local userList = script:FindFirstAncestor("UserList")

return require(userList.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(userList.Common.Constants).RODUX_KEY .. ".Presence"
})