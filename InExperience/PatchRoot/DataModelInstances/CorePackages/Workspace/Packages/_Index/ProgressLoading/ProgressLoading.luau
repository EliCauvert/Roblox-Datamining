local CreateLazyComponentFunction = require(script.Parent.RoactUtils).Components.createLazyComponent
local _ = require(script.TiltLoadingScreen.Types)

return {
	Components = {
		Footer = CreateLazyComponentFunction(function()
			return require(script.Components.Footer)
		end),
		TiltKeyart = CreateLazyComponentFunction(function()
			return require(script.TiltLoadingScreen.Components.TiltKeyart)
		end),
		TiltLockup = CreateLazyComponentFunction(function()
			return require(script.TiltLoadingScreen.Components.TiltLockup)
		end)
	},
	ProgressLoadingAssetsScreenGui = CreateLazyComponentFunction(function()
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	PreGameLoadingScreen = CreateLazyComponentFunction(function()
		return require(script.PreGameLoadingScreen)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	PregameOverride = require(script.Stores.PregameOverride),
	TiltLoadingScreen = CreateLazyComponentFunction(function()
		return require(script.TiltLoadingScreen)
	end),
	useLoadingScreenAnimation = require(script.TiltLoadingScreen.Hooks.useLoadingScreenAnimation),
	LoadingScreenView = CreateLazyComponentFunction(function()
		return require(script.LoadingScreenView)
	end),
	AutoTranslateBadge = CreateLazyComponentFunction(function()
		return require(script.Components.AutoTranslateBadge)
	end),
	PolicyContainer = CreateLazyComponentFunction(function()
		return require(script.Components.PolicyContainer)
	end),
	ServerStatus = CreateLazyComponentFunction(function()
		return require(script.Components.ServerStatus)
	end),
	ServerStatusWithCountdown = CreateLazyComponentFunction(function()
		return require(script.Components.ServerStatusWithCountdown)
	end),
	PlaceLauncherState = require(script.Enums.PlaceLauncherState),
	createNetworking = require(script.createNetworking),
	["jest.config"] = script["jest.config"]
}