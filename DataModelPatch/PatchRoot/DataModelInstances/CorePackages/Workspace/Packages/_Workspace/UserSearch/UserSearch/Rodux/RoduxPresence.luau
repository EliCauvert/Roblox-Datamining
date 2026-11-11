local UserSearch = script:FindFirstAncestor("UserSearch")

return require(UserSearch.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(UserSearch.Common.Constants).RODUX_KEY .. ".Presence"
})