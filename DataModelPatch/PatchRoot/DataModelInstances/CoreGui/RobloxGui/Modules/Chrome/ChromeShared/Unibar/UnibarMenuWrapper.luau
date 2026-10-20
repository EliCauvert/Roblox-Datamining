local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local ReactUtilsModule = require(CorePackages.Packages.ReactUtils)
local ReactModule = require(CorePackages.Packages.React)
local UnibarMenuModule = require(ChromeShared.Unibar.UnibarMenu)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local TooltipProviderModule = require(ChromeShared.Unibar.Tooltips.TooltipProvider)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider

return function(p1)
	-- upvalues: ReactModule (copy), ReactUtilsModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), TooltipProviderModule (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), UnibarMenuModule (copy)
	return ReactModule.createElement(ReactUtilsModule.ContextStack, {
		providers = {
			ReactModule.createElement(RoactAppPolicy.Provider, { policy = { AppFeaturePolicies } }),
			ReactModule.createElement(TooltipProviderModule),
			if FFlagTokenizeUnibarConstantsWithStyleProvider then ReactModule.createElement(UnibarStyle.Provider) else nil
		}
	}, {
		UnibarMenu = ReactModule.createElement(UnibarMenuModule, p1)
	})
end