FROM dart:3.1.5 AS build

WORKDIR /app

# Resolve app dependencies.
COPY pubspec.* ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY . .

# Generate a production build.
RUN dart pub global activate dart_frog_cli
RUN dart pub global run dart_frog_cli:dart_frog build

# Ensure packages are still up-to-date if anything has changed.
RUN dart pub get --offline
RUN dart compile exe build/bin/server.dart -o build/bin/server

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch

ARG APPWRITE_ENDPOINT=${APPWRITE_ENDPOINT}
ENV APPWRITE_SELFSIGNED=${APPWRITE_SELFSIGNED}
ENV APPWRITE_PROJECT_ID=${APPWRITE_PROJECT_ID}
ENV APPWRITE_WELLKNOWN_FUNCTION_ID=${APPWRITE_WELLKNOWN_FUNCTION_ID}

COPY --from=build /runtime/ /
COPY --from=build /app/build/bin/server /app/bin/

# Start the server.
CMD ["/app/bin/server"]