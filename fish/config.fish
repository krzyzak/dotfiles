if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g tide_right_prompt_items status ruby
/opt/homebrew/bin/brew shellenv | source
fish_ssh_agent
