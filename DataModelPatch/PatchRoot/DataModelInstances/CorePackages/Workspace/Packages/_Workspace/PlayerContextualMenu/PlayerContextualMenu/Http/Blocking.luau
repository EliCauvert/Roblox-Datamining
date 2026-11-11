local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local Parent = PlayerContextualMenu.Parent
local NetworkingBlocking = require(Parent.LuaSocialLibrariesDeps).NetworkingBlocking
local UserBlockingNetworkingModule = require(Parent.UserBlockingNetworking)
local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)

return if require(PlayerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled) then UserBlockingNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule }) else NetworkingBlocking.config({ roduxNetworking = RoduxNetworkingModule })