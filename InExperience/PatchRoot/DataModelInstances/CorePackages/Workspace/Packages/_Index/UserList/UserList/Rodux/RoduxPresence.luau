local UserList = script:FindFirstAncestor("UserList")

return require(UserList.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(UserList.Common.Constants).RODUX_KEY .. ".Presence"
})