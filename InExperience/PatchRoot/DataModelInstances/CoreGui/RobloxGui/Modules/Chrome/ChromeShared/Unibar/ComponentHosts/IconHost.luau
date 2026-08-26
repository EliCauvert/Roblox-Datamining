local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local var1 = if fFlagEnableWhatsNew then require(corePackagesService.Workspace.Packages.WhatsNew).WhatsNewAnchor else nil
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
local var2 = nil

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
		var2 = mappedSignal.new(bottomBarVisibility, function()
			-- upvalues: bottomBarVisibility (ref)
			return bottomBarVisibility:get()
		end)
	end
end
local var3 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
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

function logTooltipState(p1, p2)
	-- upvalues: t (ref)
	if not t[p1] or t[p1].displaying ~= p2 then
		t[p1] = { displaying = p2, time = tick() }
	end
end

function NotificationBadge(p1)
	-- upvalues: useBindingForUnreadChat (ref), reactModule (ref), useNotificationCountModule (ref), useMappedObservableValueModule (ref), serviceModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref)
	if not p1.integration then
		return nil
	end
	local var4 = nil
	local _ = nil
	local var5 = nil
	local var6 = nil
	local _ = nil
	local hideNotificationCountWhileOpen = false
	
	if useBindingForUnreadChat then
		local var7 = if p1.integration.integration then p1.integration.integration.notification else nil
		local var8, var9 = reactModule.useBinding(var7 and var7:get().value or 0)
		var4 = var8
		local var10 = var9
		local var11, var12 = reactModule.useState(false)
		var6 = var11
		local var13 = var12
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), var13 (write), var10 (write)
			if var7 then
				local var14 = var7:connect(function()
					-- upvalues: var7 (copy), var13 (copy), var10 (copy)
					local value = var7:get().value or 0
					var13(value > 0)
					var10(value)
				end)
				
				return function()
					-- upvalues: var14 (ref)
					var14:disconnect()
				end
			end
		end, { p1.integration.integration.id })
	else
		var5 = if useMappedObservableValueModule(serviceModule:currentSubMenu(), function(p2)
			-- upvalues: p1 (ref)
			return p2 == p1.integration.id
		end) then 0 else useNotificationCountModule(p1.integration.integration)
		
		if p1.integration and p1.integration.integration then
			hideNotificationCountWhileOpen = p1.integration.integration.hideNotificationCountWhileOpen or false
		end
	end
	local ICON_BADGE_OFFSET_X, ICON_BADGE_OFFSET_Y
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var14 = unibarStyle.use()
		ICON_BADGE_OFFSET_X = var14.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = var14.ICON_BADGE_OFFSET_Y
	else
		ICON_BADGE_OFFSET_X = constantsModule.ICON_BADGE_OFFSET_X
		ICON_BADGE_OFFSET_Y = constantsModule.ICON_BADGE_OFFSET_Y
	end
	local minBadgeCount = p1.minBadgeCount or 0
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		Visible = p1.toggleTransition and p1.toggleTransition:map(function(p2)
			-- upvalues: hideNotificationCountWhileOpen (write)
			return if hideNotificationCountWhileOpen then p2 < 0.5 else true
		end) or true
	}, {
		Badge = if if useBindingForUnreadChat then var6 or minBadgeCount > 0 elseif var5 <= 0 then minBadgeCount > 0 else true then reactModule.createElement(statusIndicator, {
			value = if useBindingForUnreadChat then var4:map(function(p2)
				-- upvalues: minBadgeCount (ref)
				return math.min(math.max(p2, minBadgeCount), 99)
			end) else math.min(math.max(var5, minBadgeCount), 99),
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, ICON_BADGE_OFFSET_X, 0, ICON_BADGE_OFFSET_Y)
		}) else nil
	})
end

function NotificationIndicator(p1)
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref)
	local var4 = useObservableValueModule(serviceModule:notificationIndicator())
	p1.setIconVisible(if var4 then false else true)
	
	return reactModule.createElement("Frame", {
		Name = "NotificationIndicatorFrame",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		IntegrationIcon = var4 and var4.component(p1) or nil,
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
	})
end

function HighlightCircle(p1)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Name = p1.name or "Highlighter",
		Size = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = p1.color.Color,
		BackgroundTransparency = p1.color.Transparency,
		Visible = p1.visible
	}, {
		corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

function TooltipButton(p1)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), useTimeHysteresisModule (ref), isInExperienceUIVREnabled (ref), isSpatial (write), useObservableValueModule (ref), serviceModule (ref), var2 (write), controlState (ref), chromeAnalyticsModule (ref), userInputService (ref), shouldRejectMultiTouchModule (ref), fFlagEnableConsoleExpControls (ref), var3 (ref), interactable (ref), fFlagUnibarMenuOpenHamburger (ref), fFlagUnibarMenuOpenSubmenu (ref), useCursor (ref), foundationModule (ref), panel3DInSpatialUI (write), panelType (write), SPATIAL_TOOLTIP_SPACING (write), tooltipCallout (write), tooltipOrientation (write), withTooltip (ref), coreGuiService (ref)
	local var4, var5
	local _ = nil
	local var6 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_HIGHLIGHT_SIZE else constantsModule.ICON_HIGHLIGHT_SIZE
	local var7 = reactModule.useRef(nil)
	local secondaryAction = p1.integration.integration.secondaryAction
	local draggable = p1.integration.integration.draggable or false
	local var8 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		return function()
			-- upvalues: var8 (copy)
			if var8.current then
				var8.current:Disconnect()
				var8.current = nil
			end
		end
	end, {})
	local _ = nil
	local _ = nil
	
	if secondaryAction then
		local var9, var10 = useTimeHysteresisModule(0.05, 0.15, 0.35)
		var4 = var9
		var5 = var10
	else
		local var11, var12 = useTimeHysteresisModule(0.6, 0.65, 0.7)
		var4 = var11
		var5 = var12
	end
	local var13, var14 = useTimeHysteresisModule(0, 0, 0.65)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = useTimeHysteresisModule(0, 1)
	local var19 = if isInExperienceUIVREnabled then isSpatial() else nil
	local var20 = false
	
	if isInExperienceUIVREnabled and var19 and (not (if isInExperienceUIVREnabled then useObservableValueModule(serviceModule:getTopBarVisibiity()) else nil) and not (if isInExperienceUIVREnabled and var2 then useObservableValueModule(var2) else nil)) then
		var20 = true
		draggable = draggable and not var20
	end
	local var21
	local var22 = reactModule.useCallback(function(p2, p3)
		-- upvalues: isInExperienceUIVREnabled (copy), var20 (write), controlState (copy), serviceModule (copy), p1 (ref), var5 (write), var13 (ref), var18 (ref)
		if isInExperienceUIVREnabled and var20 then return end
		if p3 == controlState.Selected and (p2 == controlState.Default or p2 == controlState.Hover) then
			serviceModule:setSelected(p1.integration.id)
		elseif p3 == controlState.Selected and p2 == controlState.Default then
			serviceModule:setSelected(p1.integration.id)
		end
		local var23 = p3 ~= controlState.Default
		p1.setHovered(var23)
		local var24 = p3 == controlState.Hover
		var5(var24, if var24 then var13 else areTooltipsDisplaying())
		
		if var24 then
			serviceModule:onIntegrationHovered():fire(p1.integration.id)
		end
		if not var23 then
			var18(false)
		end
	end, if isInExperienceUIVREnabled then {
		p1.setHovered, var5, var18, var13, var19, var20
	} else { p1.setHovered, var5, var18, var13 })
	local var23 = reactModule.useCallback(function(_, p2)
		-- upvalues: draggable (write), var18 (ref), chromeAnalyticsModule (copy), p1 (ref), var8 (ref), userInputService (copy), shouldRejectMultiTouchModule (copy), serviceModule (copy), constantsModule (copy)
		if not draggable then return end
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
			local position = p2.Position
			var18(true, true)
			chromeAnalyticsModule.default:onIconTouchBegan(p1.integration.id)
			
			if not var8.current then
				var8.current = userInputService.InputChanged:Connect(function(p3, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), p2 (ref), serviceModule (copy), p1 (copy), var8 (copy), position (ref), constantsModule (copy), chromeAnalyticsModule (copy)
					if shouldRejectMultiTouchModule(p2, p3) then return end
					if serviceModule:isWindowOpen(p1.integration.id) or not var8.current then return end
					if constantsModule.DRAG_MAGNITUDE_THRESHOLD < math.abs((position - p3.Position).Magnitude) then
						chromeAnalyticsModule.default:onIconDrag(p1.integration.id)
						serviceModule:storeChromeInteracted()
						serviceModule:toggleWindow(p1.integration.id)
						serviceModule:gesture(p1.integration.id, var8, p2)
					end
				end)
			end
		end
	end, { draggable })
	local var24 = reactModule.useCallback(function(_, p2)
		-- upvalues: draggable (write), var18 (ref), var8 (ref), serviceModule (copy), p1 (ref)
		if not draggable then return end
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
			var18(false)
			
			if var8.current then
				var8.current:Disconnect()
				var8.current = nil
				serviceModule:gesture(p1.integration.id, nil)
			end
		end
	end, { draggable })
	
	if not var4 and not var13 then
		var21 = var15 and not var17
	end
	if isInExperienceUIVREnabled and var21 and var20 then
		var21 = false
	end
	logTooltipState(p1.integration.id, var21)
	local var25 = if fFlagEnableConsoleExpControls then reactModule.useContext(var3) else nil
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), reactModule (copy), interactable (copy), constantsModule (copy), p1 (ref), var6 (write), var22 (ref), var7 (ref), fFlagUnibarMenuOpenHamburger (copy), fFlagUnibarMenuOpenSubmenu (copy), useCursor (copy), foundationModule (copy), var21 (write), secondaryAction (ref), var25 (ref), var23 (ref), var24 (ref), isInExperienceUIVREnabled (copy), var19 (ref), var20 (write), var18 (ref), var8 (ref)
		return reactModule.createElement(interactable, {
			Name = (if fFlagEnableConsoleExpControls then constantsModule.ICON_NAME_PREFIX else "IconHitArea_") .. p8.integration.id,
			Size = var6,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			onStateChanged = var22,
			ref = var7,
			SelectionOrder = if fFlagUnibarMenuOpenHamburger or fFlagUnibarMenuOpenSubmenu then p1.integration.order else 100 - p1.integration.order,
			Position = p1.isCurrentlyOpenSubMenu:map(function(p3)
				-- upvalues: fFlagEnableConsoleExpControls (copy)
				return UDim2.new(0.5, 0, 0.5, if fFlagEnableConsoleExpControls or not p3 then 0 else 1)
			end),
			SelectionImageObject = useCursor(foundationModule.Enums.CursorType.SkinToneCircle),
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = p1.isCurrentlyOpenSubMenu:map(function(p3)
				-- upvalues: var21 (copy), secondaryAction (copy)
				return if var21 and secondaryAction or p3 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
			end),
			NextSelectionLeft = if fFlagEnableConsoleExpControls and p1.integration.id == (if fFlagEnableConsoleExpControls then serviceModule:menuList():get()[1].id else nil) then var25.menuIconRef else nil,
			[reactModule.Change.AbsolutePosition] = p2,
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Event.InputBegan] = var23,
			[reactModule.Event.InputEnded] = var24,
			[reactModule.Event.Activated] = function()
				-- upvalues: isInExperienceUIVREnabled (copy), var19 (copy), var20 (copy), serviceModule (copy), var18 (copy), p1 (copy), var8 (copy)
				if isInExperienceUIVREnabled and var19 then
					if var20 then return end
					serviceModule:onTriggerVRToggleButton():fire(true)
				end
				var18(true, true)
				p1.integration.activated()
				
				if var8.current then
					var8.current:Disconnect()
					var8.current = nil
					serviceModule:gesture(p1.integration.id, nil)
				end
			end
		}, {
			corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end, {
		var22, var5, var18, var23, var24, p1.isCurrentlyOpenSubMenu, var21,
		secondaryAction, if isInExperienceUIVREnabled then var20 else nil,
		if fFlagEnableConsoleExpControls then var25.menuIconRef else nil
	})
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref), var14 (ref)
		local mouseEnterConnection = nil
		local mouseLeaveConnection = nil
		local destroyingConnection = nil
		
		local var29 = function()
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
		
		if p2 ~= var27.current then
			pcall(var29)
			
			if p2 then
				mouseEnterConnection = p2.MouseEnter:Connect(function()
					-- upvalues: var14 (copy)
					var14(true, true)
				end)
				mouseLeaveConnection = p2.MouseLeave:Connect(function()
					-- upvalues: var14 (copy)
					var14(false)
				end)
				destroyingConnection = p2.Destroying:Connect(function()
					-- upvalues: var14 (copy)
					var14(false)
				end)
			end
			var27.current = p2
		end
	end, { var14 })
	local var29 = if secondaryAction then {
		text = secondaryAction.label,
		onStateChanged = function(_, p2)
			-- upvalues: controlState (copy), var16 (ref)
			if p2 == controlState.Selected then
				var16(true)
				
				return
			end
			var16(false)
		end,
		onActivated = function()
			-- upvalues: secondaryAction (ref), p1 (ref)
			secondaryAction.activated(p1.integration)
		end,
		NextSelectionUp = var7,
		NextSelectionLeft = var7,
		NextSelectionRight = var7,
		NextSelectionDown = var7
	} else nil
	
	if not isInExperienceUIVREnabled or not var19 then
		return withTooltip({
			headerText = p1.integration.integration.label,
			hotkeyCodes = p1.integration.integration.hotkeyCodes,
			textAlignment = Enum.TextXAlignment.Left,
			buttonProps = var29,
			ref = if secondaryAction then var28 else nil
		}, {
			DisplayOrder = 10,
			active = var21,
			guiTarget = coreGuiService
		}, var26)
	end
	local var30, var31 = reactModule.useBinding(Vector2.zero)
	local var32, var33 = reactModule.useBinding(Vector2.zero)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		VRSpatialTooltip = if var21 and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
			panelType = panelType.ToolTipsContainer,
			renderFunction = function(p2)
				-- upvalues: var30 (ref), var32 (ref), SPATIAL_TOOLTIP_SPACING (copy), reactModule (copy), tooltipCallout (copy), p1 (ref), tooltipOrientation (copy), var29 (ref), secondaryAction (ref), var28 (ref)
				return reactModule.createElement(tooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p1.integration.integration.label,
					orientation = tooltipOrientation.Top,
					triggerPointCenter = Vector2.new(var30:getValue().X + var32:getValue().X / 2, p2.Y - SPATIAL_TOOLTIP_SPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero,
					buttonProps = var29,
					ref = if secondaryAction then var28 else nil
				})
			end
		}) else nil,
		var26(reactModule.useCallback(function(p2)
			-- upvalues: var31 (ref), var33 (ref)
			var31(p2.AbsolutePosition)
			var33(p2.AbsoluteSize)
		end, { var31, var33 }))
	})
end

function IconHost(p1)
	-- upvalues: reactModule (ref), useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useMappedObservableValueBindingModule (ref), serviceModule (ref), chatNotificationBadgeModule (ref), fFlagEnableConsoleExpControls (ref), fFlagEnableWhatsNew (ref), var1 (ref)
	if not p1.integration or not p1.integration.component then
		warn("IconHost has no component to render")
	end
	local var4, var5 = reactModule.useBinding(false)
	local var6, var7 = reactModule.useBinding(true)
	local _ = nil
	local backgroundOnHover = useStyle().Theme.BackgroundOnHover
	local var8 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_CELL_WIDTH else constantsModule.ICON_CELL_WIDTH
	local var9 = useMappedObservableValueBindingModule(serviceModule:currentSubMenu(), function(p2)
		-- upvalues: p1 (ref)
		return p2 == p1.integration.id
	end)
	local list = {
		reactModule.createElement("Frame", {
			Name = "IntegrationIconFrame",
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = var6
		}, {
			IntegrationIcon = p1.integration and (p1.integration.component and (p1.integration.component(p1) or nil)),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			})
		}),
		if p1.integration.integration.flashNotificationSource then reactModule.createElement(NotificationIndicator, { integration = p1.integration, setIconVisible = var7 }) else nil,
		reactModule.createElement(HighlightCircle, {
			name = "SelectedHighlighter",
			color = backgroundOnHover,
			visible = var9
		}),
		reactModule.createElement(HighlightCircle, {
			name = "Highlighter",
			color = backgroundOnHover,
			visible = var4
		}),
		if p1.integration.id == "chat" then reactModule.createElement(chatNotificationBadgeModule, {
			iconHostProps = p1,
			NotificationBadge = NotificationBadge
		}) else reactModule.createElement(NotificationBadge, p1),
		if p1.disableButtonBehaviors then nil else reactModule.createElement(TooltipButton, {
			integration = p1.integration,
			setHovered = var5,
			isCurrentlyOpenSubMenu = var9
		})
	}
	local t = {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var8, 0, var8),
		LayoutOrder = p1.integration.order,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = if fFlagEnableConsoleExpControls then nil else p1.integration.order
	}
	
	return if fFlagEnableWhatsNew then reactModule.createElement("Frame", t, {
		WhatsNewAnchor = reactModule.createElement(var1, { tag = "size-full", anchorId = p1.integration.id }, list)
	}) else reactModule.createElement("Frame", t, list)
end

return IconHost