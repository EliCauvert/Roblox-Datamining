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
local var20 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var21 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
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
local var35 = nil
local var36 = nil
local var37 = nil
task.spawn(function()
	-- upvalues: var35 (write), coreGuiService (ref), var36 (write), var37 (write)
	var35 = coreGuiService:WaitForChild("ToastNotification", 3)
	var36 = if var35 ~= nil then nil else var35:WaitForChild("ToastNotificationWrapper", 3)
	var37 = if var36 ~= nil then nil else var36:FindFirstChild("Toast", true)
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

function gamepadMenu.init(p0)
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), fFlagExperienceMenuGamepadExposureEnabled (ref), default (ref), enumGamepadMenuOptionsModule (ref), chatSelectorModule (ref), var37 (write), fFlagPlayerListUseFocusNavHook (ref), playerListManagerModule (ref), logGamepadOpenExperienceControlsMenu (ref), gamepadMenu (ref), guiService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	if fFlagMountCoreGuiBackpackModule then
		p0:setState({
			selectedIndex = 1,
			menuActions = {},
			mountBackpack = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
			-- upvalues: p0 (ref)
			if p1 == Enum.CoreGuiType.Backpack or p1 == Enum.CoreGuiType.All then
				p0:setState({ mountBackpack = p2 })
			end
		end)
	else
		p0:setState({ selectedIndex = 1, menuActions = {} })
	end
	if fFlagExperienceMenuGamepadExposureEnabled then
		p0.loggedExperienceMenuGamepadExposure = false
	end
	p0.boundMenuOpenActions = false
	p0.lastMenuButtonPress = 0
	
	function p0.toggleChatVisibilityAction(_, p3, _)
		-- upvalues: p0 (ref), default (copy), enumGamepadMenuOptionsModule (copy), chatSelectorModule (copy)
		if p3 == Enum.UserInputState.Begin then
			p0.toggleChatVisible()
			default.onOptionSelected({
				usedShortcut = true,
				menuOptionName = enumGamepadMenuOptionsModule.Chat,
				isToggleOpen = chatSelectorModule:GetVisibility()
			})
		end
	end
	
	function p0.toggleMenuVisibleAction(_, p4, _)
		-- upvalues: p0 (ref), var37 (copy), fFlagPlayerListUseFocusNavHook (copy), playerListManagerModule (copy), logGamepadOpenExperienceControlsMenu (copy)
		if p0.props.menuOpen then
			return Enum.ContextActionResult.Pass
		end
		local var38 = var37 ~= nil and var37.Visible
		
		if p4 == Enum.UserInputState.Begin then
			p0.lastMenuButtonPress = tick()
			
			return Enum.ContextActionResult.Pass
		elseif p4 ~= Enum.UserInputState.End or var38 and tick() - p0.lastMenuButtonPress >= 1 then
			return Enum.ContextActionResult.Pass
		end
		local var39 = not p0.props.isGamepadMenuOpen
		
		if fFlagPlayerListUseFocusNavHook and var39 and (playerListManagerModule:GetIsModal() and playerListManagerModule:GetVisibility()) then
			playerListManagerModule:SetVisibility(false)
		end
		p0.props.setGamepadMenuOpen(var39)
		logGamepadOpenExperienceControlsMenu(var39)
		p0:logExperienceMenuGamepadExposure()
		
		return Enum.ContextActionResult.Sink
	end
	
	function p0.closeMenuAction(_, p5, _)
		-- upvalues: p0 (ref)
		if p5 == Enum.UserInputState.Begin then
			p0.props.setGamepadMenuOpen(false)
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.leaveGameMenuAction(_, p6, _)
		-- upvalues: gamepadMenu (copy), p0 (ref), default (copy), enumGamepadMenuOptionsModule (copy)
		if p6 == Enum.UserInputState.Begin then
			gamepadMenu.leaveGame()
			p0.props.setGamepadMenuOpen(false)
			default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = enumGamepadMenuOptionsModule.Leave
			})
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.respawnMenuAction(_, p7, _)
		-- upvalues: gamepadMenu (copy), p0 (ref), default (copy), enumGamepadMenuOptionsModule (copy)
		if p7 == Enum.UserInputState.Begin then
			gamepadMenu.respawnCharacter()
			p0.props.setGamepadMenuOpen(false)
			default.onOptionSelected({
				usedShortcut = true,
				isToggleOpen = true,
				menuOptionName = enumGamepadMenuOptionsModule.Respawn
			})
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end
	
	p0.lastThumbStickMove = 0
	
	function p0.moveSelectionAction(_, p8, p9)
		-- upvalues: p0 (ref)
		if p8 == Enum.UserInputState.Begin then
			if p9.KeyCode == Enum.KeyCode.DPadUp then
				if p0.state.selectedIndex > 1 then
					p0:setState({ selectedIndex = p0.state.selectedIndex - 1 })
				end
				return Enum.ContextActionResult.Sink
			elseif p9.KeyCode ~= Enum.KeyCode.DPadDown then
				return Enum.ContextActionResult.Pass
			end
			if p0.state.selectedIndex < #p0.state.menuActions then
				p0:setState({ selectedIndex = p0.state.selectedIndex + 1 })
			end
			return Enum.ContextActionResult.Sink
		elseif p9.KeyCode == Enum.KeyCode.Thumbstick1 then
			if tick() - p0.lastThumbStickMove < 0.15 then
				return Enum.ContextActionResult.Pass
			elseif p9.Position.Y > 0.8 then
				if p0.state.selectedIndex > 1 then
					p0:setState({ selectedIndex = p0.state.selectedIndex - 1 })
					p0.lastThumbStickMove = tick()
				end
				return Enum.ContextActionResult.Pass
			elseif p9.Position.Y >= -0.8 then
			end
			if p0.state.selectedIndex < #p0.state.menuActions then
				p0:setState({ selectedIndex = p0.state.selectedIndex + 1 })
				p0.lastThumbStickMove = tick()
			end
			return Enum.ContextActionResult.Sink
		end
	end
	
	function p0.goToTopAction(_, p10, _)
		-- upvalues: p0 (ref)
		if p10 == Enum.UserInputState.Begin then
			p0:setState({ selectedIndex = 1 })
			
			return
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.goToBottomAction(_, p11, _)
		-- upvalues: p0 (ref)
		if p11 == Enum.UserInputState.Begin then
			p0:setState({ selectedIndex = #p0.state.menuActions })
			
			return
		end
		return Enum.ContextActionResult.Pass
	end
	
	function p0.activateSelectionAction(_, p12, _)
		-- upvalues: p0 (ref), guiService (copy), enumGamepadMenuOptionsModule (copy), playerListManagerModule (copy), default (copy)
		if p12 == Enum.UserInputState.Begin then
			local selectedIndex = p0.state.menuActions[p0.state.selectedIndex]
			p0.props.setGamepadMenuOpen(false)
			guiService:SetMenuIsOpen(false, "GamepadMenu")
			selectedIndex.onActivated()
			
			local function _(p13)
				-- upvalues: enumGamepadMenuOptionsModule (copy), playerListManagerModule (copy)
				return if p13 == enumGamepadMenuOptionsModule.Leaderboard then playerListManagerModule:GetSetVisible() else true
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
		-- upvalues: p0 (ref)
		p0.props.setGamepadMenuOpen(false)
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p14)
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p14) })
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
	-- upvalues: fFlagEnableNewBackpack (ref), var20 (ref), var21 (ref)
	if fFlagEnableNewBackpack then
		var20.toggleVisibility(var20.FeatureName.Backpack)
		
		return
	end
	var21:OpenClose()
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

function gamepadMenu.shouldShowChatMenuOption(p15, p16)
	-- upvalues: tenFootInterfaceModule (ref), textChatService (ref), getFFlagExpChatAlwaysRunTCS (ref)
	return if tenFootInterfaceModule:IsEnabled() then if getFFlagExpChatAlwaysRunTCS() then p16 else p16 and (p15 or textChatService.ChatVersion) == Enum.ChatVersion.TextChatService else p16
end

function gamepadMenu.getMenuActionsFromProps(p17, p18)
	-- upvalues: enumGamepadMenuOptionsModule (ref), block (ref), gamepadMenu (ref), chatIconModule (ref), enabled (ref), AR (ref), tenFootInterfaceModule (ref), fFlagMountCoreGuiBackpackModule (ref), respawn (ref), close (ref)
	local t = {}
	table.insert(t, {
		iconComponent = nil,
		localizationKey = "CoreScripts.TopBar.Menu",
		name = enumGamepadMenuOptionsModule.Menu,
		icon = block,
		onActivated = gamepadMenu.openRootMenu
	})
	
	if gamepadMenu.shouldShowChatMenuOption(p17.chatVersion, p17.chatEnabled) then
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
	if p17.leaderboardEnabled or tenFootInterfaceModule:IsEnabled() then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Leaderboard",
			name = enumGamepadMenuOptionsModule.Leaderboard,
			icon = if p17.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOn.png" else "rbxasset://textures/ui/TopBar/leaderboardOff.png",
			onActivated = gamepadMenu.toggleLeaderboard
		})
	end
	if p17.emotesEnabled then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Emotes",
			name = enumGamepadMenuOptionsModule.Emotes,
			icon = if p17.emotesOpen then "rbxasset://textures/ui/TopBar/emotesOn.png" else "rbxasset://textures/ui/TopBar/emotesOff.png",
			onActivated = gamepadMenu.toggleEmotesMenu
		})
	end
	local _ = nil
	
	if if fFlagMountCoreGuiBackpackModule then p17.topBarEnabled and p18.mountBackpack else p17.backpackEnabled then
		table.insert(t, {
			iconComponent = nil,
			localizationKey = "CoreScripts.TopBar.Inventory",
			name = enumGamepadMenuOptionsModule.Inventory,
			icon = if p17.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOn.png" else "rbxasset://textures/ui/TopBar/inventoryOff.png",
			onActivated = gamepadMenu.toggleBackpack
		})
	end
	if p17.respawnEnabled then
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

function gamepadMenu.getDerivedStateFromProps(p19, p20)
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), gamepadMenu (ref), cryoModule (ref)
	local var43 = if fFlagMountCoreGuiBackpackModule then gamepadMenu.getMenuActionsFromProps(p19, p20) else gamepadMenu.getMenuActionsFromProps(p19)
	local selectedIndex = p20.selectedIndex or 1
	
	if #var43 < selectedIndex then
		selectedIndex = #var43
	end
	return cryoModule.Dictionary.join(p20, { selectedIndex = selectedIndex, menuActions = var43 })
end

function gamepadMenu.render(p21)
	-- upvalues: withStyle (ref), roactModule (ref), menuHeaderModule (ref), menuCellModule (ref), fFlagTopBarSignalizeScreenSize (ref), quickMenuControllerBarModule (ref), imageSetLabel (ref), circle17 (ref), rect (ref), enabled (ref), fFlagEnableConsoleExpControls (ref), fFlagAddMenuNavigationToggleDialog (ref), menuNavigationToggleDialogModule (ref)
	return withStyle(function(p22)
		-- upvalues: roactModule (copy), menuHeaderModule (copy), p21 (ref), menuCellModule (copy), fFlagTopBarSignalizeScreenSize (copy), quickMenuControllerBarModule (copy), imageSetLabel (copy), circle17 (copy), rect (copy), enabled (copy), fFlagEnableConsoleExpControls (copy), fFlagAddMenuNavigationToggleDialog (copy), menuNavigationToggleDialogModule (copy)
		local theme = p22.Theme
		local t = {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			MenuHeader = roactModule.createElement(menuHeaderModule, { layoutOrder = 1, height = 120 })
		}
		
		for i, v in ipairs(p21.state.menuActions) do
			t[v.name] = roactModule.createElement(menuCellModule, {
				height = 56,
				layoutOrder = i + 1,
				icon = v.icon,
				iconComponent = v.iconComponent,
				localizationKey = v.localizationKey,
				hasDivider = i ~= #p21.state.menuActions,
				isSelected = i == p21.state.selectedIndex
			})
		end
		local var46 = #p21.state.menuActions * 56 + 120
		local var47 = 1
		local var48 = if fFlagTopBarSignalizeScreenSize then p21.state.screenSize else p21.props.screenSize
		
		if var48.Y * 0.75 < var46 then
			var47 = var48.Y * 0.75 / var46
		end
		if var48.X * 0.75 < 336 then
			local var49 = var48.X * 0.75 / 336
			
			if var49 < var47 then
				var47 = var49
			end
		end
		if var47 < 1 then
			t.UIScale = roactModule.createElement("UIScale", { Scale = var47 })
		end
		local isGamepadMenuOpen = p21.props.isGamepadMenuOpen
		
		return roactModule.createElement("TextButton", {
			Visible = isGamepadMenuOpen,
			Text = "",
			BackgroundTransparency = theme.Overlay.Transparency,
			BackgroundColor3 = theme.Overlay.Color,
			Size = UDim2.fromScale(1, 1),
			BorderSizePixel = 0,
			ZIndex = 10,
			[roactModule.Event.Activated] = p21.overlayDismiss
		}, {
			Menu = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = circle17,
				SliceCenter = rect,
				ScaleType = Enum.ScaleType.Slice,
				ImageTransparency = theme.BackgroundUIContrast.Transparency,
				ImageColor3 = theme.BackgroundUIContrast.Color,
				Size = UDim2.fromOffset(336, var46),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, t),
			ControllerBar = if isGamepadMenuOpen then roactModule.createElement(quickMenuControllerBarModule, {
				chatMenuEnabled = p21.shouldShowChatMenuOption(p21.props.chatVersion, p21.props.chatEnabled)
			}) else nil,
			MenuNavigationToggleDialog = if enabled() or fFlagEnableConsoleExpControls or not fFlagAddMenuNavigationToggleDialog then nil else roactModule.createElement(menuNavigationToggleDialogModule, { Position = UDim2.fromScale(0.5, 0.1) })
		})
	end)
end

function gamepadMenu.didMount(p23)
	-- upvalues: VRService (ref), contextActionService (ref)
	if not VRService.VREnabled then
		contextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p23.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
	end
end

function gamepadMenu.bindMenuOpenActions(p24)
	-- upvalues: contextActionService (ref)
	p24.boundMenuOpenActions = true
	contextActionService:BindCoreAction("TopBarGamepadFreezeController", function() end, false, Enum.UserInputType.Gamepad1)
	contextActionService:BindCoreAction("TopBarGamepadCloseMenu", p24.closeMenuAction, false, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("TopBarGamepadLeaveGame", p24.leaveGameMenuAction, false, Enum.KeyCode.ButtonX)
	contextActionService:BindCoreAction("TopBarGamepadRespawnAction", p24.respawnMenuAction, false, Enum.KeyCode.ButtonY)
	contextActionService:BindCoreAction("TopBarGamepadActivateSelection", p24.activateSelectionAction, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelection", p24.moveSelectionAction, false, Enum.KeyCode.Thumbstick1, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelectionTop", p24.goToTopAction, false, Enum.KeyCode.ButtonL2)
	contextActionService:BindCoreAction("TopBarGamepadMoveSelectionBottom", p24.goToBottomAction, false, Enum.KeyCode.ButtonR2)
	contextActionService:BindCoreAction("TopBarGamepadToggleChatVisibility", p24.toggleChatVisibilityAction, false, Enum.KeyCode.ButtonR1)
	contextActionService:BindCoreAction("TopBarGamepadToggleGamepadMenu", p24.toggleMenuVisibleAction, false, Enum.KeyCode.ButtonStart)
end

function gamepadMenu.unbindMenuOpenActions(p25)
	-- upvalues: contextActionService (ref)
	p25.boundMenuOpenActions = false
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

function gamepadMenu.unbindAllActions(p26)
	-- upvalues: contextActionService (ref)
	if p26.boundMenuOpenActions then
		p26:unbindMenuOpenActions()
	end
	contextActionService:UnbindCoreAction("TopBarGamepadToggleGamepadMenu")
end

function gamepadMenu.didUpdate(p27, p28, _)
	-- upvalues: guiService (ref), enabled (ref), gamepadMenu (ref)
	local _ = nil
	local _ = nil
	local isGamepadMenuOpen = p27.props.isGamepadMenuOpen
	
	if p28.isGamepadMenuOpen ~= p27.props.isGamepadMenuOpen then
		if isGamepadMenuOpen then
			p27:bindMenuOpenActions()
			
			if p27.state.selectedIndex ~= 1 then
				p27:setState({ selectedIndex = 1 })
			end
			p27.savedSelectedCoreObject = guiService.SelectedCoreObject
			guiService.SelectedCoreObject = nil
			p27.savedSelectedObject = guiService.SelectedObject
			guiService.SelectedObject = nil
			guiService:SetMenuIsOpen(true, "GamepadMenu")
			
			if enabled() then
				gamepadMenu.closeUnibarMenu()
				
				return
			end
		else
			p27:unbindMenuOpenActions()
			guiService:SetMenuIsOpen(false, "GamepadMenu")
		end
	end
end

function gamepadMenu.willUnmount(p29)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	p29:unbindAllActions()
	
	if fFlagTopBarSignalizeScreenSize then
		p29.disposeScreenSize()
	end
end

function gamepadMenu.logExperienceMenuGamepadExposure(p30)
	-- upvalues: fFlagExperienceMenuGamepadExposureEnabled (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagExperienceMenuGamepadExposureEnabled and not p30.loggedExperienceMenuGamepadExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ExperienceMenuGamepadExposureLayer)
		p30.loggedExperienceMenuGamepadExposure = true
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p31)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), VRService (ref), fFlagMountCoreGuiBackpackModule (ref)
	local topbarEnabled = p31.displayOptions.topbarEnabled
	
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p31.displayOptions.screenSize,
		chatEnabled = p31.coreGuiEnabled[Enum.CoreGuiType.Chat] and (topbarEnabled and not VRService.VREnabled),
		leaderboardEnabled = p31.coreGuiEnabled[Enum.CoreGuiType.PlayerList] and topbarEnabled,
		emotesEnabled = p31.moreMenu.emotesEnabled and (p31.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu] and topbarEnabled),
		backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else p31.coreGuiEnabled[Enum.CoreGuiType.Backpack] and topbarEnabled,
		respawnEnabled = p31.respawn.enabled,
		topBarEnabled = if fFlagMountCoreGuiBackpackModule then topbarEnabled else nil,
		leaderboardOpen = p31.moreMenu.leaderboardOpen,
		backpackOpen = p31.moreMenu.backpackOpen,
		emotesOpen = p31.moreMenu.emotesOpen,
		menuOpen = p31.displayOptions.menuOpen,
		isGamepadMenuOpen = p31.displayOptions.isGamepadMenuOpen
	}
end, function(p32)
	-- upvalues: setGamepadMenuOpenModule (ref)
	return {
		setGamepadMenuOpen = function(value)
			-- upvalues: p32 (ref), setGamepadMenuOpenModule (copy)
			return p32(setGamepadMenuOpenModule(value))
		end
	}
end)(gamepadMenu)