#!/usr/bin/env bash
# username.sh - validate usernames based on assignment rules

set -u

print_rules() {
  cat <<'RULES'
Username rules:
- Allowed characters: lowercase letters (a-z), digits (0-9), underscore (_)
- Must start with a lowercase letter
- Length must be between 3 and 12 characters (inclusive)
RULES
}

# Regex explanation:
# ^            start of string
# [a-z]        first character must be a lowercase letter
# [a-z0-9_]{2,11} remaining characters can be lowercase/digits/_ and must make total length 3..12
# $            end of string
USERNAME_RE='^[a-z][a-z0-9_]{2,11}$'

print_rules
echo

while true; do
  printf 'Enter a username: '

  # Works for interactive input AND for redirected input like:
  #   ./username.sh < username-input
  if ! IFS= read -r username; then
    echo
    echo "No input received (EOF). Exiting."
    exit 1
  fi

  if [[ $username =~ $USERNAME_RE ]]; then
    echo "Thanks! '$username' is a valid username."
    exit 0
  else
    echo "Sorry, '$username' is not valid. Please try again."
  fi
done
