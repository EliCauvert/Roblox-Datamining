local userSearch = script:FindFirstAncestor("UserSearch")

return require(userSearch.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(userSearch.Common.Constants).RODUX_KEY .. ".Presence"
})