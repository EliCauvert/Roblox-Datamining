local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local IXPService = game:GetService("IXPService")
local LocalizationService = game:GetService("LocalizationService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagBuildExperienceInGameShell = SharedFlagsModule.FFlagBuildExperienceInGameShell
local ShouldSkipHistoricalMessageFunction = require(CorePackages.Workspace.Packages.ExpChat).shouldSkipHistoricalMessage
local FFlagAddTopBarScrimModule = require(script.Flags.FFlagAddTopBarScrim)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local LocalizationProvider = require(CorePackages.Workspace.Packages.Localization).LocalizationProvider
local DesignTokenProvider = require(CorePackages.Workspace.Packages.Style).DesignTokenProvider
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local ReactSceneUnderstandingModule = require(CorePackages.Packages.ReactSceneUnderstanding)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SignalsModule = if FFlagBuildExperienceInGameShell then require(CorePackages.Packages.Signals) else nil
local ColorMode = require(CorePackages.Packages.Foundation).Enums.ColorMode
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local ServiceModule = nil
local TopBarScrimModule = nil

if EnabledResult then
	ServiceModule = require(RobloxGui.Modules.Chrome.Service)
	TopBarScrimModule = require(script.Components.TopBarScrim)
end
local ConstantsModule = require(script.Constants)
local MenuNavigationPromptTokenMapperModule = require(script.TokenMappers.MenuNavigationPromptTokenMapper)
local FFlagTopBarSignalizeSetCores = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores
local FFlagTopBarSignalizeMenuOpen = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarDeprecateGameInfoRoduxModule = require(script.Flags.FFlagTopBarDeprecateGameInfoRodux)
local FFlagTopBarDeprecateGamepadNavigationDialogRoduxModule = require(script.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local CoreScriptsErrorBoundaryModule = require(CorePackages.Workspace.Packages.CoreScriptsErrorBoundary)
local CoreScriptsErrorBoundary = CoreScriptsErrorBoundaryModule.CoreScriptsErrorBoundary
local Surfaces = CoreScriptsErrorBoundaryModule.Surfaces
local FFlagCoreScriptsReactTreeCrashCounter = CoreScriptsErrorBoundaryModule.Flags.FFlagCoreScriptsReactTreeCrashCounter
local FFlagTopBarDeprecateChatRoduxModule = require(script.Flags.FFlagTopBarDeprecateChatRodux)
local FFlagTopBarDeprecateDisplayOptionsRoduxModule = require(script.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local FFlagEnablePlaytestModeUnibar = SharedFlagsModule.FFlagEnablePlaytestModeUnibar
local Effect = nil

if EnabledResult then
	if FFlagBuildExperienceInGameShell then
		local DisplayStore = DisplayModule.GetDisplayStore(false)
		DisplayStore.setGuiInset(function(p1)
			-- upvalues: ConstantsModule (copy)
			return {
				left = p1.left,
				top = ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight),
				right = p1.right,
				bottom = p1.bottom
			}
		end)
		Effect = SignalsModule.createEffect(function(p1)
			-- upvalues: DisplayStore (copy), GuiService (copy)
			local GuiInset = DisplayStore.getGuiInset(p1)
			GuiService:SetGlobalGuiInset(GuiInset.left, GuiInset.top, GuiInset.right, GuiInset.bottom)
		end)
	else
		(function()
			-- upvalues: GuiService (copy), ConstantsModule (copy), DisplayModule (copy)
			local GuiInset, GuiInset2 = GuiService:GetGuiInset()
			GuiService:SetGlobalGuiInset(GuiInset.X, ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight), GuiInset2.X, GuiInset2.Y)
			DisplayModule.GetDisplayStore().setGuiInset({
				left = GuiInset.X,
				top = ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight),
				right = GuiInset2.X,
				bottom = GuiInset2.Y
			})
		end)()
	end
end
local TopBarAppModule = if FFlagTopBarRefactor then require(script.ComponentsV2.TopBarApp) else require(script.Components.TopBarApp)
local ReducerModule = require(script.Reducer)
local TopBarAppPolicyModule = require(script.TopBarAppPolicy)
local SetSmallTouchDeviceModule = require(script.Actions.SetSmallTouchDevice)
local SetInspectMenuOpenModule = require(script.Actions.SetInspectMenuOpen)
local SetGamepadMenuOpenModule = require(script.Actions.SetGamepadMenuOpen)
local SetGamepadNavigationDialogOpenModule = require(script.Actions.SetGamepadNavigationDialogOpen)
local UpdateUnreadMessagesBadgeModule = require(script.Actions.UpdateUnreadMessagesBadge)
local GetCanChatModule = require(script.Thunks.GetCanChat)
local GetGameNameModule = require(script.Thunks.GetGameName)
local RegisterSetCoresModule = require(script.registerSetCores)
local GlobalConfigModule = require(script.GlobalConfig)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local FFlagAddMenuNavigationToggleDialog = SharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local FFlagShowGameAgeRating = SharedFlagsModule.FFlagShowGameAgeRating
local FFlagGamepadNavigationDialogABTestModule = require(script.Flags.FFlagGamepadNavigationDialogABTest)
local GetFFlagEnableCrossExpVoiceFunction = SharedFlagsModule.GetFFlagEnableCrossExpVoice
local Component = CrossExperienceVoiceModule.Component
local FTUX = RobloxGui.Modules.FTUX
local GetFFlagEnableVRFTUXExperienceModule = require(FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local GetFFlagDebugEnableVRFTUXExperienceInStudioModule = require(FTUX.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio)
local PlatformEnumModule = require(FTUX.Enums.PlatformEnum)
local IsFTUXExperienceModule = require(FTUX.Utility.IsFTUXExperience)
local FTUXModule = require(script.Parent.FTUX)
local IsRunningInStudioFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isRunningInStudio
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local ConnectToIsSpatialChangedFunction = require(CorePackages.Workspace.Packages.AppCommonLib).connectToIsSpatialChanged
local FFlagStudioDeviceSimVRSwitchFixes = SharedFlagsModule.FFlagStudioDeviceSimVRSwitchFixes

local function SpatialRemountGate()
	-- upvalues: ReactModule (copy), IsSpatialFunction (copy), ConnectToIsSpatialChangedFunction (copy), TopBarAppModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsSpatialFunction())
	ReactModule.useEffect(function()
		-- upvalues: ConnectToIsSpatialChangedFunction (upval), UseStateResult2 (copy)
		local ConnectToIsSpatialChangedResult = ConnectToIsSpatialChangedFunction(UseStateResult2, true)
		
		return function()
			-- upvalues: ConnectToIsSpatialChangedResult (copy)
			ConnectToIsSpatialChangedResult:Disconnect()
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, { key = if UseStateResult then "spatial" else "flat" }, { TopBarApp = ReactModule.createElement(TopBarAppModule) })
end

local Module = {}
Module.__index = Module

if FFlagBuildExperienceInGameShell then
	Module._disposeGlobalGuiInsetEffect = Effect
end
function Module.new()
	-- upvalues: Module (copy), GlobalConfigModule (copy), RoactModule (copy), TenFootInterfaceModule (copy), EnabledResult (copy), GuiService (copy), ConstantsModule (copy), FFlagEnablePlaytestModeUnibar (copy), RoduxModule (copy), ReducerModule (copy), FFlagTopBarSignalizeSetCores (copy), RegisterSetCoresModule (copy), FFlagTopBarDeprecateChatRoduxModule (copy), GetCanChatModule (copy), FFlagTopBarDeprecateGameInfoRoduxModule (copy), GetGameNameModule (copy), GetFFlagDebugEnableVRFTUXExperienceInStudioModule (copy), IsRunningInStudioFunction (copy), FTUXModule (copy), PlatformEnumModule (copy), GetFFlagEnableVRFTUXExperienceModule (copy), IsFTUXExperienceModule (copy), IsNewInGameMenuEnabledModule (copy), RobloxGui (copy), FFlagTopBarDeprecateDisplayOptionsRoduxModule (copy), SetSmallTouchDeviceModule (copy), UtilityModule (copy), ColorMode (copy), Constants (copy), UiModeStyleProvider (copy), FFlagStudioDeviceSimVRSwitchFixes (copy), SpatialRemountGate (copy), TopBarAppModule (copy), FFlagAddMenuNavigationToggleDialog (copy), FFlagGamepadNavigationDialogABTestModule (copy), DesignTokenProvider (copy), MenuNavigationPromptTokenMapperModule (copy), ServiceModule (ref), FFlagAddTopBarScrimModule (copy), ReactModule (copy), TopBarScrimModule (ref), RoactRoduxModule (copy), FFlagTopBarRefactor (copy), FFlagShowGameAgeRating (copy), RoactAppPolicy (copy), TopBarAppPolicyModule (copy), AppFeaturePolicies (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), RoactAppExperimentModule (copy), IXPService (copy), GetFFlagEnableCrossExpVoiceFunction (copy), Component (copy), ReactSceneUnderstandingModule (copy), VoiceStateContextModule (copy), FFlagCoreScriptsReactTreeCrashCounter (copy), CoreScriptsErrorBoundary (copy), Surfaces (copy), CorePackages (copy), CoreGui (copy), ShouldSkipHistoricalMessageFunction (copy), UpdateUnreadMessagesBadgeModule (copy), FFlagTopBarDeprecateGamepadNavigationDialogRoduxModule (copy)
	local self = setmetatable({}, Module)
	
	if GlobalConfigModule.propValidation then
		RoactModule.setGlobalConfig({ propValidation = true })
	end
	if GlobalConfigModule.elementTracing then
		RoactModule.setGlobalConfig({ elementTracing = true })
	end
	if not TenFootInterfaceModule:IsEnabled() and not EnabledResult then
		GuiService:SetGlobalGuiInset(0, ConstantsModule.TopBarHeight, 0, 0)
	end
	if FFlagEnablePlaytestModeUnibar then
		require(script.initPlaytestMode)()
	end
	self.store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	
	if not FFlagTopBarSignalizeSetCores then
		RegisterSetCoresModule(self.store)
	end
	if not FFlagTopBarDeprecateChatRoduxModule then
		self.store:dispatch(GetCanChatModule)
	end
	if not FFlagTopBarDeprecateGameInfoRoduxModule then
		self.store:dispatch(GetGameNameModule)
	end
	if GetFFlagDebugEnableVRFTUXExperienceInStudioModule() and IsRunningInStudioFunction() then
		FTUXModule.mountFtuxMenu(PlatformEnumModule.QuestVR)
	end
	if GetFFlagEnableVRFTUXExperienceModule() and IsFTUXExperienceModule(PlatformEnumModule.QuestVR) then
		FTUXModule.mountFtuxMenu(PlatformEnumModule.QuestVR)
	end
	if IsNewInGameMenuEnabledModule() then
		require(RobloxGui.Modules.InGameMenuInit).mountInGameMenu()
	end
	if not FFlagTopBarDeprecateDisplayOptionsRoduxModule then
		coroutine.wrap(function()
			-- upvalues: self (copy), SetSmallTouchDeviceModule (upval), UtilityModule (upval)
			self.store:dispatch(SetSmallTouchDeviceModule(UtilityModule:IsSmallTouchScreen()))
		end)()
	end
	local Style = {
		themeName = ColorMode.Dark,
		fontName = Constants.FontName.Gotham
	}
	
	local function wrapWithUiModeStyleProvider(p1)
		-- upvalues: RoactModule (upval), UiModeStyleProvider (upval), Style (copy)
		return {
			UiModeStyleProvider = RoactModule.createElement(UiModeStyleProvider, { style = Style }, p1)
		}
	end
	
	local Element = if FFlagStudioDeviceSimVRSwitchFixes then RoactModule.createElement(SpatialRemountGate) else RoactModule.createElement(TopBarAppModule)
	
	if FFlagAddMenuNavigationToggleDialog or FFlagGamepadNavigationDialogABTestModule then
		Element = RoactModule.createElement(DesignTokenProvider, {
			tokenMappers = {
				MenuNavigationPrompt = if FFlagGamepadNavigationDialogABTestModule then MenuNavigationPromptTokenMapperModule else nil
			}
		}, { TopBarApp = Element })
	end
	self.root = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		PolicyProvider = RoactModule.createElement(if FFlagTopBarRefactor or FFlagShowGameAgeRating then RoactAppPolicy.Provider else TopBarAppPolicyModule.Provider, {
			policy = if FFlagTopBarRefactor or FFlagShowGameAgeRating then { AppFeaturePolicies } else { TopBarAppPolicyModule.Mapper }
		}, (wrapWithUiModeStyleProvider({
			LocalizationProvider = RoactModule.createElement(LocalizationProvider, {
				localization = Localization.new(LocalizationService.RobloxLocaleId)
			}, {
				ExperimentProvider = RoactModule.createFragment({
					RoactAppExperimentProvider = RoactModule.createElement(RoactAppExperimentModule.Provider, { value = IXPService }, {
						TopBarApp = Element,
						TopBarScrim = ServiceModule and (FFlagAddTopBarScrimModule and ReactModule.createElement("ScreenGui", {
							IgnoreGuiInset = true,
							DisplayOrder = -2,
							ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						}, {
							TopBarScrim = ReactModule.createElement(TopBarScrimModule)
						}))
					}),
					CrossExperienceVoice = GetFFlagEnableCrossExpVoiceFunction() and RoactModule.createElement(Component) or nil
				})
			})
		})))
	})
	self.root = RoactModule.createElement(ReactSceneUnderstandingModule.SceneAnalysisProvider, nil, self.root)
	self.root = RoactModule.createElement(VoiceStateContextModule.Provider, nil, self.root)
	self.root = RoactModule.createElement("Folder", { Name = "TopBarApp" }, self.root)
	
	if FFlagCoreScriptsReactTreeCrashCounter then
		self.root = RoactModule.createElement(CoreScriptsErrorBoundary, { surface = Surfaces.TopBar }, self.root)
	end
	if not require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.teamCreateUtils).isViewer() then
		self.element = RoactModule.mount(self.root, CoreGui, "TopBar")
	end
	if not FFlagTopBarDeprecateChatRoduxModule then
		game:GetService("TextChatService").MessageReceived:Connect(function(TextChatMessage)
			-- upvalues: ShouldSkipHistoricalMessageFunction (upval), self (copy), UpdateUnreadMessagesBadgeModule (upval)
			if not ShouldSkipHistoricalMessageFunction(TextChatMessage) then
				self.store:dispatch(UpdateUnreadMessagesBadgeModule(1))
				
				return
			end
		end)
	end
	if FFlagGamepadNavigationDialogABTestModule and not FFlagTopBarDeprecateGamepadNavigationDialogRoduxModule then
		local UserInputService = game:GetService("UserInputService")
		local Connection = nil
		
		local function disconnectGamepadConnected()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
		
		if UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			self:setGamepadNavigationDialogOpen(true)
		else
			Connection = UserInputService.GamepadConnected:Connect(function()
				-- upvalues: self (copy), Connection (ref)
				self:setGamepadNavigationDialogOpen(true)
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end)
		end
		GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(disconnectGamepadConnected)
	end
	return self
end

function Module:setInspectMenuOpen(p1)
	-- upvalues: FFlagTopBarSignalizeMenuOpen (copy), SetInspectMenuOpenModule (copy)
	if not FFlagTopBarSignalizeMenuOpen then
		self.store:dispatch(SetInspectMenuOpenModule(p1))
		
		return
	end
end

function Module:setGamepadMenuOpen(p1)
	-- upvalues: SetGamepadMenuOpenModule (copy)
	self.store:dispatch(SetGamepadMenuOpenModule(p1))
end

function Module:setGamepadNavigationDialogOpen(p1)
	-- upvalues: FFlagTopBarDeprecateDisplayOptionsRoduxModule (copy), SetGamepadNavigationDialogOpenModule (copy)
	if not FFlagTopBarDeprecateDisplayOptionsRoduxModule then
		self.store:dispatch(SetGamepadNavigationDialogOpenModule(p1))
	end
end

return Module.new()