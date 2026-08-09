local userList = script:FindFirstAncestor("UserList")

return require(userList.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(userList.Networking.myRoduxNetworking)
})