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
local var1 = createStoreModule()

return {
	mountInGameMenu = function()
		-- upvalues: registerSetCoresModule (ref), var1 (ref), bindMenuActionsModule (ref), requestGameNameAndDescriptionModule (ref), globalConfigModule (ref), roact (ref), bindableEvent (ref), bindableEvent_1 (ref), localization (ref), localizationService (ref), setLocaleIdModule (ref), setInspectMenuEnabledModule (ref), guiService (ref), initVoiceChatStoreModule (ref), renderWithCoreScriptsStyleProviderModule (ref), localizationProvider (ref), selectionCursorProvider (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerContextProviderModule (ref), appModule (ref), appInteractionFeedbackProvider (ref), feedbackManagerInjectionContextProvider (ref), constantsModule (ref), setScreenSizeModule (ref), roactRodux (ref), inGameMenuPolicyModule (ref), coreGuiService (ref)
		registerSetCoresModule(var1)
		bindMenuActionsModule(var1)
		requestGameNameAndDescriptionModule(var1)
		
		if globalConfigModule.propValidation then
			roact.setGlobalConfig({ propValidation = true })
		end
		if globalConfigModule.elementTracing then
			roact.setGlobalConfig({ elementTracing = true })
		end
		var1.changed:connect(function(p1, p2)
			-- upvalues: bindableEvent (copy), bindableEvent_1 (copy)
			if p1.isMenuOpen ~= p2.isMenuOpen then
				bindableEvent:Fire(p1.isMenuOpen)
			end
			local enabled = p1.respawn.enabled
			local customCallback = p1.respawn.customCallback
			
			if enabled ~= p2.respawn.enabled and customCallback ~= p2.respawn.customCallback then
				bindableEvent_1:Fire(enabled, customCallback)
			end
		end)
		local var2 = localization.new(localizationService.RobloxLocaleId)
		var1:dispatch(setLocaleIdModule(localizationService.RobloxLocaleId))
		localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: var2 (ref), localizationService (copy), var1 (copy), setLocaleIdModule (copy)
			var2:SetLocale(localizationService.RobloxLocaleId)
			var1:dispatch(setLocaleIdModule(localizationService.RobloxLocaleId))
		end)
		var1:dispatch(setInspectMenuEnabledModule(guiService:GetInspectMenuEnabled()))
		guiService.InspectMenuEnabledChangedSignal:Connect(function(p1)
			-- upvalues: var1 (copy), setInspectMenuEnabledModule (copy)
			var1:dispatch(setInspectMenuEnabledModule(p1))
		end)
		initVoiceChatStoreModule(var1)
		roact.mount(roact.createElement("ScreenGui", {
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			DisplayOrder = constantsModule.DisplayOrder.RootMenu,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			AutoLocalize = false,
			[roact.Change.AbsoluteSize] = function(p1)
				-- upvalues: var1 (copy), setScreenSizeModule (copy)
				var1:dispatch(setScreenSizeModule(p1.AbsoluteSize))
			end
		}, {
			StoreProvider = roact.createElement(roactRodux.StoreProvider, { store = var1 }, {
				PolicyProvider = roact.createElement(inGameMenuPolicyModule.Provider, { policy = { inGameMenuPolicyModule.Mapper } }, {
					ThemeProvider = roact.createElement(appInteractionFeedbackProvider, {}, {
						tree = roact.createElement(feedbackManagerInjectionContextProvider, nil, {
							tree = renderWithCoreScriptsStyleProviderModule({
								LocalizationProvider = roact.createElement(localizationProvider, { localization = var2 }, {
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
	openInGameMenu = function(p1)
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.TopbarButton, p1))
	end,
	closeInGameMenu = function()
		-- upvalues: closeMenuModule (ref), var1 (ref)
		closeMenuModule(var1)
	end,
	openReportDialog = function(p1, p2)
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref), trustAndSafetyModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.ReportAbuseTriggered, constantsModule.ReportDialogKey))
		trustAndSafetyModule.openReportDialogForPlayer(p1, if p2 ~= nil then constantsModule.AnalyticsInGameMenuName else p2)
	end,
	openGameSettingsPage = function()
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.SettingsTriggered))
		var1:dispatch(setCurrentPageModule("GameSettings"))
	end,
	openGameLeavePage = function()
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame))
		var1:dispatch(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
	end,
	openCharacterResetPage = function()
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref), setRespawningModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.GamepadResetCharacter))
		var1:dispatch(setCurrentPageModule(constantsModule.MainPagePageKey))
		var1:dispatch(setRespawningModule(true))
	end,
	openPlayersPage = function()
		-- upvalues: var1 (ref), openMenuModule (ref), constantsModule (ref), setCurrentPageModule (ref)
		var1:dispatch(openMenuModule(constantsModule.AnalyticsMenuOpenTypes.PlayersTriggered))
		var1:dispatch(setCurrentPageModule("Players"))
	end,
	getOpenChangedEvent = function()
		-- upvalues: bindableEvent (ref)
		return bindableEvent
	end,
	getOpen = function()
		-- upvalues: var1 (ref)
		return var1:getState().isMenuOpen
	end,
	getRespawnBehaviour = function()
		-- upvalues: var1 (ref)
		local state = var1:getState()
		
		return state.respawn.enabled, state.respawn.customCallback
	end,
	getRespawnBehaviourChangedEvent = function()
		-- upvalues: bindableEvent_1 (ref)
		return bindableEvent_1
	end,
	setMenuIconTooltipOpen = function(value)
		-- upvalues: var1 (ref), setMenuIconTooltipOpenModule (ref)
		var1:dispatch(setMenuIconTooltipOpenModule(value))
	end
}