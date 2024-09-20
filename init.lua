atl_server_who_online = {}
atl_server_who_online.modpath = minetest.get_modpath("atl_server_who_online")
atl_server_who_online.timer = 500
atl_server_who_online.messages_color = "#e21717" -- Green

function atl_server_who_online.load_file(path)
    local status, err = pcall(dofile, path)
    if not status then
        minetest.log("error", "-!- Failed to load file: " .. path .. " - Error: " .. err)
    else
        minetest.log("action", "-!- Successfully loaded file: " .. path)
    end
end

if atl_server_who_online.modpath then
    local files_to_load = {
        "script/api.lua",
        "script/commands.lua",
    }

    for _, file in ipairs(files_to_load) do
        atl_server_who_online.load_file(atl_server_who_online.modpath .. "/" .. file)
    end
else
    minetest.log("error", "-!- Files in " .. atl_server_who_online.modpath .. " mod are not set or valid.")
end
