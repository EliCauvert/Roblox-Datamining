local CorePackages = game:GetService("CorePackages")
local EventIngestService = game:GetService("EventIngestService")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local LocalizationModule = require(CorePackages.Workspace.Packages.Localization)
local ServiceProvider = require(CorePackages.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local UtilsModule = require(script.Parent.Integrations.Utils)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local LocalizationProvider = LocalizationModule.LocalizationProvider
local GetLocalizationServiceStoreFunction = LocalizationModule.GetLocalizationServiceStore
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local FoundationProvider = FoundationModule.FoundationProvider
local config = { theme = FoundationModule.Enums.Theme.Dark }

return ReactModule.memo(function(p1)
	-- upvalues: GetLocalizationServiceStoreFunction (copy), SignalsReactModule (copy), Localization (copy), ReactModule (copy), ServiceProvider (copy), AppEventIngestService (copy), EventIngest (copy), EventIngestService (copy), RoactAnalytics (copy), Analytics (copy), LocalizationProvider (copy), FoundationProvider (copy), config (copy), UtilsModule (copy)
	return ReactModule.createElement(ServiceProvider, {
		services = {
			[AppEventIngestService] = EventIngest.new(EventIngestService),
			[RoactAnalytics] = Analytics.new()
		}
	}, {
		LocalizationProvider = ReactModule.createElement(LocalizationProvider, {
			localization = Localization.new((SignalsReactModule.useSignalState(GetLocalizationServiceStoreFunction(false).getRobloxLocaleId)))
		}, {
			FoundationProvider = ReactModule.createElement(FoundationProvider, {
				theme = p1.theme or config.theme,
				device = UtilsModule.getDeviceType()
			}, p1.children)
		})
	})
end)