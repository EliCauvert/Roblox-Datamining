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
local var1 = if fFlagEnableConsoleExpControls then require(corePackagesService.Workspace.Packages.InputUi).Gamepad.GamepadUtils else nil
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
local var2 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local subMenuContextModule = require(chromeShared.Unibar.SubMenuContext)
local var3 = if fFlagEnableMenuTrailingBadge then require(chromeShared.Unibar.MenuTrailingBadge) else nil
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
local var4 = if isInExperienceUIVREnabled then require(corePackagesService.Workspace.Packages.VrSpatialUi).UIManager else nil
local iconHostModule = require(chromeShared.Unibar.ComponentHosts.IconHost)
local roundedSlot = foundationModule.Enums.CursorType.RoundedSlot
local vector2 = Vector2.new(0, 0)
local _ = { Closed = 0, Open = 1 }
local t = {}
local var5 = nil

function MenuRow(p1)
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), subMenuContextModule (ref), fFlagEnableConsoleExpControls (ref), var2 (ref), controlState (ref), fFlagEnableMenuTrailingBadge (ref), serviceModule (ref), guiService (ref), styledTextLabel (ref), iconHostModule (ref), var3 (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), var4 (write), interactable (ref), useCursor (ref), roundedSlot (ref), fixChromeIntegrationLayoutBug (ref)
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
		local var6 = unibarStyle.use()
		ICON_SIZE = var6.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = var6.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = var6.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = var6.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = var6.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = var6.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = var6.SUBMENU_ROW_CORNER_RADIUS
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		SUB_MENU_ROW_HEIGHT = constantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENU_PADDING_LEFT = constantsModule.SUBMENU_PADDING_LEFT
		SUBMENU_PADDING_RIGHT = constantsModule.SUBMENU_PADDING_RIGHT
		SUBMENU_ROW_LABEL_FONT = constantsModule.SUBMENU_ROW_LABEL_FONT
		SUBMENU_ROW_PADDING = constantsModule.SUBMENU_ROW_PADDING
		SUBMENU_ROW_CORNER_RADIUS = constantsModule.SUBMENU_ROW_CORNER_RADIUS
	end
	local var7 = reactModule.useContext(subMenuContextModule)
	local var8 = if fFlagEnableConsoleExpControls then reactModule.useContext(var2) else nil
	local var9, var10 = reactModule.useBinding(t)
	local var11 = reactModule.useCallback(function(_, p2)
		-- upvalues: controlState (copy), var10 (ref), theme (ref), t (ref)
		if p2 == controlState.Pressed then
			var10(theme.BackgroundOnPress)
			
			return
		elseif p2 == controlState.Hover then
			var10(theme.BackgroundOnHover)
			
			return
		end
		var10(t)
	end)
	local var12 = if fFlagEnableMenuTrailingBadge then p1.integration.menuTrailingBadgeConfig else nil
	local var13 = reactModule.useCallback(function()
		-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), guiService (copy), p1 (ref)
		if fFlagEnableConsoleExpControls then
			serviceModule:disableFocusNav()
			guiService.SelectedCoreObject = nil
			serviceModule:setShortcutBar(nil)
			serviceModule:selectedItem():set(nil)
			p1.activated()
			
			return
		end
		p1.activated()
	end, { p1.id })
	local var14 = reactModule.createElement(styledTextLabel, {
		lineHeight = 1,
		fluidSizing = true,
		richText = true,
		size = if fFlagEnableMenuTrailingBadge then UDim2.fromScale(1, 1) else UDim2.new(1, (-ICON_SIZE) - SUBMENU_PADDING_LEFT - SUBMENU_PADDING_RIGHT, 1, 0),
		fontStyle = SUBMENU_ROW_LABEL_FONT,
		colorStyle = if var7 then {
			Color = theme.TextEmphasis.Color,
			Transparency = var7:map(function(p2)
				return 1 - p2
			end)
		} else theme.TextEmphasis,
		text = p1.integration.label,
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
		IconHost = reactModule.createElement(iconHostModule, { disableButtonBehaviors = true, integration = p1 }),
		Label = if fFlagEnableMenuTrailingBadge then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1)
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			StyledTextLabel = var14
		}) else var14,
		TrailingBadge = if fFlagEnableMenuTrailingBadge and var12 then reactModule.createElement(var3, { integrationId = p1.integration.id, config = var12 }) else nil
	})
	
	return reactModule.createElement(interactable, {
		Size = UDim2.new(1, 0, 0, SUB_MENU_ROW_HEIGHT * (if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then var4.getInstance():getAdditionalCameraScaleIfNeeded() else 1)),
		BorderSizePixel = 0,
		BackgroundTransparency = var9:map(function(p2)
			return p2.Transparency
		end),
		BackgroundColor3 = var9:map(function(p2)
			return p2.Color
		end),
		SelectionImageObject = useCursor(roundedSlot),
		[reactModule.Event.Activated] = var13,
		LayoutOrder = p1.order,
		onStateChanged = var11,
		NextSelectionLeft = if fFlagEnableConsoleExpControls then var8.menuIconRef else nil
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENU_ROW_CORNER_RADIUS) }),
		RowLabel = if fixChromeIntegrationLayoutBug then reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p1.order
		}, { createElement }) else createElement
	})
end

function isLeft(p1)
	return p1 == Enum.HorizontalAlignment.Left
end

function SubMenu(p1)
	-- upvalues: useStyle (ref), reactModule (ref), useObservableValueModule (ref), viewportUtilModule (ref), useTopbarInsetHeightModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), guiService (ref), serviceModule (ref), fFlagEnableConsoleExpControls (ref), userInputService (ref), var1 (ref), avatarSwitcherHamburgerExposure (ref), IXPServiceWrapper (ref), avatarSwitcherIXPLayer (ref), isInExperienceUIVREnabled (ref), inExperienceUIVRIXP (ref), var4 (write), isSpatial (ref), userGameSettingsService (ref), useMappedObservableValueModule (ref), verticalScrollView (ref), scrollBarType (ref)
	local UNIBAR_LEFT_MARGIN, ICON_CELL_WIDTH, UNIBAR_END_PADDING, SUB_MENU_ROW_HEIGHT, SUBMENU_CORNER_RADIUS, SUBMENU_BOTTOM_PADDING
	local var6 = useStyle()
	local _ = nil
	local theme = var6.Theme
	local var7 = reactModule.useRef(nil)
	local var8 = useObservableValueModule(viewportUtilModule.screenSize)
	local var9 = useTopbarInsetHeightModule()
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var10 = unibarStyle.use()
		UNIBAR_LEFT_MARGIN = var10.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = var10.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = var10.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = var10.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = var10.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = var10.SUBMENU_BOTTOM_PADDING
	else
		UNIBAR_LEFT_MARGIN = constantsModule.UNIBAR_LEFT_MARGIN
		ICON_CELL_WIDTH = constantsModule.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
		SUB_MENU_ROW_HEIGHT = constantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENU_CORNER_RADIUS = constantsModule.SUBMENU_CORNER_RADIUS
		SUBMENU_BOTTOM_PADDING = constantsModule.SUBMENU_BOTTOM_PADDING
	end
	local var11 = SUB_MENU_ROW_HEIGHT * 0.5
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), guiService (copy), serviceModule (copy), fFlagEnableConsoleExpControls (copy), userInputService (copy), var1 (copy)
		local function _()
			-- upvalues: var7 (copy), guiService (copy), serviceModule (copy)
			if var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject) then
				serviceModule:setSelectedByOffset(-1)
			end
		end
		
		local _ = function()
			-- upvalues: var7 (copy), guiService (copy), serviceModule (copy)
			if var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject) then
				serviceModule:setSelectedByOffset(1)
			end
		end
		
		local var12 = if fFlagEnableConsoleExpControls then userInputService.InputChanged:Connect(function(_)
			-- upvalues: userInputService (copy), var1 (copy), var7 (copy), guiService (copy), serviceModule (copy)
			for i, v in userInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
				if v.KeyCode == Enum.KeyCode.Thumbstick1 then
					local x = var1.normalizeStickByDeadzone(Vector2.new(v.Position.X, v.Position.Y)).X
					
					if x < -0.5 then
						if var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject) then
							serviceModule:setSelectedByOffset(-1)
						end
					elseif x > 0.5 and (var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject)) then
						serviceModule:setSelectedByOffset(1)
					end
				end
			end
		end) else nil
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var7 (copy), guiService (copy), serviceModule (copy)
			local keyCode = p2.KeyCode
			
			if keyCode == Enum.KeyCode.Left or keyCode == Enum.KeyCode.DPadLeft then
				if var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject) then
					serviceModule:setSelectedByOffset(-1)
					
					return
				end
			elseif (keyCode == Enum.KeyCode.Right or keyCode == Enum.KeyCode.DPadRight) and (var7.current and var7.current:IsAncestorOf(guiService.SelectedCoreObject)) then
				serviceModule:setSelectedByOffset(1)
			end
		end)
		
		return function()
			-- upvalues: fFlagEnableConsoleExpControls (copy), var12 (write), inputBeganConnection (ref)
			if fFlagEnableConsoleExpControls then
				var12:Disconnect()
			end
			inputBeganConnection:Disconnect()
		end
	end, {})
	
	if avatarSwitcherHamburgerExposure then
		reactModule.useEffect(function()
			-- upvalues: IXPServiceWrapper (copy), avatarSwitcherIXPLayer (copy)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(avatarSwitcherIXPLayer)
		end, {})
	end
	local var13 = var9 + ICON_CELL_WIDTH
	local var14 = if p1 and p1.items then SUB_MENU_ROW_HEIGHT * #p1.items else 0
	local var15 = var14 * (if isInExperienceUIVREnabled and not inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then var4.getInstance():getAdditionalCameraScaleIfNeeded() else 1)
	local var16 = if p1.panelSize then p1.panelSize.Y else var15
	local var17 = isInExperienceUIVREnabled and isSpatial()
	local var18 = if var17 then math.min(var15, var16) else math.min(var8.Y - var13, var14)
	
	if not var17 and var8.Y - var13 < var14 then
		local floored = math.floor((var8.Y - var13) / SUB_MENU_ROW_HEIGHT)
		var18 = if SUB_MENU_ROW_HEIGHT * floored + var11 <= var8.Y - var13 then SUB_MENU_ROW_HEIGHT * floored + var11 else SUB_MENU_ROW_HEIGHT * floored - var11
	end
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UISizeConstraint = reactModule.createElement("UISizeConstraint", {
			MinSize = if userGameSettingsService.ReducedMotion or not p1.menuTransition then Vector2.new(0, var18) else p1.menuTransition:map(function(p2)
				-- upvalues: var18 (write)
				return Vector2.new(0, var18 * p2)
			end)
		}),
		BottomPadding = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 10000,
			Size = UDim2.new(0, 0, 0, SUBMENU_BOTTOM_PADDING)
		})
	}
	
	for i, v in p1.items do
		t[v.id] = reactModule.createElement(MenuRow, v)
	end
	local var19 = var6.Theme.BackgroundUIContrast.Transparency * var6.Settings.PreferredTransparency
	
	return reactModule.createElement("Frame", {
		Size = if var17 then UDim2.new(1, 0, 0, if var17 then math.min(var15, var16) else var15) else UDim2.new(0, ICON_CELL_WIDTH * 4 + UNIBAR_LEFT_MARGIN + UNIBAR_END_PADDING * 2, 0, 0),
		AnchorPoint = if var17 then Vector2.new(0, 1) elseif useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft) then Vector2.zero else Vector2.new(1, 0),
		Position = if var17 then UDim2.new(0, 0, 1, 0) else UDim2.new(0, (-var9) - 2 + UNIBAR_LEFT_MARGIN, 0, 0),
		BackgroundColor3 = theme.BackgroundUIContrast.Color,
		BackgroundTransparency = if p1.menuTransition then p1.menuTransition:map(function(p2)
			-- upvalues: var19 (ref)
			return var19 + (1 - var19) * (1 - p2)
		end) else var19,
		AutomaticSize = if var17 then nil else Enum.AutomaticSize.Y,
		ref = var7,
		SelectionGroup = if fFlagEnableConsoleExpControls then true else nil,
		SelectionBehaviorDown = if fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENU_CORNER_RADIUS) }),
		ScrollingFrame = reactModule.createElement(verticalScrollView, {
			selectable = false,
			size = UDim2.new(1, 0, 1, 0),
			canvasSizeY = UDim.new(0, if var17 then var15 else var14),
			scrollBarType = scrollBarType.Compact
		}, t)
	})
end

return function(p2)
	-- upvalues: reactModule (ref), useObservableValueModule (ref), serviceModule (ref), useChromeMenuItemsModule (ref), reactOtterModule (ref), t (write), var5 (write), constantsModule (ref), userInputService (ref), vector2 (write), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), fFlagUnibarMenuOpenSubmenu (ref), subMenuContextModule (ref)
	local t_1 = {}
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(nil)
	local var23 = useObservableValueModule(serviceModule:currentSubMenu())
	local _, var24 = reactModule.useState(0)
	local var25 = useChromeMenuItemsModule()
	local t_2 = {}
	local var26, var27 = reactOtterModule.useAnimatedBinding(0, function(p3)
		-- upvalues: var24 (ref)
		var24(p3)
	end)
	reactModule.useEffect(function()
		-- upvalues: t (copy), t_2 (write), var5 (copy), var23 (ref), var24 (ref), var27 (ref), reactOtterModule (copy), constantsModule (copy), var22 (ref), userInputService (copy), vector2 (copy), var21 (ref), serviceModule (copy), var20 (ref), isInExperienceUIVREnabled (copy), isSpatial (copy), inExperienceUIVRIXP (copy)
		t = t_2
		var5 = var23
		
		if var23 then
			var24(0)
			var27(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
			var22.current = userInputService.TouchStarted:Connect(function(p3)
				-- upvalues: vector2 (copy)
				vector2 = Vector2.new(p3.Position.X, p3.Position.Y)
			end)
			var21.current = userInputService.TouchTap:Connect(function(p3)
				-- upvalues: vector2 (copy), serviceModule (copy)
				if p3[1] - vector2 ~= Vector2.zero then return end
				local var28 = serviceModule:currentSubMenu():get()
				
				if var28 then
					serviceModule:toggleSubMenu(var28)
				end
			end)
			var20.current = userInputService.InputEnded:Connect(function(p3, _)
				-- upvalues: isInExperienceUIVREnabled (copy), isSpatial (copy), inExperienceUIVRIXP (copy), serviceModule (copy)
				if isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then return end
				local var28 = serviceModule:currentSubMenu():get()
				
				if var28 and p3.UserInputType == Enum.UserInputType.MouseButton1 then
					serviceModule:toggleSubMenu(var28)
				end
			end)
		else
			var24(1)
			var27(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
		end
		return function()
			-- upvalues: var20 (copy), var21 (copy), var22 (copy)
			if var20.current then
				var20.current:Disconnect()
				var20.current = nil
			end
			if var21.current then
				var21.current:Disconnect()
				var21.current = nil
			end
			if var22.current then
				var22.current:Disconnect()
				var22.current = nil
			end
		end
	end, { var23 })
	
	if var23 and var25 then
		for i, v in var25 do
			if var23 == v.id then
				t_2 = v.children
				break
			end
		end
	end
	if #t_2 > 0 then
		t_1[var23] = reactModule.createElement(SubMenu, {
			items = t_2,
			menuTransition = var26,
			panelSize = p2.panelSize
		})
	elseif #t > 0 then
		t_1[var5] = reactModule.createElement(SubMenu, {
			items = t,
			menuTransition = var26,
			panelSize = p2.panelSize
		})
	end
	return reactModule.createElement("Frame", {
		Name = "SubMenuHost",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = if isInExperienceUIVREnabled and isSpatial() then UDim2.new(1, 0, 1, 0) else UDim2.new(0, 0, 1, 0),
		ref = if fFlagUnibarMenuOpenSubmenu then p2.subMenuHostRef else nil
	}, reactModule.createElement(subMenuContextModule.Provider, { value = var26 }, t_1))
end