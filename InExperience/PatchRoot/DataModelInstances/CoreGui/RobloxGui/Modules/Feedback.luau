local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local GlobalConfigModule = require(script.GlobalConfig)
local ReducersModule = require(script.Reducers)
local FeedbackAppModule = require(script.Components.FeedbackApp)

return {
	initialize = function()
		-- upvalues: GlobalConfigModule (copy), RoactModule (copy), RoduxModule (copy), ReducersModule (copy), RoactRoduxModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FeedbackAppModule (copy), CoreGui (copy)
		if GlobalConfigModule.propValidation then
			RoactModule.setGlobalConfig({ propValidation = true })
		end
		if GlobalConfigModule.elementTracing then
			RoactModule.setGlobalConfig({ elementTracing = true })
		end
		local List = { RoduxModule.thunkMiddleware }
		
		if GlobalConfigModule.logStore then
			table.insert(List, RoduxModule.loggerMiddleware)
		end
		RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = RoduxModule.Store.new(ReducersModule, nil, List) }, {
			LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, { Feedback = RoactModule.createElement(FeedbackAppModule) })
		}), CoreGui, "Feedback")
	end
}