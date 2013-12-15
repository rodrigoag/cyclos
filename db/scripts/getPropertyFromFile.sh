#!/bin/bash# file : getPropertyFromFile.sh
# we would pass the property name and property file name as a parameter to this function
#from where we want to read the property
# @param propertyName
# @param fileName
function getPropertyFromFile()
{
  # substitute “.” with “\.” so that we can use it as sed expression
  propertyName=$1
  fileName=$2;

  #echo Property: $propertyName
  #echo File Name: $fileName

  cat $fileName | grep $propertyName | sed -n -e "s/^[ ]*//g;/^#/d;s/^$propertyName *= *//p" | tail -1
}