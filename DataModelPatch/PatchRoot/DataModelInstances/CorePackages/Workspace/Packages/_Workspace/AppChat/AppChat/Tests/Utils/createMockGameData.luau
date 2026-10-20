local RoundedVariantModule = require(script:FindFirstAncestor("AppChat").Enums.RoundedVariant)

return function(p1)
	-- upvalues: RoundedVariantModule (copy)
	local config = {
		gameName = "Test Game",
		gameThumbnail = "rbxassetid://12345",
		gameRating = "95%",
		gamePlayerCount = 1000,
		thumbnailAspectRatio = 1.7777777777777777,
		cornerRadius = 12,
		thumbnailRoundedVariant = RoundedVariantModule.Top
	}
	
	return if p1 then {
		gameName = if p1.gameName == nil then config.gameName else p1.gameName,
		gameThumbnail = if p1.gameThumbnail == nil then config.gameThumbnail else p1.gameThumbnail,
		gameRating = if p1.gameRating == nil then config.gameRating else p1.gameRating,
		gamePlayerCount = if p1.gamePlayerCount == nil then config.gamePlayerCount else p1.gamePlayerCount,
		thumbnailAspectRatio = if p1.thumbnailAspectRatio == nil then config.thumbnailAspectRatio else p1.thumbnailAspectRatio,
		thumbnailRoundedVariant = if p1.thumbnailRoundedVariant == nil then config.thumbnailRoundedVariant else p1.thumbnailRoundedVariant,
		cornerRadius = if p1.cornerRadius == nil then config.cornerRadius else p1.cornerRadius
	} else config
end