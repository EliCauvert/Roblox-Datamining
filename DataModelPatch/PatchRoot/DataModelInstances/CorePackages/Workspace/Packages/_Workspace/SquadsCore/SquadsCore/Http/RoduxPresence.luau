local SquadsCore = script:FindFirstAncestor("SquadsCore")

return (require(SquadsCore.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(SquadsCore.Common.Constants).RODUX_KEY .. ".Presence"
}))