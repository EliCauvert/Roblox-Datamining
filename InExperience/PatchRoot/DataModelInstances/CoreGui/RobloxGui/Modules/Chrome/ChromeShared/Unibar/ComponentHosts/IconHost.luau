local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local fFlagExpChatShowGlobalChatTooltip = sharedFlagsModule.FFlagExpChatShowGlobalChatTooltip or expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled and expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
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
local var21 = nil

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
		var21 = mappedSignal.new(bottomBarVisibility, function() --[[ line: 79 ]]
			-- upvalues: bottomBarVisibility (ref)
			return bottomBarVisibility:get()
		end)
	end
end
local var24 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local useBindingForUnreadChat = game:DefineFastFlag("UseBindingForUnreadChat", false)
local t = {}

function areTooltipsDisplaying() --[[ line: 101 ]]
	-- upvalues: t (ref)
	local currentTime = tick()
	
	for i, v in t do
		if v.displaying or currentTime - v.time < 0.15 then
			return true
		end
	end
	return false
end

function logTooltipState(p0, p1) --[[ line: 113 ]]
	-- upvalues: t (ref)
	if not t[p0] or t[p0].displaying ~= p1 then
		t[p0] = { displaying = p1, time = tick() }
	end
end

function NotificationBadge(p2) --[[ line: 132 ]]
	-- upvalues: useBindingForUnreadChat (ref), reactModule (ref), useNotificationCountModule (ref), useMappedObservableValueModule (ref), serviceModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), fFlagExpChatShowGlobalChatTooltip (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref)
	if not p2.integration then
		return nil
	end
	local var28 = nil
	local _ = nil
	local var29 = nil
	local var30 = nil
	local _ = nil
	local hideNotificationCountWhileOpen = false
	
	if useBindingForUnreadChat then
		local var32 = if p2.integration.integration then p2.integration.integration.notification else nil
		local var33, var34 = reactModule.useBinding(var32 and var32:get().value or 0)
		var28 = var33
		local var35 = var34
		local var36, var37 = reactModule.useState(false)
		var30 = var36
		local var38 = var37
		reactModule.useEffect(function() --[[ line: 146 ]]
			-- upvalues: var32 (ref), var38 (write), var35 (write)
			if var32 then
				local var41 = var32:connect(function() --[[ line: 151 ]]
					-- upvalues: var32 (copy), var38 (copy), var35 (copy)
					local value = var32:get().value or 0
					var38(value > 0)
					var35(value)
				end)
				
				return function() --[[ line: 156 ]]
					-- upvalues: var41 (ref)
					var41:disconnect()
				end
			end
		end, { p2.integration.integration.id })
	else
		var29 = if useMappedObservableValueModule(serviceModule:currentSubMenu(), function(p3) --[[ line: 164 ]]
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
		local var39 = unibarStyle.use()
		ICON_BADGE_OFFSET_X = var39.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = var39.ICON_BADGE_OFFSET_Y
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
		Visible = p2.toggleTransition and p2.toggleTransition:map(function(p4) --[[ line: 220 ]]
			-- upvalues: hideNotificationCountWhileOpen (write)
			return if hideNotificationCountWhileOpen then p4 < 0.5 else true
		end) or true
	}, {
		Badge = if if not fFlagExpChatShowGlobalChatTooltip then if useBindingForUnreadChat then var30 or minBadgeCount > 0 elseif var29 <= 0 then minBadgeCount > 0 else true elseif useBindingForUnreadChat then var30 else var29 > 0 then reactModule.createElement(statusIndicator, {
			value = if fFlagExpChatShowGlobalChatTooltip then if useBindingForUnreadChat then var28:map(function(p6) --[[ line: 205 ]]
				-- upvalues: minBadgeCount (ref)
				return math.min(math.max(p6, minBadgeCount), 99)
			end) else math.min(math.max(var29, minBadgeCount), 99) elseif useBindingForUnreadChat then var28:map(function(p5) --[[ line: 211 ]]
				return math.min(p5, 99)
			end) else math.min(var29, 99),
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, ICON_BADGE_OFFSET_X, 0, ICON_BADGE_OFFSET_Y)
		}) else nil
	})
end

function NotificationIndicator(p7) --[[ line: 249 ]]
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref)
	local var43 = useObservableValueModule(serviceModule:notificationIndicator())
	p7.setIconVisible(if var43 then false else true)
	
	return reactModule.createElement("Frame", {
		Name = "NotificationIndicatorFrame",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		IntegrationIcon = var43 and var43.component(p7) or nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
	})
end

function HighlightCircle(p8) --[[ line: 268 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Name = p8.name or "Highlighter",
		Size = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = p8.color.Color,
		BackgroundTransparency = p8.color.Transparency,
		Visible = p8.visible
	}, {
		corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

function TooltipButton(p9) --[[ line: 298 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), useTimeHysteresisModule (ref), isInExperienceUIVREnabled (ref), isSpatial (write), useObservableValueModule (ref), serviceModule (ref), var21 (write), controlState (ref), chromeAnalyticsModule (ref), userInputService (ref), shouldRejectMultiTouchModule (ref), fFlagEnableConsoleExpControls (ref), var24 (ref), interactable (ref), fFlagUnibarMenuOpenHamburger (ref), fFlagUnibarMenuOpenSubmenu (ref), useCursor (ref), foundationModule (ref), panel3DInSpatialUI (write), panelType (write), SPATIAL_TOOLTIP_SPACING (write), tooltipCallout (write), tooltipOrientation (write), withTooltip (ref), coreGuiService (ref)
	local var50, var51
	local _ = nil
	local var44 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE
	local var45 = reactModule.useRef(nil)
	local secondaryAction = p9.integration.integration.secondaryAction
	local draggable = p9.integration.integration.draggable or false
	local var47 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 314 ]]
		-- upvalues: var47 (ref)
		return function() --[[ line: 315 ]]
			-- upvalues: var47 (copy)
			if var47.current then
				var47.current:Disconnect()
				var47.current = nil
			end
		end
	end, {})
	local _ = nil
	local _ = nil
	
	if secondaryAction then
		local var52, var53 = useTimeHysteresisModule(0.05, 0.15, 0.35)
		var50 = var52
		var51 = var53
	else
		local var48, var49 = useTimeHysteresisModule(0.6, 0.65, 0.7)
		var50 = var48
		var51 = var49
	end
	local var54, var55 = useTimeHysteresisModule(0, 0, 0.65)
	local var56, var57 = reactModule.useState(false)
	local var58, var59 = useTimeHysteresisModule(0, 1)
	local var60 = if isInExperienceUIVREnabled then isSpatial() else nil
	local var61 = false
	
	if isInExperienceUIVREnabled and var60 and (not (if isInExperienceUIVREnabled then useObservableValueModule(serviceModule:getTopBarVisibiity()) else nil) and not (if isInExperienceUIVREnabled and var21 then useObservableValueModule(var21) else nil)) then
		var61 = true
		draggable = draggable and not var61
	end
	local var65
	local var62 = reactModule.useCallback(function(p10, p11) --[[ line: 353 ]]
		-- upvalues: isInExperienceUIVREnabled (copy), var61 (write), controlState (copy), serviceModule (copy), p9 (ref), var51 (write), var54 (ref), var59 (ref)
		if isInExperienceUIVREnabled and var61 then return end
		if p11 == controlState.Selected and (p10 == controlState.Default or p10 == controlState.Hover) then
			serviceModule:setSelected(p9.integration.id)
		elseif p11 == controlState.Selected and p10 == controlState.Default then
			serviceModule:setSelected(p9.integration.id)
		end
		local var75 = p11 ~= controlState.Default
		p9.setHovered(var75)
		local var76 = p11 == controlState.Hover
		var51(var76, if var76 then var54 else areTooltipsDisplaying())
		
		if var76 then
			serviceModule:onIntegrationHovered():fire(p9.integration.id)
		end
		if not var75 then
			var59(false)
		end
	end, if isInExperienceUIVREnabled then {
		p9.setHovered, var51, var59, var54, var60, var61
	} else { p9.setHovered, var51, var59, var54 })
	local var63 = reactModule.useCallback(function(_, p12) --[[ line: 389 ]]
		-- upvalues: draggable (write), var59 (ref), chromeAnalyticsModule (copy), p9 (ref), var47 (ref), userInputService (copy), shouldRejectMultiTouchModule (copy), serviceModule (copy), constantsModule (copy)
		if not draggable then return end
		if p12.UserInputType == Enum.UserInputType.MouseButton1 or p12.UserInputType == Enum.UserInputType.Touch then
			local position = p12.Position
			var59(true, true)
			chromeAnalyticsModule.default:onIconTouchBegan(p9.integration.id)
			
			if not var47.current then
				var47.current = userInputService.InputChanged:Connect(function(p13, _) --[[ line: 402 ]]
					-- upvalues: shouldRejectMultiTouchModule (copy), p12 (ref), serviceModule (copy), p9 (copy), var47 (copy), position (ref), constantsModule (copy), chromeAnalyticsModule (copy)
					if shouldRejectMultiTouchModule(p12, p13) then return end
					if serviceModule:isWindowOpen(p9.integration.id) or not var47.current then return end
					if constantsModule.DRAG_MAGNITUDE_THRESHOLD < math.abs((position - p13.Position).Magnitude) then
						chromeAnalyticsModule.default:onIconDrag(p9.integration.id)
						serviceModule:storeChromeInteracted()
						serviceModule:toggleWindow(p9.integration.id)
						serviceModule:gesture(p9.integration.id, var47, p12)
					end
				end)
			end
		end
	end, { draggable })
	local var64 = reactModule.useCallback(function(_, p14) --[[ line: 428 ]]
		-- upvalues: draggable (write), var59 (ref), var47 (ref), serviceModule (copy), p9 (ref)
		if not draggable then return end
		if p14.UserInputType == Enum.UserInputType.MouseButton1 or p14.UserInputType == Enum.UserInputType.Touch then
			var59(false)
			
			if var47.current then
				var47.current:Disconnect()
				var47.current = nil
				serviceModule:gesture(p9.integration.id, nil)
			end
		end
	end, { draggable })
	
	if not var50 and not var54 then
		var65 = var56 and not var58
	end
	if isInExperienceUIVREnabled and var65 and var61 then
		var65 = false
	end
	logTooltipState(p9.integration.id, var65)
	local var66 = if fFlagEnableConsoleExpControls then reactModule.useContext(var24) else nil
	local var67 = reactModule.useCallback(function(p15) --[[ line: 456 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), reactModule (copy), interactable (copy), constantsModule (copy), p9 (ref), var44 (write), var62 (ref), var45 (ref), fFlagUnibarMenuOpenHamburger (copy), fFlagUnibarMenuOpenSubmenu (copy), useCursor (copy), foundationModule (copy), var65 (write), secondaryAction (ref), var66 (ref), var63 (ref), var64 (ref), isInExperienceUIVREnabled (copy), var60 (ref), var61 (write), var59 (ref), var47 (ref)
		return reactModule.createElement(interactable, {
			Name = (if fFlagEnableConsoleExpControls then constantsModule.ICON_NAME_PREFIX else "IconHitArea_") .. p9.integration.id,
			Size = var44,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			onStateChanged = var62,
			ref = var45,
			SelectionOrder = if fFlagUnibarMenuOpenHamburger or fFlagUnibarMenuOpenSubmenu then p9.integration.order else 100 - p9.integration.order,
			Position = p9.isCurrentlyOpenSubMenu:map(function(p16) --[[ line: 474 ]]
				-- upvalues: fFlagEnableConsoleExpControls (copy)
				return UDim2.new(0.5, 0, 0.5, if fFlagEnableConsoleExpControls or not p16 then 0 else 1)
			end),
			SelectionImageObject = useCursor(foundationModule.Enums.CursorType.SkinToneCircle),
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = p9.isCurrentlyOpenSubMenu:map(function(p17) --[[ line: 480 ]]
				-- upvalues: var65 (copy), secondaryAction (copy)
				return if var65 and secondaryAction or p17 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
			end),
			NextSelectionLeft = if fFlagEnableConsoleExpControls and p9.integration.id == (if fFlagEnableConsoleExpControls then serviceModule:menuList():get()[1].id else nil) then var66.menuIconRef else nil,
			[reactModule.Change.AbsolutePosition] = p15,
			[reactModule.Change.AbsoluteSize] = p15,
			[reactModule.Event.InputBegan] = var63,
			[reactModule.Event.InputEnded] = var64,
			[reactModule.Event.Activated] = function() --[[ line: 494 ]]
				-- upvalues: isInExperienceUIVREnabled (copy), var60 (copy), var61 (copy), serviceModule (copy), var59 (copy), p9 (copy), var47 (copy)
				if isInExperienceUIVREnabled and var60 then
					if var61 then return end
					serviceModule:onTriggerVRToggleButton():fire(true)
				end
				var59(true, true)
				p9.integration.activated()
				
				if var47.current then
					var47.current:Disconnect()
					var47.current = nil
					serviceModule:gesture(p9.integration.id, nil)
				end
			end
		}, {
			corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end, {
		var62, var51, var59, var63, var64, p9.isCurrentlyOpenSubMenu, var65,
		secondaryAction, if isInExperienceUIVREnabled then var61 else nil,
		if fFlagEnableConsoleExpControls then var66.menuIconRef else nil
	})
	local var68 = reactModule.useRef(nil)
	local var69 = reactModule.useCallback(function(p18) --[[ line: 531 ]]
		-- upvalues: var68 (ref), var55 (ref)
		local mouseEnterConnection = nil
		local mouseLeaveConnection = nil
		local destroyingConnection = nil
		
		local var80 = function() --[[ line: 538 ]]
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
		
		if p18 ~= var68.current then
			pcall(var80)
			
			if p18 then
				mouseEnterConnection = p18.MouseEnter:Connect(function() --[[ line: 556 ]]
					-- upvalues: var55 (copy)
					var55(true, true)
				end)
				mouseLeaveConnection = p18.MouseLeave:Connect(function() --[[ line: 559 ]]
					-- upvalues: var55 (copy)
					var55(false)
				end)
				destroyingConnection = p18.Destroying:Connect(function() --[[ line: 562 ]]
					-- upvalues: var55 (copy)
					var55(false)
				end)
			end
			var68.current = p18
		end
	end, { var55 })
	local var70 = if secondaryAction then {
		text = secondaryAction.label,
		onStateChanged = function(_, p19) --[[ line: 573 ]]
			-- upvalues: controlState (copy), var57 (ref)
			if p19 == controlState.Selected then
				var57(true)
				
				return
			end
			var57(false)
		end,
		onActivated = function() --[[ line: 580 ]]
			-- upvalues: secondaryAction (ref), p9 (ref)
			secondaryAction.activated(p9.integration)
		end,
		NextSelectionUp = var45,
		NextSelectionLeft = var45,
		NextSelectionRight = var45,
		NextSelectionDown = var45
	} else nil
	
	if not isInExperienceUIVREnabled or not var60 then
		return withTooltip({
			headerText = p9.integration.integration.label,
			hotkeyCodes = p9.integration.integration.hotkeyCodes,
			textAlignment = Enum.TextXAlignment.Left,
			buttonProps = var70,
			ref = if secondaryAction then var69 else nil
		}, {
			DisplayOrder = 10,
			active = var65,
			guiTarget = coreGuiService
		}, var67)
	end
	local var71, var72 = reactModule.useBinding(Vector2.zero)
	local var73, var74 = reactModule.useBinding(Vector2.zero)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		VRSpatialTooltip = if var65 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
			panelType = panelType.ToolTipsContainer,
			renderFunction = function(p20) --[[ line: 606 ]]
				-- upvalues: var71 (ref), var73 (ref), SPATIAL_TOOLTIP_SPACING (copy), reactModule (copy), tooltipCallout (copy), p9 (ref), tooltipOrientation (copy), var70 (ref), secondaryAction (ref), var69 (ref)
				return reactModule.createElement(tooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p9.integration.integration.label,
					orientation = tooltipOrientation.Top,
					triggerPointCenter = Vector2.new(var71:getValue().X + var73:getValue().X / 2, p20.Y - SPATIAL_TOOLTIP_SPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero,
					buttonProps = var70,
					ref = if secondaryAction then var69 else nil
				})
			end
		}) else nil,
		var67(reactModule.useCallback(function(p21) --[[ line: 594 ]]
			-- upvalues: var72 (ref), var74 (ref)
			var72(p21.AbsolutePosition)
			var74(p21.AbsoluteSize)
		end, { var72, var74 }))
	})
end

function IconHost(p22) --[[ line: 645 ]]
	-- upvalues: reactModule (ref), useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useMappedObservableValueBindingModule (ref), serviceModule (ref), fFlagEnableConsoleExpControls (ref), fFlagExpChatShowGlobalChatTooltip (ref), chatNotificationBadgeModule (ref)
	if not p22.integration or not p22.integration.component then
		warn("IconHost has no component to render")
	end
	local var81, var82 = reactModule.useBinding(false)
	local var83, var84 = reactModule.useBinding(true)
	local _ = nil
	local backgroundOnHover = useStyle().Theme.BackgroundOnHover
	local var85 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_CELL_WIDTH else constantsModule.ICON_CELL_WIDTH
	local var86 = useMappedObservableValueBindingModule(serviceModule:currentSubMenu(), function(p23) --[[ line: 668 ]]
		-- upvalues: p22 (ref)
		return p23 == p22.integration.id
	end)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var85, 0, var85),
		LayoutOrder = p22.integration.order,
		Position = p22.position,
		Visible = p22.visible,
		ZIndex = if fFlagEnableConsoleExpControls then nil else p22.integration.order
	}, {
		reactModule.createElement("Frame", {
			Name = "IntegrationIconFrame",
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var83
		}, {
			IntegrationIcon = p22.integration and (p22.integration.component and (p22.integration.component(p22) or nil)),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			})
		}),
		if p22.integration.integration.flashNotificationSource then reactModule.createElement(NotificationIndicator, { integration = p22.integration, setIconVisible = var84 }) else nil,
		reactModule.createElement(HighlightCircle, {
			name = "SelectedHighlighter",
			color = backgroundOnHover,
			visible = var86
		}),
		reactModule.createElement(HighlightCircle, {
			name = "Highlighter",
			color = backgroundOnHover,
			visible = var81
		}),
		if fFlagExpChatShowGlobalChatTooltip and p22.integration.id == "chat" then reactModule.createElement(chatNotificationBadgeModule, {
			iconHostProps = p22,
			NotificationBadge = NotificationBadge
		}) else reactModule.createElement(NotificationBadge, p22),
		if p22.disableButtonBehaviors then nil else reactModule.createElement(TooltipButton, {
			integration = p22.integration,
			setHovered = var82,
			isCurrentlyOpenSubMenu = var86
		})
	})
end

return IconHost