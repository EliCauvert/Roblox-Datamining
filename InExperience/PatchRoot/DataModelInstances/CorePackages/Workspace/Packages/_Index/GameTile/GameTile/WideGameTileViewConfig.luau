local parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(parent.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens

return {
	getTileHeight = function(p0, p1) --[[ line: 26 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
		return p1 * 0.5625 + ((if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_500 else p0.Global.Space_250) + (if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_500 else p0.Global.Space_250) + (if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_200 else p0.Global.Space_100) + (if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_100 else p0.Global.Space_50))
	end,
	getFooterHeight = function(p2) --[[ line: 13 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
		return (if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_500 else p2.Global.Space_250) + (if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_500 else p2.Global.Space_250) + (if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_200 else p2.Global.Space_100) + (if fFlagRenameDeprecatedUIBloxTokens then p2.Size.Size_100 else p2.Global.Space_50)
	end,
	getMetadataHeight = function(p3) --[[ line: 9 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
		return if fFlagRenameDeprecatedUIBloxTokens then p3.Size.Size_500 else p3.Global.Space_250
	end,
	getPlayButtonHeight = function(p4) --[[ line: 30 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (ref)
		return if fFlagRenameDeprecatedUIBloxTokens then p4.Size.Size_900 else p4.Global.Size_450
	end
}