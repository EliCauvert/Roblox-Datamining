local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagEnableMenuTrailingBadge = sharedFlagsModule.FFlagEnableMenuTrailingBadge
local avatarSwitcherHamburgerExposure = game:DefineFastFlag("AvatarSwitcherHamburgerExposure", false)
local avatarSwitcherIXPLayer = game:DefineFastString("AvatarSwitcherIXPLayer", "UIEcosystem.User.Migration")
local fFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local var9 = if fFlagEnableConsoleExpControls then require(corePackagesService.Workspace.Packages.InputUi).Gamepad.GamepadUtils else nil
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local interactable = UIBloxModule.Core.Control.Interactable
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local scrollBarType = UIBloxModule.App.Container.Enum.ScrollBarType
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local foundationModule = require(corePackagesService.Packages.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local serviceModule = require(chromeShared.Service)
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local constantsModule = require(chromeShared.Unibar.Constants)
local var16 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local subMenuContextModule = require(chromeShared.Unibar.SubMenuContext)
local var18 = if fFlagEnableMenuTrailingBadge then require(chromeShared.Unibar.MenuTrailingBadge) else nil
local unibarStyle = chromeModule.UnibarStyle
local userInputService = game:GetService("UserInputService")
local useChromeMenuItemsModule = require(chromeShared.Hooks.useChromeMenuItems)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local useTopbarInsetHeightModule = require(chromeShared.Hooks.useTopbarInsetHeight)
local useMappedObservableValueModule = require(chromeShared.Hooks.useMappedObservableValue)
local fixChromeIntegrationLayoutBug = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local var25 = if isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.VrSpatialUi).UIManager else nil
local iconHostModule = require(chromeShared.Unibar.ComponentHosts.IconHost)
local roundedSlot = foundationModule.Enums.CursorType.RoundedSlot
local vector2 = Vector2.new(0, 0)
local _ = { Closed = 0, Open = 1 }
local t = {}
local var29 = nil

function MenuRow(p0) --[[ line: 86 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), subMenuContextModule (ref), fFlagEnableConsoleExpControls (ref), var16 (ref), controlState (ref), fFlagEnableMenuTrailingBadge (ref), serviceModule (ref), guiService (ref), styledTextLabel (ref), iconHostModule (ref), var18 (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), var25 (write), interactable (ref), useCursor (ref), roundedSlot (ref), fixChromeIntegrationLayoutBug (ref)
	local ICON_SIZE, SUB_MENU_ROW_HEIGHT, SUBMENU_PADDING_LEFT, SUBMENU_PADDING_RIGHT, SUBMENU_ROW_LABEL_FONT, SUBMENU_ROW_PADDING, SUBMENU_ROW_CORNER_RADIUS
	local _ = nil
	local theme = useStyle().Theme
	local t = { Transparency = 1, Color = Color3.new(0, 0, 0) }
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var31 = unibarStyle.use()
		ICON_SIZE = var31.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = var31.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = var31.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = var31.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = var31.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = var31.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = var31.SUBMENU_ROW_CORNER_RADIUS
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = constantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = constantsModule.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = constantsModule.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = constantsModule.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = constantsModule.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = constantsModule.SUBMENU_ROW_CORNER_RADIUS
	end
	local var32 = reactModule.useContext(subMenuContextModule)
	local var33 = if fFlagEnableConsoleExpControls then reactModule.useContext(var16) else nil
	local var34, var35 = reactModule.useBinding(t)
	local var36 = reactModule.useCallback(function(_, p1) --[[ line: 125 ]]
		-- upvalues: controlState (copy), var35 (ref), theme (ref), t (ref)
		if p1 == controlState.Pressed then
			var35(theme.BackgroundOnPress)
			
			return
		elseif p1 == controlState.Hover then
			var35(theme.BackgroundOnHover)
			
			return
		end
		var35(t)
	end)
	local var37 = if fFlagEnableMenuTrailingBadge then p0.integration.menuTrailingBadgeConfig else nil
	local var38 = reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), guiService (copy), p0 (ref)
		if fFlagEnableConsoleExpControls then
			serviceModule:disableFocusNav()
			guiService.SelectedCoreObject = nil
			serviceModule:setShortcutBar(nil)
			serviceModule:selectedItem():set(nil)
			p0.activated()
			
			return
		end
		p0.activated()
	end, { p0.id })
	local var39 = reactModule.createElement(styledTextLabel, {
		lineHeight = 1,
		fluidSizing = true,
		richText = true,
		size = if fFlagEnableMenuTrailingBadge then UDim2.fromScale(1, 1) else UDim2.new(1, (-ICON_SIZE) - SUBMENU_PADDING_LEFT - SUBMENU_PADDING_RIGHT, 1, 0),
		fontStyle = SUBMENU_ROW_LABEL_FONT,
		colorStyle = if var32 then {
			Color = theme.TextEmphasis.Color,
			Transparency = var32:map(function(p2) --[[ line: 161 ]]
				return 1 - p2
			end)
		} else theme.TextEmphasis,
		text = p0.integration.label,
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Left
	})
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SUBMENU_PADDING_LEFT),
			PaddingRight = UDim.new(0, SUBMENU_PADDING_RIGHT)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, SUBMENU_ROW_PADDING)
		}),
		IconHost = reactModule.createElement(iconHostModule, { disableButtonBehaviors = true, integration = p0 }),
		Label = if fFlagEnableMenuTrailingBadge then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1)
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			StyledTextLabel = var39
		}) else var39,
		TrailingBadge = if fFlagEnableMenuTrailingBadge and var37 then reactModule.createElement(var18, { integrationId = p0.integration.id, config = var37 }) else nil
	})
	
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 0, SUB_MENU_ROW_HEIGHT * (if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then var25.getInstance():getAdditionalCameraScaleIfNeeded() else 1)),
		BorderSizePixel = 0,
		BackgroundTransparency = var34:map(function(p3) --[[ line: 225 ]]
			return p3.Transparency
		end),
		BackgroundColor3 = var34:map(function(p4) --[[ line: 228 ]]
			return p4.Color
		end),
		SelectionImageObject = useCursor(roundedSlot),
		[reactModule.Event.Activated] = var38,
		LayoutOrder = p0.order,
		onStateChanged = var36,
		NextSelectionLeft = if fFlagEnableConsoleExpControls then var33.menuIconRef else nil
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENU_ROW_CORNER_RADIUS) }),
		RowLabel = if fixChromeIntegrationLayoutBug then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p0.order
		}, { createElement }) else createElement
	})
end

function isLeft(p5) --[[ line: 253 ]]
	return p5 == Enum.HorizontalAlignment.Left
end

function SubMenu(p6) --[[ line: 257 ]]
	-- upvalues: useStyle (ref), reactModule (ref), useObservableValueModule (ref), viewportUtilModule (ref), useTopbarInsetHeightModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), guiService (ref), serviceModule (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), var9 (ref), avatarSwitcherHamburgerExposure (ref), IXPServiceWrapper (ref), avatarSwitcherIXPLayer (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), var25 (write), isSpatial (ref), userGameSettingsService (ref), useMappedObservableValueModule (ref), verticalScrollView (ref), scrollBarType (ref)
	local UNIBAR_LEFT_MARGIN, ICON_CELL_WIDTH, UNIBAR_END_PADDING, SUB_MENU_ROW_HEIGHT, SUBMENU_CORNER_RADIUS, SUBMENU_BOTTOM_PADDING
	local var40 = useStyle()
	local _ = nil
	local theme = var40.Theme
	local var41 = reactModule.useRef(nil)
	local var42 = useObservableValueModule(viewportUtilModule.screenSize)
	local var43 = useTopbarInsetHeightModule()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var44 = unibarStyle.use()
		UNIBAR_LEFT_MARGIN = var44.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = var44.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = var44.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = var44.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = var44.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = var44.SUBMENU_BOTTOM_PADDING
	else
		UNIBAR_LEFT_MARGIN = constantsModule.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = constantsModule.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = constantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = constantsModule.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = constantsModule.SUBMENU_BOTTOM_PADDING
	end
	local var45 = SUB_MENU_ROW_HEIGHT * 0.5
	reactModule.useEffect(function() --[[ line: 287 ]]
		-- upvalues: var41 (ref), guiService (copy), serviceModule (copy), fFlagEnableConsoleExpControls (copy), userInputService (copy), var9 (copy)
		local function _() --[[ line: 288 | named "moveLeft" ]]
			-- upvalues: var41 (copy), guiService (copy), serviceModule (copy)
			if var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject) then
				serviceModule:setSelectedByOffset(-1)
			end
		end
		
		local _ = function() --[[ line: 295 | named "moveRight" ]]
			-- upvalues: var41 (copy), guiService (copy), serviceModule (copy)
			if var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject) then
				serviceModule:setSelectedByOffset(1)
			end
		end
		
		local var55 = if fFlagEnableConsoleExpControls then userInputService.InputChanged:Connect(function(_) --[[ line: 306 ]]
			-- upvalues: userInputService (copy), var9 (copy), var41 (copy), guiService (copy), serviceModule (copy)
			for i, v in userInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
				if v.KeyCode == Enum.KeyCode.Thumbstick1 then
					local x = var9.normalizeStickByDeadzone(Vector2.new(v.Position.X, v.Position.Y)).X
					
					if x < -0.5 then
						if var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject) then
							serviceModule:setSelectedByOffset(-1)
						end
					elseif x > 0.5 and (var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject)) then
						serviceModule:setSelectedByOffset(1)
					end
				end
			end
		end) else nil
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p7) --[[ line: 328 ]]
			-- upvalues: var41 (copy), guiService (copy), serviceModule (copy)
			local keyCode = p7.KeyCode
			
			if keyCode == Enum.KeyCode.Left or keyCode == Enum.KeyCode.DPadLeft then
				if var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject) then
					serviceModule:setSelectedByOffset(-1)
					
					return
				end
			elseif (keyCode == Enum.KeyCode.Right or keyCode == Enum.KeyCode.DPadRight) and (var41.current and var41.current:IsAncestorOf(guiService.SelectedCoreObject)) then
				serviceModule:setSelectedByOffset(1)
			end
		end)
		
		return function() --[[ line: 337 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), var55 (write), inputBeganConnection (ref)
			if fFlagEnableConsoleExpControls then
				var55:Disconnect()
			end
			inputBeganConnection:Disconnect()
		end
	end, {})
	
	if avatarSwitcherHamburgerExposure then
		reactModule.useEffect(function() --[[ line: 347 ]]
			-- upvalues: IXPServiceWrapper (copy), avatarSwitcherIXPLayer (copy)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(avatarSwitcherIXPLayer)
		end, {})
	end
	local var46 = var43 + ICON_CELL_WIDTH
	local var47 = if p6 and p6.items then SUB_MENU_ROW_HEIGHT * #p6.items else 0
	local var48 = var47 * (if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then var25.getInstance():getAdditionalCameraScaleIfNeeded() else 1)
	local var49 = if p6.panelSize then p6.panelSize.Y else var48
	local var50 = isInExperienceUIVREnabled and isSpatial()
	local var51 = if var50 then math.min(var48, var49) else math.min(var42.Y - var46, var47)
	
	if not var50 and var42.Y - var46 < var47 then
		local floored = math.floor((var42.Y - var46) / SUB_MENU_ROW_HEIGHT)
		var51 = if SUB_MENU_ROW_HEIGHT * floored + var45 <= var42.Y - var46 then SUB_MENU_ROW_HEIGHT * floored + var45 else SUB_MENU_ROW_HEIGHT * floored - var45
	end
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = if userGameSettingsService.ReducedMotion or not p6.menuTransition then Vector2.new(0, var51) else p6.menuTransition:map(function(p8) --[[ line: 384 ]]
				-- upvalues: var51 (write)
				return Vector2.new(0, var51 * p8)
			end)
		}),
		BottomPadding = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 10000,
			Size = UDim2.new(0, 0, 0, SUBMENU_BOTTOM_PADDING)
		})
	}
	
	for i, v in p6.items do
		t[v.id] = reactModule.createElement(MenuRow, v)
	end
	local var54 = var40.Theme.BackgroundUIContrast.Transparency * var40.Settings.PreferredTransparency
	
	return reactModule.createElement("Frame", {
		Size = if var50 then UDim2.new(1, 0, 0, if var50 then math.min(var48, var49) else var48) else UDim2.new(0, ICON_CELL_WIDTH * 4 + UNIBAR_LEFT_MARGIN + UNIBAR_END_PADDING * 2, 0, 0),
		AnchorPoint = if var50 then Vector2.new(0, 1) elseif useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft) then Vector2.zero else Vector2.new(1, 0),
		Position = if var50 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, (-var43) - 2 + UNIBAR_LEFT_MARGIN, 0, 0),
		BackgroundColor3 = theme.BackgroundUIContrast.Color,
		BackgroundTransparency = if p6.menuTransition then p6.menuTransition:map(function(p9) --[[ line: 424 ]]
			-- upvalues: var54 (ref)
			return var54 + (1 - var54) * (1 - p9)
		end) else var54,
		AutomaticSize = if var50 then nil else Enum.AutomaticSize.Y,
		ref = var41,
		SelectionGroup = if fFlagEnableConsoleExpControls then true else nil,
		SelectionBehaviorDown = if fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENU_CORNER_RADIUS) }),
		ScrollingFrame = reactModule.createElement(verticalScrollView, {
			selectable = false,
			size = UDim2.new(1, 0, 1, 0),
			canvasSizeY = UDim.new(0, if var50 then var48 else var47),
			scrollBarType = scrollBarType.Compact
		}, t)
	})
end

return function(p10) --[[ line: 450 ]]
	-- upvalues: reactModule (ref), useObservableValueModule (ref), serviceModule (ref), useChromeMenuItemsModule (ref), reactOtterModule (ref), t (write), var29 (write), constantsModule (ref), userInputService (ref), vector2 (write), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), fFlagUnibarMenuOpenSubmenu (ref), subMenuContextModule (ref)
	local t_1 = {}
	local var58 = reactModule.useRef(nil)
	local var59 = reactModule.useRef(nil)
	local var60 = reactModule.useRef(nil)
	local var61 = useObservableValueModule(serviceModule:currentSubMenu())
	local _, var62 = reactModule.useState(0)
	local var63 = useChromeMenuItemsModule()
	local t_2 = {}
	local var65, var66 = reactOtterModule.useAnimatedBinding(0, function(p11) --[[ line: 463 ]]
		-- upvalues: var62 (ref)
		var62(p11)
	end)
	reactModule.useEffect(function() --[[ line: 468 ]]
		-- upvalues: t (copy), t_2 (write), var29 (copy), var61 (ref), var62 (ref), var66 (ref), reactOtterModule (copy), constantsModule (copy), var60 (ref), userInputService (copy), vector2 (copy), var59 (ref), serviceModule (copy), var58 (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), inExperienceUIVRIXP (copy)
		t = t_2
		var29 = var61
		
		if var61 then
			var62(0)
			var66(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
			var60.current = userInputService.TouchStarted:Connect(function(p12) --[[ line: 476 ]]
				-- upvalues: vector2 (copy)
				vector2 = Vector2.new(p12.Position.X, p12.Position.Y)
			end)
			var59.current = userInputService.TouchTap:Connect(function(p13) --[[ line: 480 ]]
				-- upvalues: vector2 (copy), serviceModule (copy)
				if p13[1] - vector2 ~= Vector2.zero then return end
				local var67 = serviceModule:currentSubMenu():get()
				
				if var67 then
					serviceModule:toggleSubMenu(var67)
				end
			end)
			var58.current = userInputService.InputEnded:Connect(function(p14, _) --[[ line: 491 ]]
				-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), inExperienceUIVRIXP (copy), serviceModule (copy)
				if isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then return end
				local var68 = serviceModule:currentSubMenu():get()
				
				if var68 and p14.UserInputType == Enum.UserInputType.MouseButton1 then
					serviceModule:toggleSubMenu(var68)
				end
			end)
		else
			var62(1)
			var66(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
		end
		return function() --[[ line: 512 ]]
			-- upvalues: var58 (copy), var59 (copy), var60 (copy)
			if var58.current then
				var58.current:Disconnect()
				var58.current = nil
			end
			if var59.current then
				var59.current:Disconnect()
				var59.current = nil
			end
			if var60.current then
				var60.current:Disconnect()
				var60.current = nil
			end
		end
	end, { var61 })
	
	if var61 and var63 then
		for i, v in var63 do
			if var61 == v.id then
				t_2 = v.children
				break
			end
		end
	end
	if #t_2 > 0 then
		t_1[var61] = reactModule.createElement(SubMenu, {
			items = t_2,
			menuTransition = var65,
			panelSize = p10.panelSize
		})
	elseif #t > 0 then
		t_1[var29] = reactModule.createElement(SubMenu, {
			items = t,
			menuTransition = var65,
			panelSize = p10.panelSize
		})
	end
	return reactModule.createElement("Frame", {
		Name = "SubMenuHost",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = if isInExperienceUIVREnabled and isSpatial() then UDim2.new(1, 0, 1, 0) else UDim2.new(0, 0, 1, 0),
		ref = if fFlagUnibarMenuOpenSubmenu then p10.subMenuHostRef else nil
	}, reactModule.createElement(subMenuContextModule.Provider, { value = var65 }, t_1))
end