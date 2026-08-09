local parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local _ = require(parent.React)

return {
	GameCollectionItemType = {
		GameTile = "GameTile",
		SeeAllTile = "SeeAllTile",
		EmphasisTile = "EmphasisTile",
		TwoByOneTile = "TwoByOneTile",
		Blank = "Blank"
	},
	SpanForItemType = if require(parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning then {
		EmphasisTile = { colSpan = 2, rowSpan = 2 },
		TwoByOneTile = { colSpan = 2, rowSpan = 1 }
	} else nil
}