local createLazyComponent = require(script.Parent.RoactUtils).Components.createLazyComponent
local _ = require(script.TiltLoadingScreen.Types)

return {
	Components = {
		TiltKeyart = createLazyComponent(function() --[[ line: 11 ]]
			return require(script.TiltLoadingScreen.Components.TiltKeyart)
		end),
		TiltLockup = createLazyComponent(function() --[[ line: 14 ]]
			return require(script.TiltLoadingScreen.Components.TiltLockup)
		end)
	},
	ProgressLoadingAssetsScreenGui = createLazyComponent(function() --[[ line: 18 ]]
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	PreGameLoadingScreen = createLazyComponent(function() --[[ line: 21 ]]
		return require(script.PreGameLoadingScreen)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	TiltLoadingScreen = createLazyComponent(function() --[[ line: 25 ]]
		return require(script.TiltLoadingScreen)
	end),
	useLoadingScreenAnimation = require(script.TiltLoadingScreen.Hooks.useLoadingScreenAnimation),
	LoadingScreenView = createLazyComponent(function() --[[ line: 30 ]]
		return require(script.LoadingScreenView)
	end),
	AutoTranslateBadge = createLazyComponent(function() --[[ line: 34 ]]
		return require(script.Components.AutoTranslateBadge)
	end),
	PolicyContainer = createLazyComponent(function() --[[ line: 37 ]]
		return require(script.Components.PolicyContainer)
	end),
	ServerStatus = createLazyComponent(function() --[[ line: 40 ]]
		return require(script.Components.ServerStatus)
	end),
	ServerStatusWithCountdown = createLazyComponent(function() --[[ line: 43 ]]
		return require(script.Components.ServerStatusWithCountdown)
	end),
	PlaceLauncherState = require(script.Enums.PlaceLauncherState),
	createNetworking = require(script.createNetworking),
	["jest.config"] = script["jest.config"]
}