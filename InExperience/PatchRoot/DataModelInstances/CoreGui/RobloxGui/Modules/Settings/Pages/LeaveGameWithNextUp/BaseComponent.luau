local eventIngestService = game:GetService("EventIngestService")
local localizationService = game:GetService("LocalizationService")
local corePackagesService = game:GetService("CorePackages")
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local analytics = require(corePackagesService.Workspace.Packages.Analytics).Analytics
local roactServiceTagsModule = require(corePackagesService.Workspace.Packages.RoactServiceTags)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local serviceProvider = require(corePackagesService.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local styleModule = require(corePackagesService.Workspace.Packages.Style)
local fFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local foundationProvider = foundationModule.FoundationProvider
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local styleProviderWithDefaultTheme = styleModule.StyleProviderWithDefaultTheme
local var9 = localization.new(localizationService.RobloxLocaleId)
local var10 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)

return function(p0) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), serviceProvider (ref), appEventIngestService (ref), eventIngest (ref), eventIngestService (ref), roactAnalytics (ref), analytics (ref), localizationProvider (ref), var9 (ref), foundationProvider (ref), reactFocusNavigationModule (ref), var10 (ref), fFlagEnableNextUpImageLatencyTelemetryModule (ref), styleProviderWithDefaultTheme (ref)
	return reactModule.createElement(serviceProvider, {
		services = {
			[appEventIngestService] = eventIngest.new(eventIngestService),
			[roactAnalytics] = analytics.new()
		}
	}, {
		localizationProvider = reactModule.createElement(localizationProvider, { localization = var9 }, {
			foundationProvider = reactModule.createElement(foundationProvider, nil, {
				FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var10 }, if fFlagEnableNextUpImageLatencyTelemetryModule then p0.children else {
					uiBloxStyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, nil, p0.children)
				})
			})
		})
	})
end