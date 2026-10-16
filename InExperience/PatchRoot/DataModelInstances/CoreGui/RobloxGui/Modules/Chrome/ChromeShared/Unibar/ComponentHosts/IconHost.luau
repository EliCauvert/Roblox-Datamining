local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagEnableWhatsNew = SharedFlagsModule.FFlagEnableWhatsNew
local WhatsNewAnchor = if FFlagEnableWhatsNew then require(CorePackages.Workspace.Packages.WhatsNew).WhatsNewAnchor else nil
local FlagsModule = require(script.Parent.Parent.Parent.Parent.Flags)
local FFlagUnibarMenuOpenHamburger = FlagsModule.FFlagUnibarMenuOpenHamburger
local FFlagUnibarMenuOpenSubmenu = FlagsModule.FFlagUnibarMenuOpenSubmenu
local FlagsModule1 = require(ChromeShared.Flags)
local FFlagChromeNineDotActivityIndicator = FlagsModule1.FFlagChromeNineDotActivityIndicator
local FFlagTokenizeUnibarConstantsWithStyleProvider = FlagsModule1.FFlagTokenizeUnibarConstantsWithStyleProvider
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local ServiceModule = require(ChromeShared.Service)
local ChromeAnalyticsModule = require(ChromeShared.Analytics.ChromeAnalytics)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)
local UseMappedObservableValueBindingModule = require(ChromeShared.Hooks.useMappedObservableValueBinding)
local UseTimeHysteresisModule = require(ChromeShared.Hooks.useTimeHysteresis)
local ShouldRejectMultiTouchModule = require(ChromeShared.Utility.shouldRejectMultiTouch)
local ChatNotificationBadgeModule = require(script.Parent.ChatNotificationBadge)
local NineDotActivityIndicatorModule = require(script.Parent.NineDotActivityIndicator)
local NineDotNotificationBadgeModule = require(script.Parent.NineDotNotificationBadge)
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local IsSpatialFunction = nil
local Panel3DInSpatialUI = nil
local PanelType = nil
local TooltipOrientation = nil
local TooltipCallout = nil
local SPATIALTOOLTIPSPACING = nil
local NewResult = nil

if IsInExperienceUIVREnabled then
	IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	Panel3DInSpatialUI = VrSpatialUiModule.Panel3DInSpatialUI
	PanelType = VrSpatialUiModule.Constants.PanelType
	TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
	TooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
	SPATIALTOOLTIPSPACING = VrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING
	local MappedSignal = require(ChromeShared.Service.ChromeUtils).MappedSignal
	local BottomBarVisibility = VrSpatialUiModule.UIManager.getInstance():getBottomBarVisibility()
	
	if BottomBarVisibility and IsSpatialFunction() then
		NewResult = MappedSignal.new(BottomBarVisibility, function() --[[ Line: 76 ]]
			-- upvalues: BottomBarVisibility (copy)
			return BottomBarVisibility:get()
		end)
	end
end
local MenuIconContextModule = if FFlagEnableConsoleExpControls then require(ChromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local t = {}

function areTooltipsDisplaying(): boolean --[[ Line: 97 ]]
	-- upvalues: t (copy)
	local CurrentTime = tick()
	
	for _, value in t do
		if value.displaying or CurrentTime - value.time < 0.15 then
			return true
		end
	end
	return false
end

function logTooltipState(Key, Displaying) --[[ Line: 109 ]]
	-- upvalues: t (copy)
	if not t[Key] or t[Key].displaying ~= Displaying then
		t[Key] = { displaying = Displaying, time = tick() }
	end
end

function NotificationBadge(p1) --[[ Line: 129 ]]
	-- upvalues: ReactModule (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), FFlagChromeNineDotActivityIndicator (copy), NineDotActivityIndicatorModule (copy)
	if not p1.integration then
		return nil
	end
	local UseBindingResult2 = nil
	local UseStateResult2 = nil
	local Notification = p1.integration.integration and p1.integration.integration.notification or nil
	local UseBindingResult
	UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Notification and Notification:get().value or 0)
	local UseStateResult
	UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: Notification (copy), UseStateResult2 (ref), UseBindingResult2 (ref)
		if not Notification then return end
		local Connection = Notification:connect(function() --[[ Line: 146 ]]
			-- upvalues: Notification (upval), UseStateResult2 (upval), UseBindingResult2 (upval)
			local Value = Notification:get().value or 0
			UseStateResult2(Value > 0)
			UseBindingResult2(Value)
		end)
		
		return function() --[[ Line: 151 ]]
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1.integration.integration.id })
	local ICONBADGEOFFSETX = nil
	local ICONBADGEOFFSETY = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		ICONBADGEOFFSETX = UseResult.ICON_BADGE_OFFSET_X
		ICONBADGEOFFSETY = UseResult.ICON_BADGE_OFFSET_Y
	else
		ICONBADGEOFFSETX = ConstantsModule.ICON_BADGE_OFFSET_X
		ICONBADGEOFFSETY = ConstantsModule.ICON_BADGE_OFFSET_Y
	end
	local MinBadgeCount = p1.minBadgeCount or 0
	local UseStateResult1 = UseStateResult or MinBadgeCount > 0
	local MapResult = UseBindingResult:map(function(p2: number): number --[[ Line: 172 ]]
		-- upvalues: MinBadgeCount (copy)
		return (math.min(math.max(p2, MinBadgeCount), 99))
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		Visible = p1.toggleTransition and p1.toggleTransition:map(function(_): boolean --[[ Line: 179 ]]
			return true
		end) or true
	}, {
		Badge = if UseStateResult1 then ReactModule.createElement(StatusIndicator, {
			value = MapResult,
			variant = StatusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, ICONBADGEOFFSETX, 0, ICONBADGEOFFSETY)
		}) else nil,
		ActivityIndicator = if FFlagChromeNineDotActivityIndicator and p1.integration.id == "nine_dot" then ReactModule.createElement(NineDotActivityIndicatorModule, {
			hasNotificationBadge = UseStateResult1,
			position = UDim2.new(0, ICONBADGEOFFSETX, 0, ICONBADGEOFFSETY),
			visible = p1.showNineDotActivityIndicator == true
		}) else nil
	})
end

function NotificationIndicator(p1) --[[ Line: 213 ]]
	-- upvalues: UseObservableValueModule (copy), ServiceModule (copy), ReactModule (copy)
	local UseObservableValueModuleResult = UseObservableValueModule(ServiceModule:notificationIndicator())
	p1.setIconVisible(not UseObservableValueModuleResult)
	
	return (ReactModule.createElement("Frame", {
		Name = "NotificationIndicatorFrame",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		IntegrationIcon = UseObservableValueModuleResult and UseObservableValueModuleResult.component(p1) or nil,
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		})
	}))
end

function HighlightCircle(p1) --[[ Line: 232 ]]
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Name = p1.name or "Highlighter",
		Size = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_HIGHLIGHT_SIZE else ConstantsModule.ICON_HIGHLIGHT_SIZE,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = p1.color.Color,
		BackgroundTransparency = p1.color.Transparency,
		Visible = p1.visible
	}, {
		corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

function TooltipButton(p1) --[[ Line: 262 ]]
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), UseTimeHysteresisModule (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), UseObservableValueModule (copy), ServiceModule (copy), NewResult (ref), ControlState (copy), ChromeAnalyticsModule (copy), UserInputService (copy), ShouldRejectMultiTouchModule (copy), FFlagEnableConsoleExpControls (copy), MenuIconContextModule (copy), Interactable (copy), FFlagUnibarMenuOpenHamburger (copy), FFlagUnibarMenuOpenSubmenu (copy), UseCursorFunction (copy), FoundationModule (copy), Panel3DInSpatialUI (ref), PanelType (ref), SPATIALTOOLTIPSPACING (ref), TooltipCallout (ref), TooltipOrientation (ref), WithTooltipFunction (copy), CoreGui (copy)
	local ICONHIGHLIGHTSIZE = nil
	ICONHIGHLIGHTSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_HIGHLIGHT_SIZE else ConstantsModule.ICON_HIGHLIGHT_SIZE
	local UseRefResult = ReactModule.useRef(nil)
	local SecondaryAction = p1.integration.integration.secondaryAction
	local Draggable = p1.integration.integration.draggable or false
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 278 ]]
		-- upvalues: UseRefResult1 (copy)
		return function() --[[ Line: 279 ]]
			-- upvalues: UseRefResult1 (upval)
			if UseRefResult1.current then
				UseRefResult1.current:Disconnect()
				UseRefResult1.current = nil
			end
		end
	end, {})
	local UseTimeHysteresisModuleResult2 = nil
	local UseTimeHysteresisModuleResult = nil
	
	if SecondaryAction then
		UseTimeHysteresisModuleResult, UseTimeHysteresisModuleResult2 = UseTimeHysteresisModule(0.05, 0.15, 0.35)
	else
		UseTimeHysteresisModuleResult, UseTimeHysteresisModuleResult2 = UseTimeHysteresisModule(0.6, 0.65, 0.7)
	end
	local UseTimeHysteresisModuleResult1, UseTimeHysteresisModuleResult2_1 = UseTimeHysteresisModule(0, 0, 0.65)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTimeHysteresisModuleResult3, UseTimeHysteresisModuleResult2_2 = UseTimeHysteresisModule(0, 1)
	local IsSpatial = if IsInExperienceUIVREnabled then IsSpatialFunction() else nil
	local UseObservableValueModuleResult = if IsInExperienceUIVREnabled then UseObservableValueModule(ServiceModule:getTopBarVisibiity()) else nil
	local UseObservableValueModuleResult1 = if IsInExperienceUIVREnabled and NewResult then UseObservableValueModule(NewResult) else nil
	local Flag = false
	
	if IsInExperienceUIVREnabled and IsSpatial and not UseObservableValueModuleResult and not UseObservableValueModuleResult1 then
		Flag = true
		Draggable = Draggable and not Flag
	end
	local UseResult = ReactModule.useCallback(function(Default, Default1) --[[ Line: 317 ]]
		-- upvalues: IsInExperienceUIVREnabled (upval), Flag (ref), ControlState (upval), ServiceModule (upval), p1 (copy), UseTimeHysteresisModuleResult2 (ref), UseTimeHysteresisModuleResult1 (copy), UseTimeHysteresisModuleResult2_2 (copy)
		if IsInExperienceUIVREnabled and Flag then return end
		if Default1 == ControlState.Selected and (Default == ControlState.Default or Default == ControlState.Hover) then
			ServiceModule:setSelected(p1.integration.id)
		elseif Default1 == ControlState.Selected and Default == ControlState.Default then
			ServiceModule:setSelected(p1.integration.id)
		end
		local IsNotDefaultMatch = Default1 ~= ControlState.Default
		p1.setHovered(IsNotDefaultMatch)
		local IsDefaultMatch = Default1 == ControlState.Hover
		UseTimeHysteresisModuleResult2(IsDefaultMatch, IsDefaultMatch and UseTimeHysteresisModuleResult1 or areTooltipsDisplaying())
		
		if IsDefaultMatch then
			ServiceModule:onIntegrationHovered():fire(p1.integration.id)
		end
		if not IsNotDefaultMatch then
			UseTimeHysteresisModuleResult2_2(false)
		end
	end, if IsInExperienceUIVREnabled then {
		p1.setHovered, UseTimeHysteresisModuleResult2,
		UseTimeHysteresisModuleResult2_2, UseTimeHysteresisModuleResult1, IsSpatial,
		Flag
	} else {
		p1.setHovered,
		UseTimeHysteresisModuleResult2,
		UseTimeHysteresisModuleResult2_2,
		UseTimeHysteresisModuleResult1
	})
	local UseResult1 = ReactModule.useCallback(function(_, Input) --[[ Line: 353 ]]
		-- upvalues: Draggable (ref), UseTimeHysteresisModuleResult2_2 (copy), ChromeAnalyticsModule (upval), p1 (copy), UseRefResult1 (copy), UserInputService (upval), ShouldRejectMultiTouchModule (upval), ServiceModule (upval), ConstantsModule (upval)
		if not Draggable then return end
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			local Position = Input.Position
			UseTimeHysteresisModuleResult2_2(true, true)
			ChromeAnalyticsModule.default:onIconTouchBegan(p1.integration.id)
			
			if not UseRefResult1.current then
				UseRefResult1.current = UserInputService.InputChanged:Connect(function(Input1, _) --[[ Line: 366 ]]
					-- upvalues: ShouldRejectMultiTouchModule (upval), Input (copy), ServiceModule (upval), p1 (upval), UseRefResult1 (upval), Position (copy), ConstantsModule (upval), ChromeAnalyticsModule (upval)
					if ShouldRejectMultiTouchModule(Input, Input1) then return end
					if ServiceModule:isWindowOpen(p1.integration.id) or not UseRefResult1.current then return end
					if ConstantsModule.DRAG_MAGNITUDE_THRESHOLD < math.abs((Position - Input1.Position).Magnitude) then
						ChromeAnalyticsModule.default:onIconDrag(p1.integration.id)
						ServiceModule:storeChromeInteracted()
						ServiceModule:toggleWindow(p1.integration.id)
						ServiceModule:gesture(p1.integration.id, UseRefResult1, Input)
					end
				end)
			end
		end
	end, { Draggable })
	local UseResult2 = ReactModule.useCallback(function(_, Input) --[[ Line: 392 ]]
		-- upvalues: Draggable (ref), UseTimeHysteresisModuleResult2_2 (copy), UseRefResult1 (copy), ServiceModule (upval), p1 (copy)
		if not Draggable then return end
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			UseTimeHysteresisModuleResult2_2(false)
			
			if UseRefResult1.current then
				UseRefResult1.current:Disconnect()
				UseRefResult1.current = nil
				ServiceModule:gesture(p1.integration.id, nil)
			end
		end
	end, { Draggable })
	local NoUseTimeHysteresisModuleResult3: boolean = if UseTimeHysteresisModuleResult or UseTimeHysteresisModuleResult1 then not UseTimeHysteresisModuleResult3 else UseStateResult and not UseTimeHysteresisModuleResult3
	
	if IsInExperienceUIVREnabled and NoUseTimeHysteresisModuleResult3 and Flag then
		NoUseTimeHysteresisModuleResult3 = false
	end
	logTooltipState(p1.integration.id, NoUseTimeHysteresisModuleResult3)
	local UseContextResult = if FFlagEnableConsoleExpControls then ReactModule.useContext(MenuIconContextModule) else nil
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 420 ]]
		-- upvalues: FFlagEnableConsoleExpControls (upval), ServiceModule (upval), ReactModule (upval), Interactable (upval), ConstantsModule (upval), p1 (copy), ICONHIGHLIGHTSIZE (ref), UseResult (copy), UseRefResult (copy), FFlagUnibarMenuOpenHamburger (upval), FFlagUnibarMenuOpenSubmenu (upval), UseCursorFunction (upval), FoundationModule (upval), NoUseTimeHysteresisModuleResult3 (ref), SecondaryAction (copy), UseContextResult (copy), UseResult1 (copy), UseResult2 (copy), IsInExperienceUIVREnabled (upval), IsSpatial (copy), Flag (ref), UseTimeHysteresisModuleResult2_2 (copy), UseRefResult1 (copy)
		local Id = if FFlagEnableConsoleExpControls then ServiceModule:menuList():get()[1].id else nil
		
		return ReactModule.createElement(Interactable, {
			Name = (if FFlagEnableConsoleExpControls then ConstantsModule.ICON_NAME_PREFIX else "IconHitArea_") .. p1.integration.id,
			Size = ICONHIGHLIGHTSIZE,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			onStateChanged = UseResult,
			ref = UseRefResult,
			SelectionOrder = if FFlagUnibarMenuOpenHamburger or FFlagUnibarMenuOpenSubmenu then p1.integration.order else 100 - p1.integration.order,
			Position = p1.isCurrentlyOpenSubMenu:map(function(p3): UDim2 --[[ Line: 438 ]]
				-- upvalues: FFlagEnableConsoleExpControls (upval)
				return UDim2.new(0.5, 0, 0.5, if FFlagEnableConsoleExpControls or not p3 then 0 else 1)
			end),
			SelectionImageObject = UseCursorFunction(FoundationModule.Enums.CursorType.SkinToneCircle),
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = p1.isCurrentlyOpenSubMenu:map(function(p3) --[[ Line: 444 ]]
				-- upvalues: NoUseTimeHysteresisModuleResult3 (upval), SecondaryAction (upval)
				return if NoUseTimeHysteresisModuleResult3 and SecondaryAction or p3 then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop
			end),
			NextSelectionLeft = if FFlagEnableConsoleExpControls and p1.integration.id == Id then UseContextResult.menuIconRef else nil,
			[ReactModule.Change.AbsolutePosition] = p2,
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Event.InputBegan] = UseResult1,
			[ReactModule.Event.InputEnded] = UseResult2,
			[ReactModule.Event.Activated] = function() --[[ Line: 458 ]]
				-- upvalues: IsInExperienceUIVREnabled (upval), IsSpatial (upval), Flag (upval), ServiceModule (upval), UseTimeHysteresisModuleResult2_2 (upval), p1 (upval), UseRefResult1 (upval)
				if IsInExperienceUIVREnabled and IsSpatial then
					if Flag then return end
					ServiceModule:onTriggerVRToggleButton():fire(true)
				end
				UseTimeHysteresisModuleResult2_2(true, true)
				p1.integration.activated()
				
				if UseRefResult1.current then
					UseRefResult1.current:Disconnect()
					UseRefResult1.current = nil
					ServiceModule:gesture(p1.integration.id, nil)
				end
			end
		}, {
			corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	end, {
		UseResult, UseTimeHysteresisModuleResult2, UseTimeHysteresisModuleResult2_2,
		UseResult1, UseResult2, p1.isCurrentlyOpenSubMenu,
		NoUseTimeHysteresisModuleResult3, SecondaryAction,
		if IsInExperienceUIVREnabled then Flag else nil,
		if FFlagEnableConsoleExpControls then UseContextResult.menuIconRef else nil
	})
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult4 = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 495 ]]
		-- upvalues: UseRefResult2 (copy), UseTimeHysteresisModuleResult2_1 (copy)
		local MouseEnterConnection = nil
		local MouseLeaveConnection = nil
		local DestroyingConnection = nil
		
		local function v100() --[[ Line: 502 ]]
			-- upvalues: MouseEnterConnection (ref), MouseLeaveConnection (ref), DestroyingConnection (ref)
			if MouseEnterConnection then
				MouseEnterConnection:disconnect()
				MouseEnterConnection = nil
			end
			if MouseLeaveConnection then
				MouseLeaveConnection:disconnect()
				MouseLeaveConnection = nil
			end
			if DestroyingConnection then
				DestroyingConnection:disconnect()
				DestroyingConnection = nil
			end
		end
		
		if Frame ~= UseRefResult2.current then
			pcall(v100)
			
			if Frame then
				MouseEnterConnection = Frame.MouseEnter:Connect(function() --[[ Line: 520 ]]
					-- upvalues: UseTimeHysteresisModuleResult2_1 (upval)
					UseTimeHysteresisModuleResult2_1(true, true)
				end)
				MouseLeaveConnection = Frame.MouseLeave:Connect(function() --[[ Line: 523 ]]
					-- upvalues: UseTimeHysteresisModuleResult2_1 (upval)
					UseTimeHysteresisModuleResult2_1(false)
				end)
				DestroyingConnection = Frame.Destroying:Connect(function() --[[ Line: 526 ]]
					-- upvalues: UseTimeHysteresisModuleResult2_1 (upval)
					UseTimeHysteresisModuleResult2_1(false)
				end)
			end
			UseRefResult2.current = Frame
		end
	end, { UseTimeHysteresisModuleResult2_1 })
	local Config = if SecondaryAction then {
		text = SecondaryAction.label,
		onStateChanged = function(_, p2) --[[ Line: 537 ]]
			-- upvalues: ControlState (upval), UseStateResult2 (copy)
			if p2 == ControlState.Selected then
				UseStateResult2(true)
				
				return
			else
				UseStateResult2(false)
			end
		end,
		onActivated = function() --[[ Line: 544 ]]
			-- upvalues: SecondaryAction (copy), p1 (copy)
			SecondaryAction.activated(p1.integration)
		end,
		NextSelectionUp = UseRefResult,
		NextSelectionLeft = UseRefResult,
		NextSelectionRight = UseRefResult,
		NextSelectionDown = UseRefResult
	} else nil
	
	if IsInExperienceUIVREnabled and IsSpatial then
		local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
		local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.zero)
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			VRSpatialTooltip = if NoUseTimeHysteresisModuleResult3 and Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
				panelType = PanelType.ToolTipsContainer,
				renderFunction = function(p2) --[[ Line: 570 ]]
					-- upvalues: UseBindingResult (copy), UseBindingResult1 (copy), SPATIALTOOLTIPSPACING (upval), ReactModule (upval), TooltipCallout (upval), p1 (copy), TooltipOrientation (upval), Config (copy), SecondaryAction (copy), UseResult4 (copy)
					return ReactModule.createElement(TooltipCallout, {
						distanceOffset = 0,
						textAlignment = Enum.TextXAlignment.Center,
						headerText = p1.integration.integration.label,
						orientation = TooltipOrientation.Top,
						triggerPointCenter = Vector2.new(UseBindingResult:getValue().X + UseBindingResult1:getValue().X / 2, p2.Y - SPATIALTOOLTIPSPACING),
						contentOffsetVector = Vector2.zero,
						triggerPointRadius = Vector2.zero,
						buttonProps = Config,
						ref = if SecondaryAction then UseResult4 else nil
					})
				end
			}) else nil,
			UseResult3((ReactModule.useCallback(function(Frame: Frame) --[[ Line: 558 ]]
				-- upvalues: UseBindingResult2 (copy), UseBindingResult2_1 (copy)
				UseBindingResult2(Frame.AbsolutePosition)
				UseBindingResult2_1(Frame.AbsoluteSize)
			end, { UseBindingResult2, UseBindingResult2_1 })))
		})
	else
		return WithTooltipFunction({
			headerText = p1.integration.integration.label,
			hotkeyCodes = p1.integration.integration.hotkeyCodes,
			textAlignment = Enum.TextXAlignment.Left,
			buttonProps = Config,
			ref = if SecondaryAction then UseResult4 else nil
		}, {
			DisplayOrder = 10,
			active = NoUseTimeHysteresisModuleResult3,
			guiTarget = CoreGui
		}, UseResult3)
	end
end

function IconHost(IconHostProps) --[[ Line: 609 ]]
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), UseMappedObservableValueBindingModule (copy), ServiceModule (copy), ChatNotificationBadgeModule (copy), FFlagChromeNineDotActivityIndicator (copy), NineDotNotificationBadgeModule (copy), FFlagEnableConsoleExpControls (copy), FFlagEnableWhatsNew (copy), WhatsNewAnchor (copy)
	if not IconHostProps.integration or not IconHostProps.integration.component then
		warn("IconHost has no component to render")
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(true)
	local BackgroundOnHover = UseStyleFunction().Theme.BackgroundOnHover
	local ICONCELLWIDTH = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_CELL_WIDTH else ConstantsModule.ICON_CELL_WIDTH
	local UseMappedObservableValueBindingModuleResult = UseMappedObservableValueBindingModule(ServiceModule:currentSubMenu(), function(Id): boolean --[[ Line: 632 ]]
		-- upvalues: IconHostProps (copy)
		return Id == IconHostProps.integration.id
	end)
	local list = {
		ReactModule.createElement("Frame", {
			Name = "IntegrationIconFrame",
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = UseBindingResult1
		}, {
			IntegrationIcon = IconHostProps.integration and IconHostProps.integration.component and IconHostProps.integration.component(IconHostProps) or nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			})
		}),
		if IconHostProps.integration.integration.flashNotificationSource then ReactModule.createElement(NotificationIndicator, {
			integration = IconHostProps.integration,
			setIconVisible = UseBindingResult2_1
		}) else nil,
		ReactModule.createElement(HighlightCircle, {
			name = "SelectedHighlighter",
			color = BackgroundOnHover,
			visible = UseMappedObservableValueBindingModuleResult
		}),
		ReactModule.createElement(HighlightCircle, {
			name = "Highlighter",
			color = BackgroundOnHover,
			visible = UseBindingResult
		}),
		if IconHostProps.integration.id == "chat" then ReactModule.createElement(ChatNotificationBadgeModule, {
			iconHostProps = IconHostProps,
			NotificationBadge = NotificationBadge
		}) elseif FFlagChromeNineDotActivityIndicator and IconHostProps.integration.id == "nine_dot" then ReactModule.createElement(NineDotNotificationBadgeModule, {
			iconHostProps = IconHostProps,
			NotificationBadge = NotificationBadge
		}) else ReactModule.createElement(NotificationBadge, IconHostProps),
		if IconHostProps.disableButtonBehaviors then nil else ReactModule.createElement(TooltipButton, {
			integration = IconHostProps.integration,
			setHovered = UseBindingResult2,
			isCurrentlyOpenSubMenu = UseMappedObservableValueBindingModuleResult
		})
	}
	local config = {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, ICONCELLWIDTH, 0, ICONCELLWIDTH),
		LayoutOrder = IconHostProps.integration.order,
		Position = IconHostProps.position,
		Visible = IconHostProps.visible,
		ZIndex = if FFlagEnableConsoleExpControls then nil else IconHostProps.integration.order
	}
	
	return if FFlagEnableWhatsNew then ReactModule.createElement("Frame", config, {
		WhatsNewAnchor = ReactModule.createElement(WhatsNewAnchor, {
			tag = "size-full",
			anchorId = IconHostProps.integration.id
		}, list)
	}) else ReactModule.createElement("Frame", config, list)
end

return IconHost