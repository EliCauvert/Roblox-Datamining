local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local _ = require(Parent.React)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning

return {
	GameCollectionItemType = {
		GameTile = "GameTile",
		SeeAllTile = "SeeAllTile",
		EmphasisTile = "EmphasisTile",
		TwoByOneTile = "TwoByOneTile",
		Blank = "Blank",
		OneByTwoTile = if FFlagLuaAppEnableNxMRoduxApportioning then "OneByTwoTile" else nil
	},
	AlignmentType = {
		RightPin = "RightPin",
		LeftPin = "LeftPin",
		Default = "Default"
	},
	SpanForItemType = if FFlagLuaAppEnableNxMRoduxApportioning then {
		EmphasisTile = { colSpan = 2, rowSpan = 2 },
		TwoByOneTile = { colSpan = 2, rowSpan = 1 },
		OneByTwoTile = { colSpan = 1, rowSpan = 2 }
	} else nil
}