local AppChat = script:FindFirstAncestor("AppChat")
local NetworkingPresence = require(AppChat.Parent.LuaSocialLibrariesDeps).NetworkingPresence
local RoduxNetworkingModule = require(script.Parent.RoduxNetworking)

return if require(AppChat.Flags.FFlagAppChatPresenceStoreMigration) then nil else NetworkingPresence.config({ roduxNetworking = RoduxNetworkingModule })