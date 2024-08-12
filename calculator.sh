#!/bin/bash
while true; do
  # Input and validation for the first number
  while true; do
    echo 'Type a first number'
    read firstnumber

    # Check if the input is a valid number
    if [[ "$firstnumber" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
      break
    else
      echo "Invalid number. Please enter a valid number."
    fi
  done

  # Input and validation for the operation
  while true; do
    echo 'Type an operation'
    read operation

    # Validate the operation
    if [[ "$operation" == "+" || "$operation" == "-" || "$operation" == "*" || "$operation" == "/" || "$operation" == "%" ]]; then
      break
    else
      echo "Invalid operation. Please use one of the following: +, -, *, /, %"
    fi
  done

  # Input and validation for the second number
  while true; do
    echo 'Type a second number'
    read secondnumber

    # Check if the input is a valid number
    if [[ "$secondnumber" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
      break
    else
      echo "Invalid number. Please enter a valid number."
    fi
  done

  # Perform the operation
  case "$operation" in
    "+")
      result=$(echo "$firstnumber + $secondnumber" | bc)
      ;;
    "-")
      result=$(echo "$firstnumber - $secondnumber" | bc)
      ;;
    "*")
      result=$(echo "$firstnumber * $secondnumber" | bc)
      ;;
    "/")
      # Check for division by zero
      if [ "$secondnumber" = "0" ]; then
        echo "Division by zero is not allowed."
        continue
      fi
      result=$(echo "scale=2; $firstnumber / $secondnumber" | bc)
      ;;
    "%")
      # Modulus operation only works with integers
      if [[ "$firstnumber" =~ \. || "$secondnumber" =~ \. ]]; then
        echo "Modulus operation only works with integers."
        continue
      fi
      result=$(echo "$firstnumber % $secondnumber" | bc)
      ;;
  esac

  echo "$firstnumber $operation $secondnumber = $result"
  break  # Breaks out of the main loop
done