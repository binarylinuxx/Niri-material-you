if status is-interactive
    # Commands to run in interactive sessions can go here
end
export XDG_RUNTIME_DIR=/run/user/$(id -u)

function xi
    sudo xbps-install -S $argv
end

