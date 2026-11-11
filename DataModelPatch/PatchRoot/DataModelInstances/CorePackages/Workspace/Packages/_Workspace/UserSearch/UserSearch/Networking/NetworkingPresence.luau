local UserSearch = script:FindFirstAncestor("UserSearch")
local LuaSocialLibrariesDepsModule = require(UserSearch.Parent.LuaSocialLibrariesDeps)
local MyRoduxNetworkingModule = require(UserSearch.Networking.myRoduxNetworking)

return if require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration) then nil else LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = MyRoduxNetworkingModule })