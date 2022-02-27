
#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                Python                                 ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Do not allow to use pip outside virtual environments
export PIP_REQUIRE_VIRTUALENV=true

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║               Automatic virtual environment activation                ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Helper function for activating virtual environments
function activate_env() {
    # If venv folder is found, activate virtual environment
    if [[ -d ./venv ]]; then
        source ./venv/bin/activate
        project_dir="$PWD"
        printf "Activating %s.\n" "$VIRTUAL_ENV"
    # If poetry.lock file is found, activate virtual environment
    elif [[ -f ./poetry.lock ]]; then
        source "$(poetry env list --full-path | sort -k 2 | tail -n 1 | cut -d ' ' -f 1)/bin/activate"
        project_dir="$PWD"
        printf "Activating %s.\n" "$VIRTUAL_ENV"
    fi
}

# Function for activating the virtual environment when changing to project
# directory and deactivating when leaving the project
function auto_activate_env() {
  if [[ -z "$VIRTUAL_ENV" ]] ; then
      activate_env
  else
      # If the current folder does not belong to the project directory of the
      # current active virtual environment, deactivate the virtual environment,
      # else do nothing
      if [[ "$PWD"/ != "$project_dir"/* ]] ; then
          printf "Deactivating %s.\n" "$VIRTUAL_ENV"
          deactivate
          activate_env
      fi
  fi
}

# Add to the chpwd hook function 
chpwd_functions=(${chpwd_functions[@]} "auto_activate_env")

