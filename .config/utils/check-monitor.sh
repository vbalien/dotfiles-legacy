function is_dp_connected {
    local xRandr=$(xrandr -q)
    [ "$xRandr" == "${xRandr#*DP-2 con}" ] || return 0
    [ "$xRandr" == "${xRandr#*HDMI-2 con}" ] || return 0
    return 1
}
