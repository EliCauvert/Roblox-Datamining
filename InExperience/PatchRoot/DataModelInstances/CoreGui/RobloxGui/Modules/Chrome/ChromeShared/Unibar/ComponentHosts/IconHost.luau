local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local var6 = if fFlagEnableWhatsNew then require(corePackagesService.Workspace.Packages.WhatsNew).WhatsNewAnchor else nil
local flagsModule = require(script.Parent.Parent.Parent.Parent.Flags)
local fFlagUnibarMenuOpenHamburger = flagsModule.FFlagUnibarMenuOpenHamburger
local fFlagUnibarMenuOpenSubmenu = flagsModule.FFlagUnibarMenuOpenSubmenu
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local flags = foundationModule.Utility.Flags
local statusIndicator = foundationModule.StatusIndicator
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local interactable = UIBloxModule.Core.Control.Interactable
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local useStyle = UIBloxModule.Core.Style.useStyle
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local constantsModule = require(chromeShared.Unibar.Constants)
local serviceModule = require(chromeShared.Service)
local chromeAnalyticsModule = require(chromeShared.Analytics.ChromeAnalytics)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local useNotificationCountModule = require(chromeShared.Hooks.useNotificationCount)
local useMappedObservableValueModule = require(chromeShared.Hooks.useMappedObservableValue)
local useMappedObservableValueBindingModule = require(chromeShared.Hooks.useMappedObservableValueBinding)
local useTimeHysteresisModule = require(chromeShared.Hooks.useTimeHysteresis)
local shouldRejectMultiTouchModule = require(chromeShared.Utility.shouldRejectMultiTouch)
local chatNotificationBadgeModule = require(script.Parent.ChatNotificationBadge)
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = nil
local panel3DInSpatialUI = nil
local panelType = nil
local tooltipOrientation = nil
local tooltipCallout = nil
local SPATIAL_TOOLTIP_SPACING = nil
local _ = nil
local _ = nil
local var20 = nil

if isInExperienceUIVREnabled then
	isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
	panelType = vrSpatialUiModule.Constants.PanelType
	tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
	tooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
	SPATIAL_TOOLTIP_SPACING = vrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING
	local mappedSignal = require(chromeShared.Service.ChromeUtils).MappedSignal
	local bottomBarVisibility = vrSpatialUiModule.UIManager.getInstance():getBottomBarVisibility()
	
	if bottomBarVisibility and isSpatial() then
		var20 = mappedSignal.new(bottomBarVisibility, function()
			-- upvalues: bottomBarVisibility (ref)
			return bottomBarVisibility:get()
		end)
	end
end
local var23 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local useBindingForUnreadChat = game:DefineFastFlag("UseBindingForUnreadChat", false)
local t = {}

function areTooltipsDisplaying()
	-- upvalues: t (ref)
	local currentTime = tick()
	
	for i, v in t do
		if v.displaying or currentTime - v.time < 0.15 then
			return true
		end
	end
	return false
end

function logTooltipState(p0, p1)
	-- upvalues: t (ref)
	if not t[p0] or t[p0].displaying ~= p1 then
		t[p0] = { displaying = p1, time = tick() }
	end
end

function NotificationBadge(p2)
	-- upvalues: useBindingForUnreadChat (ref), reactModule (ref), useNotificationCountModule (ref), useMappedObservableValueModule (ref), serviceModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref)
	if not p2.integration then
		return nil
	end
	local var27 = nil
	local _ = nil
	local var28 = nil
	local var29 = nil
	local _ = nil
	local hideNotificationCountWhileOpen = false
	
	if useBindingForUnreadChat then
		local var31 = if p2.integration.integration then p2.integration.integration.notification else nil
		local var32, var33 = reactModule.useBinding(var31 and var31:get().value or 0)
		var27 = var32
		local var34 = var33
		local var35, var36 = reactModule.useState(false)
		var29 = var35
		local var37 = var36
		reactModule.useEffect(function()
			-- upvalues: var31 (ref), var37 (write), var34 (write)
			if var31 then
				local var40 = var31:connect(function()
					-- upvalues: var31 (copy), var37 (copy), var34 (copy)
					local value = var31:get().value or 0
					var37(value > 0)
					var34(value)
				end)
				
				return function()
					-- upvalues: var40 (ref)
					var40:disconnect()
				end
			end
		end, { p2.integration.integration.id })
	else
		var28 = if useMappedObservableValueModule(serviceModule:currentSubMenu(), function(p3)
			-- upvalues: p2 (ref)
			return p3 == p2.integration.id
		end) then 0 else useNotificationCountModule(p2.integration.integration)
		
		if p2.integration and p2.integration.integration then
			hideNotificationCountWhileOpen = p2.integration.integration.hideNotificationCountWhileOpen or false
		end
	end
	local ICON_BADGE_OFFSET_X, ICON_BADGE_OFFSET_Y
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var38 = unibarStyle.use()
		ICON_BADGE_OFFSET_X = var38.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = var38.ICON_BADGE_OFFSET_Y
	else
		ICON_BADGE_OFFSET_X = constantsModule.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = constantsModule.ICON_BADGE_OFFSET_Y
	end
	local minBadgeCount = p2.minBadgeCount or 0
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		Visible = p2.toggleTransition and p2.toggleTransition:map(function(p4)
			-- upvalues: hideNotificationCountWhileOpen (write)
			return if hideNotificationCountWhileOpen then p4 < 0.5 else true
		end) or true
	}, {
		Badge = if if useBindingForUnreadChat then var29 or minBadgeCount > 0 elseif var28 <= 0 then minBadgeCount > 0 else true then reactModule.createElement(statusIndicator, {
			value = if useBindingForUnreadChat then var27:map(function(p5)
				-- upvalues: minBadgeCount (ref)
				return math.min(math.max(p5, minBadgeCount), 99)
			end) else math.min(math.max(var28, minBadgeCount), 99),
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, ICON_BADGE_OFFSET_X, 0, ICON_BADGE_OFFSET_Y)
		}) else nil
	})
end

function NotificationIndicator(p6)
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref)
	local var42 = useObservableValueModule(serviceModule:notificationIndicator())
	p6.setIconVisible(if var42 then false else true)
	
	return reactModule.createElement("Frame", {
		Name = "NotificationIndicatorFrame",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		IntegrationIcon = var42 and var42.component(p6) or nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
	})
end

function HighlightCircle(p7)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Name = p7.name or "Highlighter",
		Size = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = p7.color.Color,
		BackgroundTransparency = p7.color.Transparency,
		Visible = p7.visible
	}, {
		corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

function TooltipButton(p8)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), useTimeHysteresisModule (ref), isInExperienceUIVREnabled (ref), isSpatial (write), useObservableValueModule (ref), serviceModule (ref), var20 (write), controlState (ref), chromeAnalyticsModule (ref), userInputService (ref), shouldRejectMultiTouchModule (ref), fFlagEnableConsoleExpControls (ref), var23 (ref), interactable (ref), fFlagUnibarMenuOpenHamburger (ref), fFlagUnibarMenuOpenSubmenu (ref), useCursor (ref), foundationModule (ref), panel3DInSpatialUI (write), panelType (write), SPATIAL_TOOLTIP_SPACING (write), tooltipCallout (write), tooltipOrientation (write), withTooltip (ref), coreGuiService (ref)
	local var49, var50
	local _ = nil
	local var43 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE
	local var44 = reactModule.useRef(nil)
	local secondaryAction = p8.integration.integration.secondaryAction
	local draggable = p8.integration.integration.draggable or false
	local var46 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var46 (ref)
		return function()
			-- upvalues: var46 (copy)
			if var46.current then
				var46.current:Disconnect()
				var46.current = nil
			end
		end
	end, {})
	local _ = nil
	local _ = nil
	
	if secondaryAction then
		local var51, var52 = useTimeHysteresisModule(0.05, 0.15, 0.35)
		var49 = var51
		var50 = var52
	else
		local var47, var48 = useTimeHysteresisModule(0.6, 0.65, 0.7)
		var49 = var47
		var50 = var48
	end
	local var53, var54 = useTimeHysteresisModule(0, 0, 0.65)
	local var55, var56 = reactModule.useState(false)
	local var57, var58 = useTimeHysteresisModule(0, 1)
	local var59 = if isInExperienceUIVREnabled then isSpatial() else nil
	local var60 = false
	
	if isInExperienceUIVREnabled and var59 and (not (if isInExperienceUIVREnabled then useObservableValueModule(serviceModule:getTopBarVisibiity()) else nil) and not (if isInExperienceUIVREnabled and var20 then useObservableValueModule(var20) else nil)) then
		var60 = true
		draggable = draggable and not var60
	end
	local var64
	local var61 = reactModule.useCallback(function(p9, p10)
		-- upvalues: isInExperienceUIVREnabled (copy), var60 (write), controlState (copy), serviceModule (copy), p8 (ref), var50 (write), var53 (ref), var58 (ref)
		if isInExperienceUIVREnabled and var60 then return end
		if p10 == controlState.Selected and (p9 == controlState.Default or p9 == controlState.Hover) then
			serviceModule:setSelected(p8.integration.id)
		elseif p10 == controlState.Selected and p9 == controlState.Default then
			serviceModule:setSelected(p8.integration.id)
		end
		local var74 = p10 ~= controlState.Default
		p8.setHovered(var74)
		local var75 = p10 == controlState.Hover
		var50(var75, if var75 then var53 else areTooltipsDisplaying())
		
		if var75 then
			serviceModule:onIntegrationHovered():fire(p8.integration.id)
		end
		if not var74 then
			var58(false)
		end
	end, if isInExperienceUIVREnabled then {
		p8.setHovered, var50, var58, var53, var59, var60
	} else { p8.setHovered, var50, var58, var53 })
	local var62 = reactModule.useCallback(function(_, p11)
		-- upvalues: draggable (write), var58 (ref), chromeAnalyticsModule (copy), p8 (ref), var46 (ref), userInputService (copy), shouldRejectMultiTouchModule (copy), serviceModule (copy), constantsModule (copy)
		if not draggable then return end
		if p11.UserInputType == Enum.UserInputType.MouseButton1 or p11.UserInputType == Enum.UserInputType.Touch then
			local position = p11.Position
			var58(true, true)
			chromeAnalyticsModule.default:onIconTouchBegan(p8.integration.id)
			
			if not var46.current then
				var46.current = userInputService.InputChanged:Connect(function(p12, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), p11 (ref), serviceModule (copy), p8 (copy), var46 (copy), position (ref), constantsModule (copy), chromeAnalyticsModule (copy)
					if shouldRejectMultiTouchModule(p11, p12) then return end
					if serviceModule:isWindowOpen(p8.integration.id) or not var46.current then return end
					if constantsModule.DRAG_MAGNITUDE_THRESHOLD < math.abs((position - p12.Position).Magnitude) then
						chromeAnalyticsModule.default:onIconDrag(p8.integration.id)
						serviceModule:storeChromeInteracted()
						serviceModule:toggleWindow(p8.integration.id)
						serviceModule:gesture(p8.integration.id, var46, p11)
					end
				end)
			end
		end
	end, { draggable })
	local var63 = reactModule.useCallback(function(_, p13)
		-- upvalues: draggable (write), var58 (ref), var46 (ref), serviceModule (copy), p8 (ref)
		if not draggable then return end
		if p13.UserInputType == Enum.UserInputType.MouseButton1 or p13.UserInputType == Enum.UserInputType.Touch then
			var58(false)
			
			if var46.current then
				var46.current:Disconnect()
				var46.current = nil
				serviceModule:gesture(p8.integration.id, nil)
			end
		end
	end, { draggable })
	
	if not var49 and not var53 then
		var64 = var55 and not var57
	end
	if isInExperienceUIVREnabled and var64 and var60 then
		var64 = false
	end
	logTooltipState(p8.integration.id, var64)
	local var65 = if fFlagEnableConsoleExpControls then reactModule.useContext(var23) else nil
	local var66 = reactModule.useCallback(function(p14)
		-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), reactModule (copy), interactable (copy), constantsModule (copy), p8 (ref), var43 (write), var61 (ref), var44 (ref), fFlagUnibarMenuOpenHamburger (copy), fFlagUnibarMenuOpenSubmenu (copy), useCursor (copy), foundationModule (copy), var64 (write), secondaryAction (ref), var65 (ref), var62 (ref), var63 (ref), isInExperienceUIVREnabled (copy), var59 (ref), var60 (write), var58 (ref), var46 (ref)
		return reactModule.createElement(interactable, {
			Name = (if fFlagEnableConsoleExpControls then constantsModule.ICON_NAME_PREFIX else "IconHitArea_") .. p8.integration.id,
			Size = var43,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			onStateChanged = var61,
			ref = var44,
			SelectionOrder = if fFlagUnibarMenuOpenHamburger or fFlagUnibarMenuOpenSubmenu then p8.integration.order else 100 - p8.integration.order,
			Position = p8.isCurrentlyOpenSubMenu:map(function(p15)
				-- upvalues: fFlagEnableConsoleExpControls (copy)
				return UDim2.new(0.5, 0, 0.5, if fFlagEnableConsoleExpControls or not p15 then 0 else 1)
			end),
			SelectionImageObject = useCursor(foundationModule.Enums.CursorType.SkinToneCircle),
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = p8.isCurrentlyOpenSubMenu:map(function(p16)
				-- upvalues: var64 (copy), secondaryAction (copy)
				return if var64 and secondaryAction or p16 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
			end),
			NextSelectionLeft = if fFlagEnableConsoleExpControls and p8.integration.id == (if fFlagEnableConsoleExpControls then serviceModule:menuList():get()[1].id else nil) then var65.menuIconRef else nil,
			[reactModule.Change.AbsolutePosition] = p14,
			[reactModule.Change.AbsoluteSize] = p14,
			[reactModule.Event.InputBegan] = var62,
			[reactModule.Event.InputEnded] = var63,
			[reactModule.Event.Activated] = function()
				-- upvalues: isInExperienceUIVREnabled (copy), var59 (copy), var60 (copy), serviceModule (copy), var58 (copy), p8 (copy), var46 (copy)
				if isInExperienceUIVREnabled and var59 then
					if var60 then return end
					serviceModule:onTriggerVRToggleButton():fire(true)
				end
				var58(true, true)
				p8.integration.activated()
				
				if var46.current then
					var46.current:Disconnect()
					var46.current = nil
					serviceModule:gesture(p8.integration.id, nil)
				end
			end
		}, {
			corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end, {
		var61, var50, var58, var62, var63, p8.isCurrentlyOpenSubMenu, var64,
		secondaryAction, if isInExperienceUIVREnabled then var60 else nil,
		if fFlagEnableConsoleExpControls then var65.menuIconRef else nil
	})
	local var67 = reactModule.useRef(nil)
	local var68 = reactModule.useCallback(function(p17)
		-- upvalues: var67 (ref), var54 (ref)
		local mouseEnterConnection = nil
		local mouseLeaveConnection = nil
		local destroyingConnection = nil
		
		local var79 = function()
			-- upvalues: mouseEnterConnection (write), mouseLeaveConnection (write), destroyingConnection (write)
			if mouseEnterConnection then
				mouseEnterConnection:disconnect()
				mouseEnterConnection = nil
			end
			if mouseLeaveConnection then
				mouseLeaveConnection:disconnect()
				mouseLeaveConnection = nil
			end
			if destroyingConnection then
				destroyingConnection:disconnect()
				destroyingConnection = nil
			end
		end
		
		if p17 ~= var67.current then
			pcall(var79)
			
			if p17 then
				mouseEnterConnection = p17.MouseEnter:Connect(function()
					-- upvalues: var54 (copy)
					var54(true, true)
				end)
				mouseLeaveConnection = p17.MouseLeave:Connect(function()
					-- upvalues: var54 (copy)
					var54(false)
				end)
				destroyingConnection = p17.Destroying:Connect(function()
					-- upvalues: var54 (copy)
					var54(false)
				end)
			end
			var67.current = p17
		end
	end, { var54 })
	local var69 = if secondaryAction then {
		text = secondaryAction.label,
		onStateChanged = function(_, p18)
			-- upvalues: controlState (copy), var56 (ref)
			if p18 == controlState.Selected then
				var56(true)
				
				return
			end
			var56(false)
		end,
		onActivated = function()
			-- upvalues: secondaryAction (ref), p8 (ref)
			secondaryAction.activated(p8.integration)
		end,
		NextSelectionUp = var44,
		NextSelectionLeft = var44,
		NextSelectionRight = var44,
		NextSelectionDown = var44
	} else nil
	
	if not isInExperienceUIVREnabled or not var59 then
		return withTooltip({
			headerText = p8.integration.integration.label,
			hotkeyCodes = p8.integration.integration.hotkeyCodes,
			textAlignment = Enum.TextXAlignment.Left,
			buttonProps = var69,
			ref = if secondaryAction then var68 else nil
		}, {
			DisplayOrder = 10,
			active = var64,
			guiTarget = coreGuiService
		}, var66)
	end
	local var70, var71 = reactModule.useBinding(Vector2.zero)
	local var72, var73 = reactModule.useBinding(Vector2.zero)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		VRSpatialTooltip = if var64 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
			panelType = panelType.ToolTipsContainer,
			renderFunction = function(p19)
				-- upvalues: var70 (ref), var72 (ref), SPATIAL_TOOLTIP_SPACING (copy), reactModule (copy), tooltipCallout (copy), p8 (ref), tooltipOrientation (copy), var69 (ref), secondaryAction (ref), var68 (ref)
				return reactModule.createElement(tooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p8.integration.integration.label,
					orientation = tooltipOrientation.Top,
					triggerPointCenter = Vector2.new(var70:getValue().X + var72:getValue().X / 2, p19.Y - SPATIAL_TOOLTIP_SPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero,
					buttonProps = var69,
					ref = if secondaryAction then var68 else nil
				})
			end
		}) else nil,
		var66(reactModule.useCallback(function(p20)
			-- upvalues: var71 (ref), var73 (ref)
			var71(p20.AbsolutePosition)
			var73(p20.AbsoluteSize)
		end, { var71, var73 }))
	})
end

function IconHost(p21)
	-- upvalues: reactModule (ref), useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useMappedObservableValueBindingModule (ref), serviceModule (ref), chatNotificationBadgeModule (ref), fFlagEnableConsoleExpControls (ref), fFlagEnableWhatsNew (ref), var6 (ref)
	if not p21.integration or not p21.integration.component then
		warn("IconHost has no component to render")
	end
	local var80, var81 = reactModule.useBinding(false)
	local var82, var83 = reactModule.useBinding(true)
	local _ = nil
	local backgroundOnHover = useStyle().Theme.BackgroundOnHover
	local var84 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_CELL_WIDTH else constantsModule.ICON_CELL_WIDTH
	local var85 = useMappedObservableValueBindingModule(serviceModule:currentSubMenu(), function(p22)
		-- upvalues: p21 (ref)
		return p22 == p21.integration.id
	end)
	local list = {
		reactModule.createElement("Frame", {
			Name = "IntegrationIconFrame",
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var82
		}, {
			IntegrationIcon = p21.integration and (p21.integration.component and (p21.integration.component(p21) or nil)),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			})
		}),
		if p21.integration.integration.flashNotificationSource then reactModule.createElement(NotificationIndicator, { integration = p21.integration, setIconVisible = var83 }) else nil,
		reactModule.createElement(HighlightCircle, {
			name = "SelectedHighlighter",
			color = backgroundOnHover,
			visible = var85
		}),
		reactModule.createElement(HighlightCircle, {
			name = "Highlighter",
			color = backgroundOnHover,
			visible = var80
		}),
		if p21.integration.id == "chat" then reactModule.createElement(chatNotificationBadgeModule, {
			iconHostProps = p21,
			NotificationBadge = NotificationBadge
		}) else reactModule.createElement(NotificationBadge, p21),
		if p21.disableButtonBehaviors then nil else reactModule.createElement(TooltipButton, {
			integration = p21.integration,
			setHovered = var81,
			isCurrentlyOpenSubMenu = var85
		})
	}
	local t = {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var84, 0, var84),
		LayoutOrder = p21.integration.order,
		Position = p21.position,
		Visible = p21.visible,
		ZIndex = if fFlagEnableConsoleExpControls then nil else p21.integration.order
	}
	
	return if fFlagEnableWhatsNew then reactModule.createElement("Frame", t, {
		WhatsNewAnchor = reactModule.createElement(var6, { tag = "size-full", anchorId = p21.integration.id }, list)
	}) else reactModule.createElement("Frame", t, list)
end

return IconHost