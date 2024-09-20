local S = minetest.get_translator("atl_server_who_online")

function atl_server_who_online.getConnectedPlayers()
    return minetest.get_connected_players() or {}
end

function atl_server_who_online.formatPlayerList(players)
    local player_list = {}
    for _, player in ipairs(players) do
        table.insert(player_list, player:get_player_name())
    end
    return table.concat(player_list, ", ")
end

function atl_server_who_online.sendPlayerInfo(player_name)
    if not player_name then
        return
    end

    local players = atl_server_who_online.getConnectedPlayers()
    local player_count = #players
    local player_list = atl_server_who_online.formatPlayerList(players)

    local message = S("[Status] There are ") .. player_count .. S(" player(s) connected: ") .. player_list
    minetest.chat_send_player(player_name, minetest.colorize("#28b91c", message))
end

function atl_server_who_online.schedulePlayerInfo()
    minetest.after(atl_server_who_online.timer, function()
        local players = atl_server_who_online.getConnectedPlayers()
        for _, player in ipairs(players) do
            atl_server_who_online.sendPlayerInfo(player:get_player_name())
        end
        atl_server_who_online.schedulePlayerInfo()
    end)
end

atl_server_who_online.schedulePlayerInfo()
