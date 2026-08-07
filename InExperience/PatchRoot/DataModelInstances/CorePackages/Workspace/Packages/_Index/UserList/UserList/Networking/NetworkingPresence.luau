local userList = script:FindFirstAncestor("UserList")

return if require(userList.Flags.FFlagUserListPresenceStoreMigration) then nil else require(userList.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(userList.Networking.myRoduxNetworking)
})