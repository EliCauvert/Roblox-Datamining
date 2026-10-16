local CreateLazyComponentFunction = require(script.Parent.RoactUtils).Components.createLazyComponent
local _ = require(script.TiltLoadingScreen.Types)

return {
	Components = {
		Footer = CreateLazyComponentFunction(function() --[[ Line: 11 ]]
			return require(script.Components.Footer)
		end),
		TiltKeyart = CreateLazyComponentFunction(function() --[[ Line: 14 ]]
			return require(script.TiltLoadingScreen.Components.TiltKeyart)
		end),
		TiltLockup = CreateLazyComponentFunction(function() --[[ Line: 17 ]]
			return require(script.TiltLoadingScreen.Components.TiltLockup)
		end)
	},
	ProgressLoadingAssetsScreenGui = CreateLazyComponentFunction(function() --[[ Line: 21 ]]
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	PreGameLoadingScreen = CreateLazyComponentFunction(function() --[[ Line: 24 ]]
		return require(script.PreGameLoadingScreen)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	PregameOverride = require(script.Stores.PregameOverride),
	TiltLoadingScreen = CreateLazyComponentFunction(function() --[[ Line: 29 ]]
		return require(script.TiltLoadingScreen)
	end),
	useLoadingScreenAnimation = require(script.TiltLoadingScreen.Hooks.useLoadingScreenAnimation),
	LoadingScreenView = CreateLazyComponentFunction(function() --[[ Line: 34 ]]
		return require(script.LoadingScreenView)
	end),
	AutoTranslateBadge = CreateLazyComponentFunction(function() --[[ Line: 38 ]]
		return require(script.Components.AutoTranslateBadge)
	end),
	PolicyContainer = CreateLazyComponentFunction(function() --[[ Line: 41 ]]
		return require(script.Components.PolicyContainer)
	end),
	ServerStatus = CreateLazyComponentFunction(function() --[[ Line: 44 ]]
		return require(script.Components.ServerStatus)
	end),
	ServerStatusWithCountdown = CreateLazyComponentFunction(function() --[[ Line: 47 ]]
		return require(script.Components.ServerStatusWithCountdown)
	end),
	PlaceLauncherState = require(script.Enums.PlaceLauncherState),
	createNetworking = require(script.createNetworking),
	["jest.config"] = script["jest.config"]
}