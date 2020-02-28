function is_dp_connected {
    local xRandr=$(xrandr -q)
    [ "$xRandr" == "${xRandr#*DP1 connected 1920}" ] || return 0
    [ "$xRandr" == "${xRandr#*DP2 connected 2560}" ] || return 0
    [ "$xRandr" == "${xRandr#*DP4 connected 2560}" ] || return 0
    [ "$xRandr" == "${xRandr#*HDMI2 connected 1920}" ] || return 0
    return 1
}
