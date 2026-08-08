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
	PreGameLoadingScreen = createLazyComponent(function() --[[ line: 20 ]]
		return require(script.PreGameLoadingScreen)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	TiltLoadingScreen = createLazyComponent(function() --[[ line: 24 ]]
		return require(script.TiltLoadingScreen)
	end),
	LoadingScreenView = createLazyComponent(function() --[[ line: 28 ]]
		return require(script.LoadingScreenView)
	end),
	AutoTranslateBadge = createLazyComponent(function() --[[ line: 32 ]]
		return require(script.Components.AutoTranslateBadge)
	end),
	PolicyContainer = createLazyComponent(function() --[[ line: 35 ]]
		return require(script.Components.PolicyContainer)
	end),
	ServerStatus = createLazyComponent(function() --[[ line: 38 ]]
		return require(script.Components.ServerStatus)
	end),
	ServerStatusWithCountdown = createLazyComponent(function() --[[ line: 41 ]]
		return require(script.Components.ServerStatusWithCountdown)
	end),
	PlaceLauncherState = require(script.Enums.PlaceLauncherState),
	createNetworking = require(script.createNetworking),
	["jest.config"] = script["jest.config"]
}