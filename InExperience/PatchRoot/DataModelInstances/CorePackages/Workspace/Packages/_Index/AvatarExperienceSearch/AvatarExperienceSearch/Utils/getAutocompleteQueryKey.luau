local MarketplaceQueryNormalizerModule = require(script.Parent.MarketplaceQueryNormalizer)

return function(Text: string)
	-- upvalues: MarketplaceQueryNormalizerModule (copy)
	return MarketplaceQueryNormalizerModule.canonicalizeMarketplaceQuery((Text:gsub("￼", "")))
end