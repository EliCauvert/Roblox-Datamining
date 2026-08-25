local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local reactModule = require(corePackagesService.Packages.React)
local unibarMenuModule = require(chromeShared.Unibar.UnibarMenu)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local tooltipProviderModule = require(chromeShared.Unibar.Tooltips.TooltipProvider)
local roactAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local appFeaturePolicies = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider

return function(p0)
	-- upvalues: reactModule (ref), reactUtilsModule (ref), roactAppPolicy (ref), appFeaturePolicies (ref), tooltipProviderModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), unibarMenuModule (ref)
	return reactModule.createElement(reactUtilsModule.ContextStack, {
		providers = {
			reactModule.createElement(roactAppPolicy.Provider, { policy = { appFeaturePolicies } }),
			reactModule.createElement(tooltipProviderModule),
			if fFlagTokenizeUnibarConstantsWithStyleProvider then reactModule.createElement(unibarStyle.Provider) else nil
		}
	}, {
		UnibarMenu = reactModule.createElement(unibarMenuModule, p0)
	})
end