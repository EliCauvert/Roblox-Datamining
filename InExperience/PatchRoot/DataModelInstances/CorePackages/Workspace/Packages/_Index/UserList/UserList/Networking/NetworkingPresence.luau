local UserList = script:FindFirstAncestor("UserList")
local LuaSocialLibrariesDepsModule = require(UserList.Parent.LuaSocialLibrariesDeps)
local MyRoduxNetworkingModule = require(UserList.Networking.myRoduxNetworking)

return if require(UserList.Flags.FFlagUserListPresenceStoreMigration) then nil else LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = MyRoduxNetworkingModule })