# preexec runs before each command is executed.
preexec() {
    time_before_command=$(date +%s)
}

# precmd runs before prompt is printed.
precmd() {
    if [[ ! -z $time_before_command ]]; then
        command_benchmark=$(format_timestamp $(benchmark))
    else
        command_benchmark=''
    fi
    unset time_before_command
}

benchmark() {
    echo $(($(date +%s) - time_before_command))
}

# Takes N seconds and returns string with format `Xh Ym Zs` where X, Y, Z are numbers.
# Skips time unit when 0
# Skips seconds if hours > 0
format_timestamp() {
    local hour=$(($1 / 3600))
    local min=$(($1 / 60 - $hour * 60))
    local sec=$(($1 - $min * 60 - $hour * 3600))

    local hour_str=$((($hour > 0)) && echo "${hour}h" || echo '')
    local min_str=$((($min > 0)) && echo " ${min}m" || echo '')
    local sec_str=$((($hour == 0 && $sec > 0)) && echo " ${sec}s" || echo '')
    echo ${hour_str}${min_str}${sec_str}
}

local ret_status="%(?:%F{green}:%F{red})@"

PROMPT="%F{cyan}%c ${ret_status} %F{blue}%10>..>$(git rev-parse --abbrev-ref HEAD)%>> %f"
RPROMPT="%F{yellow}${command_benchmark} %F{blue}⧖ %F{cyan}%T%f"
