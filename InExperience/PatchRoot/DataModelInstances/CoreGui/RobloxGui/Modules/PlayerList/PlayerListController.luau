local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ColorMode = require(CorePackages.Packages.Foundation).Enums.ColorMode
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local ApolloClientModule = require(CoreGui.RobloxGui.Modules.ApolloClient)
local ApolloProvider = require(CorePackages.Packages.ApolloClient).ApolloProvider
local Parent = script.Parent
local SignalsModule = require(CorePackages.Packages.Signals)
local InExperienceTopBarModule = require(CorePackages.Workspace.Packages.InExperienceTopBar)
local ReducerModule = require(Parent.Reducers.Reducer)
local GlobalConfigModule = require(Parent.GlobalConfig)
local PlayerListSwitcherModule = require(Parent.PlayerListSwitcher)
local MakePlayerInfoRequestsModule = require(Parent.Thunks.MakePlayerInfoRequests)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local PlatformLeaderboardsClientModule = require(CorePackages.Workspace.Packages.PlatformLeaderboardsClient)
local PlayerIconInfoStoreModule = require(CorePackages.Workspace.Packages.PlayerIconInfoStore)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local Constants1 = PlayerListModule.Common.Constants
local PlayerRelationshipStore = PlayerListModule.PlayerRelationshipStore
local SetPlayerListEnabledModule = require(Parent.Actions.SetPlayerListEnabled)
local SetPlayerListVisibilityModule = require(Parent.Actions.SetPlayerListVisibility)
local SetTempHideKeyModule = require(Parent.Actions.SetTempHideKey)
local SetTenFootInterfaceModule = require(Parent.Actions.SetTenFootInterface)
local SetSmallTouchDeviceModule = require(Parent.Actions.SetSmallTouchDevice)
local SetIsUsingGamepadModule = require(Parent.Actions.SetIsUsingGamepad)
local SetMinimizedModule = require(Parent.Actions.SetMinimized)
local SetSubjectToChinaPoliciesModule = require(Parent.Actions.SetSubjectToChinaPolicies)
local SetSettingsModule = require(Parent.Actions.SetSettings)

if not Players.LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
local FFlagAddNewPlayerListFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListFocusNav
local FStringPlayerListOverrideTypeModule = require(Parent.Flags.FStringPlayerListOverrideType)
local FFlagReplacePlayerIconRoduxWithSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local FFlagBadgeVisibilitySettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local FFlagLuaSupportMicroGamepadPreferredInput = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagEnableMobilePlayerListOnGamepad = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnGamepad
local IsReskinConsoleMobileRouteFunction = PlayerListModule.Common.isReskinConsoleMobileRoute
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local FFlagPlayerListIgnoreDevGamepadBindings = PlayerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local FFlagPlatformLeaderboardPersistStoreOnRemount = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local FFlagPlayerListReskin = PlayerListModule.Flags.FFlagPlayerListReskin
local FFlagPlayerListPersistVisibilityModule = require(Parent.Flags.FFlagPlayerListPersistVisibility)
local PlayerListContainer = PlayerListModule.Container.PlayerListContainer
local LeaderboardStoreInstanceManager = PlayerListModule.LeaderboardStoreInstanceManager
local PlayerListVisibilityStore = PlayerListModule.PlayerListVisibilityStore
local PlayerContextualMenuStore = PlayerListModule.PlayerContextualMenuStore
local PlayerIconInfoStore = PlayerIconInfoStoreModule.PlayerIconInfoStore
local FFlagTopBarSignalizeSetCores = InExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores

local function _(): boolean --[[ Line: 88 | Named "isUnderTestEZ" ]]
	return _G.__TESTEZ_RUNNING_TEST__ == true
end

local _ = function(PreferredInput): boolean --[[ Line: 94 | Named "isTouchOrGamepadInput" ]]
	-- upvalues: FFlagLuaSupportMicroGamepadPreferredInput (copy)
	return PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)
end

local _ = function(PreferredInput) --[[ Line: 105 | Named "isCurrentReskinConsoleMobileRoute" ]]
	-- upvalues: IsReskinConsoleMobileRouteFunction (copy), GuiService (copy)
	return IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	})
end

local _ = function(PreferredInput) --[[ Line: 114 | Named "resolveIsTenFoot" ]]
	-- upvalues: IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy)
	return not IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	}) and not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
end

local _ = function(PreferredInput) --[[ Line: 124 | Named "isLargeConsoleLayout" ]]
	-- upvalues: IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FFlagEnableMobilePlayerListOnConsole (copy)
	if IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	}) then
		return true
	elseif GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) then
		return FFlagEnableMobilePlayerListOnConsole
	else
		return false
	end
end

local _ = function(PreferredInput) --[[ Line: 134 | Named "isSmallTouchScreen" ]]
	-- upvalues: FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), IsReskinConsoleMobileRouteFunction (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FFlagEnableMobilePlayerListOnConsole (copy), FStringPlayerListOverrideTypeModule (copy)
	local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
	
	return UtilityModule:IsSmallTouchScreen() or ((if IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	}) then true else GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad) then FFlagEnableMobilePlayerListOnConsole else false)) or (IsViewportDisplaySizeMatch and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) or FStringPlayerListOverrideTypeModule == "mobile"))
end

local function setupSettings(Store) --[[ Line: 143 ]]
	-- upvalues: SetSettingsModule (copy), UserGameSettings (copy)
	local function _() --[[ Line: 144 | Named "updateSettings" ]]
		-- upvalues: Store (copy), SetSettingsModule (upval), UserGameSettings (upval)
		Store:dispatch(SetSettingsModule({
			reducedMotion = UserGameSettings.ReducedMotion,
			preferredTransparency = UserGameSettings.PreferredTransparency
		}))
	end
	
	Store:dispatch(SetSettingsModule({
		reducedMotion = UserGameSettings.ReducedMotion,
		preferredTransparency = UserGameSettings.PreferredTransparency
	}))
	UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 153 ]]
		-- upvalues: Store (copy), SetSettingsModule (upval), UserGameSettings (upval)
		Store:dispatch(SetSettingsModule({
			reducedMotion = UserGameSettings.ReducedMotion,
			preferredTransparency = UserGameSettings.PreferredTransparency
		}))
	end)
	UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 156 ]]
		-- upvalues: Store (copy), SetSettingsModule (upval), UserGameSettings (upval)
		Store:dispatch(SetSettingsModule({
			reducedMotion = UserGameSettings.ReducedMotion,
			preferredTransparency = UserGameSettings.PreferredTransparency
		}))
	end)
end

local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 164 ]]
	-- upvalues: Module (copy), FFlagPlayerListReskin (copy), GlobalConfigModule (copy), RoactModule (copy), RoduxModule (copy), ReducerModule (copy), setupSettings (copy), StarterGui (copy), SetPlayerListEnabledModule (copy), SetSmallTouchDeviceModule (copy), UserInputService (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), IsReskinConsoleMobileRouteFunction (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FFlagEnableMobilePlayerListOnConsole (copy), FStringPlayerListOverrideTypeModule (copy), SetTenFootInterfaceModule (copy), TenFootInterfaceModule (copy), SetSubjectToChinaPoliciesModule (copy), CachedPolicyServiceModule (copy), ColorMode (copy), Constants (copy), RoactRoduxModule (copy), PlayerListSwitcherModule (copy), ApolloProvider (copy), ApolloClientModule (copy), SetIsUsingGamepadModule (copy), LeaderboardStoreInstanceManager (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), PlayerListContainer (copy), RobloxGui (copy), CoreGui (copy), FFlagAddNewPlayerListFocusNav (copy), FFlagTopBarSignalizeSetCores (copy), SignalsModule (copy), InExperienceTopBarModule (copy)
	local self = setmetatable({}, Module)
	
	if FFlagPlayerListReskin then
		return self:_setupReskin()
	end
	if GlobalConfigModule.propValidation then
		RoactModule.setGlobalConfig({ propValidation = true })
	end
	if GlobalConfigModule.elementTracing then
		RoactModule.setGlobalConfig({ elementTracing = true })
	end
	self.layerCollectorRef = RoactModule.createRef()
	self.store = RoduxModule.Store.new(ReducerModule, nil, { RoduxModule.thunkMiddleware })
	setupSettings(self.store)
	
	if not StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
		self.store:dispatch(SetPlayerListEnabledModule(false))
	end
	coroutine.wrap(function() --[[ Line: 194 ]]
		-- upvalues: self (copy), SetSmallTouchDeviceModule (upval), UserInputService (upval), FFlagPlayerListUseMobileOnSmallDisplay (upval), GuiService (upval), UtilityModule (upval), IsReskinConsoleMobileRouteFunction (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), FFlagEnableMobilePlayerListOnConsole (upval), FStringPlayerListOverrideTypeModule (upval)
		local PreferredInput = UserInputService.PreferredInput
		local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
		self.store:dispatch(SetSmallTouchDeviceModule(UtilityModule:IsSmallTouchScreen() or ((if IsReskinConsoleMobileRouteFunction({
			displaySize = GuiService.ViewportDisplaySize,
			preferredInput = PreferredInput
		}) then true else GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad) then FFlagEnableMobilePlayerListOnConsole else false)) or (IsViewportDisplaySizeMatch and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) or FStringPlayerListOverrideTypeModule == "mobile"))))
	end)()
	self.store:dispatch(SetTenFootInterfaceModule(not IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = UserInputService.PreferredInput
	}) and not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()))
	coroutine.wrap(function() --[[ Line: 200 ]]
		-- upvalues: self (copy), SetSubjectToChinaPoliciesModule (upval), CachedPolicyServiceModule (upval)
		self.store:dispatch(SetSubjectToChinaPoliciesModule(CachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	self:_trackEnabled()
	self.root = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		Switcher = RoactModule.createElement(PlayerListSwitcherModule, {
			appStyleForUiModeStyleProvider = {
				themeName = ColorMode.Dark,
				fontName = Constants.FontName.Gotham
			},
			setLayerCollectorEnabled = function(Enabled) --[[ Line: 216 ]]
				-- upvalues: self (copy)
				if self.layerCollectorRef.current then
					self.layerCollectorRef.current.Enabled = Enabled
					
					return
				end
			end
		})
	})
	self.root = RoactModule.createElement(ApolloProvider, { client = ApolloClientModule }, { StoreProvider = self.root })
	
	function self._setIsUsingGamepad() --[[ Line: 230 ]]
		-- upvalues: UserInputService (upval), self (copy), SetIsUsingGamepadModule (upval)
		local LastInputType = UserInputService:GetLastInputType()
		self.store:dispatch(SetIsUsingGamepadModule((LastInputType and LastInputType.Name:find("Gamepad")) ~= nil))
	end
	
	function self._mountLeaderboardStore() --[[ Line: 236 ]]
		-- upvalues: LeaderboardStoreInstanceManager (upval)
		LeaderboardStoreInstanceManager.createLeaderboardStoreInstance()
	end
	
	function self._unmountLeaderboardStore() --[[ Line: 240 ]]
		-- upvalues: LeaderboardStoreInstanceManager (upval)
		LeaderboardStoreInstanceManager.cleanUpInstance()
	end
	
	self._unmountPlayerIconInfoStore = if FFlagReplacePlayerIconRoduxWithSignal then function() --[[ Line: 245 ]]
		-- upvalues: PlayerIconInfoStore (upval)
		PlayerIconInfoStore.cleanUp()
	end else nil
	self._mountLeaderboardStore()
	self._setIsUsingGamepad()
	self.root = RoactModule.createElement(PlayerListContainer, {
		leaderboardStore = LeaderboardStoreInstanceManager.getLeaderboardStoreInstance,
		TopBarConstants = require(RobloxGui.Modules.TopBar.Constants),
		isTenFoot = not IsReskinConsoleMobileRouteFunction({
			displaySize = GuiService.ViewportDisplaySize,
			preferredInput = UserInputService.PreferredInput
		}) and not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
	}, { PlayerListRoot = self.root })
	self.root = RoactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		IgnoreGuiInset = true,
		DisplayOrder = 1,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		[RoactModule.Ref] = self.layerCollectorRef
	}, { PlayerListRoot = self.root })
	self.element = RoactModule.mount(self.root, CoreGui, "PlayerList")
	self.topBarEnabled = true
	self.mounted = true
	self.coreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	self:_updateMounted()
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	
	if FFlagAddNewPlayerListFocusNav then
		self.VisibilityChangedEvent = Instance.new("BindableEvent")
	end
	if FFlagTopBarSignalizeSetCores then
		self.disposeEffect = SignalsModule.createEffect(function(p1) --[[ Line: 283 ]]
			-- upvalues: InExperienceTopBarModule (upval), self (copy)
			local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
			
			if GetTopBarStoreFunction then
				self:SetTopBarEnabled(GetTopBarStoreFunction(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	self.store.changed:connect(function(Value, p1) --[[ Line: 291 ]]
		-- upvalues: self (copy), FFlagAddNewPlayerListFocusNav (upval)
		if Value.displayOptions.setVisible ~= p1.displayOptions.setVisible then
			self.SetVisibleChangedEvent:Fire(Value.displayOptions.setVisible)
		end
		if FFlagAddNewPlayerListFocusNav and Value.displayOptions.isVisible ~= p1.displayOptions.isVisible then
			self.VisibilityChangedEvent:Fire(Value.displayOptions.isVisible)
		end
	end)
	
	return self
end

function Module:_updateMounted() --[[ Line: 305 ]]
	-- upvalues: UserInputService (copy), IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), RoactModule (copy), CoreGui (copy)
	if IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = UserInputService.PreferredInput
	}) or FFlagEnableMobilePlayerListOnConsole or not TenFootInterfaceModule:IsEnabled() then
		local TopBarEnabled = self.coreGuiEnabled and self.topBarEnabled
		
		if TopBarEnabled and not self.mounted then
			self._mountLeaderboardStore()
			self._setIsUsingGamepad()
			self.element = RoactModule.mount(self.root, CoreGui, "PlayerList")
			self.mounted = true
			
			return
		end
		if not TopBarEnabled and self.mounted then
			RoactModule.unmount(self.element)
			self._unmountLeaderboardStore()
			
			if self._unmountPlayerIconInfoStore then
				self._unmountPlayerIconInfoStore()
			end
			self.mounted = false
			
			if self.inspector then
				self.inspector:destroy()
				self.inspector = nil
			end
		end
	end
end

function Module._trackEnabled(p1) --[[ Line: 328 ]]
	-- upvalues: StarterGui (copy), SetPlayerListEnabledModule (copy), FFlagPlayerListIgnoreDevGamepadBindings (copy), GuiService (copy), Constants1 (copy)
	StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, CoreGuiEnabled) --[[ Line: 329 ]]
		-- upvalues: p1 (copy), SetPlayerListEnabledModule (upval), FFlagPlayerListIgnoreDevGamepadBindings (upval), GuiService (upval), Constants1 (upval)
		if CoreGuiType == Enum.CoreGuiType.All or CoreGuiType == Enum.CoreGuiType.PlayerList then
			p1.coreGuiEnabled = CoreGuiEnabled
			p1:_updateMounted()
			p1.store:dispatch(SetPlayerListEnabledModule(CoreGuiEnabled))
			
			if FFlagPlayerListIgnoreDevGamepadBindings and not CoreGuiEnabled then
				GuiService:SetMenuIsOpen(false, Constants1.PLAYER_LIST_MENU)
			end
		end
	end)
end

if FFlagAddNewPlayerListMobileFocusNav then
	function Module:GetIsModal() --[[ Line: 344 ]]
		-- upvalues: FFlagPlayerListReskin (copy), UserInputService (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), IsReskinConsoleMobileRouteFunction (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FFlagEnableMobilePlayerListOnConsole (copy), FStringPlayerListOverrideTypeModule (copy)
		if FFlagPlayerListReskin then
			local PreferredInput = UserInputService.PreferredInput
			local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
			
			return UtilityModule:IsSmallTouchScreen() or ((if IsReskinConsoleMobileRouteFunction({
				displaySize = GuiService.ViewportDisplaySize,
				preferredInput = PreferredInput
			}) then true else GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (if PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad) then FFlagEnableMobilePlayerListOnConsole else false)) or (IsViewportDisplaySizeMatch and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) or FStringPlayerListOverrideTypeModule == "mobile"))
		else
			return self.store:getState().displayOptions.isSmallTouchDevice
		end
	end
end
function Module:_setupReskin() --[[ Line: 353 ]]
	-- upvalues: CorePackages (copy), RobloxGui (copy), PlayerListModule (copy), Parent (copy), UserInputService (copy), IsReskinConsoleMobileRouteFunction (copy), GuiService (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), UtilityModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), FStringPlayerListOverrideTypeModule (copy), PlayerContextualMenuStore (copy), PlayerListVisibilityStore (copy), FFlagPlatformLeaderboardPersistStoreOnRemount (copy), PlatformLeaderboardsClientModule (copy), FFlagPlayerListPersistVisibilityModule (copy), SignalsModule (copy), Constants1 (copy), UserGameSettings (copy), PlayerListContainer (copy), LeaderboardStoreInstanceManager (copy), Players (copy), PlayerRelationshipStore (copy), MakePlayerInfoRequestsModule (copy), PlayerIconInfoStore (copy), BlockingUtilityModule (copy), FFlagBadgeVisibilitySettingEnabled (copy), RobloxReplicatedStorage (copy), CoreGui (copy), StarterGui (copy), FFlagEnableMobilePlayerListOnGamepad (copy), ContextActionService (copy), FFlagTopBarSignalizeSetCores (copy), InExperienceTopBarModule (copy)
	local ReactModule = require(CorePackages.Packages.React)
	local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
	local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
	local FoundationModule = require(CorePackages.Packages.Foundation)
	local FoundationProvider = FoundationModule.FoundationProvider
	local ColorMode = FoundationModule.Enums.ColorMode
	local Device = FoundationModule.Enums.Device
	local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
	local PlayerListPanel = PlayerListModule.Presentation.PlayerListPanel
	local PlayerContextualMenuView = PlayerListModule.Presentation.PlayerContextualMenuView
	local LeaderboardScrim = PlayerListModule.Presentation.LeaderboardScrim
	local ContextMenuControllerModule = require(Parent.ContextMenuController)
	
	local function _(p1, p2) --[[ Line: 368 | Named "translate" ]]
		-- upvalues: RobloxTranslatorModule (copy)
		local Success, Result = pcall(function() --[[ Line: 369 ]]
			-- upvalues: RobloxTranslatorModule (upval), p1 (copy)
			return RobloxTranslatorModule:FormatByKey(p1)
		end)
		
		return if Success and Result and Result ~= "" then Result else p2
	end
	
	local v1 = "InGame.PlayerList.Leaderboard"
	local Success, Result = pcall(function() --[[ Line: 369 ]]
		-- upvalues: RobloxTranslatorModule (copy), v1 (copy)
		return RobloxTranslatorModule:FormatByKey(v1)
	end)
	local Result1 = if Success and Result and Result ~= "" then Result else "Leaderboard"
	local PreferredInput = UserInputService.PreferredInput
	local IsEnabled = not IsReskinConsoleMobileRouteFunction({
		displaySize = GuiService.ViewportDisplaySize,
		preferredInput = PreferredInput
	}) and not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
	local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local IsSmallTouchScreen = UtilityModule:IsSmallTouchScreen()
	local Console = nil
	
	if not IsSmallTouchScreen then
		if IsReskinConsoleMobileRouteFunction({
			displaySize = GuiService.ViewportDisplaySize,
			preferredInput = PreferredInput
		}) then
			IsSmallTouchScreen = true
		elseif GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) then
			IsSmallTouchScreen = FFlagEnableMobilePlayerListOnConsole
		else
			IsSmallTouchScreen = false
		end
		if not IsSmallTouchScreen then
			IsSmallTouchScreen = IsViewportDisplaySizeMatch and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) or FStringPlayerListOverrideTypeModule == "mobile"
		end
	end
	repeat
		if not IsEnabled then
			local Flag = nil
			if IsReskinConsoleMobileRouteFunction({
				displaySize = GuiService.ViewportDisplaySize,
				preferredInput = PreferredInput
			}) then
				Flag = true
			elseif GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) then
				Flag = FFlagEnableMobilePlayerListOnConsole
			else
				Flag = false
			end
			if not Flag then
				Console = Device.Unknown
				continue
			end
		end
		Console = Device.Console
		break
	until true
	local function restoreVisibilityOnDismiss() --[[ Line: 391 ]]
		-- upvalues: PlayerContextualMenuStore (upval), PlayerListVisibilityStore (upval)
		if not PlayerContextualMenuStore.takeSuppressNextDismissRestore() then
			PlayerListVisibilityStore.setVisible(true)
			
			return
		end
	end
	
	if IsSmallTouchScreen then
		PlayerContextualMenuStore.setOnDismiss(restoreVisibilityOnDismiss)
	end
	PlayerContextualMenuStore.setContextMenuOpener(function(p1, AnchorPosition, p2, p3) --[[ Line: 402 ]]
		-- upvalues: ContextMenuControllerModule (copy), PlayerContextualMenuStore (upval), IsSmallTouchScreen (ref)
		task.spawn(function() --[[ Line: 403 ]]
			-- upvalues: ContextMenuControllerModule (upval), p1 (copy), PlayerContextualMenuStore (upval), IsSmallTouchScreen (upval), p3 (copy), AnchorPosition (copy), p2 (copy)
			local MenuData = ContextMenuControllerModule.buildMenuData(p1, PlayerContextualMenuStore.closeContextMenu, IsSmallTouchScreen, p3)
			
			if p1.Parent ~= nil then
				MenuData.anchorPosition = AnchorPosition
				PlayerContextualMenuStore.setMenuDataIfCurrent(MenuData, p2)
				
				return
			end
		end)
	end)
	local PlayerListInitialVisibleStateModule = require(Parent.PlayerListInitialVisibleState)
	PlayerListVisibilityStore.reset()
	
	if FFlagPlatformLeaderboardPersistStoreOnRemount then
		PlatformLeaderboardsClientModule.reset()
	end
	local _ = function() --[[ Line: 426 | Named "setStorePersistVisibility" ]]
		-- upvalues: PlayerListVisibilityStore (upval), FFlagPlayerListPersistVisibilityModule (upval), IsSmallTouchScreen (ref), IsEnabled (copy)
		PlayerListVisibilityStore.setShouldPersistVisibility(FFlagPlayerListPersistVisibilityModule and (not IsSmallTouchScreen and not IsEnabled))
	end
	
	PlayerListVisibilityStore.setShouldPersistVisibility(FFlagPlayerListPersistVisibilityModule and (not IsSmallTouchScreen and not IsEnabled))
	PlayerListVisibilityStore.setVisible(PlayerListInitialVisibleStateModule())
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	self.VisibilityChangedEvent = Instance.new("BindableEvent")
	
	local function setupVisibilityEffect() --[[ Line: 437 ]]
		-- upvalues: self (copy), SignalsModule (upval), PlayerListVisibilityStore (upval)
		local Flag = false
		self._reskinSetVisibleEffect = SignalsModule.createEffect(function(p1) --[[ Line: 439 ]]
			-- upvalues: PlayerListVisibilityStore (upval), Flag (ref), self (upval)
			local Visible = PlayerListVisibilityStore.getVisible(p1)
			
			if Flag then
				self.SetVisibleChangedEvent:Fire(Visible)
				
				return
			else
				Flag = true
			end
		end)
		local Flag1 = false
		self._reskinVisibilityEffect = SignalsModule.createEffect(function(p1) --[[ Line: 449 ]]
			-- upvalues: PlayerListVisibilityStore (upval), Flag1 (ref), self (upval)
			local EffectiveVisible = PlayerListVisibilityStore.getEffectiveVisible(p1)
			
			if Flag1 then
				self.VisibilityChangedEvent:Fire(EffectiveVisible)
				
				return
			else
				Flag1 = true
			end
		end)
	end
	
	local TopBarHeight = ConstantsModule.TopBarHeight
	
	local _ = function(): number --[[ Line: 462 | Named "computeMobileTopInset" ]]
		-- upvalues: Constants1 (upval), ConstantsModule (copy)
		local MOBILEEDGEGAP: number = Constants1.MOBILE_EDGE_GAP
		
		return (math.max(MOBILEEDGEGAP, ConstantsModule.ApplyDisplayScale(MOBILEEDGEGAP)))
	end
	
	local function computeMobilePosition(): UDim2 --[[ Line: 466 ]]
		-- upvalues: TopBarHeight (copy), Constants1 (upval), ConstantsModule (copy)
		local MOBILEEDGEGAP: number = Constants1.MOBILE_EDGE_GAP
		
		return UDim2.new(0.5, 0, 0, TopBarHeight + math.max(MOBILEEDGEGAP, ConstantsModule.ApplyDisplayScale(MOBILEEDGEGAP)))
	end
	
	local Binding, Binding2 = ReactModule.createBinding(computeMobilePosition())
	
	local function resolveContainerProps() --[[ Line: 470 ]]
		-- upvalues: IsSmallTouchScreen (ref), Binding (copy), ConstantsModule (copy), TopBarHeight (copy)
		if IsSmallTouchScreen then
			return {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = Binding,
				Size = UDim2.fromOffset(0, 0)
			}
		else
			local Largest = math.max(4, ConstantsModule.ApplyDisplayScale(4))
			
			return {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -Largest, 0, Largest + TopBarHeight),
				Size = UDim2.fromOffset(0, 0)
			}
		end
	end
	
	local function buildReskinElement() --[[ Line: 488 ]]
		-- upvalues: ReactModule (copy), FoundationProvider (copy), ColorMode (copy), Console (ref), UserGameSettings (upval), LeaderboardScrim (copy), IsSmallTouchScreen (ref), FoundationModule (copy), resolveContainerProps (copy), PlayerListContainer (upval), LeaderboardStoreInstanceManager (upval), ConstantsModule (copy), IsEnabled (copy), PlayerListPanel (copy), Result1 (copy), PlayerContextualMenuView (copy)
		return ReactModule.createElement(FoundationProvider, {
			colorMode = ColorMode.Dark,
			device = Console,
			preferences = {
				preferredTransparency = UserGameSettings.PreferredTransparency
			}
		}, {
			Scrim = ReactModule.createElement(LeaderboardScrim, { isSmallTouchDevice = IsSmallTouchScreen }),
			Container = ReactModule.createElement(FoundationModule.View, resolveContainerProps(), {
				ReskinContainer = ReactModule.createElement(PlayerListContainer, {
					leaderboardStore = LeaderboardStoreInstanceManager.getLeaderboardStoreInstance,
					TopBarConstants = ConstantsModule,
					isTenFoot = IsEnabled
				}, {
					PlayerListPanel = ReactModule.createElement(PlayerListPanel, { isSmallTouchDevice = IsSmallTouchScreen, title = Result1 })
				})
			}),
			ContextMenu = ReactModule.createElement(PlayerContextualMenuView, { isSmallTouchDevice = IsSmallTouchScreen })
		})
	end
	
	local function setupPlayerInfoRequests() --[[ Line: 523 ]]
		-- upvalues: Players (upval), PlayerRelationshipStore (upval), MakePlayerInfoRequestsModule (upval), self (copy), PlayerIconInfoStore (upval), PlayerContextualMenuStore (upval), BlockingUtilityModule (upval), FFlagBadgeVisibilitySettingEnabled (upval), RobloxReplicatedStorage (upval)
		local config = {
			getState = function() --[[ Line: 525 ]]
				-- upvalues: Players (upval)
				return { players = Players:GetPlayers() }
			end,
			dispatch = function(_, p1) --[[ Line: 528 ]]
				-- upvalues: PlayerRelationshipStore (upval)
				if type(p1) ~= "table" then return end
				if p1.type == "SetPlayerIsBlocked" and p1.userId then
					PlayerRelationshipStore.patchPlayerRelationship(p1.userId, { isBlocked = p1.isBlocked })
					
					return
				end
				if p1.type == "SetPlayerFriendStatus" and p1.userId then
					PlayerRelationshipStore.patchPlayerRelationship(p1.userId, { friendStatus = p1.friendStatus })
				end
			end
		}
		
		local function request(Player) --[[ Line: 543 ]]
			-- upvalues: MakePlayerInfoRequestsModule (upval), config (copy)
			MakePlayerInfoRequestsModule(Player)(config)
		end
		
		for _, player in ipairs(Players:GetPlayers()) do
			MakePlayerInfoRequestsModule(player)(config)
		end
		self._reskinPlayerAddedConn = Players.PlayerAdded:Connect(request)
		self._reskinPlayerRemovingConn = Players.PlayerRemoving:Connect(function(Player: Player) --[[ Line: 550 ]]
			-- upvalues: PlayerIconInfoStore (upval), PlayerRelationshipStore (upval)
			PlayerIconInfoStore.removePlayer(Player.UserId)
			PlayerRelationshipStore.removePlayer(Player.UserId)
		end)
		
		local function _(Player, p1) --[[ Line: 554 | Named "refreshOpenMenuForPlayer" ]]
			-- upvalues: PlayerContextualMenuStore (upval)
			local MenuData = PlayerContextualMenuStore.getMenuData(false)
			
			if MenuData ~= nil and MenuData.player == Player then
				PlayerContextualMenuStore.openContextMenu(Player, MenuData.anchorPosition, p1)
			end
		end
		
		self._reskinBlockedStatusConn = BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p1, IsBlocked) --[[ Line: 562 ]]
			-- upvalues: PlayerRelationshipStore (upval)
			local Number: number? = tonumber(p1)
			
			if Number then
				PlayerRelationshipStore.patchPlayerRelationship(Number, { isBlocked = IsBlocked })
			end
		end)
		self._reskinFriendStatusConn = Players.LocalPlayer.FriendStatusChanged:Connect(function(Player: Player, FriendStatus) --[[ Line: 568 ]]
			-- upvalues: PlayerRelationshipStore (upval), PlayerContextualMenuStore (upval)
			PlayerRelationshipStore.patchPlayerRelationship(Player.UserId, { friendStatus = FriendStatus })
			local MenuData = PlayerContextualMenuStore.getMenuData(false)
			
			if MenuData ~= nil and MenuData.player == Player then
				PlayerContextualMenuStore.openContextMenu(Player, MenuData.anchorPosition, FriendStatus)
			end
		end)
		
		if FFlagBadgeVisibilitySettingEnabled then
			task.spawn(function() --[[ Line: 575 ]]
				-- upvalues: RobloxReplicatedStorage (upval), self (upval), Players (upval), MakePlayerInfoRequestsModule (upval), config (copy)
				self._reskinProfileSettingsConn = RobloxReplicatedStorage:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p1) --[[ Line: 578 ]]
					-- upvalues: Players (upval), MakePlayerInfoRequestsModule (upval), config (upval)
					local Player = Players:GetPlayerByUserId((tonumber(p1)))
					
					if Player then
						MakePlayerInfoRequestsModule(Player)(config)
					end
				end)
			end)
		end
	end
	
	local function teardownPlayerInfoRequests() --[[ Line: 588 ]]
		-- upvalues: self (copy), PlayerRelationshipStore (upval)
		if self._reskinPlayerAddedConn then
			self._reskinPlayerAddedConn:Disconnect()
			self._reskinPlayerAddedConn = nil
		end
		if self._reskinPlayerRemovingConn then
			self._reskinPlayerRemovingConn:Disconnect()
			self._reskinPlayerRemovingConn = nil
		end
		if self._reskinBlockedStatusConn then
			self._reskinBlockedStatusConn:Disconnect()
			self._reskinBlockedStatusConn = nil
		end
		if self._reskinFriendStatusConn then
			self._reskinFriendStatusConn:Disconnect()
			self._reskinFriendStatusConn = nil
		end
		if self._reskinProfileSettingsConn then
			self._reskinProfileSettingsConn:Disconnect()
			self._reskinProfileSettingsConn = nil
		end
		PlayerRelationshipStore.cleanUp()
	end
	
	local function mountReskin() --[[ Line: 612 ]]
		-- upvalues: PlayerListVisibilityStore (upval), FFlagPlayerListPersistVisibilityModule (upval), IsSmallTouchScreen (ref), IsEnabled (copy), CoreGui (upval), ReactRobloxModule (copy), buildReskinElement (copy), self (copy), Binding2 (copy), computeMobilePosition (copy), setupPlayerInfoRequests (copy)
		PlayerListVisibilityStore.setShouldPersistVisibility(FFlagPlayerListPersistVisibilityModule and (not IsSmallTouchScreen and not IsEnabled))
		local PlayerListReskin = Instance.new("ScreenGui")
		PlayerListReskin.Name = "PlayerListReskin"
		PlayerListReskin.AutoLocalize = false
		PlayerListReskin.IgnoreGuiInset = true
		local IsTESTEZRUNNINGTEST = _G.__TESTEZ_RUNNING_TEST__ == true
		PlayerListReskin.DisplayOrder = if IsTESTEZRUNNINGTEST then -1 else 1
		PlayerListReskin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		PlayerListReskin.Parent = CoreGui
		local Root = ReactRobloxModule.createRoot(PlayerListReskin)
		Root:render(buildReskinElement())
		self._reskinRoot = Root
		self._reskinScreenGui = PlayerListReskin
		
		if IsSmallTouchScreen then
			local function connectViewport(CurrentCamera) --[[ Line: 630 ]]
				-- upvalues: self (upval), Binding2 (upval), computeMobilePosition (upval)
				if self._reskinViewportConn then
					self._reskinViewportConn:Disconnect()
					self._reskinViewportConn = nil
				end
				if CurrentCamera then
					self._reskinViewportConn = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 636 ]]
						-- upvalues: Binding2 (upval), computeMobilePosition (upval)
						Binding2(computeMobilePosition())
					end)
					Binding2(computeMobilePosition())
				end
			end
			
			self._reskinCameraConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 642 ]]
				-- upvalues: connectViewport (copy)
				connectViewport(workspace.CurrentCamera)
			end)
			connectViewport(workspace.CurrentCamera)
		end
		setupPlayerInfoRequests()
	end
	
	local function unmountReskin() --[[ Line: 650 ]]
		-- upvalues: PlayerListVisibilityStore (upval), teardownPlayerInfoRequests (copy), self (copy)
		PlayerListVisibilityStore.setShouldPersistVisibility(false)
		teardownPlayerInfoRequests()
		
		if self._reskinCameraConn then
			self._reskinCameraConn:Disconnect()
			self._reskinCameraConn = nil
		end
		if self._reskinViewportConn then
			self._reskinViewportConn:Disconnect()
			self._reskinViewportConn = nil
		end
		if self._reskinRoot then
			self._reskinRoot:unmount()
			self._reskinRoot = nil
		end
		if self._reskinScreenGui then
			self._reskinScreenGui:Destroy()
			self._reskinScreenGui = nil
		end
		if self._reskinVisibilityEffect then
			self._reskinVisibilityEffect()
			self._reskinVisibilityEffect = nil
		end
		if self._reskinSetVisibleEffect then
			self._reskinSetVisibleEffect()
			self._reskinSetVisibleEffect = nil
		end
	end
	
	self.topBarEnabled = true
	self.coreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	self._reskin = {
		mountReskin = mountReskin,
		unmountReskin = unmountReskin,
		setupVisibilityEffect = setupVisibilityEffect
	}
	
	if self.coreGuiEnabled then
		LeaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		setupVisibilityEffect()
		mountReskin()
		self.mounted = true
	else
		self.mounted = false
	end
	if FFlagEnableMobilePlayerListOnGamepad then
		local function onPreferredInputChanged(PreferredInput) --[[ Line: 700 ]]
			-- upvalues: FFlagPlayerListUseMobileOnSmallDisplay (upval), GuiService (upval), UtilityModule (upval), IsReskinConsoleMobileRouteFunction (upval), FFlagLuaSupportMicroGamepadPreferredInput (upval), FFlagEnableMobilePlayerListOnConsole (upval), FStringPlayerListOverrideTypeModule (upval), IsSmallTouchScreen (ref), PlayerContextualMenuStore (upval), Console (ref), Device (copy), restoreVisibilityOnDismiss (copy), self (copy), unmountReskin (copy), setupVisibilityEffect (copy), mountReskin (copy), PlayerListVisibilityStore (upval), FFlagPlayerListPersistVisibilityModule (upval), IsEnabled (copy), PlayerListInitialVisibleStateModule (copy)
			local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
			local IsSmallTouchScreen1 = UtilityModule:IsSmallTouchScreen()
			
			if not IsSmallTouchScreen1 then
				if IsReskinConsoleMobileRouteFunction({
					displaySize = GuiService.ViewportDisplaySize,
					preferredInput = PreferredInput
				}) then
					IsSmallTouchScreen1 = true
				elseif GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) then
					IsSmallTouchScreen1 = FFlagEnableMobilePlayerListOnConsole
				else
					IsSmallTouchScreen1 = false
				end
				if not IsSmallTouchScreen1 then
					IsSmallTouchScreen1 = IsViewportDisplaySizeMatch and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) or FStringPlayerListOverrideTypeModule == "mobile"
				end
			end
			if IsSmallTouchScreen1 == IsSmallTouchScreen then return end
			if PlayerContextualMenuStore.getMenuData(false) ~= nil then
				PlayerContextualMenuStore.closeContextMenu()
			end
			IsSmallTouchScreen = IsSmallTouchScreen1
			local FFlagEnableMobilePlayerListOnConsole1 = if IsReskinConsoleMobileRouteFunction({
				displaySize = GuiService.ViewportDisplaySize,
				preferredInput = PreferredInput
			}) then true elseif GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (PreferredInput == Enum.PreferredInput.Touch or (PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and PreferredInput == Enum.PreferredInput.MicroGamepad)) then FFlagEnableMobilePlayerListOnConsole else false
			Console = if FFlagEnableMobilePlayerListOnConsole1 then Device.Console else Device.Unknown
			PlayerContextualMenuStore.setOnDismiss(if IsSmallTouchScreen then restoreVisibilityOnDismiss else nil)
			
			if self.mounted then
				unmountReskin()
				setupVisibilityEffect()
				mountReskin()
			end
			PlayerListVisibilityStore.setShouldPersistVisibility(FFlagPlayerListPersistVisibilityModule and (not IsSmallTouchScreen and not IsEnabled))
			local PlayerListInitialVisibleStateModuleResult = PlayerListInitialVisibleStateModule(PreferredInput)
			PlayerListVisibilityStore.setVisible(PlayerListInitialVisibleStateModuleResult)
			PlayerListVisibilityStore.setTempHideSnapshot(PlayerListInitialVisibleStateModuleResult)
		end
		
		self._onPreferredInputChanged = onPreferredInputChanged
		self._reskinPreferredInputConn = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 728 ]]
			-- upvalues: onPreferredInputChanged (copy), UserInputService (upval)
			onPreferredInputChanged(UserInputService.PreferredInput)
		end)
	end
	self._reskinCoreGuiConn = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, CoreGuiEnabled) --[[ Line: 733 ]]
		-- upvalues: self (copy)
		if CoreGuiType == Enum.CoreGuiType.All or CoreGuiType == Enum.CoreGuiType.PlayerList then
			self.coreGuiEnabled = CoreGuiEnabled
			self:SetTopBarEnabled(self.topBarEnabled)
		end
	end)
	ContextActionService:BindCoreAction("RbxPlayerListToggle", function(_, UserInputState, _) --[[ Line: 740 ]]
		-- upvalues: self (copy), IsSmallTouchScreen (ref), GuiService (upval)
		if not self.mounted then
			return Enum.ContextActionResult.Pass
		elseif IsSmallTouchScreen then
			return Enum.ContextActionResult.Pass
		elseif GuiService.MenuIsOpen then
			return Enum.ContextActionResult.Pass
		elseif UserInputState == Enum.UserInputState.Begin then
			self:SetVisibility(not self:GetVisibility())
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, Enum.KeyCode.Tab)
	
	if FFlagTopBarSignalizeSetCores then
		self._reskinTopBarEffect = SignalsModule.createEffect(function(p1) --[[ Line: 758 ]]
			-- upvalues: InExperienceTopBarModule (upval), self (copy)
			local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
			
			if GetTopBarStoreFunction then
				self:SetTopBarEnabled(GetTopBarStoreFunction(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	return self
end

function Module.GetVisibility(p1) --[[ Line: 769 ]]
	-- upvalues: FFlagPlayerListReskin (copy), PlayerListVisibilityStore (copy)
	return if FFlagPlayerListReskin then PlayerListVisibilityStore.getEffectiveVisible(false) else p1.store:getState().displayOptions.isVisible
end

if FFlagAddNewPlayerListFocusNav then
	function Module:GetVisibilityChangedEvent() --[[ Line: 777 ]]
		return self.VisibilityChangedEvent
	end
end
function Module.GetSetVisible(p1) --[[ Line: 782 ]]
	-- upvalues: FFlagPlayerListReskin (copy), PlayerListVisibilityStore (copy)
	return if FFlagPlayerListReskin then PlayerListVisibilityStore.getVisible(false) else p1.store:getState().displayOptions.setVisible
end

function Module:GetSetVisibleChangedEvent() --[[ Line: 789 ]]
	return self.SetVisibleChangedEvent
end

function Module:SetVisibility(p1) --[[ Line: 793 ]]
	-- upvalues: FFlagPlayerListReskin (copy), PlayerContextualMenuStore (copy), PlayerListVisibilityStore (copy), SetPlayerListVisibilityModule (copy)
	if not FFlagPlayerListReskin then
		self.store:dispatch(SetPlayerListVisibilityModule(p1))
		
		return
	end
	if not p1 then
		PlayerContextualMenuStore.closeContextMenu()
	end
	PlayerListVisibilityStore.setVisible(p1)
end

function Module:HideTemp(p1, Enabled) --[[ Line: 804 ]]
	-- upvalues: FFlagPlayerListReskin (copy), PlayerContextualMenuStore (copy), PlayerListVisibilityStore (copy), SetTempHideKeyModule (copy)
	if FFlagPlayerListReskin then
		if Enabled and PlayerContextualMenuStore.getMenuData(false) ~= nil then
			PlayerContextualMenuStore.closeContextMenu()
		end
		PlayerListVisibilityStore.setTempHide(p1, Enabled)
		
		return
	else
		if Enabled == false then
			Enabled = nil
		end
		self.store:dispatch(SetTempHideKeyModule(p1, Enabled))
	end
end

function Module:SetTopBarEnabled(TopBarEnabled) --[[ Line: 823 ]]
	-- upvalues: FFlagPlayerListReskin (copy), LeaderboardStoreInstanceManager (copy)
	if not FFlagPlayerListReskin then
		self.topBarEnabled = TopBarEnabled
		self:_updateMounted()
		
		return
	end
	self.topBarEnabled = TopBarEnabled
	local TopBarEnabled1 = self.coreGuiEnabled and TopBarEnabled
	
	if TopBarEnabled1 and not self.mounted then
		LeaderboardStoreInstanceManager.createLeaderboardStoreInstance()
		self._reskin.setupVisibilityEffect()
		self._reskin.mountReskin()
		self.mounted = true
		
		return
	end
	if not TopBarEnabled1 and self.mounted then
		self._reskin.unmountReskin()
		LeaderboardStoreInstanceManager.cleanUpInstance()
		self.mounted = false
	end
end

function Module:SetMinimized(p1) --[[ Line: 843 ]]
	-- upvalues: FFlagPlayerListReskin (copy), SetMinimizedModule (copy)
	if not FFlagPlayerListReskin then
		self.store:dispatch(SetMinimizedModule(p1))
		
		return
	end
end

return Module