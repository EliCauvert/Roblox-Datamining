local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local localizationService = game:GetService("LocalizationService")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local feedbackManagerInjectionContextProvider = require(corePackagesService.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider
local appInteractionFeedbackProvider = require(corePackagesService.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local selectionCursorProvider = UIBlox.App.SelectionImage.SelectionCursorProvider
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local bindMenuActionsModule = require(script.SetupFunctions.bindMenuActions)
local registerSetCoresModule = require(script.SetupFunctions.registerSetCores)
local requestGameNameAndDescriptionModule = require(script.SetupFunctions.requestGameNameAndDescription)
local createStoreModule = require(script.createStore)
local appModule = require(script.Components.App)
local focusHandlerContextProviderModule = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider)
local initVoiceChatStoreModule = require(robloxGui.Modules.VoiceChat.initVoiceChatStore)
local trustAndSafetyModule = require(robloxGui.Modules.TrustAndSafety)
local setLocaleIdModule = require(script.Actions.SetLocaleId)
local setInspectMenuEnabledModule = require(script.Actions.SetInspectMenuEnabled)
local setCurrentPageModule = require(script.Actions.SetCurrentPage)
local setScreenSizeModule = require(script.Actions.SetScreenSize)
local setMenuIconTooltipOpenModule = require(script.Actions.SetMenuIconTooltipOpen)
local setRespawningModule = require(script.Actions.SetRespawning)
local openMenuModule = require(script.Thunks.OpenMenu)
local closeMenuModule = require(script.Thunks.CloseMenu)
local inGameMenuPolicyModule = require(script.InGameMenuPolicy)
local globalConfigModule = require(script.GlobalConfig)
local constantsModule = require(script.Resources.Constants)
local getFFlagIGMGamepadSelectionHistoryModule = require(script.Flags.GetFFlagIGMGamepadSelectionHistory)
local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
local var29 = createStoreModule()

return {
	mountInGameMenu = function() --[[ line: 56 ]]
		-- upvalues: registerSetCoresModule (ref), var29 (ref), bindMenuActionsModule (ref), requestGameNameAndDescriptionModule (ref), globalConfigModule (ref), roact (ref), bindableEvent (ref), bindableEvent_1 (ref), localization (ref), localizationService (ref), setLocaleIdModule (ref), setInspectMenuEnabledModule (ref), guiService (ref), initVoiceChatStoreModule (ref), renderWithCoreScriptsStyleProviderModule (ref), localizationProvider (ref), selectionCursorProvider (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerContextProviderModule (ref), appModule (ref), appInteractionFeedbackProvider (ref), feedbackManagerInjectionContextProvider (ref), constantsModule (ref), setScreenSizeModule (ref), roactRodux (ref), inGameMenuPolicyModule (ref), coreGuiService (ref)
		registerSetCoresModule(var29)
		bindMenuActionsModule(var29)
		requestGameNameAndDescriptionModule(var29)
		
		if globalConfigModule.propValidation then
			roact.setGlobalConfig({ propValidation = true })
		end
		if globalConfigModule.elementTracing then
			roact.setGlobalConfig({ elementTracing = true })
		end
		var29.changed:connect(function(p0, p1) --[[ line: 72 ]]
			-- upvalues: bindableEvent (copy), bindableEvent_1 (copy)
			if p0.isMenuOpen ~= p1.isMenuOpen then
				bindableEvent:Fire(p0.isMenuOpen)
			end
			local enabled = p0.respawn.enabled
			local customCallback = p0.respawn.customCallback
			
			if enabled ~= p1.respawn.enabled and customCallback ~= p1.respawn.customCallback then
				bindableEvent_1:Fire(enabled, customCallback)
			end
		end)
		local var30 = localization.new(localizationService.RobloxLocaleId)
		var29:dispatch(setLocaleIdModule(localizationService.RobloxLocaleId))
		localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ line: 90 ]]
			-- upvalues: var30 (ref), localizationService (copy), var29 (copy), setLocaleIdModule (copy)
			var30:SetLocale(localizationService.RobloxLocaleId)
			var29:dispatch(setLocaleIdModule(localizationService.RobloxLocaleId))
		end)
		var29:dispatch(setInspectMenuEnabledModule(guiService:GetInspectMenuEnabled()))
		guiService.InspectMenuEnabledChangedSignal:Connect(function(p2) --[[ line: 96 ]]
			-- upvalues: var29 (copy), setInspectMenuEnabledModule (copy)
			var29:dispatch(setInspectMenuEnabledModule(p2))
		end)
		initVoiceChatStoreModule(var29)
		roact.mount(roact.createElement("ScreenGui", {
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			DisplayOrder = constantsModule.DisplayOrder.RootMenu,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			AutoLocalize = false,
			[roact.Change.AbsoluteSize] = function(p3) --[[ line: 128 ]]
				-- upvalues: var29 (copy), setScreenSizeModule (copy)
				var29:dispatch(setScreenSizeModule(p3.AbsoluteSize))
			end
		}, {
			StoreProvider = roact.createElement(roactRodux.StoreProvider, { store = var29 }, {
				PolicyProvider = roact.createElement(inGameMenuPolicyModule.Provider, { policy = { inGameMenuPolicyModule.Mapper } }, {
					ThemeProvider = roact.createElement(appInteractionFeedbackProvider, {}, {
						tree = roact.createElement(feedbackManagerInjectionContextProvider, nil, {
							tree = renderWithCoreScriptsStyleProviderModule({
								LocalizationProvider = roact.createElement(localizationProvider, { localization = var30 }, {
									CursorProvider = roact.createElement(selectionCursorProvider, {}, {
										FocusHandlerContextProvider = getFFlagIGMGamepadSelectionHistoryModule() and roact.createElement(focusHandlerContextProviderModule, {}, { InGameMenu = roact.createElement(appModule) }) or nil,
										InGameMenu = not getFFlagIGMGamepadSelectionHistoryModule() and roact.createElement(appModule) or nil
									})
								})
							})
						})
					})
				})
			})
		}), coreGuiService, "InGameMenu")
	end,
	openInGameMenu = function(p4) --[[ line: 145 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.TopbarButton, p4))
	end,
	closeInGameMenu = function() --[[ line: 149 ]]
		-- upvalues: closeMenuModule (ref), var29 (ref)
		closeMenuModule(var29)
	end,
	openReportDialog = function(p5, p6) --[[ line: 153 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref), trustAndSafetyModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.ReportAbuseTriggered, constantsModule.ReportDialogKey))
		trustAndSafetyModule.openReportDialogForPlayer(p5, if p6 ~= nil then constantsModule.AnalyticsInGameMenuName else p6)
	end,
	openGameSettingsPage = function() --[[ line: 159 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.SettingsTriggered))
		var29:dispatch(setCurrentPageModule("GameSettings"))
	end,
	openGameLeavePage = function() --[[ line: 164 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame))
		var29:dispatch(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
	end,
	openCharacterResetPage = function() --[[ line: 169 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref), setRespawningModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.GamepadResetCharacter))
		var29:dispatch(setCurrentPageModule(constantsModule.MainPagePageKey))
		var29:dispatch(setRespawningModule(true))
	end,
	openPlayersPage = function() --[[ line: 175 ]]
		-- upvalues: var29 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var29:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.PlayersTriggered))
		var29:dispatch(setCurrentPageModule("Players"))
	end,
	getOpenChangedEvent = function() --[[ line: 180 ]]
		-- upvalues: bindableEvent (ref)
		return bindableEvent
	end,
	getOpen = function() --[[ line: 184 ]]
		-- upvalues: var29 (ref)
		return var29:getState().isMenuOpen
	end,
	getRespawnBehaviour = function() --[[ line: 188 ]]
		-- upvalues: var29 (ref)
		local state = var29:getState()
		
		return state.respawn.enabled, state.respawn.customCallback
	end,
	getRespawnBehaviourChangedEvent = function() --[[ line: 193 ]]
		-- upvalues: bindableEvent_1 (ref)
		return bindableEvent_1
	end,
	setMenuIconTooltipOpen = function(value) --[[ line: 197 ]]
		-- upvalues: var29 (ref), setMenuIconTooltipOpenModule (ref)
		var29:dispatch(setMenuIconTooltipOpenModule(value))
	end
}