local Parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(Parent.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local FFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local FFlagLuaAppNarrowTileSmallerFooterFont = require(Parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont

return function(Enabled, p1, p2, p3, p4)
	-- upvalues: FFlagLuaAppNarrowTileSmallerFooterFont (copy), FFlagLuaAppMigrateGameTileFixConsoleMetadataText (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	return if p3 and p2 then if FFlagLuaAppNarrowTileSmallerFooterFont and p4 or FFlagLuaAppMigrateGameTileFixConsoleMetadataText and Enabled == false then p2.Typography.BodySmall else p2.Typography.BodyMedium elseif Enabled then if FFlagRenameDeprecatedUIBloxTokens then p1.Typography.BodyLarge else p1.Semantic.Typography.Body elseif FFlagRenameDeprecatedUIBloxTokens then p1.Typography.CaptionMedium else p1.Semantic.Typography.CaptionHeader
end