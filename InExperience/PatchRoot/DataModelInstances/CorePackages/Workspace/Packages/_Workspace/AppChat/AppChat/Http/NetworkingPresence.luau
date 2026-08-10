local appChat = script:FindFirstAncestor("AppChat")

return if require(appChat.Flags.FFlagAppChatPresenceStoreMigration) then nil else require(appChat.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({ roduxNetworking = require(script.Parent.RoduxNetworking) })