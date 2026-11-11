local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local BannerContainerModule = require(Modules.LuaApp.Components.Banner.BannerContainer)
local UseShowSecurityBannerModule = require(Modules.LuaApp.Components.Banner.useShowSecurityBanner)
local UseShowSiteMessageBannerModule = require(Modules.LuaApp.Components.Banner.useShowSiteMessageBanner)
local ApiFetchOmniRecommendations = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations
local UseClientCacheFallbackBannerConfigFunction = require(CorePackages.Workspace.Packages.DiscoveryAvailability).useClientCacheFallbackBannerConfig

return function(p1)
	-- upvalues: ReactModule (copy), UseShowSecurityBannerModule (copy), UseShowSiteMessageBannerModule (copy), UseClientCacheFallbackBannerConfigFunction (copy), ApiFetchOmniRecommendations (copy), BannerContainerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseShowSecurityBannerModuleResult = UseShowSecurityBannerModule()
	local UseShowSiteMessageBannerModuleResult = UseShowSiteMessageBannerModule()
	local UseClientCacheFallbackBannerConfigResult = UseClientCacheFallbackBannerConfigFunction(ApiFetchOmniRecommendations)
	
	if p1 then
		UseShowSiteMessageBannerModuleResult = false
	end
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), BannerContainerModule (upval), UseShowSiteMessageBannerModuleResult (ref), UseShowSecurityBannerModuleResult (copy), UseClientCacheFallbackBannerConfigResult (copy), UseStateResult2 (copy)
		return ReactModule.createElement(BannerContainerModule, {
			showSiteMessageBanner = UseShowSiteMessageBannerModuleResult,
			showSecurityBanner = UseShowSecurityBannerModuleResult,
			clientCacheFallbackBannerConfig = UseClientCacheFallbackBannerConfigResult,
			onSizeChanged = UseStateResult2
		})
	end, {
		UseShowSecurityBannerModuleResult,
		UseShowSiteMessageBannerModuleResult,
		UseClientCacheFallbackBannerConfigResult,
		UseStateResult
	}), UseStateResult.Y
end