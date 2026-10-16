local Parent = script:FindFirstAncestor("GameTile").Parent
local _ = require(Parent.Foundation)
local FFlagLuaAppMigrateGameTileFixConsoleMetadataText = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFixConsoleMetadataText

return function(Enabled, p1, p2, p3, p4) --[[ Line: 10 | Named "getGameTileMetadataFont" ]]
	-- upvalues: FFlagLuaAppMigrateGameTileFixConsoleMetadataText (copy)
	return if p3 and p2 then if p4 or FFlagLuaAppMigrateGameTileFixConsoleMetadataText and Enabled == false then p2.Typography.BodySmall else p2.Typography.BodyMedium elseif Enabled then p1.Typography.BodyLarge else p1.Typography.CaptionMedium
end