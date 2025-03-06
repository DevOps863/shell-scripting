# whiel loops Used when the number of iterations is not known and continues as long as the condition is true.
#!/bin/bash

while true; do
    read -p "Enter something or enter exit to quit:" User_input
    if [ "$User_input" == "exit" ]; then
        echo "exiting the loop"
        break
    fi
    echo "User input: $User_input"
done

