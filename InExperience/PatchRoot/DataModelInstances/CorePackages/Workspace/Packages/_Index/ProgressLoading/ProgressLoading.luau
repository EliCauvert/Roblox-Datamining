local createLazyComponent = require(script.Parent.RoactUtils).Components.createLazyComponent
local _ = require(script.TiltLoadingScreen.Types)

return {
	Components = {
		TiltKeyart = createLazyComponent(function() --[[ line: 10 ]]
			return require(script.TiltLoadingScreen.Components.TiltKeyart)
		end),
		TiltLockup = createLazyComponent(function() --[[ line: 13 ]]
			return require(script.TiltLoadingScreen.Components.TiltLockup)
		end)
	},
	ProgressLoadingAssetsScreenGui = createLazyComponent(function() --[[ line: 17 ]]
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	TiltLoadingScreen = createLazyComponent(function() --[[ line: 21 ]]
		return require(script.TiltLoadingScreen)
	end),
	["jest.config"] = script["jest.config"]
}