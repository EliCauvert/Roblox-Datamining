game:DefineFastString("MomentsEmojiFallbackCatalogJSON", game:GetService("HttpService"):JSONEncode(require(script:FindFirstAncestor("DataHydration").Moments.Util.compiledMomentsEmojiFallbackCatalog).COMPILED_MOMENTS_EMOJI_FALLBACK_API_PAYLOAD))

return function()
	return game:GetFastString("MomentsEmojiFallbackCatalogJSON")
end