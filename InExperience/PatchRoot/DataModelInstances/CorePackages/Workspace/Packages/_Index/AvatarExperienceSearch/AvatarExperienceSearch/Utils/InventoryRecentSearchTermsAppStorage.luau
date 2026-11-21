local AXInventoryRecentSearchesStorageKeyEngineFeature = game:GetEngineFeature("AXInventoryRecentSearchesStorageKey")

return require(script.Parent.createRecentSearchTermsStorage)("AXInventoryRecentSearches", {
	useMemoryStorage = game:DefineFastFlag("AXInventoryRecentSearchesUseMemStorageDev", false) or not AXInventoryRecentSearchesStorageKeyEngineFeature
})