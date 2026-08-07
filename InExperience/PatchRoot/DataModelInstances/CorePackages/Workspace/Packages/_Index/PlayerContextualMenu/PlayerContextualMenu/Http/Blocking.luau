local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local parent = playerContextualMenu.Parent
local roduxNetworkingModule = require(script.Parent.RoduxNetworking)

return if require(playerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled) then require(parent.UserBlockingNetworking).config({ roduxNetworking = roduxNetworkingModule }) else require(parent.LuaSocialLibrariesDeps).NetworkingBlocking.config({ roduxNetworking = roduxNetworkingModule })