local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagDebugShowSiteMessageBannerModule = require(Modules.LuaApp.Flags.FFlagDebugShowSiteMessageBanner)

return function()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), UseAppPolicyModule (copy), FFlagDebugShowSiteMessageBannerModule (copy)
	local HasUseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1)
		return p1.SiteMessage and p1.SiteMessage.Text
	end, {}))) ~= nil
	
	return UseAppPolicyModule(function(p1)
		return p1.getSiteMessageBanner()
	end) and HasUseSelectorResult or FFlagDebugShowSiteMessageBannerModule
end