local createLazyComponent = require(script.Parent.RoactUtils).Components.createLazyComponent
local _ = require(script.TiltLoadingScreen.Types)

return {
	Components = {
		Footer = createLazyComponent(function()
			return require(script.Components.Footer)
		end),
		TiltKeyart = createLazyComponent(function()
			return require(script.TiltLoadingScreen.Components.TiltKeyart)
		end),
		TiltLockup = createLazyComponent(function()
			return require(script.TiltLoadingScreen.Components.TiltLockup)
		end)
	},
	ProgressLoadingAssetsScreenGui = createLazyComponent(function()
		return require(script.ProgressLoadingAssetsScreenGui)
	end),
	PreGameLoadingScreen = createLazyComponent(function()
		return require(script.PreGameLoadingScreen)
	end),
	GetDeferredAssetStore = require(script.Stores.GetDeferredAssetStore),
	TiltLoadingScreen = createLazyComponent(function()
		return require(script.TiltLoadingScreen)
	end),
	useLoadingScreenAnimation = require(script.TiltLoadingScreen.Hooks.useLoadingScreenAnimation),
	LoadingScreenView = createLazyComponent(function()
		return require(script.LoadingScreenView)
	end),
	AutoTranslateBadge = createLazyComponent(function()
		return require(script.Components.AutoTranslateBadge)
	end),
	PolicyContainer = createLazyComponent(function()
		return require(script.Components.PolicyContainer)
	end),
	ServerStatus = createLazyComponent(function()
		return require(script.Components.ServerStatus)
	end),
	ServerStatusWithCountdown = createLazyComponent(function()
		return require(script.Components.ServerStatusWithCountdown)
	end),
	PlaceLauncherState = require(script.Enums.PlaceLauncherState),
	createNetworking = require(script.createNetworking),
	["jest.config"] = script["jest.config"]
}