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
local identifyAvatarsModule = require(script.Thunks.IdentifyAvatars)
local sessionUtilityModule = require(script.Utility.SessionUtility)
local screenshotHookManagerModule = require(script.Utility.ScreenshotHookManager)
local fetchPlaceInfoModule = require(script.Thunks.FetchPlaceInfo)
local getFFlagReportAnythingScreenshotModule = require(script.Flags.GetFFlagReportAnythingScreenshot)
local t = {
	getInstance = function(p0)
		if not p0._initialized then
			p0:initialize()
			p0._initialized = true
		end
		return p0
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
		local var24 = localization.new(localizationService.RobloxLocaleId)
		localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: localizationService (copy), var24 (ref)
			var24:SetLocale(localizationService.RobloxLocaleId)
		end)
		
		return var24
	end,
	openReportDialog = function(p2, p3, p4)
		-- upvalues: setVoiceReportingFlowModule (ref), getFFlagReportAnythingScreenshotModule (ref), identifyAvatarsModule (ref), beginReportFlowModule (ref)
		p2.store:dispatch(setVoiceReportingFlowModule(true))
		
		if getFFlagReportAnythingScreenshotModule() then
			p2.store:dispatch(identifyAvatarsModule())
		end
		p2.store:dispatch(beginReportFlowModule(p3, p4))
	end,
	openReportMenu = function(p5)
		-- upvalues: setVoiceReportingFlowModule (ref), getFFlagReportAnythingScreenshotModule (ref), identifyAvatarsModule (ref), beginReportFlowModule (ref)
		p5.store:dispatch(setVoiceReportingFlowModule(true))
		
		if getFFlagReportAnythingScreenshotModule() then
			p5.store:dispatch(identifyAvatarsModule())
		end
		p5.store:dispatch(beginReportFlowModule())
	end
}

return {
	openReportDialogForPlayer = function(p6, p7)
		-- upvalues: playerInterfaceModule (ref), tModule (ref), sessionUtilityModule (ref), t (ref), constantsModule (ref)
		assert(playerInterfaceModule(p6) and tModule.instanceIsA("Player")(p6))
		sessionUtilityModule.startAbuseReportSession(p7)
		t:getInstance():openReportDialog(constantsModule.ReportType.Player, p6)
	end,
	openReportDialogForPlace = function(p8)
		-- upvalues: sessionUtilityModule (ref), t (ref), constantsModule (ref)
		sessionUtilityModule.startAbuseReportSession(p8)
		t:getInstance():openReportDialog(constantsModule.ReportType.Place)
	end,
	openReportMenu = function(p9)
		-- upvalues: sessionUtilityModule (ref), t (ref)
		sessionUtilityModule.startAbuseReportSession(p9)
		t:getInstance():openReportMenu()
	end,
	setPreReportScreenshotHook = function(value)
		-- upvalues: screenshotHookManagerModule (ref)
		screenshotHookManagerModule.setPreScreenshotHook(value)
	end,
	setPostReportScreenshotHook = function(value)
		-- upvalues: screenshotHookManagerModule (ref)
		screenshotHookManagerModule.setPostScreenshotHook(value)
	end
}