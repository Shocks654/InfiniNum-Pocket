local ShocksPocketConfig = {
    io_mode = 1,
    math_port = 0x70,
    display_port = 0x78,
    shocks_number_horizon = 256,
    refresh_rate_hz = 60,
    auto_limit = 1
}

local function process_config_io(key)
    local value = ShocksPocketConfig[key]
    if value then
        return value
    end
    return 0
end

return {
    config = ShocksPocketConfig,
    process = process_config_io
}
