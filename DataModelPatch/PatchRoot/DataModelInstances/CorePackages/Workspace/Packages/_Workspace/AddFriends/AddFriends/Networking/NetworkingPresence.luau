local Parent = script:FindFirstAncestor("AddFriends").Parent
local MyRoduxNetworking = require(Parent.AddFriendsState).Networking.myRoduxNetworking
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)

return if require(Parent.SharedFlags).FFlagAddFriendsPresenceStoreMigration then nil else LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = MyRoduxNetworking })