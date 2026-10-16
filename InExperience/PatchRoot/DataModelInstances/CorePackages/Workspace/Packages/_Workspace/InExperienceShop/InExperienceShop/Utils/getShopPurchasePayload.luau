local var1 = game:GetService("HttpService"):JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function()
	-- upvalues: var1 (ref)
	return var1
end