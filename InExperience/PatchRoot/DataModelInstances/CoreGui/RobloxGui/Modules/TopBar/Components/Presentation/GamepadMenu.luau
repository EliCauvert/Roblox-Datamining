local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local textChatService = game:GetService("TextChatService")
local starterGuiService = game:GetService("StarterGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local cryoModule = require(corePackagesService.Packages.Cryo)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local appUserLayers = require(corePackagesService.Workspace.Packages.ExperimentLayers).AppUserLayers
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local withStyle = UIBloxModule.Core.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local menuHeaderModule = require(script.MenuHeader)
local chatIconModule = require(script.ChatIcon)
local menuCellModule = require(script.MenuCell)
local quickMenuControllerBarModule = require(script.QuickMenuControllerBar)
local menuNavigationToggleDialogModule = require(script.MenuNavigationToggleDialog)
local modules = coreGuiService:WaitForChild("RobloxGui").Modules
local topBar = modules.TopBar
local tenFootInterfaceModule = require(modules.TenFootInterface)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var1 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var2 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
local emotesMenuMasterModule = require(modules.EmotesMenu.EmotesMenuMaster)
local chatSelectorModule = require(modules.ChatSelector)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local playerListManagerModule = require(modules.PlayerList.PlayerListManager)
local isNewInGameMenuEnabledModule = require(modules.isNewInGameMenuEnabled)
local inGameMenuConstantsModule = require(modules.InGameMenuConstants)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local telemetryModule = require(topBar:WaitForChild("Telemetry"))
local logGamepadOpenExperienceControlsMenu = telemetryModule.LogGamepadOpenExperienceControlsMenu
local default = telemetryModule.GamepadMenuTelemetry.default
local gameSettings = UserSettings().GameSettings
local setGamepadMenuOpenModule = require(script.Parent.Parent.Parent.Actions.SetGamepadMenuOpen)
local enumGamepadMenuOptionsModule = require(script.EnumGamepadMenuOptions)
local block = images["icons/logo/block"]
local AR = images["icons/menu/AR"]
local respawn = images["icons/actions/respawn"]
local close = images["icons/navigation/close"]
local circle17 = images["component_assets/circle_17"]
local rect = Rect.new(8, 8, 9, 9)
local gamepadMenu = roactModule.PureComponent:extend("GamepadMenu")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagAddMenuNavigationToggleDialog = sharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExperienceMenuGamepadExposureEnabled = sharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
local fFlagMountCoreGuiBackpackModule = require(modules.Flags.FFlagMountCoreGuiBackpack)
local fFlagPlayerListUseFocusNavHook = playerListModule.Flags.FFlagPlayerListUseFocusNavHook
local getFFlagExpChatAlwaysRunTCS = sharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local var3 = nil
local var4 = nil
local var5 = nil
task.spawn(function()
	-- upvalues: var3 (write), coreGuiService (ref), var4 (write), var5 (write)
	var3 = coreGuiService:WaitForChild("ToastNotification", 3)
	var4 = if var3 ~= nil then nil else var3:WaitForChild("ToastNotificationWrapper", 3)
	var5 = if var4 ~= nil then nil else var4:FindFirstChild("Toast", true)
end)
gamepadMenu.validateProps = tModule.strictInterface({
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	chatVersion = tModule.optional(tModule.EnumItem),
	chatEnabled = tModule.boolean,
	leaderboardEnabled = tModule.boolean,
	emotesEnabled = tModule.boolean,
	backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else tModule.boolean,
	respawnEnabled = tModule.boolean,
	leaderboardOpen = tModule.boolean,
	backpackOpen = tModule.boolean,
	emotesOpen = tModule.boolean,
	menuOpen = tModule.boolean,
	topBarEnabled = if fFlagMountCoreGuiBackpackModule then tModule.boolean else nil,
	setGamepadMenuOpen = tModule.callback,
	isGamepadMenuOpen = tModule.boolean
})

function gamepadMenu.init(p1)
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), fFlagExperienceMenuGamepadExposureEnabled (ref), default (ref), enumGamepadMenuOptionsModule (ref), chatSelectorModule (ref), var5 (write), fFlagPlayerListUseFocusNavHook (ref), playerListManagerModule (ref), logGamepadOpenExperienceControlsMenu (ref), gamepadMenu (ref), guiService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	if fFlagMountCoreGuiBackpackModule then
		p1:setState({
			selectedIndex = 1,
			menuActions = {},
			mountBackpack = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p2 == Enum.CoreGuiType.Backpack or p2 == Enum.CoreGuiType.All then
				p1:setState({ mountBackpack = p3 })
			end
		end)
	else
		p1:setState({ selectedIndex = 1, menuActions = {} })
	end
	if fFlagExperienceMenuGamepadExposureEnabled then
		p1.loggedExperienceMenuGamepadExposure = false
	end
	p1.boundMenuOpenActions = false
	p1.lastMenuButtonPress = 0
	
	function p0.toggleChatVisibilityAction(_, p2, _)
		-- upvalues: p1 (ref), default (copy), enumGamepadMenuOptionsModule (copy), chatSelectorModule (copy)
		if p2 == Enum.UserInputState.Begin then
			p1.toggleChatVisible()
			default.onOptionSelected({
				usedShortcut = true,
				menuOptionName = enumGamepadMenuOptionsModule.Chat,
				isToggleOpen = chatSelectorModule:GetVisibility()
			})
		end
	end
	
	function p0.toggleMenuVisibleAction(_, p2, _)
		-- upvalues: p1 (ref), var5 (copy), fFlagPlayerListUseFocusNavHook (copy), playerListManagerModule (copy), logGamepadOpenExperienceControlsMenu (copy)
		if p1.props.menuOpen then
			return Enum.ContextActionResult.Pass
		end
		local var6 = var5 ~= nil and var5.Visible
		
		if p2 == Enum.UserInputState.Begin then
			p1.lastMenuButtonPress = tick()
			
			return Enum.ContextActionResult.Pass
		elseif p2 ~= Enum.UserInputState.End or var6 and tick() - p1.lastMenuButtonPress >= 1 then
			return Enum.ContextActionResult.Pass
		end
		local var7 = not p1.props.isGamepadMenuOpen
		
		if fFlagPlayerListUseFocusNavHook and var7 and (playerListManagerModule:GetIsModal() and playerListManagerModule:GetVisibility()) then
			playerListManagerModule:SetVisibility(false)
		end
		p1.props.setGamepadMenuOpen(var7)
		logGamepadOpenExperienceControlsMenu(var7)
		p1:logExperienceMenuGamepadExposure()
		
		return Enum.ContextActionResult.Sink
	end
	
	function p0.closeMenuAction(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.setGamepadMenuOpen(false)
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.leaveGameMenuAction(_, p2, _)
		-- upvalues: gamepadMenu (copy), p1 (ref), default (copy), enumGamepadMenuOptionsModule (copy)
		if p2 == Enum.UserInputState.Begin then
			gamepadMenu.leaveGame()
			p1.props.setGamepadMenuOpen(false)
			default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = enumGamepadMenuOptionsModule.Leave
			})
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.respawnMenuAction(_, p2, _)
		-- upvalues: gamepadMenu (copy), p1 (ref), default (copy), enumGamepadMenuOptionsModule (copy)
		if p2 == Enum.UserInputState.Begin then
			gamepadMenu.respawnCharacter()
			p1.props.setGamepadMenuOpen(false)
			default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = enumGamepadMenuOptionsModule.Respawn
			})
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	p1.lastThumbStickMove = 0
	
	function p0.moveSelectionAction(_, p2, p3)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			if p3.KeyCode == Enum.KeyCode.DPadUp then
				if p1.state.selectedIndex > 1 then
					p1:setState({ selectedIndex = p1.state.selectedIndex - 1 })
				end
				return Enum.ContextActionResult.Sink
			elseif p3.KeyCode ~= Enum.KeyCode.DPadDown then
				return Enum.ContextActionResult.Pass
			end
			if p1.state.selectedIndex < #p1.state.menuActions then
				p1:setState({ selectedIndex = p1.state.selectedIndex + 1 })
			end
			return Enum.ContextActionResult.Sink
		elseif p3.KeyCode == Enum.KeyCode.Thumbstick1 then
			if tick() - p1.lastThumbStickMove < 0.15 then
				return Enum.ContextActionResult.Pass
			elseif p3.Position.Y > 0.8 then
				if p1.state.selectedIndex > 1 then
					p1:setState({ selectedIndex = p1.state.selectedIndex - 1 })
					p1.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Pass
			elseif p3.Position.Y >= -0.8 then
			end
			if p1.state.selectedIndex < #p1.state.menuActions then
				p1:setState({ selectedIndex = p1.state.selectedIndex + 1 })
				p1.lastThumbStickMove = tick()
			end
			return Enum.ContextActionResult.Sink
		end
	end
	
	function p0.goToTopAction(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1:setState({ selectedIndex = 1 })
			
			return
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.goToBottomAction(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1:setState({ selectedIndex = #p1.state.menuActions })
			
			return
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.activateSelectionAction(_, p2, _)
		-- upvalues: p1 (ref), guiService (copy), enumGamepadMenuOptionsModule (copy), playerListManagerModule (copy), default (copy)
		if p2 == Enum.UserInputState.Begin then
			local selectedIndex = p1.state.menuActions[p1.state.selectedIndex]
			p1.props.setGamepadMenuOpen(false)
			guiService:SetMenuIsOpen(false, "GamepadMenu")
			selectedIndex.onActivated()
			
			local function _(p3)
				-- upvalues: enumGamepadMenuOptionsModule (copy), playerListManagerModule (copy)
				return if p3 == enumGamepadMenuOptionsModule.Leaderboard then playerListManagerModule:GetSetVisible() else true
			end
			
			default.onOptionSelected({
				usedShortcut = false,
				menuOptionName = selectedIndex.name,
				isToggleOpen = if selectedIndex.name == enumGamepadMenuOptionsModule.Leaderboard then playerListManagerModule:GetSetVisible() else true
			})
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.overlayDismiss()
		-- upvalues: p1 (ref)
		p1.props.setGamepadMenuOpen(false)
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function gamepadMenu.openRootMenu()
	-- upvalues: isNewInGameMenuEnabledModule (ref), modules (ref), inGameMenuConstantsModule (ref)
	if isNewInGameMenuEnabledModule() then
		require(modules.InGameMenuInit).openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
		
		return
	end
	require(modules.Settings.SettingsHub):SetVisibility(true, nil, nil, true, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.PlayersTriggered)
end

function gamepadMenu.openUnibarMenu()
	-- upvalues: modules (ref)
	require(modules.Chrome.Service):enableFocusNav()
end

function gamepadMenu.closeUnibarMenu()
	-- upvalues: modules (ref)
	require(modules.Chrome.Service):disableFocusNav()
end

function gamepadMenu.toggleChatVisible()
	-- upvalues: chatSelectorModule (ref), gameSettings (ref)
	chatSelectorModule:ToggleVisibility()
	gameSettings.ChatVisible = chatSelectorModule:GetVisibility()
end

function gamepadMenu.focusChatBar()
	-- upvalues: chatSelectorModule (ref), gameSettings (ref)
	chatSelectorModule:SetVisible(true)
	gameSettings.ChatVisible = true
	chatSelectorModule:FocusChatBar()
end

function gamepadMenu.toggleLeaderboard()
	-- upvalues: isNewInGameMenuEnabledModule (ref), modules (ref), playerListManagerModule (ref)
	if isNewInGameMenuEnabledModule() then
		require(modules.InGameMenuInit).openPlayersPage()
		
		return
	end
	playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
end

function gamepadMenu.toggleEmotesMenu()
	-- upvalues: emotesMenuMasterModule (ref)
	if emotesMenuMasterModule:isOpen() then
		emotesMenuMasterModule:close()
		
		return
	end
	emotesMenuMasterModule:open()
end

function gamepadMenu.toggleBackpack()
	-- upvalues: fFlagEnableNewBackpack (ref), var1 (ref), var2 (ref)
	if fFlagEnableNewBackpack then
		var1.toggleVisibility(var1.FeatureName.Backpack)
		
		return
	end
	var2:OpenClose()
end

function gamepadMenu.leaveGame()
	-- upvalues: isNewInGameMenuEnabledModule (ref), modules (ref), inGameMenuConstantsModule (ref)
	if isNewInGameMenuEnabledModule() then
		require(modules.InGameMenuInit).openGameLeavePage()
		
		return
	end
	local settingsHubModule = require(modules.Settings.SettingsHub)
	settingsHubModule:SetVisibility(true, false, settingsHubModule.Instance.LeaveGamePage, true, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.GamepadLeaveGame)
end

function gamepadMenu.respawnCharacter()
	-- upvalues: isNewInGameMenuEnabledModule (ref), modules (ref), inGameMenuConstantsModule (ref)
	if isNewInGameMenuEnabledModule() then
		require(modules.InGameMenuInit).openCharacterResetPage()
		
		return
	end
	local settingsHubModule = require(modules.Settings.SettingsHub)
	settingsHubModule:SetVisibility(true, false, settingsHubModule.Instance.ResetCharacterPage, true, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.GamepadResetCharacter)
end

function gamepadMenu.shouldShowChatMenuOption(p1, p2)
	-- upvalues: tenFootInterfaceModule (ref), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref)
	return if tenFootInterfaceModule:IsEnabled() then if getFFlagExpChatAlwaysRunTCS() then p2 else p2 and (p1 or textChatService.ChatVersion) == Enum.ChatVersion.TextChatService else p2
end

function gamepadMenu.getMenuActionsFromProps(p1, p2)
	-- upvalues: enumGamepadMenuOptionsModule (ref), block (ref), gamepadMenu (ref), chatIconModule (ref), enabled (ref), AR (ref), tenFootInterfaceModule (ref), fFlagMountCoreGuiBackpackModule (ref), respawn (ref), close (ref)
	local t = {}
	table.insert(t, {
		iconComponent = nil,
		localizationKey = "CoreScripts.TopBar.Menu",
		name = enumGamepadMenuOptionsModule.Menu,
		icon = block,
		onActivated = gamepadMenu.openRootMenu
	})
	
	if gamepadMenu.shouldShowChatMenuOption(p1.chatVersion, p1.chatEnabled) then
		table.insert(t, {
			icon = nil,
			localizationKey = "CoreScripts.TopBar.Chat",
			name = enumGamepadMenuOptionsModule.Chat,
			iconComponent = chatIconModule,
			onActivated = gamepadMenu.focusChatBar
		})
	end
	if enabled() then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Title.ExperienceControls",
			name = enumGamepadMenuOptionsModule.Unibar,
			icon = AR,
			onActivated = gamepadMenu.openUnibarMenu
		})
	end
	if p1.leaderboardEnabled or tenFootInterfaceModule:IsEnabled() then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Leaderboard",
			name = enumGamepadMenuOptionsModule.Leaderboard,
			icon = if p1.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOn.png" else "rbxasset://textures/ui/TopBar/leaderboardOff.png",
			onActivated = gamepadMenu.toggleLeaderboard
		})
	end
	if p1.emotesEnabled then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Emotes",
			name = enumGamepadMenuOptionsModule.Emotes,
			icon = if p1.emotesOpen then "rbxasset://textures/ui/TopBar/emotesOn.png" else "rbxasset://textures/ui/TopBar/emotesOff.png",
			onActivated = gamepadMenu.toggleEmotesMenu
		})
	end
	local _ = nil
	
	if if fFlagMountCoreGuiBackpackModule then p1.topBarEnabled and p2.mountBackpack else p1.backpackEnabled then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Inventory",
			name = enumGamepadMenuOptionsModule.Inventory,
			icon = if p1.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOn.png" else "rbxasset://textures/ui/TopBar/inventoryOff.png",
			onActivated = gamepadMenu.toggleBackpack
		})
	end
	if p1.respawnEnabled then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Respawn",
			name = enumGamepadMenuOptionsModule.Respawn,
			icon = respawn,
			onActivated = gamepadMenu.respawnCharacter
		})
	end
	table.insert(t, {
		iconComponent = nil,
		localizationKey = "CoreScripts.TopBar.Leave",
		name = enumGamepadMenuOptionsModule.Leave,
		icon = close,
		onActivated = gamepadMenu.leaveGame
	})
	
	return t
end

function gamepadMenu.getDerivedStateFromProps(p1, p2)
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), gamepadMenu (ref), cryoModule (ref)
	local var6 = if fFlagMountCoreGuiBackpackModule then gamepadMenu.getMenuActionsFromProps(p1, p2) else gamepadMenu.getMenuActionsFromProps(p1)
	local selectedIndex = p2.selectedIndex or 1
	
	if #var6 < selectedIndex then
		selectedIndex = #var6
	end
	return cryoModule.Dictionary.join(p2, { selectedIndex = selectedIndex, menuActions = var6 })
end

function gamepadMenu.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), menuHeaderModule (ref), menuCellModule (ref), fFlagTopBarSignalizeScreenSize (ref), quickMenuControllerBarModule (ref), imageSetLabel (ref), circle17 (ref), rect (ref), enabled (ref), fFlagEnableConsoleExpControls (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref)
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), menuHeaderModule (copy), p1 (ref), menuCellModule (copy), fFlagTopBarSignalizeScreenSize (copy), quickMenuControllerBarModule (copy), imageSetLabel (copy), circle17 (copy), rect (copy), enabled (copy), fFlagEnableConsoleExpControls (copy), fFlagAddMenuNavigationToggleDialog (copy), menuNavigationToggleDialogModule (copy)
		local theme = p2.Theme
		local t = {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			MenuHeader = roactModule.createElement(menuHeaderModule, { layoutOrder = 1, height = 120 })
		}
		
		for i, v in ipairs(p1.state.menuActions) do
			t[v.name] = roactModule.createElement(menuCellModule, {
				height = 56,
				layoutOrder = i + 1,
				icon = v.icon,
				iconComponent = v.iconComponent,
				localizationKey = v.localizationKey,
				hasDivider = i ~= #p1.state.menuActions,
				isSelected = i == p1.state.selectedIndex
			})
		end
		local var6 = #p1.state.menuActions * 56 + 120
		local var7 = 1
		local var8 = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize
		
		if var8.Y * 0.75 < var6 then
			var7 = var8.Y * 0.75 / var6
		end
		if var8.X * 0.75 < 336 then
			local var9 = var8.X * 0.75 / 336
			
			if var9 < var7 then
				var7 = var9
			end
		end
		if var7 < 1 then
			t.UIScale = roactModule.createElement("UIScale", { Scale = var7 })
		end
		local isGamepadMenuOpen = p1.props.isGamepadMenuOpen
		
		return roactModule.createElement("TextButton", {
			Visible = isGamepadMenuOpen,
			Text = "",
			BackgroundTransparency = theme.Overlay.Transparency,
			BackgroundColor3 = theme.Overlay.Color,
			Size = UDim2.fromScale(1, 1),
			BorderSizePixel = 0,
			ZIndex = 10,
			[roactModule.Event.Activated] = p1.overlayDismiss
		}, {
			Menu = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = circle17,
				SliceCenter = rect,
				ScaleType = Enum.ScaleType.Slice,
				ImageTransparency = theme.BackgroundUIContrast.Transparency,
				ImageColor3 = theme.BackgroundUIContrast.Color,
				Size = UDim2.fromOffset(336, var6),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, t),
			ControllerBar = if isGamepadMenuOpen then roactModule.createElement(quickMenuControllerBarModule, {
				chatMenuEnabled = p1.shouldShowChatMenuOption(p1.props.chatVersion, p1.props.chatEnabled)
			}) else nil,
			MenuNavigationToggleDialog = if enabled() or fFlagEnableConsoleExpControls or not fFlagAddMenuNavigationToggleDialog then nil else roactModule.createElement(menuNavigationToggleDialogModule, { Position = UDim2.fromScale(0.5, 0.1) })
		})
	end)
end

function gamepadMenu.didMount(p2)
	-- upvalues: VRService (ref), contextActionService (ref)
	if not VRService.VREnabled then
		contextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p2.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
	end
end

function gamepadMenu.bindMenuOpenActions(p2)
	-- upvalues: contextActionService (ref)
	p2.boundMenuOpenActions = true
	contextActionService:BindCoreAction("TopBarGamepadFreezeController", function() end, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindCoreAction("TopBarGamepadCloseMenu", p2.closeMenuAction, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("TopBarGamepadLeaveGame", p2.leaveGameMenuAction, false, Enum.KeyCode.ButtonX)
	contextActionService:BindCoreAction("TopBarGamepadRespawnAction", p2.respawnMenuAction, false, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("TopBarGamepadActivateSelection", p2.activateSelectionAction, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelection", p2.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelectionTop", p2.goToTopAction, false, Enum.KeyCode.ButtonL2)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelectionBottom", p2.goToBottomAction, false, Enum.KeyCode.ButtonR2)
	contextActionService:BindCoreAction("TopBarGamepadToggleChatVisibility", p2.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1)
	contextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p2.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
end

function gamepadMenu.unbindMenuOpenActions(p2)
	-- upvalues: contextActionService (ref)
	p2.boundMenuOpenActions = false
	contextActionService:UnbindCoreAction("TopBarGamepadFreezeController")
	contextActionService:UnbindCoreAction("TopBarGamepadCloseMenu")
	contextActionService:UnbindCoreAction("TopBarGamepadActivateSelection")
	contextActionService:UnbindCoreAction("TopBarGamepadLeaveGame")
	contextActionService:UnbindCoreAction("TopBarGamepadRespawnAction")
	contextActionService:UnbindCoreAction("TopBarGamepadMoveSelection")
	contextActionService:UnbindCoreAction("TopBarGamepadMoveSelectionTop")
	contextActionService:UnbindCoreAction("TopBarGamepadMoveSelectionBottom")
	contextActionService:UnbindCoreAction("TopBarGamepadToggleChatVisibility")
end

function gamepadMenu.unbindAllActions(p2)
	-- upvalues: contextActionService (ref)
	if p2.boundMenuOpenActions then
		p2:unbindMenuOpenActions()
	end
	contextActionService:UnbindCoreAction("TopBarGamepadToggleGamepadMenu")
end

function gamepadMenu.didUpdate(p2, p3, _)
	-- upvalues: guiService (ref), enabled (ref), gamepadMenu (ref)
	local _ = nil
	local _ = nil
	local isGamepadMenuOpen = p2.props.isGamepadMenuOpen
	
	if p3.isGamepadMenuOpen ~= p2.props.isGamepadMenuOpen then
		if isGamepadMenuOpen then
			p2:bindMenuOpenActions()
			
			if p2.state.selectedIndex ~= 1 then
				p2:setState({ selectedIndex = 1 })
			end
			p2.savedSelectedCoreObject = guiService.SelectedCoreObject
			guiService.SelectedCoreObject = nil
			p2.savedSelectedObject = guiService.SelectedObject
			guiService.SelectedObject = nil
			guiService:SetMenuIsOpen(true, "GamepadMenu")
			
			if enabled() then
				gamepadMenu.closeUnibarMenu()
				
				return
			end
		else
			p2:unbindMenuOpenActions()
			guiService:SetMenuIsOpen(false, "GamepadMenu")
		end
	end
end

function gamepadMenu.willUnmount(p2)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	p2:unbindAllActions()
	
	if fFlagTopBarSignalizeScreenSize then
		p2.disposeScreenSize()
	end
end

function gamepadMenu.logExperienceMenuGamepadExposure(p2)
	-- upvalues: fFlagExperienceMenuGamepadExposureEnabled (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagExperienceMenuGamepadExposureEnabled and not p2.loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ExperienceMenuGamepadExposureLayer)
		p2.loggedExperienceMenuGamepadExposure = true
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p2)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), VRService (ref), fFlagMountCoreGuiBackpackModule (ref)
	local topbarEnabled = p2.displayOptions.topbarEnabled
	
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p2.displayOptions.screenSize,
		chatEnabled = p2.coreGuiEnabled[Enum.CoreGuiType.Chat] and (topbarEnabled and not VRService.VREnabled),
		leaderboardEnabled = p2.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and topbarEnabled,
		emotesEnabled = p2.moreMenu.emotesEnabled and (p2.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu] and topbarEnabled),
		backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else p2.coreGuiEnabled[Enum.CoreGuiType.Backpack] and topbarEnabled,
		respawnEnabled = p2.respawn.enabled,
		topBarEnabled = if fFlagMountCoreGuiBackpackModule then topbarEnabled else nil,
		leaderboardOpen = p2.moreMenu.leaderboardOpen,
		backpackOpen = p2.moreMenu.backpackOpen,
		emotesOpen = p2.moreMenu.emotesOpen,
		menuOpen = p2.displayOptions.menuOpen,
		isGamepadMenuOpen = p2.displayOptions.isGamepadMenuOpen
	}
end, function(p2)
	-- upvalues: setGamepadMenuOpenModule (ref)
	return {
		setGamepadMenuOpen = function(value)
			-- upvalues: p2 (ref), setGamepadMenuOpenModule (copy)
			return p2(setGamepadMenuOpenModule(value))
		end
	}
end)(gamepadMenu)