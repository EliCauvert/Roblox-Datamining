local parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(parent.Foundation)
local fFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagLuaAppMigrateGameTileFixConsoleMetadataText (ref)
	return if p4 and p3 then if p5 or fFlagLuaAppMigrateGameTileFixConsoleMetadataText and p1 == false then p3.Typography.BodySmall else p3.Typography.BodyMedium elseif p1 then p2.Typography.BodyLarge else p2.Typography.CaptionMedium
end