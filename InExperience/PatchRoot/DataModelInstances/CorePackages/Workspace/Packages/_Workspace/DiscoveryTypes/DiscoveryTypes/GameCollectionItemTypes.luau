local parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local _ = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile

return {
	GameCollectionItemType = {
		GameTile = "GameTile",
		SeeAllTile = "SeeAllTile",
		EmphasisTile = "EmphasisTile",
		TwoByOneTile = "TwoByOneTile",
		Blank = "Blank",
		OneByTwoTile = if fFlagLuaAppEnableHomepageOneByTwoTile then "OneByTwoTile" else nil
	},
	SpanForItemType = if sharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning then {
		EmphasisTile = { colSpan = 2, rowSpan = 2 },
		TwoByOneTile = { colSpan = 2, rowSpan = 1 },
		OneByTwoTile = if fFlagLuaAppEnableHomepageOneByTwoTile then { colSpan = 1, rowSpan = 2 } else nil
	} else nil
}