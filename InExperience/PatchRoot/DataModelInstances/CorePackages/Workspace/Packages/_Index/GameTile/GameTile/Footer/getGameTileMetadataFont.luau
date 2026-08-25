local parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(parent.Foundation)
local fFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText
local fFlagLuaAppNarrowTileSmallerFooterFont = require(parent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont

return function(p0, p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppNarrowTileSmallerFooterFont (ref), fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref)
	return if p3 and p2 then if fFlagLuaAppNarrowTileSmallerFooterFont and p4 or fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p0 == false then p2.Typography.BodySmall else p2.Typography.BodyMedium elseif p0 then p1.Typography.BodyLarge else p1.Typography.CaptionMedium
end