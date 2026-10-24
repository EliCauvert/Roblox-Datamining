local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("PeekView").Parent
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RunService = game:GetService("RunService")
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local RoactGamepadModule = require(Parent.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(Parent.RoactRodux)
local PeekViewStateModule = require(script.Parent.PeekViewState)
local ScrimModule = require(script.Parent.Scrim)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection
local ArgCheckModule = require(Parent.ArgCheck)
local InputTypeConstants = require(Parent.InputType).InputTypeConstants
local GamepadUtils = require(Parent.InputUi).Gamepad.GamepadUtils
local GetInputGroupFunction = require(Parent.InputType).getInputGroup
local PeekViewDismissedEventModule = require(script.Parent.analytics.peekViewDismissedEvent)
local NewResult = require(Parent.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local SwitchAccountScrimErrorFunction = require(Parent.UiShellEvents).switchAccountScrimError
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local UsePeekViewFocusNavigationBindingsModule = require(script.Parent.usePeekViewFocusNavigationBindings)
local GetFFlagEnablePeekViewStateOnMountParamFunction = require(Parent.SharedFlags).GetFFlagEnablePeekViewStateOnMountParam
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagProfilePlatformPeekDraggerContrast = require(Parent.SharedFlags).FFlagProfilePlatformPeekDraggerContrast
local EnableFastScrollingFixTest = game:DefineFastFlag("EnableFastScrollingFixTest", false)
local GetFFlagPreventSuperBriefPeekViewCloseFunction = require(Parent.SharedFlags).GetFFlagPreventSuperBriefPeekViewClose
local AXMigratePeekViewToFocusNavigation = game:DefineFastFlag("AXMigratePeekViewToFocusNavigation", false)
local FixPeekViewAnimationJitter = game:DefineFastFlag("FixPeekViewAnimationJitter", false)
local FFlagPeekViewFixBriefHeightLayoutRace = require(Parent.SharedFlags).FFlagPeekViewFixBriefHeightLayoutRace
local _Rect = Rect.new(9, 9, 9, 9)
local IconsNavigationSwipe = UIBloxModule.App.ImageSet.Images["icons/navigation/swipe"]
local ScaledFIntPeekViewTransitionDelayTiming = 0.1 * require(Parent.SharedFlags).GetFIntPeekViewTransitionDelayTiming()
local Hidden = PeekViewStateModule.Hidden
local Closed = PeekViewStateModule.Closed
local SuperBrief = PeekViewStateModule.SuperBrief
local Brief = PeekViewStateModule.Brief
local Full = PeekViewStateModule.Full
local Extended = PeekViewStateModule.Extended
local PeekView = RoactModule.PureComponent:extend("PeekView")
PeekView.defaultProps = {
	superBriefViewContentHeight = nil,
	bottomDockedContainerHeight = 0,
	bottomDockedContainerContent = nil,
	hidden = false,
	showDraggerInClosedState = true,
	showDropShadow = true,
	stateOnMount = nil,
	mountAsFullView = false,
	mountAnimation = true,
	canDragFullViewToBrief = false,
	withNewThemeProvider = true,
	viewStateChanged = nil,
	briefToFullTransitionPercent = nil,
	peekHeaderClose = true,
	peekHeaderPositionYChange = nil,
	isScrollingEnabled = true,
	closeSignal = nil,
	hideDraggerInSuperBrief = false,
	minimizeToSuperBrief = false,
	customBackground = nil,
	shouldCaptureFocus = true,
	hasSolidDragger = true,
	draggerImageStyle = nil,
	briefViewContentHeight = UDim.new(0.5, 0),
	fullViewContentHeight = if AXMigratePeekViewToFocusNavigation then nil else UDim.new(1, 0),
	elasticBehavior = Enum.ElasticBehavior.Always
}

function PeekView.init(p1)
	-- upvalues: UserGameSettings (copy), Hidden (copy), GetInputGroupFunction (copy), UserInputService (copy), RoactModule (copy), UIBloxModule (copy), Closed (copy), SuperBrief (copy), Brief (copy), Full (copy), AXMigratePeekViewToFocusNavigation (copy), SwitchAccountScrimErrorFunction (copy), NewResult (copy), FixPeekViewAnimationJitter (copy), FFlagPeekViewFixBriefHeightLayoutRace (copy), EnableFastScrollingFixTest (copy), GetFFlagPreventSuperBriefPeekViewCloseFunction (copy), PeekViewStateModule (copy), InputTypeConstants (copy), PeekViewDismissedEventModule (copy), Extended (copy), ArgCheckModule (copy), RunService (copy), ScaledFIntPeekViewTransitionDelayTiming (copy), GuiService (copy)
	p1.isMounted = false
	p1.isTouched = false
	p1.isInGoToState = false
	p1.useReducedMotion = UserGameSettings.ReducedMotion
	p1.viewType = Hidden
	p1:setState({
		scrollableViewType = false,
		absoluteWindowSizeX = 0,
		absoluteWindowSizeY = 0,
		canvasGroupTransparency = 0,
		lastInputGroup = GetInputGroupFunction(UserInputService:GetLastInputType())
	})
	p1.containerFrameRef = RoactModule.createRef()
	p1.clipFrameRef = RoactModule.createRef()
	p1.shadowRef = RoactModule.createRef()
	p1.fillingAreaRef = RoactModule.createRef()
	p1.swipeScrollingFrameRef = RoactModule.createRef()
	p1.bottomContainerRef = RoactModule.createRef()
	p1.transitionPercent, p1.setTransitionPercent = RoactModule.createBinding(0)
	
	function p1.onAbsoluteWindowSizeChanged(p2)
		-- upvalues: p1 (copy)
		if p2.AbsoluteWindowSize.X ~= p1.state.absoluteWindowSizeX or p2.AbsoluteWindowSize.Y ~= p1.state.absoluteWindowSizeY then
			p1:setState({
				absoluteWindowSizeX = p2.AbsoluteWindowSize.X,
				absoluteWindowSizeY = p2.AbsoluteWindowSize.Y
			})
		end
	end
	
	function p1.withStyle(Callback)
		-- upvalues: p1 (copy), UIBloxModule (upval)
		return if p1.props.withNewThemeProvider then UIBloxModule.Style.withStyle(Callback) else Callback({
			Theme = {
				BackgroundDefault = { Transparency = 0, Color = Color3.fromRGB(35, 37, 39) },
				UIEmphasis = {
					Transparency = 0.7,
					Color = Color3.fromRGB(255, 255, 255)
				},
				DropShadow = { Transparency = 0, Color = Color3.fromRGB(0, 0, 0) }
			},
			Settings = { ReducedMotion = false }
		})
	end
	
	function p1.inputBeganCallback(Input)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if Input.UserInputType == Enum.UserInputType.Touch then
			p1.isTouched = true
			
			return
		end
	end
	
	function p1.inputEndedCallback(Input)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if Input.UserInputType == Enum.UserInputType.Touch then
			p1.isTouched = false
			p1.checkGoTo()
			
			return
		end
	end
	
	function p1.getViewSize(ViewType)
		-- upvalues: Hidden (upval), Closed (upval), SuperBrief (upval), p1 (copy), Brief (upval), Full (upval)
		if ViewType == Hidden then
			return UDim.new(0, 0)
		elseif ViewType == Closed then
			return UDim.new(0, 0)
		elseif ViewType == SuperBrief then
			if p1.props.superBriefViewContentHeight then
				local SuperBriefViewContentHeight = p1.props.superBriefViewContentHeight
				
				return UDim.new(SuperBriefViewContentHeight.Scale, SuperBriefViewContentHeight.Offset + 25)
			else
				return UDim.new(0, 0)
			end
		elseif ViewType == Brief then
			local BriefViewContentHeight = p1.props.briefViewContentHeight
			
			return UDim.new(BriefViewContentHeight.Scale, BriefViewContentHeight.Offset + 25)
		else
			return if ViewType == Full then p1.props.fullViewContentHeight else nil
		end
	end
	
	function p1.hasNilRefs(): boolean
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy)
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current
		local Current1 = p1.clipFrameRef.current
		local Current2 = p1.shadowRef.current
		local Current3 = p1.fillingAreaRef.current
		
		return not ((if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current) and (Current and (Current1 and (Current2 and Current3))))
	end
	
	function p1.reportRefStatus(CallSite, Current, Current1, Current2, Current3, Current4)
		-- upvalues: SwitchAccountScrimErrorFunction (upval), NewResult (upval)
		SwitchAccountScrimErrorFunction(NewResult, "switchAccountScrimError", {
			callSite = CallSite,
			swipeScrollingFrame = if Current then "true" else "nil",
			containerFrame = if Current1 then "true" else "nil",
			clipFrame = if Current2 then "true" else "nil",
			shadow = if Current3 then "true" else "nil",
			fillingArea = if Current4 then "true" else "nil"
		})
	end
	
	function p1.reconcileRbxInstances(CallSite)
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy)
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		local Y = Current and Current.CanvasPosition.Y or 0
		local Current1 = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current
		local Current2 = p1.clipFrameRef.current
		local Current3 = p1.shadowRef.current
		local Current4 = p1.fillingAreaRef.current
		
		if p1.hasNilRefs() then
			p1.reportRefStatus(CallSite, Current, Current1, Current2, Current3, Current4)
			
			return
		end
		local X = Current1.AbsoluteSize.X
		local Y1 = Current1.AbsoluteSize.Y
		Current2.Size = UDim2.new(0, X, 0, Y)
		Current3.Size = UDim2.new(0, X, 0, 36)
		Current2.Position = UDim2.new(0, 0, 1, -Y)
		Current3.Position = UDim2.new(0, 0, 1, -Y - 30)
		Current.Size = UDim2.new(0, X, 0, Y1)
		Current.Position = UDim2.new(0, 0, 0, -(Y1 - Y))
		Current4.Size = UDim2.new(0, X, 0, Y1)
		local Current5 = p1.bottomContainerRef.current
		
		if Current5 then
			local BottomDockedContainerHeight: number = p1.props.bottomDockedContainerHeight
			
			if 25 + BottomDockedContainerHeight < Current2.AbsoluteSize.Y then
				Current5.Active = true
				Current5.Position = UDim2.new(0, 0, 1, -BottomDockedContainerHeight)
			else
				Current5.Active = false
				Current5.Position = UDim2.new(0, 0, 1, -Current2.AbsoluteSize.Y + 25)
			end
		end
		p1.transitionCallbacks()
		
		if p1.props.peekHeaderPositionYChange then
			p1.props.peekHeaderPositionYChange(Y)
		end
	end
	
	function p1.updateSwipeScrollingFrame()
		-- upvalues: p1 (copy), AXMigratePeekViewToFocusNavigation (upval)
		local ViewSize = p1.getViewSize(p1.viewType)
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current and p1.props.swipeScrollingFrameRef.current else p1.containerFrameRef.current and p1.swipeScrollingFrameRef.current
		
		if ViewSize and Current then
			local Current1 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
			local NewY = (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current).AbsoluteSize.Y * ViewSize.Scale + ViewSize.Offset
			
			if Current1.CanvasPosition.Y ~= NewY then
				Current1.CanvasPosition = Vector2.new(0, NewY)
				
				if p1.props.peekHeaderPositionYChange then
					p1.props.peekHeaderPositionYChange(NewY)
				end
			end
		end
	end
	
	function p1.onContainerFrameAbsoluteSizeChanged()
		-- upvalues: p1 (copy), FixPeekViewAnimationJitter (upval), Hidden (upval)
		if not p1.isMounted then return end
		p1.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged")
		
		if not FixPeekViewAnimationJitter then
			p1.updateSwipeScrollingFrame()
		elseif not p1:isAnimating() or p1.viewType ~= Hidden then
			p1.updateSwipeScrollingFrame()
			
			return
		end
	end
	
	if FFlagPeekViewFixBriefHeightLayoutRace then
		function p1.onAbsoluteCanvasSizeChanged()
			-- upvalues: p1 (copy), Brief (upval), SuperBrief (upval), AXMigratePeekViewToFocusNavigation (upval)
			if not p1.isMounted or p1:isAnimating() or p1.isTouched then return end
			if p1.viewType ~= Brief and p1.viewType ~= SuperBrief then return end
			local ViewSize = p1.getViewSize(p1.viewType)
			
			if not ViewSize then return end
			local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
			local Current1 = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current
			
			if not Current or not Current1 then return end
			local NewY = Current1.AbsoluteSize.Y * ViewSize.Scale + ViewSize.Offset
			local YDelta = Current.AbsoluteCanvasSize.Y - Current.AbsoluteWindowSize.Y
			
			if Current.CanvasPosition.Y < NewY and NewY <= YDelta then
				Current.CanvasPosition = Vector2.new(0, NewY)
			end
		end
	end
	function p1.onSwipeScrollingFrameCanvasPositionChanged()
		-- upvalues: p1 (copy), AXMigratePeekViewToFocusNavigation (upval), EnableFastScrollingFixTest (upval), GetFFlagPreventSuperBriefPeekViewCloseFunction (upval), PeekViewStateModule (upval), InputTypeConstants (upval)
		if not p1.isMounted then return end
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		local Y: number = Current.CanvasPosition.Y
		
		if Y ~= math.floor(Y) then
			if not EnableFastScrollingFixTest then
				if GetFFlagPreventSuperBriefPeekViewCloseFunction() then
					local Floored = math.floor(Y + 0.5)
					
					if p1.viewType == PeekViewStateModule.SuperBrief and p1.props.minimizeToSuperBrief then
						local SuperBriefViewY = p1.getSuperBriefViewY()
						
						if SuperBriefViewY ~= nil and Floored ~= nil and Floored < SuperBriefViewY then
							Floored = SuperBriefViewY
						end
					end
					Current.CanvasPosition = Vector2.new(0, Floored)
				else
					Current.CanvasPosition = Vector2.new(0, (math.floor(Y + 0.5)))
				end
			end
			if p1.props.peekHeaderPositionYChange then
				p1.props.peekHeaderPositionYChange(Y)
			end
			if not EnableFastScrollingFixTest then return end
		end
		p1.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged")
		
		if p1.state.lastInputGroup ~= InputTypeConstants.Gamepad then
			p1.checkGoTo()
		end
	end
	
	function p1.getBriefViewY(): number
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy)
		local BriefViewContentHeight = p1.props.briefViewContentHeight
		
		return (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current.AbsoluteSize.Y else p1.containerFrameRef.current.AbsoluteSize.Y) * BriefViewContentHeight.Scale + BriefViewContentHeight.Offset + 25
	end
	
	function p1.getSuperBriefViewY(): number?
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy)
		if AXMigratePeekViewToFocusNavigation then
			if not p1.props.superBriefViewContentHeight or not p1.props.containerFrameRef:getValue() then
				return nil
			end
		elseif not p1.props.superBriefViewContentHeight or not p1.containerFrameRef:getValue() then
			return nil
		end
		local SuperBriefViewContentHeight = p1.props.superBriefViewContentHeight
		
		return (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef:getValue().AbsoluteSize.Y else p1.containerFrameRef:getValue().AbsoluteSize.Y) * SuperBriefViewContentHeight.Scale + SuperBriefViewContentHeight.Offset + 25
	end
	
	function p1.getFullViewY()
		-- upvalues: p1 (copy)
		return p1.containerFrameRef.current.AbsoluteSize.Y * p1.props.fullViewContentHeight.Scale + p1.props.fullViewContentHeight.Offset
	end
	
	function p1.transitionCallbacks()
		-- upvalues: p1 (copy), AXMigratePeekViewToFocusNavigation (upval)
		local BriefToFullTransitionPercentFunction: (any) -> () = p1.props.briefToFullTransitionPercent
		local Y = (if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current).CanvasPosition.Y
		local BriefViewY = p1.getBriefViewY()
		local FullViewY = if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()
		local FullViewYDelta = FullViewY - BriefViewY
		local YRatio = if BriefViewY < Y and Y <= FullViewY then (Y - BriefViewY) / FullViewYDelta elseif FullViewY < Y then 1 else 0
		p1.setTransitionPercent(YRatio)
		
		if BriefToFullTransitionPercentFunction then
			BriefToFullTransitionPercentFunction(YRatio)
		end
	end
	
	function p1.checkGoTo()
		-- upvalues: p1 (copy), AXMigratePeekViewToFocusNavigation (upval), PeekViewStateModule (upval)
		if p1.isInGoToState then return end
		if p1.isTouched then return end
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		
		if Current and p1.state.absoluteWindowSizeX == 0 and p1.state.absoluteWindowSizeY == 0 then return end
		local BriefViewY = p1.getBriefViewY()
		local SuperBriefViewY = p1.getSuperBriefViewY()
		local FullViewY = if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()
		
		if FullViewY < BriefViewY then return end
		if SuperBriefViewY and BriefViewY < SuperBriefViewY then return end
		if (Current.AbsoluteCanvasSize.Y or Current.CanvasSize.Y.Offset) < Current.AbsoluteWindowSize.Y + 25 + p1.props.bottomDockedContainerHeight then return end
		local Y: number = Current.ScrollVelocity.Y
		local IsYBelow = Y < 0
		local IsYAbove = Y > 0
		local Y1 = Current.CanvasPosition.Y
		local IsYMatch: boolean = p1.viewType == PeekViewStateModule.Full and Y1 == FullViewY
		
		if (p1.viewType == PeekViewStateModule.Brief and Y1 == BriefViewY or IsYMatch) and Y == 0 then return end
		if FullViewY < Y1 then
			p1:handleCurYAboveFullViewY(IsYBelow)
			
			return
		end
		if BriefViewY < Y1 and Y1 <= FullViewY then
			p1:handleCurYFromBriefToFull(Y1, Y, IsYBelow, IsYAbove)
			
			return
		end
		if SuperBriefViewY then
			if SuperBriefViewY < Y1 and Y1 <= BriefViewY then
				p1:handleCurYFromSuperBriefToBrief(Y1, SuperBriefViewY, Y, IsYBelow, IsYAbove)
				
				return
			end
			if Y1 <= SuperBriefViewY then
				p1:handleCurYFromClosedToSuperBrief(Y1, SuperBriefViewY, Y, IsYAbove, IsYBelow)
				
				return
			end
		elseif Y1 <= BriefViewY then
			p1:handleCurYFromClosedToBrief(Y1, IsYAbove, IsYBelow)
		end
	end
	
	function p1.onPeekHeaderActivated()
		-- upvalues: p1 (copy), Closed (upval), Brief (upval), Full (upval), SuperBrief (upval), PeekViewDismissedEventModule (upval)
		if p1.viewType == Closed then
			p1.goTo(Brief)
			
			return
		end
		if p1.viewType == Brief then
			p1.goTo(Full)
			
			return
		end
		if p1.viewType == SuperBrief then
			p1.goTo(Brief)
			
			return
		end
		if p1.viewType == Full then
			if p1.props.peekHeaderClose then
				p1.goTo(Closed, nil, nil, {
					dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.handleTap
				})
				
				return
			end
			p1.goTo(Brief)
		end
	end
	
	function p1.setViewType(ViewType, p2)
		-- upvalues: p1 (copy), Extended (upval), Full (upval)
		if p1.goToAnimationConnection then
			p1.goToAnimationConnection:disconnect()
			p1.goToAnimationConnection = nil
		end
		p1.isInGoToState = false
		p1.clipFrameRef.current.Active = false
		local ViewType1 = p1.viewType
		
		if ViewType1 ~= ViewType then
			p1.viewType = ViewType
			p1:setState({
				scrollableViewType = p1.viewType == Extended or p1.viewType == Full
			})
			local ViewStateChangedFunction: (any, any, any) -> () = p1.props.viewStateChanged
			
			if ViewStateChangedFunction then
				ViewStateChangedFunction(ViewType, ViewType1, p2 or {})
			end
		end
		p1.updateSwipeScrollingFrame()
	end
	
	function p1.goTo(Brief1, Enabled, UseReducedMotion, p2)
		-- upvalues: p1 (copy), ArgCheckModule (upval), AXMigratePeekViewToFocusNavigation (upval), Full (upval), Closed (upval), RunService (upval), Brief (upval), ScaledFIntPeekViewTransitionDelayTiming (upval)
		if p1.viewType == Brief1 then return end
		if ArgCheckModule.isEqual(p1.isInGoToState, false, "self.isInGoToState") then return end
		if ArgCheckModule.isEqual(p1.goToAnimationConnection, nil, "self.goToAnimationConnection") then return end
		p1.isInGoToState = true
		
		if AXMigratePeekViewToFocusNavigation then
			p1.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		else
			p1.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		end
		p1.clipFrameRef.current.Active = true
		
		if Enabled == false then
			p1.setViewType(Brief1, p2)
			
			if Brief1 == Full then
				p1:adjustScrollingFramePosition()
				
				return
			end
		else
			local CurrentTime = tick()
			
			if not UseReducedMotion then
				p1:setState({
					canvasGroupTransparency = if Brief1 == Closed then 1 else 0
				})
				p1.goToAnimationConnection = RunService.RenderStepped:Connect(function()
					-- upvalues: p1 (upval), CurrentTime (copy), Brief1 (copy), Brief (upval), ScaledFIntPeekViewTransitionDelayTiming (upval), AXMigratePeekViewToFocusNavigation (upval), ArgCheckModule (upval), p2 (copy), Full (upval)
					if not p1.isMounted then return end
					local Elapsed = tick() - CurrentTime
					
					if Brief1 ~= Brief or ScaledFIntPeekViewTransitionDelayTiming <= Elapsed then
						if AXMigratePeekViewToFocusNavigation then
							p1.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						else
							p1.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						end
						local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
						local SelfGoToViewSize = ArgCheckModule.isNotNil(p1.getViewSize(Brief1), "self.goTo.viewSize")
						local NewScale = (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current.AbsoluteSize.Y else p1.containerFrameRef.current.AbsoluteSize.Y) * SelfGoToViewSize.Scale + SelfGoToViewSize.Offset
						
						if Brief1 == Brief then
							Elapsed -= ScaledFIntPeekViewTransitionDelayTiming
						end
						if Elapsed >= 0.35 then
							p1.setViewType(Brief1, p2)
							
							if Brief1 == Full then
								p1:adjustScrollingFramePosition()
							end
							return
						else
							local Y = Current.CanvasPosition.Y
							Current.CanvasPosition = Vector2.new(0, Y + (NewScale - Y) * math.sin(Elapsed * 2.468394227820552))
						end
					end
				end)
				
				return
			end
			if Brief1 ~= Closed then
				p1.setViewType(Brief1, p2)
				
				if Brief1 == Full then
					p1:adjustScrollingFramePosition()
				end
			end
			p1:setState({
				canvasGroupTransparency = if Brief1 == Closed then 0 else 1
			})
			p1.goToAnimationConnection = RunService.RenderStepped:Connect(function()
				-- upvalues: p1 (upval), Brief1 (copy), Full (upval), CurrentTime (copy), Closed (upval), p2 (copy)
				if not p1.isMounted then return end
				if Brief1 == Full then
					p1.updateSwipeScrollingFrame()
				end
				local Elapsed = tick() - CurrentTime
				
				if Elapsed < 0.35 then
					p1:setState({
						canvasGroupTransparency = if Brief1 == Closed then Elapsed / 0.35 else 1 - Elapsed / 0.35
					})
					
					return
				end
				p1:setState({
					canvasGroupTransparency = if Brief1 == Closed then 1 else 0
				})
				p1.setViewType(Brief1, p2)
				
				if Brief1 == Full then
					p1:adjustScrollingFramePosition()
				end
			end)
		end
	end
	
	p1.selectedCoreObjectConnection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy), InputTypeConstants (upval)
		if AXMigratePeekViewToFocusNavigation then
			if p1.props.swipeScrollingFrameRef.current and p1.state.lastInputGroup == InputTypeConstants.Gamepad then
				p1:adjustScrollingFramePosition()
				
				return
			end
		elseif p1.swipeScrollingFrameRef.current and p1.state.lastInputGroup == InputTypeConstants.Gamepad then
			p1:adjustScrollingFramePosition()
		end
	end)
end

function PeekView.handleCurYAboveFullViewY(p1, p2)
	-- upvalues: Full (copy), Extended (copy)
	if p1.viewType == Full or p1.viewType == Extended then
		if p1.viewType == Full then
			p1.setViewType(Extended)
		end
		return
	elseif p2 then
		p1.goTo(Full)
		
		return
	else
		p1.setViewType(Extended)
	end
end

function PeekView.handleCurYFromBriefToFull(p1, Y, Y1: number, p2, p3)
	-- upvalues: AXMigratePeekViewToFocusNavigation (copy), Full (copy), Brief (copy), Closed (copy), PeekViewDismissedEventModule (copy), Extended (copy)
	local CanDragFullViewToBrief = p1.props.canDragFullViewToBrief
	local MinimizeToSuperBrief = p1.props.minimizeToSuperBrief
	local Value = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef:getValue() else p1.swipeScrollingFrameRef:getValue()
	local BriefViewY = p1.getBriefViewY()
	local v1 = (if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - BriefViewY
	
	if p1.viewType == Full then
		if Value.AbsoluteCanvasSize.Y - Value.AbsoluteWindowSize.Y - 1 < Y then return end
		if p3 or Y < BriefViewY + v1 * 0.8 then
			if CanDragFullViewToBrief and (not (p3 and Y1 > 500) or MinimizeToSuperBrief) then
				p1.goTo(Brief)
				
				return
			else
				p1.goTo(Closed, nil, nil, {
					dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
				})
				
				return
			end
		end
	elseif p1.viewType == Extended then
		if not p3 or Y < BriefViewY + v1 * 0.8 or Y1 > -1 then
			p1.goTo(Full)
			
			return
		end
	elseif p2 or BriefViewY + v1 * 0.2 < Y then
		p1.goTo(Full)
		
		return
	else
		p1.goTo(Brief)
	end
end

function PeekView.handleCurYFromSuperBriefToBrief(p1, Y, SuperBriefViewY, Y1: number, p2, p3)
	-- upvalues: AXMigratePeekViewToFocusNavigation (copy), Full (copy), SuperBrief (copy), Closed (copy), PeekViewDismissedEventModule (copy), Brief (copy), Extended (copy)
	local CanDragFullViewToBrief = p1.props.canDragFullViewToBrief
	local MinimizeToSuperBrief = p1.props.minimizeToSuperBrief
	local v1 = (if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - SuperBriefViewY
	
	if p1.viewType == Full then
		if not p3 and Y >= SuperBriefViewY + v1 * 0.8 then
			p1.goTo(Brief)
			
			return
		end
		if CanDragFullViewToBrief and (not (p3 and Y1 > 500) or MinimizeToSuperBrief) then
			p1.goTo(SuperBrief)
			
			return
		else
			p1.goTo(Closed, nil, nil, {
				dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		end
	elseif p1.viewType == Extended then
		if not p3 or Y < SuperBriefViewY + v1 * 0.8 or Y1 > -1 then
			p1.goTo(Brief)
			
			return
		end
	elseif p2 or SuperBriefViewY + v1 * 0.2 < Y then
		p1.goTo(Brief)
		
		return
	else
		if CanDragFullViewToBrief and (not (p3 and Y1 > 500) or MinimizeToSuperBrief) then
			p1.goTo(SuperBrief)
			
			return
		end
		p1.goTo(Closed, nil, nil, {
			dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
		})
	end
end

function PeekView.handleCurYFromClosedToSuperBrief(p1, Y, SuperBriefViewY: number, Y1: number, p2, p3)
	-- upvalues: SuperBrief (copy), Closed (copy), PeekViewDismissedEventModule (copy)
	local SuperBriefViewYDelta = SuperBriefViewY - 0
	local MinimizeToSuperBrief = p1.props.minimizeToSuperBrief
	
	if p1.viewType == SuperBrief then
		if (p2 or Y < SuperBriefViewYDelta * 0.8) and not MinimizeToSuperBrief then
			p1.goTo(Closed, nil, nil, {
				dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		else
			p1.goTo(SuperBrief)
			
			return
		end
	elseif (p2 and Y1 > 500 or not p3 and SuperBriefViewYDelta * 0.8 >= Y) and not MinimizeToSuperBrief then
		p1.goTo(Closed, nil, nil, {
			dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
		})
		
		return
	else
		p1.goTo(SuperBrief)
	end
end

function PeekView.handleCurYFromClosedToBrief(p1, Y, p2, p3)
	-- upvalues: Brief (copy), Closed (copy), PeekViewDismissedEventModule (copy)
	local BriefViewYDelta = p1.getBriefViewY() - 0
	
	if p1.viewType == Brief then
		if p2 or Y < 0 + BriefViewYDelta * 0.8 then
			p1.goTo(Closed, nil, nil, {
				dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		else
			p1.goTo(Brief)
			
			return
		end
	elseif p3 or 0 + BriefViewYDelta * 0.2 < Y then
		p1.goTo(Brief)
		
		return
	else
		p1.goTo(Closed, nil, nil, {
			dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.swipe
		})
	end
end

function PeekView.adjustScrollingFramePosition(p1)
	-- upvalues: GuiService (copy), AXMigratePeekViewToFocusNavigation (copy), Extended (copy), Full (copy), ArgCheckModule (copy)
	local SelectedCoreObject = GuiService.SelectedCoreObject
	
	if not SelectedCoreObject or not p1.props.contentFrameRef or not SelectedCoreObject:IsDescendantOf(p1.props.contentFrameRef.current) then return end
	local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
	
	if p1.viewType ~= Extended and p1.viewType ~= Full then
		Current.CanvasPosition = Vector2.new(Current.CanvasPosition.X, ArgCheckModule.isNotNil(p1.getViewSize(p1.viewType), "self.adjustScrollingFramePosition.viewSize").Offset)
		
		return
	end
	local YDelta = SelectedCoreObject.AbsolutePosition.Y - p1.props.topBarHeight
	local Y = SelectedCoreObject.AbsoluteSize.Y
	local Y1: number = Current.AbsoluteWindowSize.Y
	local YDelta1 = Y1 - (YDelta + Y)
	local Y2 = Current.CanvasPosition.Y
	
	if YDelta1 < p1.props.bottomDockedContainerHeight then
		Y2 = Y2 + p1.props.bottomDockedContainerHeight - YDelta1
	elseif YDelta + Y + (Y2 - Y1) < Y1 - p1.props.bottomDockedContainerHeight then
		Y2 = Y1
	end
	Current.CanvasPosition = Vector2.new(Current.CanvasPosition.X, (math.max(0, (math.min(Y2, (Current.AbsoluteCanvasSize.Y or Current.CanvasSize.Y.Offset) - Current.AbsoluteWindowSize.Y)))))
end

function PeekView.handleThumbstickInput(p1, p2, p3)
	-- upvalues: GamepadUtils (copy)
	local Position = p2.Position
	local Value = p1.swipeScrollingFrameRef:getValue()
	
	if p1.containerFrameRef:getValue() and Value then
		local NewY = Value.CanvasPosition.Y + p3 * -GamepadUtils.normalizeStickByDeadzone(Position).Y * 1000
		
		if p1.getFullViewY() < NewY then
			Value.CanvasPosition = Vector2.new(0, NewY)
		end
	end
end

function PeekView.renderWithStyle(p1, p2)
	-- upvalues: RoactModule (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagProfilePlatformPeekDraggerContrast (copy), AXMigratePeekViewToFocusNavigation (copy), SuperBrief (copy), ImageSetLabel (copy), IconsNavigationSwipe (copy), Focusable (copy), RoactGamepadModule (copy), FFlagPeekViewFixBriefHeightLayoutRace (copy), _Rect (copy), Brief (copy), Full (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigationUtilsModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local Prop = p1.props[RoactModule.Children]
	local BottomDockedContainerHeight: number = p1.props.bottomDockedContainerHeight
	local BottomDockedContainerContent = p1.props.bottomDockedContainerContent
	local ScrollableViewType = p1.props.thumbstickScrollEnabled and p1.state.scrollableViewType
	local Color = p2.Theme.BackgroundContrast.Color
	local NoHasSolidDragger: boolean = FFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger
	local Transparency = nil
	local DraggerImageStyleColor3 = nil
	
	if FFlagProfilePlatformPeekDraggerContrast then
		local DraggerImageStyle = p1.props.draggerImageStyle
		DraggerImageStyleColor3 = if DraggerImageStyle then DraggerImageStyle.Color3 else p2.Theme.UIEmphasis.Color
		Transparency = if DraggerImageStyle then DraggerImageStyle.Transparency else p2.Theme.UIEmphasis.Transparency
	else
		DraggerImageStyleColor3 = p2.Theme.UIEmphasis.Color
		Transparency = p2.Theme.UIEmphasis.Transparency
	end
	local function getDraggerTransparency(): number
		-- upvalues: AXMigratePeekViewToFocusNavigation (upval), p1 (copy), Transparency (ref)
		local Current = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		
		if Current then
			local BriefViewY = p1.getBriefViewY()
			
			return Transparency + math.max(0, (math.min(1, (Current.CanvasPosition.Y - BriefViewY) / ((if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - BriefViewY)))) * (1 - Transparency)
		else
			return Transparency
		end
	end
	
	local DraggerTransparency = if NoHasSolidDragger then getDraggerTransparency() else Transparency
	local TextButton = RoactModule.createElement("TextButton", {
		Text = "",
		LayoutOrder = 3,
		ZIndex = 3,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 25),
		[RoactModule.Event.Activated] = p1.onPeekHeaderActivated,
		Selectable = false
	}, {
		Dragger = if p1.props.hideDraggerInSuperBrief and p1.props.peekViewState == SuperBrief then nil else RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Active = false,
			Size = UDim2.new(0, 36, 0, 36),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = IconsNavigationSwipe,
			ImageColor3 = DraggerImageStyleColor3,
			ImageTransparency = DraggerTransparency
		})
	})
	local Element = RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[RoactModule.Ref] = p1.clipFrameRef,
		restorePreviousChildFocus = true,
		inputBindings = if AXMigratePeekViewToFocusNavigation or not ScrollableViewType then nil else {
			ScrollPeekView = RoactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick2, function(p3, p4)
				-- upvalues: p1 (copy)
				p1:handleThumbstickInput(p3, p4)
			end)
		}
	}, {
		SwipeScrollingFrame = RoactModule.createElement("ScrollingFrame", {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Selectable = false,
			CanvasSize = UDim2.fromScale(1, 0),
			Active = true,
			BackgroundTransparency = 1,
			ZIndex = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ElasticBehavior = p1.props.elasticBehavior,
			ScrollingEnabled = p1.props.isScrollingEnabled,
			[RoactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef else p1.swipeScrollingFrameRef,
			[RoactModule.Change.CanvasPosition] = p1.onSwipeScrollingFrameCanvasPositionChanged,
			[RoactModule.Change.AbsoluteWindowSize] = p1.onAbsoluteWindowSizeChanged,
			[RoactModule.Change.AbsoluteCanvasSize] = if FFlagPeekViewFixBriefHeightLayoutRace then p1.onAbsoluteCanvasSizeChanged else nil
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			FillingArea = RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Active = false,
				[RoactModule.Ref] = p1.fillingAreaRef
			}),
			BackgroundFrame = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				ZIndex = 1,
				Active = false,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BackgroundImage = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Active = false,
					Size = UDim2.new(1, 0, 0, 9999),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = _Rect,
					BackgroundColor3 = if p1.props.customBackground then p1.props.customBackground else Color
				})
			}),
			PeekHeader = if FFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger then nil else TextButton,
			ContentFrame = RoactModule.createElement(Focusable.Frame, {
				LayoutOrder = 4,
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				[RoactModule.Ref] = p1.props.contentFrameRef,
				restorePreviousChildFocus = true,
				onFocusGained = function()
					-- upvalues: p1 (copy), Brief (upval), Full (upval)
					if p1.viewType == Brief and p1.props.peekViewState ~= Full then
						p1.goTo(Full)
					end
				end
			}, if FFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger then {
				PeekHeader = TextButton,
				Content = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, Prop)
			} else Prop),
			BottomContainerPlaceHolder = BottomDockedContainerHeight > 0 and RoactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				Active = false,
				Size = UDim2.new(1, 0, 0, BottomDockedContainerHeight)
			})
		}),
		BottomContainer = BottomDockedContainerHeight > 0 and RoactModule.createElement("Frame", {
			Active = true,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, BottomDockedContainerHeight),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.bottomContainerRef
		}, BottomDockedContainerContent)
	})
	
	return RoactModule.createFragment({
		DropShadowBackground = RoactModule.createElement("Frame", {
			ZIndex = 0,
			Visible = p1.props.showDropShadow,
			[RoactModule.Ref] = p1.shadowRef
		}, {
			UIGradient = RoactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, p2.Theme.DropShadow.Color),
					ColorSequenceKeypoint.new(1, p2.Theme.DropShadow.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.7)
				})
			})
		}),
		ClipFrameContainer = if p1.props.shouldCaptureFocus then RoactModule.createElement(FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PeekView
		}, { ClipFrame = Element }) else nil,
		ClipFrame = if p1.props.shouldCaptureFocus then nil else Element,
		InputBegan = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputBegan,
			callback = p1.inputBeganCallback
		}),
		InputEnded = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputEnded,
			callback = p1.inputEndedCallback
		})
	})
end

function PeekView.render(p1)
	-- upvalues: RoactModule (copy), ScrimModule (copy), AXMigratePeekViewToFocusNavigation (copy), Closed (copy), PeekViewDismissedEventModule (copy)
	return p1.withStyle(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), ScrimModule (upval), AXMigratePeekViewToFocusNavigation (upval), Closed (upval), PeekViewDismissedEventModule (upval)
		local CanvasGroup = if p1.useReducedMotion then RoactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			GroupTransparency = p1.state.canvasGroupTransparency
		}, { p1:renderWithStyle(p2) }) else p1:renderWithStyle(p2)
		
		return if p1.props.hasScrim then RoactModule.createElement(ScrimModule, {
			[RoactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef else p1.containerFrameRef,
			onActivated = function()
				-- upvalues: p1 (upval), Closed (upval), PeekViewDismissedEventModule (upval)
				if not p1.isInGoToState then
					p1.goTo(Closed, nil, nil, {
						dismissMethod = PeekViewDismissedEventModule.dismissMethodEnum.scrimTap
					})
					
					return
				end
			end,
			onSizeChanged = p1.onContainerFrameAbsoluteSizeChanged
		}, CanvasGroup) else RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			[RoactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef else p1.containerFrameRef,
			[RoactModule.Change.AbsoluteSize] = p1.onContainerFrameAbsoluteSizeChanged
		}, CanvasGroup)
	end)
end

function PeekView.didMount(p1)
	-- upvalues: Closed (copy), GetFFlagEnablePeekViewStateOnMountParamFunction (copy), Full (copy), Brief (copy), GetInputGroupFunction (copy), UserInputService (copy)
	p1.isMounted = true
	
	if p1.props.closeSignal then
		p1.closeSignalConnection = p1.props.closeSignal:connect(function()
			-- upvalues: p1 (copy), Closed (upval)
			if not p1.isInGoToState then
				p1.goTo(Closed, true, p1.useReducedMotion)
			end
		end)
	end
	local MountAsFullView = p1.props.mountAsFullView
	local MountAnimation = p1.props.mountAnimation
	local StateOnMount = if GetFFlagEnablePeekViewStateOnMountParamFunction() then p1.props.stateOnMount else nil
	
	if not p1.props.hidden then
		if MountAsFullView then
			p1.goTo(Full, MountAnimation, p1.useReducedMotion)
		elseif StateOnMount == nil then
			p1.goTo(Brief, MountAnimation, p1.useReducedMotion)
		else
			p1.goTo(StateOnMount, MountAnimation, p1.useReducedMotion)
		end
	end
	p1:setState({
		lastInputGroup = GetInputGroupFunction(UserInputService:GetLastInputType())
	})
	UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
		-- upvalues: p1 (copy), GetInputGroupFunction (upval)
		p1:setState({ lastInputGroup = GetInputGroupFunction(LastInputType) })
	end)
end

function PeekView.isAnimating(p1): boolean
	return p1.goToAnimationConnection ~= nil
end

function PeekView.didUpdate(p1, DefaultProps, p2)
	-- upvalues: Hidden (copy), Brief (copy), Extended (copy)
	if p2.absoluteWindowSizeX ~= p1.state.absoluteWindowSizeX or p2.absoluteWindowSizeY ~= p1.state.absoluteWindowSizeY then
		p1.reconcileRbxInstances("didUpdate")
		
		if not p1:isAnimating() then
			p1.updateSwipeScrollingFrame()
		end
	end
	if DefaultProps.bottomDockedContainerHeight ~= p1.props.bottomDockedContainerHeight then
		p1.onContainerFrameAbsoluteSizeChanged()
	end
	if DefaultProps.briefViewContentHeight ~= p1.props.briefViewContentHeight and not p1:isAnimating() then
		p1.updateSwipeScrollingFrame()
	end
	if DefaultProps.hidden == false and p1.props.hidden == true then
		p1.goTo(Hidden)
	elseif DefaultProps.hidden == true and p1.props.hidden == false then
		p1.goTo(Brief)
	end
	local PeekViewState = p1.props.peekViewState
	local IsInGoToState = p1.isInGoToState
	
	if PeekViewState ~= DefaultProps.peekViewState and p1.viewType == DefaultProps.peekViewState and PeekViewState ~= Extended and not IsInGoToState then
		p1.goTo(p1.props.peekViewState)
	end
end

function PeekView.willUnmount(p1)
	p1.isMounted = false
	
	if p1.closeSignalConnection then
		p1.closeSignalConnection:disconnect()
		p1.closeSignalConnection = nil
	end
	if p1.goToAnimationConnection then
		p1.goToAnimationConnection:disconnect()
		p1.goToAnimationConnection = nil
	end
	if p1.selectedCoreObjectConnection then
		p1.selectedCoreObjectConnection:disconnect()
		p1.selectedCoreObjectConnection = nil
	end
end

local function PeekViewContainer(p1)
	-- upvalues: ReactModule (copy), GamepadUtils (copy), UsePeekViewFocusNavigationBindingsModule (copy), PeekView (ref), CryoModule (copy)
	local ScrollingFrameRef = if p1.scrollingFrameRef then p1.scrollingFrameRef else ReactModule.useRef(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local FullViewContentHeight = nil
	FullViewContentHeight = if p1.fullViewContentHeight then p1.fullViewContentHeight else UDim.new(1, 0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), FullViewContentHeight (ref)
		return UseRefResult.current.AbsoluteSize.Y * FullViewContentHeight.Scale + FullViewContentHeight.Offset
	end, { FullViewContentHeight, UseRefResult })
	UsePeekViewFocusNavigationBindingsModule((ReactModule.useCallback(function(p2, p3)
		-- upvalues: ScrollingFrameRef (ref), UseRefResult (copy), GamepadUtils (upval), UseResult (copy)
		local Position = p2.Position
		local Value = ScrollingFrameRef:getValue()
		
		if UseRefResult:getValue() and Value then
			local NewY = Value.CanvasPosition.Y + p3 * -GamepadUtils.normalizeStickByDeadzone(Position).Y * 1000
			
			if UseResult() < NewY then
				Value.CanvasPosition = Vector2.new(0, NewY)
			end
		end
	end, { UseResult, ScrollingFrameRef, UseRefResult })))
	
	return ReactModule.createElement(PeekView, CryoModule.Dictionary.join(p1, {
		swipeScrollingFrameRef = ScrollingFrameRef,
		containerFrameRef = UseRefResult,
		fullViewContentHeight = FullViewContentHeight,
		getFullViewY = UseResult
	}))
end

PeekView = RoactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = p1.TopBar and p1.TopBar.topBarHeight or 0
	}
end, nil)(PeekView)

return if AXMigratePeekViewToFocusNavigation then PeekViewContainer else PeekView