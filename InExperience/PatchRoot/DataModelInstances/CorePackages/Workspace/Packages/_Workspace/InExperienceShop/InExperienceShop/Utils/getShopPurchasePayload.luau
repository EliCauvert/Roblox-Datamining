local var0 = game:GetService("HttpService"):JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function()
	-- upvalues: var0 (ref)
	return var0
end