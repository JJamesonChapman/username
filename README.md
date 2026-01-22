# README for Username Validation Script

## Author Information
- **Name:** Jake Jameson
- **Course:** CPSC 298 Computer Science Colloquium
- **Assignment:** Username Validation
- **Date:** 1/20/26

## Program Description
This script prompts a user to enter a username and checks whether it meets a specific set of validation rules. The program ensures that usernames use only allowed characters, begin with a lowercase letter, and fall within an acceptable length range. If the username is invalid, the user is prompted to try again until a valid username is entered.

## Username Requirements
This script validates usernames according to the following rules:
- Must start with a lowercase letter
- Can only contain lowercase letters, digits, and underscores
- Must be between 3 and 12 characters in length (inclusive)

## Usage
To run the script interactively:
```bash
./username.sh
```

To test with the provided input file:
```bash
./username.sh < username-input
```

## How the Script Works
The script uses a `while` loop to repeatedly prompt the user for a username until a valid one is provided. Each input is checked using the `grep` command with extended regular expressions to determine whether it matches the required pattern. The `-E` flag enables extended regular expressions, while the `-v` flag is used to detect invalid input by inverting the match. Output from `grep` is redirected to `/dev/null 2>&1` to suppress all output and rely only on the command’s exit status for validation.

## Regular Expression Pattern
The validation uses the following regular expression pattern:
```
^[a-z][a-z0-9_]{2,11}$
```
This pattern ensures that:
- The username starts with a lowercase letter `[a-z]`
- The following characters are lowercase letters, digits, or underscores `[a-z0-9_]`
- The total length is between 3 and 12 characters

## Testing Results
[Describe your testing process and results. Include:]
- Example valid usernames you tested (at least two)
- Example invalid usernames and why they fail (at least two)
- How you used the username-input file to test

## Challenges and Solutions
One challenge was creating a regular expression that correctly enforced all username rules without allowing invalid edge cases. This was resolved by carefully testing different patterns and adjusting the length constraints. Another challenge was ensuring the script worked correctly with redirected input, which was addressed by using the `read` command safely inside a loop.

## Resources
[List any resources you used (class slides, ChatGPT, etc.). Please refer to the course syllabus for more details on citations.]

## License
This project is part of coursework for Chapman University and is intended for educational purposes.
