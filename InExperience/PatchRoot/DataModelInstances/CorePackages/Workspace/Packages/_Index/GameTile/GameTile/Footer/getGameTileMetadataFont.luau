local parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local fFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont

return function(p0, p1, p2, p3, p4) --[[ line: 13 | named "getGameTileMetadataFont" ]]
	-- upvalues: fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	return if p3 and p2 then if fFlagLuaAppNarrowTileSmallerFooterFont and p4 or fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p0 == false then p2.Typography.BodySmall else p2.Typography.BodyMedium elseif p0 then if fFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body elseif fFlagRenameDeprecatedUIBloxTokens then p1.Typography.CaptionMedium else p1.Semantic.Typography.CaptionHeader
end