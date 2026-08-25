local corePackagesService = game:GetService("CorePackages")
local eventIngestService = game:GetService("EventIngestService")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local analytics = require(corePackagesService.Workspace.Packages.Analytics).Analytics
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local inExperienceLocalesModule = require(corePackagesService.Workspace.Packages.InExperienceLocales)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local serviceProvider = require(corePackagesService.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local roactServiceTagsModule = require(corePackagesService.Workspace.Packages.RoactServiceTags)
local utilsModule = require(script.Parent.Integrations.Utils)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local localizationProvider = localizationModule.LocalizationProvider
local getLocalizationServiceStore = localizationModule.GetLocalizationServiceStore
local localization = inExperienceLocalesModule.Localization
local foundationProvider = foundationModule.FoundationProvider
local t = { colorMode = foundationModule.Enums.ColorMode.Dark }

return reactModule.memo(function(p0)
	-- upvalues: getLocalizationServiceStore (ref), signalsReactModule (ref), localization (ref), reactModule (ref), serviceProvider (ref), appEventIngestService (ref), eventIngest (ref), eventIngestService (ref), roactAnalytics (ref), analytics (ref), localizationProvider (ref), foundationProvider (ref), t (ref), utilsModule (ref)
	return reactModule.createElement(serviceProvider, {
		services = {
			[appEventIngestService] = eventIngest.new(eventIngestService),
			[roactAnalytics] = analytics.new()
		}
	}, {
		LocalizationProvider = reactModule.createElement(localizationProvider, {
			localization = localization.new(signalsReactModule.useSignalState(getLocalizationServiceStore(false).getRobloxLocaleId))
		}, {
			FoundationProvider = reactModule.createElement(foundationProvider, {
				colorMode = p0.theme or t.colorMode,
				device = utilsModule.getDeviceType()
			}, p0.children)
		})
	})
end)