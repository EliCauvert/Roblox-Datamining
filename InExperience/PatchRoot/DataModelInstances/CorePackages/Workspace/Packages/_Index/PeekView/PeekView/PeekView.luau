local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("PeekView").Parent
local userInputService = game:GetService("UserInputService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local eventIngestService = game:GetService("EventIngestService")
local runService = game:GetService("RunService")
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local roactGamepadModule = require(parent.RoactGamepad)
local focusable = roactGamepadModule.Focusable
local roactRoduxModule = require(parent.RoactRodux)
local peekViewStateModule = require(script.Parent.PeekViewState)
local scrimModule = require(script.Parent.Scrim)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local argCheckModule = require(parent.ArgCheck)
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local gamepadUtils = require(parent.InputUi).Gamepad.GamepadUtils
local getInputGroup = require(parent.InputType).getInputGroup
local peekViewDismissedEventModule = require(script.Parent.analytics.peekViewDismissedEvent)
local var15 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(eventIngestService)
local switchAccountScrimError = require(parent.UiShellEvents).switchAccountScrimError
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local usePeekViewFocusNavigationBindingsModule = require(script.Parent.usePeekViewFocusNavigationBindings)
local getFFlagEnablePeekViewStateOnMountParam = require(parent.SharedFlags).GetFFlagEnablePeekViewStateOnMountParam
local getFIntPeekViewTransitionDelayTiming = require(parent.SharedFlags).GetFIntPeekViewTransitionDelayTiming
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagProfilePlatformPeekDraggerContrast = require(parent.SharedFlags).FFlagProfilePlatformPeekDraggerContrast
local enableFastScrollingFixTest = game:DefineFastFlag("EnableFastScrollingFixTest", false)
local fFlagEnablePeekViewFocusNav = require(parent.SharedFlags).FFlagEnablePeekViewFocusNav
local getFFlagPreventSuperBriefPeekViewClose = require(parent.SharedFlags).GetFFlagPreventSuperBriefPeekViewClose
local AXMigratePeekViewToFocusNavigation = game:DefineFastFlag("AXMigratePeekViewToFocusNavigation", false)
local fFlagAXMigrateAXToGlobalAutofocus = require(parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local fFlagAXScrollingFramesShouldAnimateOnFocus = require(parent.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local fixPeekViewAnimationJitter = game:DefineFastFlag("FixPeekViewAnimationJitter", false)
local fFlagPeekViewFixBriefHeightLayoutRace = require(parent.SharedFlags).FFlagPeekViewFixBriefHeightLayoutRace
local rect = Rect.new(9, 9, 9, 9)
local swipe = images["icons/navigation/swipe"]
local var22 = 0.1 * getFIntPeekViewTransitionDelayTiming()
local hidden = peekViewStateModule.Hidden
local closed = peekViewStateModule.Closed
local superBrief = peekViewStateModule.SuperBrief
local brief = peekViewStateModule.Brief
local full = peekViewStateModule.Full
local extended = peekViewStateModule.Extended
local peekView = roactModule.PureComponent:extend("PeekView")
peekView.defaultProps = {
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
	hasSolidDragger = true,
	draggerImageStyle = nil,
	briefViewContentHeight = UDim.new(0.5, 0),
	fullViewContentHeight = if not AXMigratePeekViewToFocusNavigation then UDim.new(1, 0) else nil,
	elasticBehavior = Enum.ElasticBehavior.Always,
	shouldCaptureFocus = if fFlagAXMigrateAXToGlobalAutofocus then true else nil
}

function peekView.init(p0) --[[ line: 142 ]]
	-- upvalues: userGameSettingsService (ref), hidden (ref), getInputGroup (ref), userInputService (ref), roactModule (ref), UIBloxModule (ref), closed (ref), superBrief (ref), brief (ref), full (ref), AXMigratePeekViewToFocusNavigation (ref), switchAccountScrimError (ref), var15 (ref), fixPeekViewAnimationJitter (ref), fFlagPeekViewFixBriefHeightLayoutRace (ref), enableFastScrollingFixTest (ref), getFFlagPreventSuperBriefPeekViewClose (ref), peekViewStateModule (ref), inputTypeConstants (ref), peekViewDismissedEventModule (ref), extended (ref), argCheckModule (ref), runService (ref), var22 (ref), guiService (ref)
	p0.isMounted = false
	p0.isTouched = false
	p0.isInGoToState = false
	p0.useReducedMotion = userGameSettingsService.ReducedMotion
	p0.viewType = hidden
	p0:setState({
		scrollableViewType = false,
		absoluteWindowSizeX = 0,
		absoluteWindowSizeY = 0,
		canvasGroupTransparency = 0,
		lastInputGroup = getInputGroup(userInputService:GetLastInputType())
	})
	p0.containerFrameRef = roactModule.createRef()
	p0.clipFrameRef = roactModule.createRef()
	p0.shadowRef = roactModule.createRef()
	p0.fillingAreaRef = roactModule.createRef()
	p0.swipeScrollingFrameRef = roactModule.createRef()
	p0.bottomContainerRef = roactModule.createRef()
	local var25, var26 = roactModule.createBinding(0)
	p0.transitionPercent = var25
	p0.setTransitionPercent = var26
	
	function p0.onAbsoluteWindowSizeChanged(p1) --[[ line: 168 ]]
		-- upvalues: p0 (ref)
		if p1.AbsoluteWindowSize.X ~= p0.state.absoluteWindowSizeX or p1.AbsoluteWindowSize.Y ~= p0.state.absoluteWindowSizeY then
			p0:setState({
				absoluteWindowSizeX = p1.AbsoluteWindowSize.X,
				absoluteWindowSizeY = p1.AbsoluteWindowSize.Y
			})
		end
	end
	
	function p0.withStyle(p2) --[[ line: 180 ]]
		-- upvalues: p0 (ref), UIBloxModule (copy)
		return if p0.props.withNewThemeProvider then UIBloxModule.Style.withStyle(p2) else p2({
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
	
	function p0.inputBeganCallback(p3) --[[ line: 206 ]]
		-- upvalues: p0 (ref)
		if not p0.isMounted then return end
		if p3.UserInputType == Enum.UserInputType.Touch then
			p0.isTouched = true
			
			return
		end
	end
	
	function p0.inputEndedCallback(p4) --[[ line: 218 ]]
		-- upvalues: p0 (ref)
		if not p0.isMounted then return end
		if p4.UserInputType == Enum.UserInputType.Touch then
			p0.isTouched = false
			p0.checkGoTo()
			
			return
		end
	end
	
	function p0.getViewSize(p5) --[[ line: 231 ]]
		-- upvalues: hidden (copy), closed (copy), superBrief (copy), p0 (ref), brief (copy), full (copy)
		if p5 == hidden then
			return UDim.new(0, 0)
		elseif p5 == closed then
			return UDim.new(0, 0)
		elseif p5 == superBrief then
			if p0.props.superBriefViewContentHeight then
				local superBriefViewContentHeight = p0.props.superBriefViewContentHeight
				
				return UDim.new(superBriefViewContentHeight.Scale, superBriefViewContentHeight.Offset + 25)
			end
			return UDim.new(0, 0)
		elseif p5 == brief then
			local briefViewContentHeight = p0.props.briefViewContentHeight
			
			return UDim.new(briefViewContentHeight.Scale, briefViewContentHeight.Offset + 25)
		end
		return if p5 == full then p0.props.fullViewContentHeight else nil
	end
	
	function p0.hasNilRefs() --[[ line: 256 ]]
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p0 (ref)
		return not ((if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current) and ((if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current else p0.containerFrameRef.current) and (p0.clipFrameRef.current and (p0.shadowRef.current and p0.fillingAreaRef.current))))
	end
	
	function p0.reportRefStatus(p6, p7, p8, p9, p10, p11) --[[ line: 270 ]]
		-- upvalues: switchAccountScrimError (copy), var15 (copy)
		switchAccountScrimError(var15, "switchAccountScrimError", {
			callSite = p6,
			swipeScrollingFrame = if p7 then "true" else "nil",
			containerFrame = if p8 then "true" else "nil",
			clipFrame = if p9 then "true" else "nil",
			shadow = if p10 then "true" else "nil",
			fillingArea = if p11 then "true" else "nil"
		})
	end
	
	function p0.reconcileRbxInstances(p12) --[[ line: 282 ]]
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p0 (ref)
		local var27 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
		local var28 = if var27 then var27.CanvasPosition.Y else 0
		local var29 = if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current else p0.containerFrameRef.current
		local current = p0.clipFrameRef.current
		local current_1 = p0.shadowRef.current
		local current_2 = p0.fillingAreaRef.current
		
		if p0.hasNilRefs() then
			p0.reportRefStatus(p12, var27, var29, current, current_1, current_2)
			
			return
		end
		local x = var29.AbsoluteSize.X
		local y = var29.AbsoluteSize.Y
		current.Size = UDim2.new(0, x, 0, var28)
		current_1.Size = UDim2.new(0, x, 0, 36)
		current.Position = UDim2.new(0, 0, 1, -var28)
		current_1.Position = UDim2.new(0, 0, 1, (-var28) - 30)
		var27.Size = UDim2.new(0, x, 0, y)
		var27.Position = UDim2.new(0, 0, 0, -(y - var28))
		current_2.Size = UDim2.new(0, x, 0, y)
		local current_3 = p0.bottomContainerRef.current
		
		if current_3 then
			local bottomDockedContainerHeight = p0.props.bottomDockedContainerHeight
			
			if 25 + bottomDockedContainerHeight < current.AbsoluteSize.Y then
				current_3.Active = true
				current_3.Position = UDim2.new(0, 0, 1, -bottomDockedContainerHeight)
			else
				current_3.Active = false
				current_3.Position = UDim2.new(0, 0, 1, -current.AbsoluteSize.Y + 25)
			end
		end
		p0.transitionCallbacks()
		
		if p0.props.peekHeaderPositionYChange then
			p0.props.peekHeaderPositionYChange(var28)
		end
	end
	
	function p0.updateSwipeScrollingFrame() --[[ line: 332 ]]
		-- upvalues: p0 (ref), AXMigratePeekViewToFocusNavigation (copy)
		local viewSize = p0.getViewSize(p0.viewType)
		local _ = nil
		
		if viewSize and (if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current and p0.props.swipeScrollingFrameRef.current else p0.containerFrameRef.current and p0.swipeScrollingFrameRef.current) then
			local var31 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
			local var32 = (if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current else p0.containerFrameRef.current).AbsoluteSize.Y * viewSize.Scale + viewSize.Offset
			
			if var31.CanvasPosition.Y ~= var32 then
				var31.CanvasPosition = Vector2.new(0, var32)
				
				if p0.props.peekHeaderPositionYChange then
					p0.props.peekHeaderPositionYChange(var32)
				end
			end
		end
	end
	
	function p0.onContainerFrameAbsoluteSizeChanged() --[[ line: 361 ]]
		-- upvalues: p0 (ref), fixPeekViewAnimationJitter (copy), hidden (copy)
		if not p0.isMounted then return end
		p0.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged")
		
		if fixPeekViewAnimationJitter then
			if p0:isAnimating() and p0.viewType == hidden then
				return
			else
				p0.updateSwipeScrollingFrame()
				
				return
			end
		else
			p0.updateSwipeScrollingFrame()
		end
	end
	
	if fFlagPeekViewFixBriefHeightLayoutRace then
		function p0.onAbsoluteCanvasSizeChanged() --[[ line: 383 ]]
			-- upvalues: p0 (ref), brief (copy), superBrief (copy), AXMigratePeekViewToFocusNavigation (copy)
			if not p0.isMounted or p0:isAnimating() or p0.isTouched then return end
			if p0.viewType ~= brief and p0.viewType ~= superBrief then return end
			local viewSize = p0.getViewSize(p0.viewType)
			
			if not viewSize then return end
			local var34 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
			local var35 = if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current else p0.containerFrameRef.current
			
			if not var34 or not var35 then return end
			local var36 = var35.AbsoluteSize.Y * viewSize.Scale + viewSize.Offset
			
			if var34.CanvasPosition.Y < var36 and var36 <= var34.AbsoluteCanvasSize.Y - var34.AbsoluteWindowSize.Y then
				var34.CanvasPosition = Vector2.new(0, var36)
			end
		end
	end
	function p0.onSwipeScrollingFrameCanvasPositionChanged() --[[ line: 414 ]]
		-- upvalues: p0 (ref), AXMigratePeekViewToFocusNavigation (copy), enableFastScrollingFixTest (copy), getFFlagPreventSuperBriefPeekViewClose (copy), peekViewStateModule (copy), inputTypeConstants (copy)
		if not p0.isMounted then return end
		local var37 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
		local y = var37.CanvasPosition.Y
		
		if y ~= math.floor(y) then
			if not enableFastScrollingFixTest then
				if getFFlagPreventSuperBriefPeekViewClose() then
					local floored = math.floor(y + 0.5)
					
					if p0.viewType == peekViewStateModule.SuperBrief and p0.props.minimizeToSuperBrief then
						local superBriefViewY = p0.getSuperBriefViewY()
						
						if superBriefViewY ~= nil and floored ~= nil and floored < superBriefViewY then
							floored = superBriefViewY
						end
					end
					var37.CanvasPosition = Vector2.new(0, floored)
				else
					var37.CanvasPosition = Vector2.new(0, math.floor(y + 0.5))
				end
			end
			if p0.props.peekHeaderPositionYChange then
				p0.props.peekHeaderPositionYChange(y)
			end
			if not enableFastScrollingFixTest then return end
		end
		p0.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged")
		
		if p0.state.lastInputGroup ~= inputTypeConstants.Gamepad then
			p0.checkGoTo()
		end
	end
	
	function p0.getBriefViewY() --[[ line: 463 ]]
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p0 (ref)
		local briefViewContentHeight = p0.props.briefViewContentHeight
		
		return (if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current.AbsoluteSize.Y else p0.containerFrameRef.current.AbsoluteSize.Y) * briefViewContentHeight.Scale + briefViewContentHeight.Offset + 25
	end
	
	function p0.getSuperBriefViewY() --[[ line: 471 ]]
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p0 (ref)
		if AXMigratePeekViewToFocusNavigation then
			if p0.props.superBriefViewContentHeight and p0.props.containerFrameRef:getValue() then
				local superBriefViewContentHeight = p0.props.superBriefViewContentHeight
				
				return (if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef:getValue().AbsoluteSize.Y else p0.containerFrameRef:getValue().AbsoluteSize.Y) * superBriefViewContentHeight.Scale + superBriefViewContentHeight.Offset + 25
			else
				return nil
			end
		elseif p0.props.superBriefViewContentHeight and p0.containerFrameRef:getValue() then
		else
			return nil
		end
	end
	
	function p0.getFullViewY() --[[ line: 489 ]]
		-- upvalues: p0 (ref)
		return p0.containerFrameRef.current.AbsoluteSize.Y * p0.props.fullViewContentHeight.Scale + p0.props.fullViewContentHeight.Offset
	end
	
	function p0.transitionCallbacks() --[[ line: 494 ]]
		-- upvalues: p0 (ref), AXMigratePeekViewToFocusNavigation (copy)
		local briefToFullTransitionPercent = p0.props.briefToFullTransitionPercent
		local y = (if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current).CanvasPosition.Y
		local briefViewY = p0.getBriefViewY()
		local var41 = if AXMigratePeekViewToFocusNavigation then p0.props.getFullViewY() else p0.getFullViewY()
		local var42 = var41 - briefViewY
		local var43 = 0
		
		if briefViewY < y and y <= var41 then
			var43 = (y - briefViewY) / var42
		elseif var41 < y then
			var43 = 1
		end
		p0.setTransitionPercent(var43)
		
		if briefToFullTransitionPercent then
			briefToFullTransitionPercent(var43)
		end
	end
	
	function p0.checkGoTo() --[[ line: 531 ]]
		-- upvalues: p0 (ref), AXMigratePeekViewToFocusNavigation (copy), peekViewStateModule (copy)
		if p0.isInGoToState then return end
		if p0.isTouched then return end
		local var44 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
		
		if var44 and p0.state.absoluteWindowSizeX == 0 and p0.state.absoluteWindowSizeY == 0 then return end
		local briefViewY = p0.getBriefViewY()
		local superBriefViewY = p0.getSuperBriefViewY()
		local var47 = if AXMigratePeekViewToFocusNavigation then p0.props.getFullViewY() else p0.getFullViewY()
		
		if var47 < briefViewY then return end
		if superBriefViewY and briefViewY < superBriefViewY then return end
		if (var44.AbsoluteCanvasSize.Y or var44.CanvasSize.Y.Offset) < var44.AbsoluteWindowSize.Y + 25 + p0.props.bottomDockedContainerHeight then return end
		local y = var44.ScrollVelocity.Y
		local var48 = y < 0
		local var49 = y > 0
		local y_1 = var44.CanvasPosition.Y
		
		if ((p0.viewType == peekViewStateModule.Brief and y_1 == briefViewY) or (p0.viewType == peekViewStateModule.Full and y_1 == var47)) and y == 0 then return end
		if var47 < y_1 then
			p0:handleCurYAboveFullViewY(var48)
			
			return
		elseif briefViewY < y_1 and y_1 <= var47 then
			p0:handleCurYFromBriefToFull(y_1, y, var48, var49)
			
			return
		elseif superBriefViewY then
			if superBriefViewY < y_1 and y_1 <= briefViewY then
				p0:handleCurYFromSuperBriefToBrief(y_1, superBriefViewY, y, var48, var49)
				
				return
			elseif y_1 <= superBriefViewY then
				p0:handleCurYFromClosedToSuperBrief(y_1, superBriefViewY, y, var49, var48)
				
				return
			end
		elseif y_1 <= briefViewY then
			p0:handleCurYFromClosedToBrief(y_1, var49, var48)
		end
	end
	
	function p0.onPeekHeaderActivated() --[[ line: 618 ]]
		-- upvalues: p0 (ref), closed (copy), brief (copy), full (copy), superBrief (copy), peekViewDismissedEventModule (copy)
		if p0.viewType == closed then
			p0.goTo(brief)
			
			return
		elseif p0.viewType == brief then
			p0.goTo(full)
			
			return
		elseif p0.viewType == superBrief then
			p0.goTo(brief)
			
			return
		elseif p0.viewType == full then
			if p0.props.peekHeaderClose then
				p0.goTo(closed, nil, nil, {
					dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.handleTap
				})
				
				return
			end
			p0.goTo(brief)
		end
	end
	
	function p0.setViewType(p13, p14) --[[ line: 636 ]]
		-- upvalues: p0 (ref), extended (copy), full (copy)
		if p0.goToAnimationConnection then
			p0.goToAnimationConnection:disconnect()
			p0.goToAnimationConnection = nil
		end
		p0.isInGoToState = false
		p0.clipFrameRef.current.Active = false
		local viewType = p0.viewType
		
		if viewType ~= p13 then
			p0.viewType = p13
			p0:setState({
				scrollableViewType = if p0.viewType ~= extended then p0.viewType == full else true
			})
			local viewStateChanged = p0.props.viewStateChanged
			
			if viewStateChanged then
				viewStateChanged(p13, viewType, p14 or {})
			end
		end
		p0.updateSwipeScrollingFrame()
	end
	
	function p0.goTo(p15, p16, p17, p18) --[[ line: 664 ]]
		-- upvalues: p0 (ref), argCheckModule (copy), AXMigratePeekViewToFocusNavigation (copy), full (copy), closed (copy), runService (copy), brief (copy), var22 (copy)
		if p0.viewType == p15 then return end
		if argCheckModule.isEqual(p0.isInGoToState, false, "self.isInGoToState") then return end
		if argCheckModule.isEqual(p0.goToAnimationConnection, nil, "self.goToAnimationConnection") then return end
		p0.isInGoToState = true
		
		if AXMigratePeekViewToFocusNavigation then
			p0.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		else
			p0.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		end
		p0.clipFrameRef.current.Active = true
		
		if p16 == false then
			p0.setViewType(p15, p18)
			
			if p15 == full then
				p0:adjustScrollingFramePosition()
				
				return
			end
		else
			local currentTime = tick()
			
			if not p17 then
				p0:setState({ canvasGroupTransparency = if p15 == closed then 1 else 0 })
				p0.goToAnimationConnection = runService.RenderStepped:Connect(function() --[[ line: 699 ]]
					-- upvalues: p0 (copy), currentTime (ref), p15 (ref), brief (copy), var22 (copy), AXMigratePeekViewToFocusNavigation (copy), argCheckModule (copy), p18 (ref), full (copy)
					if not p0.isMounted then return end
					local var51 = tick() - currentTime
					
					if p15 ~= brief or var22 <= var51 then
						if AXMigratePeekViewToFocusNavigation then
							p0.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						else
							p0.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						end
						local var52 = if AXMigratePeekViewToFocusNavigation then p0.props.swipeScrollingFrameRef.current else p0.swipeScrollingFrameRef.current
						local var53 = argCheckModule.isNotNil(p0.getViewSize(p15), "self.goTo.viewSize")
						local var54 = (if AXMigratePeekViewToFocusNavigation then p0.props.containerFrameRef.current.AbsoluteSize.Y else p0.containerFrameRef.current.AbsoluteSize.Y) * var53.Scale + var53.Offset
						
						if p15 == brief then
							var51 -= var22
						end
						if var51 >= 0.35 then
							p0.setViewType(p15, p18)
							
							if p15 == full then
								p0:adjustScrollingFramePosition()
							end
							return
						else
							local y = var52.CanvasPosition.Y
							var52.CanvasPosition = Vector2.new(0, y + (var54 - y) * math.sin(var51 * 2.468394227821))
						end
					end
				end)
				
				return
			elseif p15 ~= closed then
				p0.setViewType(p15, p18)
				
				if p15 == full then
					p0:adjustScrollingFramePosition()
				end
			end
			p0:setState({ canvasGroupTransparency = if p15 == closed then 0 else 1 })
			p0.goToAnimationConnection = runService.RenderStepped:Connect(function() --[[ line: 752 ]]
				-- upvalues: p0 (copy), p15 (ref), full (copy), currentTime (ref), closed (copy), p18 (ref)
				if not p0.isMounted then return end
				if p15 == full then
					p0.updateSwipeScrollingFrame()
				end
				local var55 = tick() - currentTime
				
				if var55 < 0.35 then
					p0:setState({
						canvasGroupTransparency = if p15 == closed then var55 / 0.35 else 1 - var55 / 0.35
					})
					
					return
				end
				p0:setState({ canvasGroupTransparency = if p15 == closed then 1 else 0 })
				p0.setViewType(p15, p18)
				
				if p15 == full then
					p0:adjustScrollingFramePosition()
				end
			end)
		end
	end
	
	p0.selectedCoreObjectConnection = guiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function() --[[ line: 786 ]]
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p0 (ref), inputTypeConstants (copy)
		if AXMigratePeekViewToFocusNavigation then
			if p0.props.swipeScrollingFrameRef.current and p0.state.lastInputGroup == inputTypeConstants.Gamepad then
				p0:adjustScrollingFramePosition()
				
				return
			end
		elseif p0.swipeScrollingFrameRef.current and p0.state.lastInputGroup == inputTypeConstants.Gamepad then
			p0:adjustScrollingFramePosition()
		end
	end)
end

function peekView.handleCurYAboveFullViewY(p19, p20) --[[ line: 812 ]]
	-- upvalues: full (ref), extended (ref)
	if p19.viewType == full or p19.viewType == extended then
		if p19.viewType == full then
			p19.setViewType(extended)
		end
		return
	elseif p20 then
		p19.goTo(full)
		
		return
	end
	p19.setViewType(extended)
end

function peekView.handleCurYFromBriefToFull(p21, p22, p23, p24, p25) --[[ line: 824 ]]
	-- upvalues: AXMigratePeekViewToFocusNavigation (ref), full (ref), brief (ref), closed (ref), peekViewDismissedEventModule (ref), extended (ref)
	local canDragFullViewToBrief = p21.props.canDragFullViewToBrief
	local minimizeToSuperBrief = p21.props.minimizeToSuperBrief
	local var56 = if AXMigratePeekViewToFocusNavigation then p21.props.swipeScrollingFrameRef:getValue() else p21.swipeScrollingFrameRef:getValue()
	local briefViewY = p21.getBriefViewY()
	local var58 = (if AXMigratePeekViewToFocusNavigation then p21.props.getFullViewY() else p21.getFullViewY()) - briefViewY
	
	if p21.viewType == full then
		if var56.AbsoluteCanvasSize.Y - var56.AbsoluteWindowSize.Y - 1 < p22 then return end
		if not p25 and p22 >= briefViewY + var58 * 0.8 then return end
		if canDragFullViewToBrief and (not (p25 and p23 > 500) or minimizeToSuperBrief) then
			p21.goTo(brief)
			
			return
		end
		p21.goTo(closed, nil, nil, {
			dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
		})
		
		return
	elseif p21.viewType == extended then
		if p25 and p22 >= briefViewY + var58 * 0.8 and p23 <= -1 then
		else
			p21.goTo(full)
			
			return
		end
	elseif p24 or briefViewY + var58 * 0.2 < p22 then
		p21.goTo(full)
		
		return
	end
	p21.goTo(brief)
end

function peekView.handleCurYFromSuperBriefToBrief(p26, p27, p28, p29, p30, p31) --[[ line: 865 ]]
	-- upvalues: AXMigratePeekViewToFocusNavigation (ref), full (ref), superBrief (ref), closed (ref), peekViewDismissedEventModule (ref), brief (ref), extended (ref)
	local var60
	local canDragFullViewToBrief = p26.props.canDragFullViewToBrief
	local minimizeToSuperBrief = p26.props.minimizeToSuperBrief
	local var59 = (if AXMigratePeekViewToFocusNavigation then p26.props.getFullViewY() else p26.getFullViewY()) - p28
	
	if p26.viewType == full then
		if p31 or p27 < p28 + var59 * 0.8 then
			var60 = p31 and p29 > 500
			
			if canDragFullViewToBrief and (not var60 or minimizeToSuperBrief) then
				p26.goTo(superBrief)
				
				return
			end
			p26.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		else
			p26.goTo(brief)
			
			return
		end
	elseif p26.viewType == extended then
		if p31 and p27 >= p28 + var59 * 0.8 and p29 <= -1 then
			return
		else
			p26.goTo(brief)
			
			return
		end
	elseif p30 or p28 + var59 * 0.2 < p27 then
		p26.goTo(brief)
		
		return
	end
	var60 = p31 and p29 > 500
	
	if canDragFullViewToBrief and (not var60 or minimizeToSuperBrief) then
		p26.goTo(superBrief)
		
		return
	end
	p26.goTo(closed, nil, nil, {
		dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
	})
end

function peekView.handleCurYFromClosedToSuperBrief(p32, p33, p34, p35, p36, p37) --[[ line: 903 ]]
	-- upvalues: superBrief (ref), closed (ref), peekViewDismissedEventModule (ref)
	local var61 = p34 - 0
	local minimizeToSuperBrief = p32.props.minimizeToSuperBrief
	
	if p32.viewType == superBrief then
		if (p36 or p33 < var61 * 0.8) and not minimizeToSuperBrief then
			p32.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		end
		p32.goTo(superBrief)
		
		return
	elseif (p36 and p35 > 500 or not p37 and var61 * 0.8 >= p33) and not minimizeToSuperBrief then
		p32.goTo(closed, nil, nil, {
			dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
		})
		
		return
	end
	p32.goTo(superBrief)
end

function peekView.handleCurYFromClosedToBrief(p38, p39, p40, p41) --[[ line: 926 ]]
	-- upvalues: brief (ref), closed (ref), peekViewDismissedEventModule (ref)
	local var62 = p38.getBriefViewY() - 0
	
	if p38.viewType == brief then
		if p40 or p39 < 0 + var62 * 0.8 then
			p38.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		end
		p38.goTo(brief)
		
		return
	elseif p41 or 0 + var62 * 0.2 < p39 then
		p38.goTo(brief)
		
		return
	end
	p38.goTo(closed, nil, nil, {
		dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
	})
end

function peekView.adjustScrollingFramePosition(p42) --[[ line: 949 ]]
	-- upvalues: guiService (ref), AXMigratePeekViewToFocusNavigation (ref), extended (ref), full (ref), argCheckModule (ref)
	local selectedCoreObject = guiService.SelectedCoreObject
	
	if not selectedCoreObject or not p42.props.contentFrameRef or not selectedCoreObject:IsDescendantOf(p42.props.contentFrameRef.current) then return end
	local var63 = if AXMigratePeekViewToFocusNavigation then p42.props.swipeScrollingFrameRef.current else p42.swipeScrollingFrameRef.current
	
	if p42.viewType ~= extended and p42.viewType ~= full then
		var63.CanvasPosition = Vector2.new(var63.CanvasPosition.X, argCheckModule.isNotNil(p42.getViewSize(p42.viewType), "self.adjustScrollingFramePosition.viewSize").Offset)
		
		return
	end
	local var64 = selectedCoreObject.AbsolutePosition.Y - p42.props.topBarHeight
	local y = selectedCoreObject.AbsoluteSize.Y
	local y_1 = var63.AbsoluteWindowSize.Y
	local var65 = y_1 - (var64 + y)
	local y_2 = var63.CanvasPosition.Y
	
	if var65 < p42.props.bottomDockedContainerHeight then
		y_2 = y_2 + p42.props.bottomDockedContainerHeight - var65
	elseif var64 + y + (y_2 - y_1) < y_1 - p42.props.bottomDockedContainerHeight then
		y_2 = y_1
	end
	var63.CanvasPosition = Vector2.new(var63.CanvasPosition.X, math.max(0, math.min(y_2, (var63.AbsoluteCanvasSize.Y or var63.CanvasSize.Y.Offset) - var63.AbsoluteWindowSize.Y)))
end

function peekView.handleThumbstickInput(p43, p44, p45) --[[ line: 996 ]]
	-- upvalues: gamepadUtils (ref)
	local position = p44.Position
	local value = p43.swipeScrollingFrameRef:getValue()
	
	if p43.containerFrameRef:getValue() and value then
		local var67 = value.CanvasPosition.Y + p45 * -gamepadUtils.normalizeStickByDeadzone(position).Y * 1000
		
		if p43.getFullViewY() < var67 then
			value.CanvasPosition = Vector2.new(0, var67)
		end
	end
end

function peekView.renderWithStyle(p46, p47) --[[ line: 1009 ]]
	-- upvalues: roactModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagProfilePlatformPeekDraggerContrast (ref), AXMigratePeekViewToFocusNavigation (ref), superBrief (ref), imageSetLabel (ref), swipe (ref), focusable (ref), roactGamepadModule (ref), fFlagEnablePeekViewFocusNav (ref), fFlagPeekViewFixBriefHeightLayoutRace (ref), rect (ref), brief (ref), full (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), focusNavigableSurfaceWrapper (ref), focusNavigationUtilsModule (ref), externalEventConnection (ref), userInputService (ref)
	local color_1, transparency
	local children = p46.props[roactModule.Children]
	local bottomDockedContainerHeight = p46.props.bottomDockedContainerHeight
	local bottomDockedContainerContent = p46.props.bottomDockedContainerContent
	local scrollableViewType = p46.props.thumbstickScrollEnabled and p46.state.scrollableViewType
	local color = p47.Theme.BackgroundContrast.Color
	local var69 = fFlagProfilePlatformNewProfileHeader and not p46.props.hasSolidDragger
	local _ = nil
	local _ = nil
	
	if fFlagProfilePlatformPeekDraggerContrast then
		local draggerImageStyle = p46.props.draggerImageStyle
		color_1 = if draggerImageStyle then draggerImageStyle.Color3 else p47.Theme.UIEmphasis.Color
		transparency = if draggerImageStyle then draggerImageStyle.Transparency else p47.Theme.UIEmphasis.Transparency
	else
		color_1 = p47.Theme.UIEmphasis.Color
		transparency = p47.Theme.UIEmphasis.Transparency
	end
	local createElement = roactModule.createElement
	createElement = createElement("TextButton", {
		Text = "",
		LayoutOrder = 3,
		ZIndex = 3,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 25),
		[roactModule.Event.Activated] = p46.onPeekHeaderActivated,
		Selectable = false
	}, {
		Dragger = if p46.props.hideDraggerInSuperBrief and p46.props.peekViewState == superBrief then nil else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Active = false,
			Size = UDim2.new(0, 36, 0, 36),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = swipe,
			ImageColor3 = color_1,
			ImageTransparency = if var69 then (function() --[[ line: 1036 | named "getDraggerTransparency" ]]
				-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p46 (ref), transparency (write)
				local var70 = if AXMigratePeekViewToFocusNavigation then p46.props.swipeScrollingFrameRef.current else p46.swipeScrollingFrameRef.current
				
				if var70 then
					local briefViewY = p46.getBriefViewY()
					
					return transparency + math.max(0, math.min(1, (var70.CanvasPosition.Y - briefViewY) / ((if AXMigratePeekViewToFocusNavigation then p46.props.getFullViewY() else p46.getFullViewY()) - briefViewY))) * (1 - transparency)
				end
				return transparency
			end)() else transparency
		})
	})
	local createElement_1 = roactModule.createElement
	createElement_1 = createElement_1(focusable.Frame, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[roactModule.Ref] = p46.clipFrameRef,
		restorePreviousChildFocus = true,
		inputBindings = if AXMigratePeekViewToFocusNavigation or not scrollableViewType then nil else {
			ScrollPeekView = roactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick2, function(p48, p49) --[[ line: 1087 ]]
				-- upvalues: p46 (ref)
				p46:handleThumbstickInput(p48, p49)
			end)
		}
	}, {
		SwipeScrollingFrame = roactModule.createElement("ScrollingFrame", {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Selectable = if fFlagEnablePeekViewFocusNav then false else nil,
			CanvasSize = UDim2.fromScale(1, 0),
			Active = true,
			BackgroundTransparency = 1,
			ZIndex = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = false,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ElasticBehavior = p46.props.elasticBehavior,
			ScrollingEnabled = p46.props.isScrollingEnabled,
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p46.props.swipeScrollingFrameRef else p46.swipeScrollingFrameRef,
			[roactModule.Change.CanvasPosition] = p46.onSwipeScrollingFrameCanvasPositionChanged,
			[roactModule.Change.AbsoluteWindowSize] = p46.onAbsoluteWindowSizeChanged,
			[roactModule.Change.AbsoluteCanvasSize] = if fFlagPeekViewFixBriefHeightLayoutRace then p46.onAbsoluteCanvasSizeChanged else nil
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			FillingArea = roactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Active = false,
				[roactModule.Ref] = p46.fillingAreaRef
			}),
			BackgroundFrame = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				ZIndex = 1,
				Active = false,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				BackgroundImage = roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					Active = false,
					Size = UDim2.new(1, 0, 0, 9999),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = rect,
					BackgroundColor3 = if p46.props.customBackground then p46.props.customBackground else color
				})
			}),
			PeekHeader = if fFlagProfilePlatformNewProfileHeader and not p46.props.hasSolidDragger then nil else createElement,
			ContentFrame = roactModule.createElement(focusable.Frame, {
				LayoutOrder = 4,
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Ref] = p46.props.contentFrameRef,
				restorePreviousChildFocus = true,
				onFocusGained = function() --[[ line: 1161 ]]
					-- upvalues: p46 (ref), brief (copy), full (copy)
					if p46.viewType == brief and p46.props.peekViewState ~= full then
						p46.goTo(full)
					end
				end
			}, if fFlagProfilePlatformNewProfileHeader and not p46.props.hasSolidDragger then {
				PeekHeader = createElement,
				Content = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, children)
			} else children),
			BottomContainerPlaceHolder = bottomDockedContainerHeight > 0 and roactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				Active = false,
				Size = UDim2.new(1, 0, 0, bottomDockedContainerHeight)
			})
		}),
		BottomContainer = bottomDockedContainerHeight > 0 and roactModule.createElement("Frame", {
			Active = true,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, bottomDockedContainerHeight),
			BackgroundTransparency = 1,
			[roactModule.Ref] = p46.bottomContainerRef
		}, bottomDockedContainerContent)
	})
	
	return roactModule.createFragment({
		DropShadowBackground = roactModule.createElement("Frame", {
			ZIndex = 0,
			Visible = p46.props.showDropShadow,
			[roactModule.Ref] = p46.shadowRef
		}, {
			UIGradient = roactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, p47.Theme.DropShadow.Color),
					ColorSequenceKeypoint.new(1, p47.Theme.DropShadow.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0.7)
				})
			})
		}),
		ClipFrameContainer = if fFlagAXMigrateAXToGlobalAutofocus and not p46.props.shouldCaptureFocus then nil elseif fFlagEnablePeekViewFocusNav then roactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PeekView
		}, { ClipFrame = createElement_1 }) else nil,
		ClipFrame = if fFlagAXMigrateAXToGlobalAutofocus and not p46.props.shouldCaptureFocus then createElement_1 elseif fFlagEnablePeekViewFocusNav then nil else createElement_1,
		InputBegan = roactModule.createElement(externalEventConnection, {
			event = userInputService.InputBegan,
			callback = p46.inputBeganCallback
		}),
		InputEnded = roactModule.createElement(externalEventConnection, {
			event = userInputService.InputEnded,
			callback = p46.inputEndedCallback
		})
	})
end

function peekView.render(p50) --[[ line: 1240 ]]
	-- upvalues: roactModule (ref), scrimModule (ref), AXMigratePeekViewToFocusNavigation (ref), closed (ref), peekViewDismissedEventModule (ref)
	return p50.withStyle(function(p51) --[[ line: 1241 ]]
		-- upvalues: p50 (ref), roactModule (copy), scrimModule (copy), AXMigratePeekViewToFocusNavigation (copy), closed (copy), peekViewDismissedEventModule (copy)
		local var72 = if p50.useReducedMotion then roactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			GroupTransparency = p50.state.canvasGroupTransparency
		}, { p50:renderWithStyle(p51) }) else p50:renderWithStyle(p51)
		
		return if p50.props.hasScrim then roactModule.createElement(scrimModule, {
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p50.props.containerFrameRef else p50.containerFrameRef,
			onActivated = function() --[[ line: 1257 ]]
				-- upvalues: p50 (copy), closed (copy), peekViewDismissedEventModule (copy)
				if p50.isInGoToState then
					return
				end
				p50.goTo(closed, nil, nil, {
					dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.scrimTap
				})
			end,
			onSizeChanged = p50.onContainerFrameAbsoluteSizeChanged
		}, var72) else roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p50.props.containerFrameRef else p50.containerFrameRef,
			[roactModule.Change.AbsoluteSize] = p50.onContainerFrameAbsoluteSizeChanged
		}, var72)
	end)
end

function peekView.didMount(p52) --[[ line: 1282 ]]
	-- upvalues: closed (ref), getFFlagEnablePeekViewStateOnMountParam (ref), full (ref), brief (ref), getInputGroup (ref), userInputService (ref)
	p52.isMounted = true
	
	if p52.props.closeSignal then
		p52.closeSignalConnection = p52.props.closeSignal:connect(function() --[[ line: 1286 ]]
			-- upvalues: p52 (ref), closed (copy)
			if not p52.isInGoToState then
				p52.goTo(closed, true, p52.useReducedMotion)
			end
		end)
	end
	local hidden = p52.props.hidden
	local mountAsFullView = p52.props.mountAsFullView
	local mountAnimation = p52.props.mountAnimation
	local var73 = if getFFlagEnablePeekViewStateOnMountParam() then p52.props.stateOnMount else nil
	
	if not hidden then
		if mountAsFullView then
			p52.goTo(full, mountAnimation, p52.useReducedMotion)
		elseif var73 == nil then
			p52.goTo(brief, mountAnimation, p52.useReducedMotion)
		else
			p52.goTo(var73, mountAnimation, p52.useReducedMotion)
		end
	end
	p52:setState({
		lastInputGroup = getInputGroup(userInputService:GetLastInputType())
	})
	userInputService.LastInputTypeChanged:Connect(function(p53) --[[ line: 1314 ]]
		-- upvalues: p52 (ref), getInputGroup (copy)
		p52:setState({ lastInputGroup = getInputGroup(p53) })
	end)
end

function peekView.isAnimating(p54) --[[ line: 1319 ]]
	return p54.goToAnimationConnection ~= nil
end

function peekView.didUpdate(p55, p56, p57) --[[ line: 1323 ]]
	-- upvalues: hidden (ref), brief (ref), extended (ref)
	if p57.absoluteWindowSizeX ~= p55.state.absoluteWindowSizeX or p57.absoluteWindowSizeY ~= p55.state.absoluteWindowSizeY then
		p55.reconcileRbxInstances("didUpdate")
		
		if not p55:isAnimating() then
			p55.updateSwipeScrollingFrame()
		end
	end
	if p56.bottomDockedContainerHeight ~= p55.props.bottomDockedContainerHeight then
		p55.onContainerFrameAbsoluteSizeChanged()
	end
	if p56.briefViewContentHeight ~= p55.props.briefViewContentHeight and not p55:isAnimating() then
		p55.updateSwipeScrollingFrame()
	end
	if p56.hidden == false and p55.props.hidden == true then
		p55.goTo(hidden)
	elseif p56.hidden == true and p55.props.hidden == false then
		p55.goTo(brief)
	end
	local peekViewState = p55.props.peekViewState
	
	if peekViewState ~= p56.peekViewState and p55.viewType == p56.peekViewState and (peekViewState ~= extended and not p55.isInGoToState) then
		p55.goTo(p55.props.peekViewState)
	end
end

function peekView.willUnmount(p58) --[[ line: 1370 ]]
	p58.isMounted = false
	
	if p58.closeSignalConnection then
		p58.closeSignalConnection:disconnect()
		p58.closeSignalConnection = nil
	end
	if p58.goToAnimationConnection then
		p58.goToAnimationConnection:disconnect()
		p58.goToAnimationConnection = nil
	end
	if p58.selectedCoreObjectConnection then
		p58.selectedCoreObjectConnection:disconnect()
		p58.selectedCoreObjectConnection = nil
	end
end

local function PeekViewContainer(p59) --[[ line: 1395 ]]
	-- upvalues: reactModule (ref), fFlagAXScrollingFramesShouldAnimateOnFocus (ref), gamepadUtils (ref), usePeekViewFocusNavigationBindingsModule (ref), peekView (write), cryoModule (ref)
	local var74 = if fFlagAXScrollingFramesShouldAnimateOnFocus and p59.scrollingFrameRef then p59.scrollingFrameRef else reactModule.useRef(nil)
	local var75 = reactModule.useRef(nil)
	local var76 = if p59.fullViewContentHeight then p59.fullViewContentHeight else UDim.new(1, 0)
	local var77 = reactModule.useCallback(function() --[[ line: 1411 ]]
		-- upvalues: var75 (ref), var76 (write)
		return var75.current.AbsoluteSize.Y * var76.Scale + var76.Offset
	end, { var76, var75 })
	usePeekViewFocusNavigationBindingsModule(reactModule.useCallback(function(p60, p61) --[[ line: 1416 ]]
		-- upvalues: var74 (write), var75 (ref), gamepadUtils (copy), var77 (ref)
		local position = p60.Position
		local value = var74:getValue()
		
		if var75:getValue() and value then
			local var79 = value.CanvasPosition.Y + p61 * -gamepadUtils.normalizeStickByDeadzone(position).Y * 1000
			
			if var77() < var79 then
				value.CanvasPosition = Vector2.new(0, var79)
			end
		end
	end, { var77, var74, var75 }))
	
	return reactModule.createElement(peekView, cryoModule.Dictionary.join(p59, {
		swipeScrollingFrameRef = var74,
		containerFrameRef = var75,
		fullViewContentHeight = var76,
		getFullViewY = var77
	}))
end

peekView = roactRoduxModule.connect(function(p62, _) --[[ line: 1389 | named "mapStateToProps" ]]
	return {
		topBarHeight = if p62.TopBar then p62.TopBar.topBarHeight else 0
	}
end, nil)(peekView)

return if AXMigratePeekViewToFocusNavigation then PeekViewContainer else peekView