local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local MenuHeaderModule = require(script.MenuHeader)
local ChatIconModule = require(script.ChatIcon)
local MenuCellModule = require(script.MenuCell)
local QuickMenuControllerBarModule = require(script.QuickMenuControllerBar)
local MenuNavigationToggleDialogModule = require(script.MenuNavigationToggleDialog)
local Modules = CoreGui:WaitForChild("RobloxGui").Modules
local TenFootInterfaceModule = require(Modules.TenFootInterface)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(Modules.BackpackScript)
local EmotesMenuMasterModule = require(Modules.EmotesMenu.EmotesMenuMaster)
local ChatSelectorModule = require(Modules.ChatSelector)
local PlayerListManagerModule = require(Modules.PlayerList.PlayerListManager)
local IsNewInGameMenuEnabledModule = require(Modules.isNewInGameMenuEnabled)
local InGameMenuConstantsModule = require(Modules.InGameMenuConstants)
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local TelemetryModule = require(Modules.TopBar:WaitForChild("Telemetry"))
local LogGamepadOpenExperienceControlsMenuFunction = TelemetryModule.LogGamepadOpenExperienceControlsMenu
local Default = TelemetryModule.GamepadMenuTelemetry.default
local GameSettings = UserSettings().GameSettings
local SetGamepadMenuOpenModule = require(script.Parent.Parent.Parent.Actions.SetGamepadMenuOpen)
local EnumGamepadMenuOptionsModule = require(script.EnumGamepadMenuOptions)
local IconsLogoBlock = Images["icons/logo/block"]
local IconsMenuAR = Images["icons/menu/AR"]
local IconsActionsRespawn = Images["icons/actions/respawn"]
local IconsNavigationClose = Images["icons/navigation/close"]
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local _Rect = Rect.new(8, 8, 9, 9)
local GamepadMenu = RoactModule.PureComponent:extend("GamepadMenu")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAddMenuNavigationToggleDialog = SharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExperienceMenuGamepadExposureEnabled = SharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
local FFlagMountCoreGuiBackpackModule = require(Modules.Flags.FFlagMountCoreGuiBackpack)
local FFlagPlayerListUseFocusNavHook = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagPlayerListUseFocusNavHook
local GetFFlagExpChatAlwaysRunTCSFunction = SharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local ToastNotification = nil
local ToastNotificationWrapper = nil
local Toast = nil
task.spawn(function() --[[ Line: 111 ]]
	-- upvalues: ToastNotification (ref), CoreGui (copy), ToastNotificationWrapper (ref), Toast (ref)
	ToastNotification = CoreGui:WaitForChild("ToastNotification", 3)
	ToastNotificationWrapper = if ToastNotification == nil then nil else ToastNotification:WaitForChild("ToastNotificationWrapper", 3)
	Toast = if ToastNotificationWrapper == nil then nil else ToastNotificationWrapper:FindFirstChild("Toast", true)
end)
GamepadMenu.validateProps = TModule.strictInterface({
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	chatVersion = TModule.optional(TModule.EnumItem),
	chatEnabled = TModule.boolean,
	leaderboardEnabled = TModule.boolean,
	emotesEnabled = TModule.boolean,
	backpackEnabled = if FFlagMountCoreGuiBackpackModule then nil else TModule.boolean,
	respawnEnabled = TModule.boolean,
	leaderboardOpen = TModule.boolean,
	backpackOpen = TModule.boolean,
	emotesOpen = TModule.boolean,
	menuOpen = TModule.boolean,
	topBarEnabled = if FFlagMountCoreGuiBackpackModule then TModule.boolean else nil,
	setGamepadMenuOpen = TModule.callback,
	isGamepadMenuOpen = TModule.boolean
})

function GamepadMenu.init(p1) --[[ Line: 139 ]]
	-- upvalues: FFlagMountCoreGuiBackpackModule (copy), StarterGui (copy), FFlagExperienceMenuGamepadExposureEnabled (copy), Default (copy), EnumGamepadMenuOptionsModule (copy), ChatSelectorModule (copy), Toast (ref), FFlagPlayerListUseFocusNavHook (copy), PlayerListManagerModule (copy), LogGamepadOpenExperienceControlsMenuFunction (copy), GamepadMenu (copy), GuiService (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	if FFlagMountCoreGuiBackpackModule then
		p1:setState({
			selectedIndex = 1,
			menuActions = {},
			mountBackpack = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, MountBackpack) --[[ Line: 147 ]]
			-- upvalues: p1 (copy)
			if CoreGuiType == Enum.CoreGuiType.Backpack or CoreGuiType == Enum.CoreGuiType.All then
				p1:setState({ mountBackpack = MountBackpack })
			end
		end)
	else
		p1:setState({ selectedIndex = 1, menuActions = {} })
	end
	if FFlagExperienceMenuGamepadExposureEnabled then
		p1.loggedExperienceMenuGamepadExposure = false
	end
	p1.boundMenuOpenActions = false
	p1.lastMenuButtonPress = 0
	
	function p1:toggleChatVisibilityAction(UserInputState, _) --[[ Line: 169 ]]
		-- upvalues: p1 (copy), Default (upval), EnumGamepadMenuOptionsModule (upval), ChatSelectorModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			p1.toggleChatVisible()
			Default.onOptionSelected({
				usedShortcut = true,
				menuOptionName = EnumGamepadMenuOptionsModule.Chat,
				isToggleOpen = ChatSelectorModule:GetVisibility()
			})
		end
	end
	
	function p1:toggleMenuVisibleAction(UserInputState, _) --[[ Line: 180 ]]
		-- upvalues: p1 (copy), Toast (upval), FFlagPlayerListUseFocusNavHook (upval), PlayerListManagerModule (upval), LogGamepadOpenExperienceControlsMenuFunction (upval)
		if p1.props.menuOpen then
			return Enum.ContextActionResult.Pass
		end
		local Visible = Toast ~= nil and Toast.Visible
		
		if UserInputState == Enum.UserInputState.Begin then
			p1.lastMenuButtonPress = tick()
			
			return Enum.ContextActionResult.Pass
		end
		if UserInputState ~= Enum.UserInputState.End or Visible and tick() - p1.lastMenuButtonPress >= 1 then
			return Enum.ContextActionResult.Pass
		end
		local NoIsGamepadMenuOpen = not p1.props.isGamepadMenuOpen
		
		if FFlagPlayerListUseFocusNavHook and NoIsGamepadMenuOpen and PlayerListManagerModule:GetIsModal() and PlayerListManagerModule:GetVisibility() then
			PlayerListManagerModule:SetVisibility(false)
		end
		p1.props.setGamepadMenuOpen(NoIsGamepadMenuOpen)
		LogGamepadOpenExperienceControlsMenuFunction(NoIsGamepadMenuOpen)
		p1:logExperienceMenuGamepadExposure()
		
		return Enum.ContextActionResult.Sink
	end
	
	function p1:closeMenuAction(UserInputState, _) --[[ Line: 211 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.setGamepadMenuOpen(false)
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	function p1:leaveGameMenuAction(UserInputState, _) --[[ Line: 221 ]]
		-- upvalues: GamepadMenu (upval), p1 (copy), Default (upval), EnumGamepadMenuOptionsModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			GamepadMenu.leaveGame()
			p1.props.setGamepadMenuOpen(false)
			Default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = EnumGamepadMenuOptionsModule.Leave
			})
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	function p1:respawnMenuAction(UserInputState, _) --[[ Line: 238 ]]
		-- upvalues: GamepadMenu (upval), p1 (copy), Default (upval), EnumGamepadMenuOptionsModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			GamepadMenu.respawnCharacter()
			p1.props.setGamepadMenuOpen(false)
			Default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = EnumGamepadMenuOptionsModule.Respawn
			})
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	p1.lastThumbStickMove = 0
	
	function p1:moveSelectionAction(UserInputState, Input) --[[ Line: 257 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			if Input.KeyCode == Enum.KeyCode.DPadUp then
				if p1.state.selectedIndex > 1 then
					p1:setState({ selectedIndex = p1.state.selectedIndex - 1 })
				end
				return Enum.ContextActionResult.Sink
			elseif Input.KeyCode == Enum.KeyCode.DPadDown then
				if p1.state.selectedIndex < #p1.state.menuActions then
					p1:setState({ selectedIndex = p1.state.selectedIndex + 1 })
				end
				return Enum.ContextActionResult.Sink
			end
		elseif Input.KeyCode == Enum.KeyCode.Thumbstick1 then
			if tick() - p1.lastThumbStickMove < 0.15 then
				return Enum.ContextActionResult.Pass
			end
			if Input.Position.Y > 0.8 then
				if p1.state.selectedIndex > 1 then
					p1:setState({ selectedIndex = p1.state.selectedIndex - 1 })
					p1.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Pass
			elseif Input.Position.Y < -0.8 then
				if p1.state.selectedIndex < #p1.state.menuActions then
					p1:setState({ selectedIndex = p1.state.selectedIndex + 1 })
					p1.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p1:goToTopAction(UserInputState, _) --[[ Line: 299 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1:setState({ selectedIndex = 1 })
			
			return
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	function p1:goToBottomAction(UserInputState, _) --[[ Line: 309 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1:setState({ selectedIndex = #p1.state.menuActions })
			
			return
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	function p1:activateSelectionAction(UserInputState, _) --[[ Line: 319 ]]
		-- upvalues: p1 (copy), GuiService (upval), EnumGamepadMenuOptionsModule (upval), PlayerListManagerModule (upval), Default (upval)
		if UserInputState == Enum.UserInputState.Begin then
			local MenuAction = p1.state.menuActions[p1.state.selectedIndex]
			p1.props.setGamepadMenuOpen(false)
			GuiService:SetMenuIsOpen(false, "GamepadMenu")
			MenuAction.onActivated()
			
			local function _(Leaderboard) --[[ Line: 333 | Named "isMenuOptionToggleOpenOnSelect" ]]
				-- upvalues: EnumGamepadMenuOptionsModule (upval), PlayerListManagerModule (upval)
				return Leaderboard ~= EnumGamepadMenuOptionsModule.Leaderboard or PlayerListManagerModule:GetSetVisible()
			end
			
			Default.onOptionSelected({
				usedShortcut = false,
				menuOptionName = MenuAction.name,
				isToggleOpen = MenuAction.name ~= EnumGamepadMenuOptionsModule.Leaderboard or PlayerListManagerModule:GetSetVisible()
			})
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end
	
	function p1.overlayDismiss() --[[ Line: 350 ]]
		-- upvalues: p1 (copy)
		p1.props.setGamepadMenuOpen(false)
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2) --[[ Line: 357 ]]
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function GamepadMenu.openRootMenu() --[[ Line: 365 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), Modules (copy), InGameMenuConstantsModule (copy)
	if IsNewInGameMenuEnabledModule() then
		require(Modules.InGameMenuInit).openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
		
		return
	else
		require(Modules.Settings.SettingsHub):SetVisibility(true, nil, nil, true, InGameMenuConstantsModule.AnalyticsMenuOpenTypes.PlayersTriggered)
	end
end

function GamepadMenu.openUnibarMenu() --[[ Line: 376 ]]
	-- upvalues: Modules (copy)
	require(Modules.Chrome.Service):enableFocusNav()
end

function GamepadMenu.closeUnibarMenu() --[[ Line: 381 ]]
	-- upvalues: Modules (copy)
	require(Modules.Chrome.Service):disableFocusNav()
end

function GamepadMenu.toggleChatVisible() --[[ Line: 386 ]]
	-- upvalues: ChatSelectorModule (copy), GameSettings (copy)
	ChatSelectorModule:ToggleVisibility()
	GameSettings.ChatVisible = ChatSelectorModule:GetVisibility()
end

function GamepadMenu.focusChatBar() --[[ Line: 391 ]]
	-- upvalues: ChatSelectorModule (copy), GameSettings (copy)
	ChatSelectorModule:SetVisible(true)
	GameSettings.ChatVisible = true
	ChatSelectorModule:FocusChatBar()
end

function GamepadMenu.toggleLeaderboard() --[[ Line: 397 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), Modules (copy), PlayerListManagerModule (copy)
	if IsNewInGameMenuEnabledModule() then
		require(Modules.InGameMenuInit).openPlayersPage()
		
		return
	else
		PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
	end
end

function GamepadMenu.toggleEmotesMenu() --[[ Line: 407 ]]
	-- upvalues: EmotesMenuMasterModule (copy)
	if EmotesMenuMasterModule:isOpen() then
		EmotesMenuMasterModule:close()
		
		return
	else
		EmotesMenuMasterModule:open()
	end
end

function GamepadMenu.toggleBackpack() --[[ Line: 415 ]]
	-- upvalues: FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy)
	if FFlagEnableNewBackpack then
		Features.toggleVisibility(Features.FeatureName.Backpack)
		
		return
	else
		BackpackScriptModule:OpenClose()
	end
end

function GamepadMenu.leaveGame() --[[ Line: 423 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), Modules (copy), InGameMenuConstantsModule (copy)
	if IsNewInGameMenuEnabledModule() then
		require(Modules.InGameMenuInit).openGameLeavePage()
		
		return
	else
		local SettingsHubModule = require(Modules.Settings.SettingsHub)
		SettingsHubModule:SetVisibility(true, false, SettingsHubModule.Instance.LeaveGamePage, true, InGameMenuConstantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame)
	end
end

function GamepadMenu.respawnCharacter() --[[ Line: 440 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), Modules (copy), InGameMenuConstantsModule (copy)
	if IsNewInGameMenuEnabledModule() then
		require(Modules.InGameMenuInit).openCharacterResetPage()
		
		return
	else
		local SettingsHubModule = require(Modules.Settings.SettingsHub)
		SettingsHubModule:SetVisibility(true, false, SettingsHubModule.Instance.ResetCharacterPage, true, InGameMenuConstantsModule.AnalyticsMenuOpenTypes.GamepadResetCharacter)
	end
end

function GamepadMenu.shouldShowChatMenuOption(ChatVersion, ChatEnabled) --[[ Line: 456 ]]
	-- upvalues: TenFootInterfaceModule (copy), TextChatService (copy), GetFFlagExpChatAlwaysRunTCSFunction (copy)
	if TenFootInterfaceModule:IsEnabled() then
		local ChatVersion1 = ChatVersion or TextChatService.ChatVersion
		
		return if GetFFlagExpChatAlwaysRunTCSFunction() then ChatEnabled else ChatEnabled and ChatVersion1 == Enum.ChatVersion.TextChatService
	else
		return ChatEnabled
	end
end

function GamepadMenu.getMenuActionsFromProps(p1, p2) --[[ Line: 474 ]]
	-- upvalues: EnumGamepadMenuOptionsModule (copy), IconsLogoBlock (copy), GamepadMenu (copy), ChatIconModule (copy), EnabledFunction (copy), IconsMenuAR (copy), TenFootInterfaceModule (copy), FFlagMountCoreGuiBackpackModule (copy), IconsActionsRespawn (copy), IconsNavigationClose (copy)
	local List = {}
	table.insert(List, {
		iconComponent = nil,
		localizationKey = "CoreScripts.TopBar.Menu",
		name = EnumGamepadMenuOptionsModule.Menu,
		icon = IconsLogoBlock,
		onActivated = GamepadMenu.openRootMenu
	})
	
	if GamepadMenu.shouldShowChatMenuOption(p1.chatVersion, p1.chatEnabled) then
		table.insert(List, {
			icon = nil,
			localizationKey = "CoreScripts.TopBar.Chat",
			name = EnumGamepadMenuOptionsModule.Chat,
			iconComponent = ChatIconModule,
			onActivated = GamepadMenu.focusChatBar
		})
	end
	if EnabledFunction() then
		table.insert(List, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Title.ExperienceControls",
			name = EnumGamepadMenuOptionsModule.Unibar,
			icon = IconsMenuAR,
			onActivated = GamepadMenu.openUnibarMenu
		})
	end
	if p1.leaderboardEnabled or TenFootInterfaceModule:IsEnabled() then
		table.insert(List, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Leaderboard",
			name = EnumGamepadMenuOptionsModule.Leaderboard,
			icon = if p1.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOn.png" else "rbxasset://textures/ui/TopBar/leaderboardOff.png",
			onActivated = GamepadMenu.toggleLeaderboard
		})
	end
	if p1.emotesEnabled then
		table.insert(List, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Emotes",
			name = EnumGamepadMenuOptionsModule.Emotes,
			icon = if p1.emotesOpen then "rbxasset://textures/ui/TopBar/emotesOn.png" else "rbxasset://textures/ui/TopBar/emotesOff.png",
			onActivated = GamepadMenu.toggleEmotesMenu
		})
	end
	if if FFlagMountCoreGuiBackpackModule then p1.topBarEnabled and p2.mountBackpack else p1.backpackEnabled then
		table.insert(List, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Inventory",
			name = EnumGamepadMenuOptionsModule.Inventory,
			icon = if p1.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOn.png" else "rbxasset://textures/ui/TopBar/inventoryOff.png",
			onActivated = GamepadMenu.toggleBackpack
		})
	end
	if p1.respawnEnabled then
		table.insert(List, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Respawn",
			name = EnumGamepadMenuOptionsModule.Respawn,
			icon = IconsActionsRespawn,
			onActivated = GamepadMenu.respawnCharacter
		})
	end
	table.insert(List, {
		iconComponent = nil,
		localizationKey = "CoreScripts.TopBar.Leave",
		name = EnumGamepadMenuOptionsModule.Leave,
		icon = IconsNavigationClose,
		onActivated = GamepadMenu.leaveGame
	})
	
	return List
end

function GamepadMenu.getDerivedStateFromProps(p1, p2) --[[ Line: 586 ]]
	-- upvalues: FFlagMountCoreGuiBackpackModule (copy), GamepadMenu (copy), CryoModule (copy)
	local MenuActionsFromProps = if FFlagMountCoreGuiBackpackModule then GamepadMenu.getMenuActionsFromProps(p1, p2) else GamepadMenu.getMenuActionsFromProps(p1)
	local SelectedIndex = p2.selectedIndex or 1
	
	if #MenuActionsFromProps < SelectedIndex then
		SelectedIndex = #MenuActionsFromProps
	end
	return CryoModule.Dictionary.join(p2, {
		selectedIndex = SelectedIndex,
		menuActions = MenuActionsFromProps
	})
end

function GamepadMenu.render(p1) --[[ Line: 605 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), MenuHeaderModule (copy), MenuCellModule (copy), FFlagTopBarSignalizeScreenSize (copy), QuickMenuControllerBarModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17 (copy), _Rect (copy), EnabledFunction (copy), FFlagEnableConsoleExpControls (copy), FFlagAddMenuNavigationToggleDialog (copy), MenuNavigationToggleDialogModule (copy)
	return WithStyleFunction(function(p2) --[[ Line: 606 ]]
		-- upvalues: RoactModule (upval), MenuHeaderModule (upval), p1 (copy), MenuCellModule (upval), FFlagTopBarSignalizeScreenSize (upval), QuickMenuControllerBarModule (upval), ImageSetLabel (upval), ComponentAssetsCircle17 (upval), _Rect (upval), EnabledFunction (upval), FFlagEnableConsoleExpControls (upval), FFlagAddMenuNavigationToggleDialog (upval), MenuNavigationToggleDialogModule (upval)
		local Theme = p2.Theme
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			MenuHeader = RoactModule.createElement(MenuHeaderModule, { layoutOrder = 1, height = 120 })
		}
		
		for i, menuAction in ipairs(p1.state.menuActions) do
			config[menuAction.name] = RoactModule.createElement(MenuCellModule, {
				height = 56,
				layoutOrder = i + 1,
				icon = menuAction.icon,
				iconComponent = menuAction.iconComponent,
				localizationKey = menuAction.localizationKey,
				hasDivider = i ~= #p1.state.menuActions,
				isSelected = i == p1.state.selectedIndex
			})
		end
		local YOffset = #p1.state.menuActions * 56 + 120
		local YRatio = 1
		local ScreenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize
		
		if ScreenSize.Y * 0.75 < YOffset then
			YRatio = ScreenSize.Y * 0.75 / YOffset
		end
		if ScreenSize.X * 0.75 < 336 then
			local XRatio = ScreenSize.X * 0.75 / 336
			
			if XRatio < YRatio then
				YRatio = XRatio
			end
		end
		if YRatio < 1 then
			config.UIScale = RoactModule.createElement("UIScale", { Scale = YRatio })
		end
		local IsGamepadMenuOpen = p1.props.isGamepadMenuOpen
		
		return RoactModule.createElement("TextButton", {
			Visible = IsGamepadMenuOpen,
			Text = "",
			BackgroundTransparency = Theme.Overlay.Transparency,
			BackgroundColor3 = Theme.Overlay.Color,
			Size = UDim2.fromScale(1, 1),
			BorderSizePixel = 0,
			ZIndex = 10,
			[RoactModule.Event.Activated] = p1.overlayDismiss
		}, {
			Menu = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = ComponentAssetsCircle17,
				SliceCenter = _Rect,
				ScaleType = Enum.ScaleType.Slice,
				ImageTransparency = Theme.BackgroundUIContrast.Transparency,
				ImageColor3 = Theme.BackgroundUIContrast.Color,
				Size = UDim2.fromOffset(336, YOffset),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, config),
			ControllerBar = if IsGamepadMenuOpen then RoactModule.createElement(QuickMenuControllerBarModule, {
				chatMenuEnabled = p1.shouldShowChatMenuOption(p1.props.chatVersion, p1.props.chatEnabled)
			}) else nil,
			MenuNavigationToggleDialog = if EnabledFunction() or FFlagEnableConsoleExpControls or not FFlagAddMenuNavigationToggleDialog then nil else RoactModule.createElement(MenuNavigationToggleDialogModule, { Position = UDim2.fromScale(0.5, 0.1) })
		})
	end)
end

function GamepadMenu.didMount(p2) --[[ Line: 703 ]]
	-- upvalues: VRService (copy), ContextActionService (copy)
	if not VRService.VREnabled then
		ContextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p2.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
	end
end

function GamepadMenu.bindMenuOpenActions(p2) --[[ Line: 714 ]]
	-- upvalues: ContextActionService (copy)
	p2.boundMenuOpenActions = true
	ContextActionService:BindCoreAction("TopBarGamepadFreezeController", function() --[[ Line: 719 ]] end, false, Enum.UserInputType.Gamepad1)
	ContextActionService:BindCoreAction("TopBarGamepadCloseMenu", p2.closeMenuAction, false, Enum.KeyCode.ButtonB)
	ContextActionService:BindCoreAction("TopBarGamepadLeaveGame", p2.leaveGameMenuAction, false, Enum.KeyCode.ButtonX)
	ContextActionService:BindCoreAction("TopBarGamepadRespawnAction", p2.respawnMenuAction, false, Enum.KeyCode.ButtonY)
	ContextActionService:BindCoreAction("TopBarGamepadActivateSelection", p2.activateSelectionAction, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindCoreAction("TopBarGamepadMoveSelection", p2.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown)
	ContextActionService:BindCoreAction("TopBarGamepadMoveSelectionTop", p2.goToTopAction, false, Enum.KeyCode.ButtonL2)
	ContextActionService:BindCoreAction("TopBarGamepadMoveSelectionBottom", p2.goToBottomAction, false, Enum.KeyCode.ButtonR2)
	ContextActionService:BindCoreAction("TopBarGamepadToggleChatVisibility", p2.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1)
	ContextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p2.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
end

function GamepadMenu.unbindMenuOpenActions(p2) --[[ Line: 759 ]]
	-- upvalues: ContextActionService (copy)
	p2.boundMenuOpenActions = false
	ContextActionService:UnbindCoreAction("TopBarGamepadFreezeController")
	ContextActionService:UnbindCoreAction("TopBarGamepadCloseMenu")
	ContextActionService:UnbindCoreAction("TopBarGamepadActivateSelection")
	ContextActionService:UnbindCoreAction("TopBarGamepadLeaveGame")
	ContextActionService:UnbindCoreAction("TopBarGamepadRespawnAction")
	ContextActionService:UnbindCoreAction("TopBarGamepadMoveSelection")
	ContextActionService:UnbindCoreAction("TopBarGamepadMoveSelectionTop")
	ContextActionService:UnbindCoreAction("TopBarGamepadMoveSelectionBottom")
	ContextActionService:UnbindCoreAction("TopBarGamepadToggleChatVisibility")
end

function GamepadMenu.unbindAllActions(p2) --[[ Line: 773 ]]
	-- upvalues: ContextActionService (copy)
	if p2.boundMenuOpenActions then
		p2:unbindMenuOpenActions()
	end
	ContextActionService:UnbindCoreAction("TopBarGamepadToggleGamepadMenu")
end

function GamepadMenu.didUpdate(p2, p3, _) --[[ Line: 781 ]]
	-- upvalues: GuiService (copy), EnabledFunction (copy), GamepadMenu (copy)
	local IsGamepadMenuOpen = p2.props.isGamepadMenuOpen
	
	if p3.isGamepadMenuOpen ~= p2.props.isGamepadMenuOpen then
		if IsGamepadMenuOpen then
			p2:bindMenuOpenActions()
			
			if p2.state.selectedIndex ~= 1 then
				p2:setState({ selectedIndex = 1 })
			end
			p2.savedSelectedCoreObject = GuiService.SelectedCoreObject
			GuiService.SelectedCoreObject = nil
			p2.savedSelectedObject = GuiService.SelectedObject
			GuiService.SelectedObject = nil
			GuiService:SetMenuIsOpen(true, "GamepadMenu")
			
			if EnabledFunction() then
				GamepadMenu.closeUnibarMenu()
				
				return
			end
		else
			p2:unbindMenuOpenActions()
			GuiService:SetMenuIsOpen(false, "GamepadMenu")
		end
	end
end

function GamepadMenu.willUnmount(p2) --[[ Line: 814 ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	p2:unbindAllActions()
	
	if FFlagTopBarSignalizeScreenSize then
		p2.disposeScreenSize()
	end
end

function GamepadMenu.logExperienceMenuGamepadExposure(p2) --[[ Line: 822 ]]
	-- upvalues: FFlagExperienceMenuGamepadExposureEnabled (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	if FFlagExperienceMenuGamepadExposureEnabled and not p2.loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ExperienceMenuGamepadExposureLayer)
		p2.loggedExperienceMenuGamepadExposure = true
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2) --[[ Line: 829 | Named "mapStateToProps" ]]
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), VRService (copy), FFlagMountCoreGuiBackpackModule (copy)
	local TopbarEnabled = p2.displayOptions.topbarEnabled
	
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p2.displayOptions.screenSize,
		chatEnabled = p2.coreGuiEnabled[Enum.CoreGuiType.Chat] and (TopbarEnabled and not VRService.VREnabled),
		leaderboardEnabled = p2.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and TopbarEnabled,
		emotesEnabled = p2.moreMenu.emotesEnabled and (p2.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu] and TopbarEnabled),
		backpackEnabled = if FFlagMountCoreGuiBackpackModule then nil else p2.coreGuiEnabled[Enum.CoreGuiType.Backpack] and TopbarEnabled,
		respawnEnabled = p2.respawn.enabled,
		topBarEnabled = if FFlagMountCoreGuiBackpackModule then TopbarEnabled else nil,
		leaderboardOpen = p2.moreMenu.leaderboardOpen,
		backpackOpen = p2.moreMenu.backpackOpen,
		emotesOpen = p2.moreMenu.emotesOpen,
		menuOpen = p2.displayOptions.menuOpen,
		isGamepadMenuOpen = p2.displayOptions.isGamepadMenuOpen
	}
end, function(Callback) --[[ Line: 855 | Named "mapDispatchToProps" ]]
	-- upvalues: SetGamepadMenuOpenModule (copy)
	return {
		setGamepadMenuOpen = function(p2) --[[ Line: 857 ]]
			-- upvalues: Callback (copy), SetGamepadMenuOpenModule (upval)
			return Callback(SetGamepadMenuOpenModule(p2))
		end
	}
end)(GamepadMenu)