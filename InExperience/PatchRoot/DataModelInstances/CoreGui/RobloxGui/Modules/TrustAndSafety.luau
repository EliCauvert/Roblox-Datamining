local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local _ = require(CorePackages.Packages.UIBlox)
local DependenciesModule = require(script.Dependencies)
local Localization = DependenciesModule.Localization
local LocalizationProviderModule = require(DependenciesModule.LocalizationProvider)
local PlayerInterfaceModule = require(DependenciesModule.playerInterface)
local ConstantsModule = require(script.Resources.Constants)
local GlobalConfigModule = require(script.GlobalConfig)
local ReducersModule = require(script.Reducers)
local TrustAndSafetyAppModule = require(script.Components.TrustAndSafetyApp)
local TrustAndSafetyAppPolicyModule = require(script.TrustAndSafetyAppPolicy)
local _ = require(script.Actions.OpenReportDialog)
local _ = require(script.Actions.OpenReportMenu)
local BeginReportFlowModule = require(script.Actions.BeginReportFlow)
local SetVoiceReportingFlowModule = require(script.Actions.SetVoiceReportingFlow)
local SessionUtilityModule = require(script.Utility.SessionUtility)
local FetchPlaceInfoModule = require(script.Thunks.FetchPlaceInfo)
local config = {
	getInstance = function(p1)
		if not p1._initialized then
			p1:initialize()
			p1._initialized = true
		end
		return p1
	end,
	initialize = function(p1)
		-- upvalues: GlobalConfigModule (copy), RoactModule (copy), FetchPlaceInfoModule (copy), RoactRoduxModule (copy), TrustAndSafetyAppPolicyModule (copy), LocalizationProviderModule (copy), TrustAndSafetyAppModule (copy), CoreGui (copy)
		if GlobalConfigModule.propValidation then
			RoactModule.setGlobalConfig({ propValidation = true })
		end
		if GlobalConfigModule.elementTracing then
			RoactModule.setGlobalConfig({ elementTracing = true })
		end
		p1.store = p1:createStore()
		p1.store:dispatch(FetchPlaceInfoModule(game.GameId))
		p1.localization = p1:createLocalization()
		p1.root = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p1.store }, {
			PolicyProvider = RoactModule.createElement(TrustAndSafetyAppPolicyModule.Provider, { policy = { TrustAndSafetyAppPolicyModule.Mapper } }, {
				LocalizationProvider = RoactModule.createElement(LocalizationProviderModule, { localization = p1.localization }, {
					TrustAndSafety = RoactModule.createElement(TrustAndSafetyAppModule)
				})
			})
		})
		p1.element = RoactModule.mount(p1.root, CoreGui, "TrustAndSafety")
	end,
	createStore = function(_)
		-- upvalues: ReducersModule (copy), RoduxModule (copy), GlobalConfigModule (copy)
		local List = { RoduxModule.thunkMiddleware }
		
		if GlobalConfigModule.logStore then
			table.insert(List, RoduxModule.loggerMiddleware)
		end
		return RoduxModule.Store.new(ReducersModule, nil, List)
	end,
	createLocalization = function(_)
		-- upvalues: LocalizationService (copy), Localization (copy)
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: LocalizationService (upval), NewLocalization (copy)
			NewLocalization:SetLocale(LocalizationService.RobloxLocaleId)
		end)
		
		return NewLocalization
	end,
	openReportDialog = function(p1, p2, p3)
		-- upvalues: SetVoiceReportingFlowModule (copy), BeginReportFlowModule (copy)
		p1.store:dispatch(SetVoiceReportingFlowModule(true))
		p1.store:dispatch(BeginReportFlowModule(p2, p3))
	end,
	openReportMenu = function(p1)
		-- upvalues: SetVoiceReportingFlowModule (copy), BeginReportFlowModule (copy)
		p1.store:dispatch(SetVoiceReportingFlowModule(true))
		p1.store:dispatch(BeginReportFlowModule())
	end
}

return {
	openReportDialogForPlayer = function(p1, p2)
		-- upvalues: PlayerInterfaceModule (copy), TModule (copy), SessionUtilityModule (copy), config (copy), ConstantsModule (copy)
		assert(PlayerInterfaceModule(p1) and TModule.instanceIsA("Player")(p1))
		SessionUtilityModule.startAbuseReportSession(p2)
		config:getInstance():openReportDialog(ConstantsModule.ReportType.Player, p1)
	end,
	openReportDialogForPlace = function(p1)
		-- upvalues: SessionUtilityModule (copy), config (copy), ConstantsModule (copy)
		SessionUtilityModule.startAbuseReportSession(p1)
		config:getInstance():openReportDialog(ConstantsModule.ReportType.Place)
	end,
	openReportMenu = function(p1)
		-- upvalues: SessionUtilityModule (copy), config (copy)
		SessionUtilityModule.startAbuseReportSession(p1)
		config:getInstance():openReportMenu()
	end
}