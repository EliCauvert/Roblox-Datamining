local userSearch = script:FindFirstAncestor("UserSearch")

return if require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration) then nil else require(userSearch.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(userSearch.Networking.myRoduxNetworking)
})