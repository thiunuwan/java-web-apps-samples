#!/bin/bash

# Check if the pom.xml file exists
if [ ! -f "pom.xml" ]; then
    echo "pom.xml file not found."
    exit 1
fi

# Extract Java version from pom.xml using XML parsing with xmllint
java_version=$(xmllint --xpath "//*[local-name()='properties']/*[local-name()='java.version']/text()" pom.xml 2>/dev/null)

# Check if Java version is retrieved
if [ -z "$java_version" ]; then
    echo "Java version not found in pom.xml."
    exit 1
fi

echo "Java version from pom.xml: $java_version"

