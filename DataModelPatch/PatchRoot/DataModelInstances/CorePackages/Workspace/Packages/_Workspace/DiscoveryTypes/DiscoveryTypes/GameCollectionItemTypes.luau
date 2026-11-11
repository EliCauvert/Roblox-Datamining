local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local _ = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppEnableHomepageOneByTwoTile = SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile

return {
	GameCollectionItemType = {
		GameTile = "GameTile",
		SeeAllTile = "SeeAllTile",
		EmphasisTile = "EmphasisTile",
		TwoByOneTile = "TwoByOneTile",
		Blank = "Blank",
		OneByTwoTile = if FFlagLuaAppEnableHomepageOneByTwoTile then "OneByTwoTile" else nil
	},
	SpanForItemType = if SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning then {
		EmphasisTile = { colSpan = 2, rowSpan = 2 },
		TwoByOneTile = { colSpan = 2, rowSpan = 1 },
		OneByTwoTile = if FFlagLuaAppEnableHomepageOneByTwoTile then { colSpan = 1, rowSpan = 2 } else nil
	} else nil
}