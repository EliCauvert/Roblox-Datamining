local Parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

return {
	getTileHeight = function(p1, p2: number): number
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
		return p2 * 0.5625 + ((if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_100 else p1.Global.Space_50))
	end,
	getFooterHeight = function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
		return (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100) + (if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_100 else p1.Global.Space_50)
	end,
	getMetadataHeight = function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
		return if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_500 else p1.Global.Space_250
	end,
	getPlayButtonHeight = function(p1)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
		return if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_900 else p1.Global.Size_450
	end
}