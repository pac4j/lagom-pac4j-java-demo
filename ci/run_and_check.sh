#!/bin/bash

# Script to verify lagom-pac4j-java-demo compilation and tests
# Usage: ./run_and_check.sh

set -e  # Stop script on error

echo "🚀 Testing lagom-pac4j-java-demo..."

# Go to project directory (one level up from ci/)
cd "$(dirname "$0")/.."

# Clean and compile project
echo "📦 Compiling project..."
mvn clean package -q

# Run tests
echo "🧪 Running tests..."
mvn test -q

# Verify JARs were created
echo "🔍 Verifying JARs were created..."
if [ -f "api/target/lagom-pac4j-java-demo-api-1.0.0-SNAPSHOT.jar" ]; then
    echo "✅ API JAR created successfully"
else
    echo "❌ API JAR not found"
    exit 1
fi

if [ -f "impl/target/lagom-pac4j-java-demo-impl-1.0.0-SNAPSHOT.jar" ]; then
    echo "✅ Implementation JAR created successfully"
else
    echo "❌ Implementation JAR not found"
    exit 1
fi

echo "🎉 lagom-pac4j-java-demo test completed successfully!"
echo "✅ All tests passed:"
echo "   - Project compiles successfully"
echo "   - All unit tests pass"
echo "   - API JAR generated"
echo "   - Implementation JAR generated"
echo "   - Ready for deployment"
