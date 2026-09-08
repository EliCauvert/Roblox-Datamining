local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local _ = require(corePackagesService.Packages.UIBlox)
local dependenciesModule = require(script.Dependencies)
local localization = dependenciesModule.Localization
local localizationProviderModule = require(dependenciesModule.LocalizationProvider)
local playerInterfaceModule = require(dependenciesModule.playerInterface)
local constantsModule = require(script.Resources.Constants)
local globalConfigModule = require(script.GlobalConfig)
local reducersModule = require(script.Reducers)
local trustAndSafetyAppModule = require(script.Components.TrustAndSafetyApp)
local trustAndSafetyAppPolicyModule = require(script.TrustAndSafetyAppPolicy)
local _ = require(script.Actions.OpenReportDialog)
local _ = require(script.Actions.OpenReportMenu)
local beginReportFlowModule = require(script.Actions.BeginReportFlow)
local setVoiceReportingFlowModule = require(script.Actions.SetVoiceReportingFlow)
local sessionUtilityModule = require(script.Utility.SessionUtility)
local fetchPlaceInfoModule = require(script.Thunks.FetchPlaceInfo)
local t = {
	getInstance = function(p1)
		if not p1._initialized then
			p1:initialize()
			p1._initialized = true
		end
		return p1
	end,
	initialize = function(p1)
		-- upvalues: globalConfigModule (ref), roactModule (ref), fetchPlaceInfoModule (ref), roactRoduxModule (ref), trustAndSafetyAppPolicyModule (ref), localizationProviderModule (ref), trustAndSafetyAppModule (ref), coreGuiService (ref)
		if globalConfigModule.propValidation then
			roactModule.setGlobalConfig({ propValidation = true })
		end
		if globalConfigModule.elementTracing then
			roactModule.setGlobalConfig({ elementTracing = true })
		end
		p1.store = p1:createStore()
		p1.store:dispatch(fetchPlaceInfoModule(game.GameId))
		p1.localization = p1:createLocalization()
		p1.root = roactModule.createElement(roactRoduxModule.StoreProvider, { store = p1.store }, {
			PolicyProvider = roactModule.createElement(trustAndSafetyAppPolicyModule.Provider, { policy = { trustAndSafetyAppPolicyModule.Mapper } }, {
				LocalizationProvider = roactModule.createElement(localizationProviderModule, { localization = p1.localization }, {
					TrustAndSafety = roactModule.createElement(trustAndSafetyAppModule)
				})
			})
		})
		p1.element = roactModule.mount(p1.root, coreGuiService, "TrustAndSafety")
	end,
	createStore = function(_)
		-- upvalues: reducersModule (ref), roduxModule (ref), globalConfigModule (ref)
		local list = { roduxModule.thunkMiddleware }
		
		if globalConfigModule.logStore then
			table.insert(list, roduxModule.loggerMiddleware)
		end
		return roduxModule.Store.new(reducersModule, nil, list)
	end,
	createLocalization = function(_)
		-- upvalues: localizationService (ref), localization (ref)
		local var1 = localization.new(localizationService.RobloxLocaleId)
		localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: localizationService (copy), var1 (ref)
			var1:SetLocale(localizationService.RobloxLocaleId)
		end)
		
		return var1
	end,
	openReportDialog = function(p1, p2, p3)
		-- upvalues: setVoiceReportingFlowModule (ref), beginReportFlowModule (ref)
		p1.store:dispatch(setVoiceReportingFlowModule(true))
		p1.store:dispatch(beginReportFlowModule(p2, p3))
	end,
	openReportMenu = function(p1)
		-- upvalues: setVoiceReportingFlowModule (ref), beginReportFlowModule (ref)
		p1.store:dispatch(setVoiceReportingFlowModule(true))
		p1.store:dispatch(beginReportFlowModule())
	end
}

return {
	openReportDialogForPlayer = function(p1, p2)
		-- upvalues: playerInterfaceModule (ref), tModule (ref), sessionUtilityModule (ref), t (ref), constantsModule (ref)
		assert(playerInterfaceModule(p1) and tModule.instanceIsA("Player")(p1))
		sessionUtilityModule.startAbuseReportSession(p2)
		t:getInstance():openReportDialog(constantsModule.ReportType.Player, p1)
	end,
	openReportDialogForPlace = function(p1)
		-- upvalues: sessionUtilityModule (ref), t (ref), constantsModule (ref)
		sessionUtilityModule.startAbuseReportSession(p1)
		t:getInstance():openReportDialog(constantsModule.ReportType.Place)
	end,
	openReportMenu = function(p1)
		-- upvalues: sessionUtilityModule (ref), t (ref)
		sessionUtilityModule.startAbuseReportSession(p1)
		t:getInstance():openReportMenu()
	end
}