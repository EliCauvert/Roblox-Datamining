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
local FFlagAddNewPlayerListMobileFocusNav = PlayerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagPlayerListUseMobileOnSmallDisplay = PlayerListModule.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local FFlagPlayerListIgnoreDevGamepadBindings = PlayerListModule.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local FFlagPlayerListReskin = PlayerListModule.Flags.FFlagPlayerListReskin
local PlayerListContainer = PlayerListModule.Container.PlayerListContainer
local LeaderboardStoreInstanceManager = PlayerListModule.LeaderboardStoreInstanceManager
local PlayerListVisibilityStore = PlayerListModule.PlayerListVisibilityStore
local PlayerContextualMenuStore = PlayerListModule.PlayerContextualMenuStore
local PlayerIconInfoStore = PlayerIconInfoStoreModule.PlayerIconInfoStore
local FFlagTopBarSignalizeSetCores = InExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores

local function _(): boolean
	return _G.__TESTEZ_RUNNING_TEST__ == true
end

local _ = function()
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy)
	return not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
end

local _ = function(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad
end

local _ = function(): boolean
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), GuiService (copy), UserInputService (copy)
	return FFlagEnableMobilePlayerListOnConsole and (GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad))
end

local _ = function()
	-- upvalues: FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), FFlagEnableMobilePlayerListOnConsole (copy), UserInputService (copy), FStringPlayerListOverrideTypeModule (copy)
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		return false
	else
		local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
		
		return UtilityModule:IsSmallTouchScreen() or ((if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) else FFlagEnableMobilePlayerListOnConsole) or (IsViewportDisplaySizeMatch and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) or FStringPlayerListOverrideTypeModule == "mobile"))
	end
end

local function setupSettings(Store)
	-- upvalues: SetSettingsModule (copy), UserGameSettings (copy)
	local function _()
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
	UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: Store (copy), SetSettingsModule (upval), UserGameSettings (upval)
		Store:dispatch(SetSettingsModule({
			reducedMotion = UserGameSettings.ReducedMotion,
			preferredTransparency = UserGameSettings.PreferredTransparency
		}))
	end)
	UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
		-- upvalues: Store (copy), SetSettingsModule (upval), UserGameSettings (upval)
		Store:dispatch(SetSettingsModule({
			reducedMotion = UserGameSettings.ReducedMotion,
			preferredTransparency = UserGameSettings.PreferredTransparency
		}))
	end)
end

local PlayerListController = {}
PlayerListController.__index = PlayerListController

function PlayerListController.new()
	-- upvalues: PlayerListController (copy), FFlagPlayerListReskin (copy), GlobalConfigModule (copy), RoactModule (copy), RoduxModule (copy), ReducerModule (copy), setupSettings (copy), StarterGui (copy), SetPlayerListEnabledModule (copy), SetSmallTouchDeviceModule (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), FFlagEnableMobilePlayerListOnConsole (copy), UserInputService (copy), FStringPlayerListOverrideTypeModule (copy), SetTenFootInterfaceModule (copy), TenFootInterfaceModule (copy), SetSubjectToChinaPoliciesModule (copy), CachedPolicyServiceModule (copy), Constants (copy), RoactRoduxModule (copy), PlayerListSwitcherModule (copy), ApolloProvider (copy), ApolloClientModule (copy), SetIsUsingGamepadModule (copy), LeaderboardStoreInstanceManager (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), PlayerListContainer (copy), RobloxGui (copy), CoreGui (copy), FFlagAddNewPlayerListFocusNav (copy), FFlagTopBarSignalizeSetCores (copy), SignalsModule (copy), InExperienceTopBarModule (copy)
	local self = setmetatable({}, PlayerListController)
	
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
	coroutine.wrap(function()
		-- upvalues: self (copy), SetSmallTouchDeviceModule (upval), FFlagPlayerListUseMobileOnSmallDisplay (upval), GuiService (upval), UtilityModule (upval), FFlagEnableMobilePlayerListOnConsole (upval), UserInputService (upval), FStringPlayerListOverrideTypeModule (upval)
		local Store = self.store
		local IsSmallTouchScreen = nil
		
		if _G.__TESTEZ_RUNNING_TEST__ == true then
			IsSmallTouchScreen = false
		else
			local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
			IsSmallTouchScreen = UtilityModule:IsSmallTouchScreen() or ((if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) else FFlagEnableMobilePlayerListOnConsole) or (IsViewportDisplaySizeMatch and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) or FStringPlayerListOverrideTypeModule == "mobile"))
		end
		Store:dispatch(SetSmallTouchDeviceModule(IsSmallTouchScreen))
	end)()
	self.store:dispatch(SetTenFootInterfaceModule(not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()))
	coroutine.wrap(function()
		-- upvalues: self (copy), SetSubjectToChinaPoliciesModule (upval), CachedPolicyServiceModule (upval)
		self.store:dispatch(SetSubjectToChinaPoliciesModule(CachedPolicyServiceModule:IsSubjectToChinaPolicies()))
	end)()
	self:_trackEnabled()
	self.root = RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
		Switcher = RoactModule.createElement(PlayerListSwitcherModule, {
			appStyleForUiModeStyleProvider = {
				themeName = Constants.ThemeName.Dark,
				fontName = Constants.FontName.Gotham
			},
			setLayerCollectorEnabled = function(Enabled)
				-- upvalues: self (copy)
				if self.layerCollectorRef.current then
					self.layerCollectorRef.current.Enabled = Enabled
					
					return
				end
			end
		})
	})
	self.root = RoactModule.createElement(ApolloProvider, { client = ApolloClientModule }, { StoreProvider = self.root })
	
	function self._setIsUsingGamepad()
		-- upvalues: UserInputService (upval), self (copy), SetIsUsingGamepadModule (upval)
		local LastInputType = UserInputService:GetLastInputType()
		self.store:dispatch(SetIsUsingGamepadModule((LastInputType and LastInputType.Name:find("Gamepad")) ~= nil))
	end
	
	function self._mountLeaderboardStore()
		-- upvalues: LeaderboardStoreInstanceManager (upval)
		LeaderboardStoreInstanceManager.createLeaderboardStoreInstance()
	end
	
	function self._unmountLeaderboardStore()
		-- upvalues: LeaderboardStoreInstanceManager (upval)
		LeaderboardStoreInstanceManager.cleanUpInstance()
	end
	
	self._unmountPlayerIconInfoStore = if FFlagReplacePlayerIconRoduxWithSignal then function()
		-- upvalues: PlayerIconInfoStore (upval)
		PlayerIconInfoStore.cleanUp()
	end else nil
	self._mountLeaderboardStore()
	self._setIsUsingGamepad()
	self.root = RoactModule.createElement(PlayerListContainer, {
		leaderboardStore = LeaderboardStoreInstanceManager.getLeaderboardStoreInstance,
		TopBarConstants = require(RobloxGui.Modules.TopBar.Constants),
		isTenFoot = not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
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
		self.disposeEffect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceTopBarModule (upval), self (copy)
			local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
			
			if GetTopBarStoreFunction then
				self:SetTopBarEnabled(GetTopBarStoreFunction(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	self.store.changed:connect(function(Value, p1)
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

function PlayerListController:_updateMounted()
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), RoactModule (copy), CoreGui (copy)
	if FFlagEnableMobilePlayerListOnConsole or not TenFootInterfaceModule:IsEnabled() then
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

function PlayerListController._trackEnabled(p1)
	-- upvalues: StarterGui (copy), SetPlayerListEnabledModule (copy), FFlagPlayerListIgnoreDevGamepadBindings (copy), GuiService (copy), Constants1 (copy)
	StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, CoreGuiEnabled)
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
	function PlayerListController:GetIsModal()
		-- upvalues: FFlagPlayerListReskin (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), FFlagEnableMobilePlayerListOnConsole (copy), UserInputService (copy), FStringPlayerListOverrideTypeModule (copy)
		if not FFlagPlayerListReskin then
			return self.store:getState().displayOptions.isSmallTouchDevice
		elseif _G.__TESTEZ_RUNNING_TEST__ == true then
			return false
		else
			local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
			
			return UtilityModule:IsSmallTouchScreen() or ((if FFlagEnableMobilePlayerListOnConsole then GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) else FFlagEnableMobilePlayerListOnConsole) or (IsViewportDisplaySizeMatch and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) or FStringPlayerListOverrideTypeModule == "mobile"))
		end
	end
end
function PlayerListController:_setupReskin()
	-- upvalues: CorePackages (copy), RobloxGui (copy), PlayerListModule (copy), Parent (copy), FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), FFlagPlayerListUseMobileOnSmallDisplay (copy), GuiService (copy), UtilityModule (copy), UserInputService (copy), FStringPlayerListOverrideTypeModule (copy), PlayerContextualMenuStore (copy), PlayerListVisibilityStore (copy), SignalsModule (copy), UserGameSettings (copy), PlayerListContainer (copy), LeaderboardStoreInstanceManager (copy), Players (copy), PlayerRelationshipStore (copy), MakePlayerInfoRequestsModule (copy), PlayerIconInfoStore (copy), BlockingUtilityModule (copy), FFlagBadgeVisibilitySettingEnabled (copy), RobloxReplicatedStorage (copy), CoreGui (copy), StarterGui (copy), ContextActionService (copy), FFlagTopBarSignalizeSetCores (copy), InExperienceTopBarModule (copy)
	local ReactModule = require(CorePackages.Packages.React)
	local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
	local ConstantsModule = require(RobloxGui.Modules.TopBar.Constants)
	local FoundationModule = require(CorePackages.Packages.Foundation)
	local FoundationProvider = FoundationModule.FoundationProvider
	local Theme = FoundationModule.Enums.Theme
	local Device = FoundationModule.Enums.Device
	local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
	local PlayerListPanel = PlayerListModule.Presentation.PlayerListPanel
	local PlayerContextualMenuView = PlayerListModule.Presentation.PlayerContextualMenuView
	local LeaderboardScrim = PlayerListModule.Presentation.LeaderboardScrim
	local ContextMenuControllerModule = require(Parent.ContextMenuController)
	
	local function _(p1, p2)
		-- upvalues: RobloxTranslatorModule (copy)
		local Success, Result = pcall(function()
			-- upvalues: RobloxTranslatorModule (upval), p1 (copy)
			return RobloxTranslatorModule:FormatByKey(p1)
		end)
		
		return if Success and Result and Result ~= "" then Result else p2
	end
	
	local v1 = "InGame.PlayerList.Leaderboard"
	local Success, Result = pcall(function()
		-- upvalues: RobloxTranslatorModule (copy), v1 (copy)
		return RobloxTranslatorModule:FormatByKey(v1)
	end)
	local Result1 = if Success and Result and Result ~= "" then Result else "Leaderboard"
	local IsEnabled = not FFlagEnableMobilePlayerListOnConsole and TenFootInterfaceModule:IsEnabled()
	local IsSmallTouchDevice = nil
	
	if _G.__TESTEZ_RUNNING_TEST__ == true then
		IsSmallTouchDevice = false
	else
		local IsViewportDisplaySizeMatch: boolean = FFlagPlayerListUseMobileOnSmallDisplay and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
		IsSmallTouchDevice = UtilityModule:IsSmallTouchScreen() or (FFlagEnableMobilePlayerListOnConsole and (GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad)) or (IsViewportDisplaySizeMatch and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad) or FStringPlayerListOverrideTypeModule == "mobile"))
	end
	local Console = nil
	if TenFootInterfaceModule:IsEnabled() or FFlagEnableMobilePlayerListOnConsole and (GuiService.ViewportDisplaySize == Enum.DisplaySize.Large and (UserInputService.PreferredInput == Enum.PreferredInput.Touch or UserInputService.PreferredInput == Enum.PreferredInput.Gamepad)) then
		Console = Device.Console
	else
		Console = Device.Unknown
	end
	if IsSmallTouchDevice then
		PlayerContextualMenuStore.setOnDismiss(function()
			-- upvalues: PlayerContextualMenuStore (upval), PlayerListVisibilityStore (upval)
			if not PlayerContextualMenuStore.takeSuppressNextDismissRestore() then
				PlayerListVisibilityStore.setVisible(true)
				
				return
			end
		end)
	end
	PlayerContextualMenuStore.setContextMenuOpener(function(p1, AnchorPosition, p2)
		-- upvalues: ContextMenuControllerModule (copy), PlayerContextualMenuStore (upval), IsSmallTouchDevice (copy), PlayerListVisibilityStore (upval)
		task.spawn(function()
			-- upvalues: ContextMenuControllerModule (upval), p1 (copy), PlayerContextualMenuStore (upval), IsSmallTouchDevice (upval), AnchorPosition (copy), p2 (copy), PlayerListVisibilityStore (upval)
			local MenuData = ContextMenuControllerModule.buildMenuData(p1, PlayerContextualMenuStore.closeContextMenu, IsSmallTouchDevice)
			
			if p1.Parent == nil then return end
			MenuData.anchorPosition = AnchorPosition
			
			if PlayerContextualMenuStore.setMenuDataIfCurrent(MenuData, p2) and IsSmallTouchDevice then
				PlayerListVisibilityStore.setVisible(false)
			end
		end)
	end)
	local PlayerListInitialVisibleStateModule = require(Parent.PlayerListInitialVisibleState)
	PlayerListVisibilityStore.reset()
	PlayerListVisibilityStore.setVisible(PlayerListInitialVisibleStateModule())
	self.SetVisibleChangedEvent = Instance.new("BindableEvent")
	self.VisibilityChangedEvent = Instance.new("BindableEvent")
	
	local function setupVisibilityEffect()
		-- upvalues: self (copy), SignalsModule (upval), PlayerListVisibilityStore (upval)
		local Flag = false
		self._reskinSetVisibleEffect = SignalsModule.createEffect(function(p1)
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
		self._reskinVisibilityEffect = SignalsModule.createEffect(function(p1)
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
	local Element = ReactModule.createElement(FoundationProvider, {
		theme = Theme.Dark,
		device = Console,
		preferences = {
			preferredTransparency = UserGameSettings.PreferredTransparency
		}
	}, {
		Scrim = ReactModule.createElement(LeaderboardScrim, { isSmallTouchDevice = IsSmallTouchDevice }),
		Container = ReactModule.createElement(FoundationModule.View, (function()
			-- upvalues: IsSmallTouchDevice (copy), ConstantsModule (copy), TopBarHeight (copy)
			if IsSmallTouchDevice then
				local CurrentCamera = workspace.CurrentCamera
				local ViewportSize = if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(0, 0)
				
				return if ViewportSize.Y > ViewportSize.X then {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, ConstantsModule.ApplyDisplayScale(ConstantsModule.ScreenSideOffset), 0.5, TopBarHeight / 2),
					Size = UDim2.fromOffset(0, 0)
				} else {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, TopBarHeight / 2),
					Size = UDim2.fromOffset(0, 0)
				}
			else
				return {
					tag = "auto-xy",
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -4, 0, 4 + TopBarHeight),
					Size = UDim2.fromOffset(0, 0)
				}
			end
		end)(), {
			ReskinContainer = ReactModule.createElement(PlayerListContainer, {
				leaderboardStore = LeaderboardStoreInstanceManager.getLeaderboardStoreInstance,
				TopBarConstants = ConstantsModule,
				isTenFoot = IsEnabled
			}, {
				PlayerListPanel = ReactModule.createElement(PlayerListPanel, { isSmallTouchDevice = IsSmallTouchDevice, title = Result1 })
			})
		}),
		ContextMenu = ReactModule.createElement(PlayerContextualMenuView, { isSmallTouchDevice = IsSmallTouchDevice })
	})
	
	local function setupPlayerInfoRequests()
		-- upvalues: Players (upval), PlayerRelationshipStore (upval), MakePlayerInfoRequestsModule (upval), self (copy), PlayerIconInfoStore (upval), BlockingUtilityModule (upval), FFlagBadgeVisibilitySettingEnabled (upval), RobloxReplicatedStorage (upval)
		local config = {
			getState = function()
				-- upvalues: Players (upval)
				return { players = Players:GetPlayers() }
			end,
			dispatch = function(_, p1)
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
		
		local function request(Player)
			-- upvalues: MakePlayerInfoRequestsModule (upval), config (copy)
			MakePlayerInfoRequestsModule(Player)(config)
		end
		
		for _, player in ipairs(Players:GetPlayers()) do
			MakePlayerInfoRequestsModule(player)(config)
		end
		self._reskinPlayerAddedConn = Players.PlayerAdded:Connect(request)
		self._reskinPlayerRemovingConn = Players.PlayerRemoving:Connect(function(Player: Player)
			-- upvalues: PlayerIconInfoStore (upval), PlayerRelationshipStore (upval)
			PlayerIconInfoStore.removePlayer(Player.UserId)
			PlayerRelationshipStore.removePlayer(Player.UserId)
		end)
		self._reskinBlockedStatusConn = BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(function(p1, IsBlocked)
			-- upvalues: PlayerRelationshipStore (upval)
			local Number: number? = tonumber(p1)
			
			if Number then
				PlayerRelationshipStore.patchPlayerRelationship(Number, { isBlocked = IsBlocked })
			end
		end)
		self._reskinFriendStatusConn = Players.LocalPlayer.FriendStatusChanged:Connect(function(Player, FriendStatus)
			-- upvalues: PlayerRelationshipStore (upval)
			PlayerRelationshipStore.patchPlayerRelationship(Player.UserId, { friendStatus = FriendStatus })
		end)
		
		if FFlagBadgeVisibilitySettingEnabled then
			task.spawn(function()
				-- upvalues: RobloxReplicatedStorage (upval), self (upval), Players (upval), MakePlayerInfoRequestsModule (upval), config (copy)
				self._reskinProfileSettingsConn = RobloxReplicatedStorage:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p1)
					-- upvalues: Players (upval), MakePlayerInfoRequestsModule (upval), config (upval)
					local Player = Players:GetPlayerByUserId((tonumber(p1)))
					
					if Player then
						MakePlayerInfoRequestsModule(Player)(config)
					end
				end)
			end)
		end
	end
	
	local function teardownPlayerInfoRequests()
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
	
	local function mountReskin()
		-- upvalues: CoreGui (upval), ReactRobloxModule (copy), Element (copy), self (copy), setupPlayerInfoRequests (copy)
		local PlayerListReskin = Instance.new("ScreenGui")
		PlayerListReskin.Name = "PlayerListReskin"
		PlayerListReskin.AutoLocalize = false
		PlayerListReskin.IgnoreGuiInset = true
		local IsTESTEZRUNNINGTEST = _G.__TESTEZ_RUNNING_TEST__ == true
		PlayerListReskin.DisplayOrder = if IsTESTEZRUNNINGTEST then -1 else 1
		PlayerListReskin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		PlayerListReskin.Parent = CoreGui
		local Root = ReactRobloxModule.createRoot(PlayerListReskin)
		Root:render(Element)
		self._reskinRoot = Root
		self._reskinScreenGui = PlayerListReskin
		setupPlayerInfoRequests()
	end
	
	local function unmountReskin()
		-- upvalues: teardownPlayerInfoRequests (copy), self (copy)
		teardownPlayerInfoRequests()
		
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
	self._reskinCoreGuiConn = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, CoreGuiEnabled)
		-- upvalues: self (copy)
		if CoreGuiType == Enum.CoreGuiType.All or CoreGuiType == Enum.CoreGuiType.PlayerList then
			self.coreGuiEnabled = CoreGuiEnabled
			self:SetTopBarEnabled(self.topBarEnabled)
		end
	end)
	ContextActionService:BindCoreAction("RbxPlayerListToggle", function(_, UserInputState, _)
		-- upvalues: self (copy), IsSmallTouchDevice (copy), GuiService (upval)
		if not self.mounted then
			return Enum.ContextActionResult.Pass
		elseif IsSmallTouchDevice then
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
		self._reskinTopBarEffect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceTopBarModule (upval), self (copy)
			local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
			
			if GetTopBarStoreFunction then
				self:SetTopBarEnabled(GetTopBarStoreFunction(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
	return self
end

function PlayerListController.GetVisibility(p1)
	-- upvalues: FFlagPlayerListReskin (copy), PlayerListVisibilityStore (copy)
	return if FFlagPlayerListReskin then PlayerListVisibilityStore.getEffectiveVisible(false) else p1.store:getState().displayOptions.isVisible
end

if FFlagAddNewPlayerListFocusNav then
	function PlayerListController:GetVisibilityChangedEvent()
		return self.VisibilityChangedEvent
	end
end
function PlayerListController.GetSetVisible(p1)
	-- upvalues: FFlagPlayerListReskin (copy), PlayerListVisibilityStore (copy)
	return if FFlagPlayerListReskin then PlayerListVisibilityStore.getVisible(false) else p1.store:getState().displayOptions.setVisible
end

function PlayerListController:GetSetVisibleChangedEvent()
	return self.SetVisibleChangedEvent
end

function PlayerListController:SetVisibility(p1)
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

function PlayerListController:HideTemp(p1, Enabled)
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

function PlayerListController:SetTopBarEnabled(TopBarEnabled)
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

function PlayerListController:SetMinimized(p1)
	-- upvalues: FFlagPlayerListReskin (copy), SetMinimizedModule (copy)
	if not FFlagPlayerListReskin then
		self.store:dispatch(SetMinimizedModule(p1))
		
		return
	end
end

return PlayerListController