local EventIngestService = game:GetService("EventIngestService")
local CorePackages = game:GetService("CorePackages")
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local ReactModule = require(CorePackages.Packages.React)
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local ServiceProvider = require(CorePackages.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local FFlagEnableNextUpImageLatencyTelemetryModule = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry)
local FoundationProvider = require(CorePackages.Packages.Foundation).FoundationProvider
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local StyleProviderWithDefaultTheme = require(CorePackages.Workspace.Packages.Style).StyleProviderWithDefaultTheme
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local NewResult1 = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)

return function(p1)
	-- upvalues: ReactModule (copy), ServiceProvider (copy), AppEventIngestService (copy), EventIngest (copy), EventIngestService (copy), RoactAnalytics (copy), Analytics (copy), LocalizationProvider (copy), NewResult (copy), FoundationProvider (copy), ReactFocusNavigationModule (copy), NewResult1 (copy), FFlagEnableNextUpImageLatencyTelemetryModule (copy), StyleProviderWithDefaultTheme (copy)
	return ReactModule.createElement(ServiceProvider, {
		services = {
			[AppEventIngestService] = EventIngest.new(EventIngestService),
			[RoactAnalytics] = Analytics.new()
		}
	}, {
		localizationProvider = ReactModule.createElement(LocalizationProvider, { localization = NewResult }, {
			foundationProvider = ReactModule.createElement(FoundationProvider, nil, {
				FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult1 }, if FFlagEnableNextUpImageLatencyTelemetryModule then p1.children else {
					uiBloxStyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, nil, p1.children)
				})
			})
		})
	})
end