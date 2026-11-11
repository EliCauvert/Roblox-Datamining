local FFlagRenameDeprecatedUIBloxTokens = require(script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

return function(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return {
		smallTileContainerSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1600 else p1.Global.Size_800,
		smallTileImageSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1000 else p1.Global.Size_500,
		largeTileContainerSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_2200 else p1.Global.Size_1100,
		largeTileImageSize = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1600 else p1.Global.Size_800,
		tileListPaddingBetweenItems = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100,
		tileListPaddingLeft = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250,
		tileListPaddingRight = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250,
		tileListPaddingTop = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_50 else p1.Global.Space_25,
		tileListPaddingBottom = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_50 else p1.Global.Space_25
	}
end