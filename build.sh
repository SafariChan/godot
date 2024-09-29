
IS_CI=false

# Check if running in CI environment
if [ "$1" == "--ci" ]; then
  IS_CI=true
  echo "Running in CI environment"
else
  echo "Running standalone"
fi

build() {
  echo "Starting build..."
  if [ "$IS_CI" == "true" ]; then
    # CI build command
    scons platform=linuxbsd
  else
    # Standalone build command
    scons platform=linuxbsd
  fi
}

test() {
  echo "Running tests..."
  # Add test logic here (can be extended based on specific needs)
  echo "Tests completed!"
}

package() {
  echo "Packaging the build..."
  tar -czvf godot-build.tar.gz bin/
  echo "Packaging complete!"
}

# Handle command-line arguments
case "$2" in
  build) build ;;
  test) test ;;
  package) package ;;
  *) echo "Usage: $0 [--ci] {build|test|package}" ;;
esac

