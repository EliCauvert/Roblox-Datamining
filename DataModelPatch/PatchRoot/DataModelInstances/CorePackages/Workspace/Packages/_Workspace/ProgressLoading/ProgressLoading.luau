return {
	ProgressLoadingAssetsScreenGui = require(script.Parent.RoactUtils).Components.createLazyComponent(function()
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	["jest.config"] = script["jest.config"]
}