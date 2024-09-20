minetest.register_chatcommand("who", {
    description = "Displays the list of connected players",
    func = function(name, param)
        atl_server_who_online.sendPlayerInfo(name)
    end,
})
