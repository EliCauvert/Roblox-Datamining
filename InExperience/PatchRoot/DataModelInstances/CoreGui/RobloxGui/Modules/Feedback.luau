local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local globalConfigModule = require(script.GlobalConfig)
local reducersModule = require(script.Reducers)
local feedbackAppModule = require(script.Components.FeedbackApp)

return {
	initialize = function() --[[ line: 23 ]]
		-- upvalues: globalConfigModule (ref), roactModule (ref), roduxModule (ref), reducersModule (ref), roactRoduxModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), feedbackAppModule (ref), coreGuiService (ref)
		if globalConfigModule.propValidation then
			roactModule.setGlobalConfig({ propValidation = true })
		end
		if globalConfigModule.elementTracing then
			roactModule.setGlobalConfig({ elementTracing = true })
		end
		local list = { roduxModule.thunkMiddleware }
		
		if globalConfigModule.logStore then
			table.insert(list, roduxModule.loggerMiddleware)
		end
		roactModule.mount(roactModule.createElement(roactRoduxModule.StoreProvider, { store = roduxModule.Store.new(reducersModule, nil, list) }, {
			LocalizationProvider = roactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, { Feedback = roactModule.createElement(feedbackAppModule) })
		}), coreGuiService, "Feedback")
	end
}