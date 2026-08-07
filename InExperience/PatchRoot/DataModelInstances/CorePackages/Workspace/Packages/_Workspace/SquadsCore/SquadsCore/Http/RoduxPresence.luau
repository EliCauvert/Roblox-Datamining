local squadsCore = script:FindFirstAncestor("SquadsCore")

return require(squadsCore.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(squadsCore.Common.Constants).RODUX_KEY .. ".Presence"
})