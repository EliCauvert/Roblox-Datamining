local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local FeedbackManagerInjectionContextProvider = require(CorePackages.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider
local AppInteractionFeedbackProvider = require(CorePackages.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local SelectionCursorProvider = InGameMenuDependenciesModule.UIBlox.App.SelectionImage.SelectionCursorProvider
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local BindMenuActionsModule = require(script.SetupFunctions.bindMenuActions)
local RegisterSetCoresModule = require(script.SetupFunctions.registerSetCores)
local RequestGameNameAndDescriptionModule = require(script.SetupFunctions.requestGameNameAndDescription)
local AppModule = require(script.Components.App)
local FocusHandlerContextProviderModule = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider)
local InitVoiceChatStoreModule = require(RobloxGui.Modules.VoiceChat.initVoiceChatStore)
local TrustAndSafetyModule = require(RobloxGui.Modules.TrustAndSafety)
local SetLocaleIdModule = require(script.Actions.SetLocaleId)
local SetInspectMenuEnabledModule = require(script.Actions.SetInspectMenuEnabled)
local SetCurrentPageModule = require(script.Actions.SetCurrentPage)
local SetScreenSizeModule = require(script.Actions.SetScreenSize)
local SetMenuIconTooltipOpenModule = require(script.Actions.SetMenuIconTooltipOpen)
local SetRespawningModule = require(script.Actions.SetRespawning)
local OpenMenuModule = require(script.Thunks.OpenMenu)
local CloseMenuModule = require(script.Thunks.CloseMenu)
local InGameMenuPolicyModule = require(script.InGameMenuPolicy)
local GlobalConfigModule = require(script.GlobalConfig)
local ConstantsModule = require(script.Resources.Constants)
local GetFFlagIGMGamepadSelectionHistoryModule = require(script.Flags.GetFFlagIGMGamepadSelectionHistory)
local BindableEvent = Instance.new("BindableEvent")
local BindableEvent1 = Instance.new("BindableEvent")
local Store = require(script.createStore)()

return {
	mountInGameMenu = function()
		-- upvalues: RegisterSetCoresModule (copy), Store (copy), BindMenuActionsModule (copy), RequestGameNameAndDescriptionModule (copy), GlobalConfigModule (copy), Roact (copy), BindableEvent (copy), BindableEvent1 (copy), Localization (copy), LocalizationService (copy), SetLocaleIdModule (copy), SetInspectMenuEnabledModule (copy), GuiService (copy), InitVoiceChatStoreModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), LocalizationProvider (copy), SelectionCursorProvider (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), FocusHandlerContextProviderModule (copy), AppModule (copy), AppInteractionFeedbackProvider (copy), FeedbackManagerInjectionContextProvider (copy), ConstantsModule (copy), SetScreenSizeModule (copy), RoactRodux (copy), InGameMenuPolicyModule (copy), CoreGui (copy)
		RegisterSetCoresModule(Store)
		BindMenuActionsModule(Store)
		RequestGameNameAndDescriptionModule(Store)
		
		if GlobalConfigModule.propValidation then
			Roact.setGlobalConfig({ propValidation = true })
		end
		if GlobalConfigModule.elementTracing then
			Roact.setGlobalConfig({ elementTracing = true })
		end
		Store.changed:connect(function(Value, p1)
			-- upvalues: BindableEvent (upval), BindableEvent1 (upval)
			if Value.isMenuOpen ~= p1.isMenuOpen then
				BindableEvent:Fire(Value.isMenuOpen)
			end
			local Enabled = Value.respawn.enabled
			local CustomCallback = Value.respawn.customCallback
			local CustomCallback1 = p1.respawn.customCallback
			
			if Enabled ~= p1.respawn.enabled and CustomCallback ~= CustomCallback1 then
				BindableEvent1:Fire(Enabled, CustomCallback)
			end
		end)
		local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
		Store:dispatch(SetLocaleIdModule(LocalizationService.RobloxLocaleId))
		LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: NewLocalization (copy), LocalizationService (upval), Store (upval), SetLocaleIdModule (upval)
			NewLocalization:SetLocale(LocalizationService.RobloxLocaleId)
			Store:dispatch(SetLocaleIdModule(LocalizationService.RobloxLocaleId))
		end)
		Store:dispatch(SetInspectMenuEnabledModule(GuiService:GetInspectMenuEnabled()))
		GuiService.InspectMenuEnabledChangedSignal:Connect(function(Enabled)
			-- upvalues: Store (upval), SetInspectMenuEnabledModule (upval)
			Store:dispatch(SetInspectMenuEnabledModule(Enabled))
		end)
		InitVoiceChatStoreModule(Store)
		Roact.mount(Roact.createElement("ScreenGui", {
			ResetOnSpawn = false,
			IgnoreGuiInset = true,
			DisplayOrder = ConstantsModule.DisplayOrder.RootMenu,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			AutoLocalize = false,
			[Roact.Change.AbsoluteSize] = function(Frame)
				-- upvalues: Store (upval), SetScreenSizeModule (upval)
				Store:dispatch(SetScreenSizeModule(Frame.AbsoluteSize))
			end
		}, {
			StoreProvider = Roact.createElement(RoactRodux.StoreProvider, { store = Store }, {
				PolicyProvider = Roact.createElement(InGameMenuPolicyModule.Provider, { policy = { InGameMenuPolicyModule.Mapper } }, {
					ThemeProvider = Roact.createElement(AppInteractionFeedbackProvider, {}, {
						tree = Roact.createElement(FeedbackManagerInjectionContextProvider, nil, {
							tree = RenderWithCoreScriptsStyleProviderModule({
								LocalizationProvider = Roact.createElement(LocalizationProvider, { localization = NewLocalization }, {
									CursorProvider = Roact.createElement(SelectionCursorProvider, {}, {
										FocusHandlerContextProvider = GetFFlagIGMGamepadSelectionHistoryModule() and Roact.createElement(FocusHandlerContextProviderModule, {}, { InGameMenu = Roact.createElement(AppModule) }) or nil,
										InGameMenu = if GetFFlagIGMGamepadSelectionHistoryModule() then nil else Roact.createElement(AppModule) or nil
									})
								})
							})
						})
					})
				})
			})
		}), CoreGui, "InGameMenu")
	end,
	openInGameMenu = function(p1)
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.TopbarButton, p1))
	end,
	closeInGameMenu = function()
		-- upvalues: CloseMenuModule (copy), Store (copy)
		CloseMenuModule(Store)
	end,
	openReportDialog = function(p1, p2)
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy), TrustAndSafetyModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.ReportAbuseTriggered, ConstantsModule.ReportDialogKey))
		TrustAndSafetyModule.openReportDialogForPlayer(p1, if p2 == nil then ConstantsModule.AnalyticsInGameMenuName else p2)
	end,
	openGameSettingsPage = function()
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy), SetCurrentPageModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.SettingsTriggered))
		Store:dispatch(SetCurrentPageModule("GameSettings"))
	end,
	openGameLeavePage = function()
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy), SetCurrentPageModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame))
		Store:dispatch(SetCurrentPageModule(ConstantsModule.LeaveGamePromptPageKey))
	end,
	openCharacterResetPage = function()
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy), SetCurrentPageModule (copy), SetRespawningModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.GamepadResetCharacter))
		Store:dispatch(SetCurrentPageModule(ConstantsModule.MainPagePageKey))
		Store:dispatch(SetRespawningModule(true))
	end,
	openPlayersPage = function()
		-- upvalues: Store (copy), OpenMenuModule (copy), ConstantsModule (copy), SetCurrentPageModule (copy)
		Store:dispatch(OpenMenuModule(ConstantsModule.AnalyticsMenuOpenTypes.PlayersTriggered))
		Store:dispatch(SetCurrentPageModule("Players"))
	end,
	getOpenChangedEvent = function()
		-- upvalues: BindableEvent (copy)
		return BindableEvent
	end,
	getOpen = function()
		-- upvalues: Store (copy)
		return Store:getState().isMenuOpen
	end,
	getRespawnBehaviour = function()
		-- upvalues: Store (copy)
		local State = Store:getState()
		
		return State.respawn.enabled, State.respawn.customCallback
	end,
	getRespawnBehaviourChangedEvent = function()
		-- upvalues: BindableEvent1 (copy)
		return BindableEvent1
	end,
	setMenuIconTooltipOpen = function(p1)
		-- upvalues: Store (copy), SetMenuIconTooltipOpenModule (copy)
		Store:dispatch(SetMenuIconTooltipOpenModule(p1))
	end
}