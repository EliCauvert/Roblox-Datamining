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
local var1 = require(parent.Analytics).AnalyticsReporters.EventIngest.new(eventIngestService)
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
local var2 = 0.1 * getFIntPeekViewTransitionDelayTiming()
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

function peekView.init(p1)
	-- upvalues: userGameSettingsService (ref), hidden (ref), getInputGroup (ref), userInputService (ref), roactModule (ref), UIBloxModule (ref), closed (ref), superBrief (ref), brief (ref), full (ref), AXMigratePeekViewToFocusNavigation (ref), switchAccountScrimError (ref), var1 (ref), fixPeekViewAnimationJitter (ref), fFlagPeekViewFixBriefHeightLayoutRace (ref), enableFastScrollingFixTest (ref), getFFlagPreventSuperBriefPeekViewClose (ref), peekViewStateModule (ref), inputTypeConstants (ref), peekViewDismissedEventModule (ref), extended (ref), argCheckModule (ref), runService (ref), var2 (ref), guiService (ref)
	p1.isMounted = false
	p1.isTouched = false
	p1.isInGoToState = false
	p1.useReducedMotion = userGameSettingsService.ReducedMotion
	p1.viewType = hidden
	p1:setState({
		scrollableViewType = false,
		absoluteWindowSizeX = 0,
		absoluteWindowSizeY = 0,
		canvasGroupTransparency = 0,
		lastInputGroup = getInputGroup(userInputService:GetLastInputType())
	})
	p1.containerFrameRef = roactModule.createRef()
	p1.clipFrameRef = roactModule.createRef()
	p1.shadowRef = roactModule.createRef()
	p1.fillingAreaRef = roactModule.createRef()
	p1.swipeScrollingFrameRef = roactModule.createRef()
	p1.bottomContainerRef = roactModule.createRef()
	local var3, var4 = roactModule.createBinding(0)
	p1.transitionPercent = var3
	p1.setTransitionPercent = var4
	
	function p0.onAbsoluteWindowSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p2.AbsoluteWindowSize.X ~= p1.state.absoluteWindowSizeX or p2.AbsoluteWindowSize.Y ~= p1.state.absoluteWindowSizeY then
			p1:setState({
				absoluteWindowSizeX = p2.AbsoluteWindowSize.X,
				absoluteWindowSizeY = p2.AbsoluteWindowSize.Y
			})
		end
	end
	
	function p0.withStyle(p2)
		-- upvalues: p1 (ref), UIBloxModule (copy)
		return if p1.props.withNewThemeProvider then UIBloxModule.Style.withStyle(p2) else p2({
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
	
	function p0.inputBeganCallback(p2)
		-- upvalues: p1 (ref)
		if not p1.isMounted then return end
		if p2.UserInputType == Enum.UserInputType.Touch then
			p1.isTouched = true
			
			return
		end
	end
	
	function p0.inputEndedCallback(p2)
		-- upvalues: p1 (ref)
		if not p1.isMounted then return end
		if p2.UserInputType == Enum.UserInputType.Touch then
			p1.isTouched = false
			p1.checkGoTo()
			
			return
		end
	end
	
	function p0.getViewSize(p2)
		-- upvalues: hidden (copy), closed (copy), superBrief (copy), p1 (ref), brief (copy), full (copy)
		if p2 == hidden then
			return UDim.new(0, 0)
		elseif p2 == closed then
			return UDim.new(0, 0)
		elseif p2 == superBrief then
			if p1.props.superBriefViewContentHeight then
				local superBriefViewContentHeight = p1.props.superBriefViewContentHeight
				
				return UDim.new(superBriefViewContentHeight.Scale, superBriefViewContentHeight.Offset + 25)
			end
			return UDim.new(0, 0)
		elseif p2 == brief then
			local briefViewContentHeight = p1.props.briefViewContentHeight
			
			return UDim.new(briefViewContentHeight.Scale, briefViewContentHeight.Offset + 25)
		end
		return if p2 == full then p1.props.fullViewContentHeight else nil
	end
	
	function p0.hasNilRefs()
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref)
		return not ((if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current) and ((if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current) and (p1.clipFrameRef.current and (p1.shadowRef.current and p1.fillingAreaRef.current))))
	end
	
	function p0.reportRefStatus(p2, p3, p4, p5, p6, p7)
		-- upvalues: switchAccountScrimError (copy), var1 (copy)
		switchAccountScrimError(var1, "switchAccountScrimError", {
			callSite = p2,
			swipeScrollingFrame = if p3 then "true" else "nil",
			containerFrame = if p4 then "true" else "nil",
			clipFrame = if p5 then "true" else "nil",
			shadow = if p6 then "true" else "nil",
			fillingArea = if p7 then "true" else "nil"
		})
	end
	
	function p0.reconcileRbxInstances(p2)
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref)
		local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		local var6 = if var5 then var5.CanvasPosition.Y else 0
		local var7 = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current
		local current = p1.clipFrameRef.current
		local current_1 = p1.shadowRef.current
		local current_2 = p1.fillingAreaRef.current
		
		if p1.hasNilRefs() then
			p1.reportRefStatus(p2, var5, var7, current, current_1, current_2)
			
			return
		end
		local x = var7.AbsoluteSize.X
		local y = var7.AbsoluteSize.Y
		current.Size = UDim2.new(0, x, 0, var6)
		current_1.Size = UDim2.new(0, x, 0, 36)
		current.Position = UDim2.new(0, 0, 1, -var6)
		current_1.Position = UDim2.new(0, 0, 1, (-var6) - 30)
		var5.Size = UDim2.new(0, x, 0, y)
		var5.Position = UDim2.new(0, 0, 0, -(y - var6))
		current_2.Size = UDim2.new(0, x, 0, y)
		local current_3 = p1.bottomContainerRef.current
		
		if current_3 then
			local bottomDockedContainerHeight = p1.props.bottomDockedContainerHeight
			
			if 25 + bottomDockedContainerHeight < current.AbsoluteSize.Y then
				current_3.Active = true
				current_3.Position = UDim2.new(0, 0, 1, -bottomDockedContainerHeight)
			else
				current_3.Active = false
				current_3.Position = UDim2.new(0, 0, 1, -current.AbsoluteSize.Y + 25)
			end
		end
		p1.transitionCallbacks()
		
		if p1.props.peekHeaderPositionYChange then
			p1.props.peekHeaderPositionYChange(var6)
		end
	end
	
	function p0.updateSwipeScrollingFrame()
		-- upvalues: p1 (ref), AXMigratePeekViewToFocusNavigation (copy)
		local viewSize = p1.getViewSize(p1.viewType)
		local _ = nil
		
		if viewSize and (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current and p1.props.swipeScrollingFrameRef.current else p1.containerFrameRef.current and p1.swipeScrollingFrameRef.current) then
			local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
			local var6 = (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current).AbsoluteSize.Y * viewSize.Scale + viewSize.Offset
			
			if var5.CanvasPosition.Y ~= var6 then
				var5.CanvasPosition = Vector2.new(0, var6)
				
				if p1.props.peekHeaderPositionYChange then
					p1.props.peekHeaderPositionYChange(var6)
				end
			end
		end
	end
	
	function p0.onContainerFrameAbsoluteSizeChanged()
		-- upvalues: p1 (ref), fixPeekViewAnimationJitter (copy), hidden (copy)
		if not p1.isMounted then return end
		p1.reconcileRbxInstances("onContainerFrameAbsoluteSizeChanged")
		
		if fixPeekViewAnimationJitter then
			if p1:isAnimating() and p1.viewType == hidden then
				return
			else
				p1.updateSwipeScrollingFrame()
				
				return
			end
		else
			p1.updateSwipeScrollingFrame()
		end
	end
	
	if fFlagPeekViewFixBriefHeightLayoutRace then
		function p0.onAbsoluteCanvasSizeChanged()
			-- upvalues: p1 (ref), brief (copy), superBrief (copy), AXMigratePeekViewToFocusNavigation (copy)
			if not p1.isMounted or p1:isAnimating() or p1.isTouched then return end
			if p1.viewType ~= brief and p1.viewType ~= superBrief then return end
			local viewSize = p1.getViewSize(p1.viewType)
			
			if not viewSize then return end
			local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
			local var6 = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current else p1.containerFrameRef.current
			
			if not var5 or not var6 then return end
			local var7 = var6.AbsoluteSize.Y * viewSize.Scale + viewSize.Offset
			
			if var5.CanvasPosition.Y < var7 and var7 <= var5.AbsoluteCanvasSize.Y - var5.AbsoluteWindowSize.Y then
				var5.CanvasPosition = Vector2.new(0, var7)
			end
		end
	end
	function p0.onSwipeScrollingFrameCanvasPositionChanged()
		-- upvalues: p1 (ref), AXMigratePeekViewToFocusNavigation (copy), enableFastScrollingFixTest (copy), getFFlagPreventSuperBriefPeekViewClose (copy), peekViewStateModule (copy), inputTypeConstants (copy)
		if not p1.isMounted then return end
		local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		local y = var5.CanvasPosition.Y
		
		if y ~= math.floor(y) then
			if not enableFastScrollingFixTest then
				if getFFlagPreventSuperBriefPeekViewClose() then
					local floored = math.floor(y + 0.5)
					
					if p1.viewType == peekViewStateModule.SuperBrief and p1.props.minimizeToSuperBrief then
						local superBriefViewY = p1.getSuperBriefViewY()
						
						if superBriefViewY ~= nil and floored ~= nil and floored < superBriefViewY then
							floored = superBriefViewY
						end
					end
					var5.CanvasPosition = Vector2.new(0, floored)
				else
					var5.CanvasPosition = Vector2.new(0, math.floor(y + 0.5))
				end
			end
			if p1.props.peekHeaderPositionYChange then
				p1.props.peekHeaderPositionYChange(y)
			end
			if not enableFastScrollingFixTest then return end
		end
		p1.reconcileRbxInstances("onSwipeScrollingFrameCanvasPositionChanged")
		
		if p1.state.lastInputGroup ~= inputTypeConstants.Gamepad then
			p1.checkGoTo()
		end
	end
	
	function p0.getBriefViewY()
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref)
		local briefViewContentHeight = p1.props.briefViewContentHeight
		
		return (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current.AbsoluteSize.Y else p1.containerFrameRef.current.AbsoluteSize.Y) * briefViewContentHeight.Scale + briefViewContentHeight.Offset + 25
	end
	
	function p0.getSuperBriefViewY()
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref)
		if AXMigratePeekViewToFocusNavigation then
			if p1.props.superBriefViewContentHeight and p1.props.containerFrameRef:getValue() then
				local superBriefViewContentHeight = p1.props.superBriefViewContentHeight
				
				return (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef:getValue().AbsoluteSize.Y else p1.containerFrameRef:getValue().AbsoluteSize.Y) * superBriefViewContentHeight.Scale + superBriefViewContentHeight.Offset + 25
			else
				return nil
			end
		elseif p1.props.superBriefViewContentHeight and p1.containerFrameRef:getValue() then
		else
			return nil
		end
	end
	
	function p0.getFullViewY()
		-- upvalues: p1 (ref)
		return p1.containerFrameRef.current.AbsoluteSize.Y * p1.props.fullViewContentHeight.Scale + p1.props.fullViewContentHeight.Offset
	end
	
	function p0.transitionCallbacks()
		-- upvalues: p1 (ref), AXMigratePeekViewToFocusNavigation (copy)
		local briefToFullTransitionPercent = p1.props.briefToFullTransitionPercent
		local y = (if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current).CanvasPosition.Y
		local briefViewY = p1.getBriefViewY()
		local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()
		local var6 = var5 - briefViewY
		local var7 = 0
		
		if briefViewY < y and y <= var5 then
			var7 = (y - briefViewY) / var6
		elseif var5 < y then
			var7 = 1
		end
		p1.setTransitionPercent(var7)
		
		if briefToFullTransitionPercent then
			briefToFullTransitionPercent(var7)
		end
	end
	
	function p0.checkGoTo()
		-- upvalues: p1 (ref), AXMigratePeekViewToFocusNavigation (copy), peekViewStateModule (copy)
		if p1.isInGoToState then return end
		if p1.isTouched then return end
		local var5 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
		
		if var5 and p1.state.absoluteWindowSizeX == 0 and p1.state.absoluteWindowSizeY == 0 then return end
		local briefViewY = p1.getBriefViewY()
		local superBriefViewY = p1.getSuperBriefViewY()
		local var6 = if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()
		
		if var6 < briefViewY then return end
		if superBriefViewY and briefViewY < superBriefViewY then return end
		if (var5.AbsoluteCanvasSize.Y or var5.CanvasSize.Y.Offset) < var5.AbsoluteWindowSize.Y + 25 + p1.props.bottomDockedContainerHeight then return end
		local y = var5.ScrollVelocity.Y
		local var7 = y < 0
		local var8 = y > 0
		local y_1 = var5.CanvasPosition.Y
		
		if ((p1.viewType == peekViewStateModule.Brief and y_1 == briefViewY) or (p1.viewType == peekViewStateModule.Full and y_1 == var6)) and y == 0 then return end
		if var6 < y_1 then
			p1:handleCurYAboveFullViewY(var7)
			
			return
		elseif briefViewY < y_1 and y_1 <= var6 then
			p1:handleCurYFromBriefToFull(y_1, y, var7, var8)
			
			return
		elseif superBriefViewY then
			if superBriefViewY < y_1 and y_1 <= briefViewY then
				p1:handleCurYFromSuperBriefToBrief(y_1, superBriefViewY, y, var7, var8)
				
				return
			elseif y_1 <= superBriefViewY then
				p1:handleCurYFromClosedToSuperBrief(y_1, superBriefViewY, y, var8, var7)
				
				return
			end
		elseif y_1 <= briefViewY then
			p1:handleCurYFromClosedToBrief(y_1, var8, var7)
		end
	end
	
	function p0.onPeekHeaderActivated()
		-- upvalues: p1 (ref), closed (copy), brief (copy), full (copy), superBrief (copy), peekViewDismissedEventModule (copy)
		if p1.viewType == closed then
			p1.goTo(brief)
			
			return
		elseif p1.viewType == brief then
			p1.goTo(full)
			
			return
		elseif p1.viewType == superBrief then
			p1.goTo(brief)
			
			return
		elseif p1.viewType == full then
			if p1.props.peekHeaderClose then
				p1.goTo(closed, nil, nil, {
					dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.handleTap
				})
				
				return
			end
			p1.goTo(brief)
		end
	end
	
	function p0.setViewType(p2, p3)
		-- upvalues: p1 (ref), extended (copy), full (copy)
		if p1.goToAnimationConnection then
			p1.goToAnimationConnection:disconnect()
			p1.goToAnimationConnection = nil
		end
		p1.isInGoToState = false
		p1.clipFrameRef.current.Active = false
		local viewType = p1.viewType
		
		if viewType ~= p2 then
			p1.viewType = p2
			p1:setState({
				scrollableViewType = if p1.viewType ~= extended then p1.viewType == full else true
			})
			local viewStateChanged = p1.props.viewStateChanged
			
			if viewStateChanged then
				viewStateChanged(p2, viewType, p3 or {})
			end
		end
		p1.updateSwipeScrollingFrame()
	end
	
	function p0.goTo(p2, p3, p4, p5)
		-- upvalues: p1 (ref), argCheckModule (copy), AXMigratePeekViewToFocusNavigation (copy), full (copy), closed (copy), runService (copy), brief (copy), var2 (copy)
		if p1.viewType == p2 then return end
		if argCheckModule.isEqual(p1.isInGoToState, false, "self.isInGoToState") then return end
		if argCheckModule.isEqual(p1.goToAnimationConnection, nil, "self.goToAnimationConnection") then return end
		p1.isInGoToState = true
		
		if AXMigratePeekViewToFocusNavigation then
			p1.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		else
			p1.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
		end
		p1.clipFrameRef.current.Active = true
		
		if p3 == false then
			p1.setViewType(p2, p5)
			
			if p2 == full then
				p1:adjustScrollingFramePosition()
				
				return
			end
		else
			local currentTime = tick()
			
			if not p4 then
				p1:setState({ canvasGroupTransparency = if p2 == closed then 1 else 0 })
				p1.goToAnimationConnection = runService.RenderStepped:Connect(function()
					-- upvalues: p1 (copy), currentTime (ref), p2 (ref), brief (copy), var2 (copy), AXMigratePeekViewToFocusNavigation (copy), argCheckModule (copy), p5 (ref), full (copy)
					if not p1.isMounted then return end
					local var5 = tick() - currentTime
					
					if p2 ~= brief or var2 <= var5 then
						if AXMigratePeekViewToFocusNavigation then
							p1.props.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						else
							p1.swipeScrollingFrameRef:getValue().ScrollVelocity = Vector2.new(0, 0)
						end
						local var6 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
						local var7 = argCheckModule.isNotNil(p1.getViewSize(p2), "self.goTo.viewSize")
						local var8 = (if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef.current.AbsoluteSize.Y else p1.containerFrameRef.current.AbsoluteSize.Y) * var7.Scale + var7.Offset
						
						if p2 == brief then
							var5 -= var2
						end
						if var5 >= 0.35 then
							p1.setViewType(p2, p5)
							
							if p2 == full then
								p1:adjustScrollingFramePosition()
							end
							return
						else
							local y = var6.CanvasPosition.Y
							var6.CanvasPosition = Vector2.new(0, y + (var8 - y) * math.sin(var5 * 2.468394227821))
						end
					end
				end)
				
				return
			elseif p2 ~= closed then
				p1.setViewType(p2, p5)
				
				if p2 == full then
					p1:adjustScrollingFramePosition()
				end
			end
			p1:setState({ canvasGroupTransparency = if p2 == closed then 0 else 1 })
			p1.goToAnimationConnection = runService.RenderStepped:Connect(function()
				-- upvalues: p1 (copy), p2 (ref), full (copy), currentTime (ref), closed (copy), p5 (ref)
				if not p1.isMounted then return end
				if p2 == full then
					p1.updateSwipeScrollingFrame()
				end
				local var5 = tick() - currentTime
				
				if var5 < 0.35 then
					p1:setState({
						canvasGroupTransparency = if p2 == closed then var5 / 0.35 else 1 - var5 / 0.35
					})
					
					return
				end
				p1:setState({ canvasGroupTransparency = if p2 == closed then 1 else 0 })
				p1.setViewType(p2, p5)
				
				if p2 == full then
					p1:adjustScrollingFramePosition()
				end
			end)
		end
	end
	
	p1.selectedCoreObjectConnection = guiService:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
		-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref), inputTypeConstants (copy)
		if AXMigratePeekViewToFocusNavigation then
			if p1.props.swipeScrollingFrameRef.current and p1.state.lastInputGroup == inputTypeConstants.Gamepad then
				p1:adjustScrollingFramePosition()
				
				return
			end
		elseif p1.swipeScrollingFrameRef.current and p1.state.lastInputGroup == inputTypeConstants.Gamepad then
			p1:adjustScrollingFramePosition()
		end
	end)
end

function peekView.handleCurYAboveFullViewY(p1, p2)
	-- upvalues: full (ref), extended (ref)
	if p1.viewType == full or p1.viewType == extended then
		if p1.viewType == full then
			p1.setViewType(extended)
		end
		return
	elseif p2 then
		p1.goTo(full)
		
		return
	end
	p1.setViewType(extended)
end

function peekView.handleCurYFromBriefToFull(p1, p2, p3, p4, p5)
	-- upvalues: AXMigratePeekViewToFocusNavigation (ref), full (ref), brief (ref), closed (ref), peekViewDismissedEventModule (ref), extended (ref)
	local canDragFullViewToBrief = p1.props.canDragFullViewToBrief
	local minimizeToSuperBrief = p1.props.minimizeToSuperBrief
	local var3 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef:getValue() else p1.swipeScrollingFrameRef:getValue()
	local briefViewY = p1.getBriefViewY()
	local var4 = (if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - briefViewY
	
	if p1.viewType == full then
		if var3.AbsoluteCanvasSize.Y - var3.AbsoluteWindowSize.Y - 1 < p2 then return end
		if not p5 and p2 >= briefViewY + var4 * 0.8 then return end
		if canDragFullViewToBrief and (not (p5 and p3 > 500) or minimizeToSuperBrief) then
			p1.goTo(brief)
			
			return
		end
		p1.goTo(closed, nil, nil, {
			dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
		})
		
		return
	elseif p1.viewType == extended then
		if p5 and p2 >= briefViewY + var4 * 0.8 and p3 <= -1 then
		else
			p1.goTo(full)
			
			return
		end
	elseif p4 or briefViewY + var4 * 0.2 < p2 then
		p1.goTo(full)
		
		return
	end
	p1.goTo(brief)
end

function peekView.handleCurYFromSuperBriefToBrief(p1, p2, p3, p4, p5, p6)
	-- upvalues: AXMigratePeekViewToFocusNavigation (ref), full (ref), superBrief (ref), closed (ref), peekViewDismissedEventModule (ref), brief (ref), extended (ref)
	local var3
	local canDragFullViewToBrief = p1.props.canDragFullViewToBrief
	local minimizeToSuperBrief = p1.props.minimizeToSuperBrief
	local var4 = (if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - p3
	
	if p1.viewType == full then
		if p6 or p2 < p3 + var4 * 0.8 then
			var3 = p6 and p4 > 500
			
			if canDragFullViewToBrief and (not var3 or minimizeToSuperBrief) then
				p1.goTo(superBrief)
				
				return
			end
			p1.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		else
			p1.goTo(brief)
			
			return
		end
	elseif p1.viewType == extended then
		if p6 and p2 >= p3 + var4 * 0.8 and p4 <= -1 then
			return
		else
			p1.goTo(brief)
			
			return
		end
	elseif p5 or p3 + var4 * 0.2 < p2 then
		p1.goTo(brief)
		
		return
	end
	var3 = p6 and p4 > 500
	
	if canDragFullViewToBrief and (not var3 or minimizeToSuperBrief) then
		p1.goTo(superBrief)
		
		return
	end
	p1.goTo(closed, nil, nil, {
		dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
	})
end

function peekView.handleCurYFromClosedToSuperBrief(p1, p2, p3, p4, p5, p6)
	-- upvalues: superBrief (ref), closed (ref), peekViewDismissedEventModule (ref)
	local var3 = p3 - 0
	local minimizeToSuperBrief = p1.props.minimizeToSuperBrief
	
	if p1.viewType == superBrief then
		if (p5 or p2 < var3 * 0.8) and not minimizeToSuperBrief then
			p1.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		end
		p1.goTo(superBrief)
		
		return
	elseif (p5 and p4 > 500 or not p6 and var3 * 0.8 >= p2) and not minimizeToSuperBrief then
		p1.goTo(closed, nil, nil, {
			dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
		})
		
		return
	end
	p1.goTo(superBrief)
end

function peekView.handleCurYFromClosedToBrief(p1, p2, p3, p4)
	-- upvalues: brief (ref), closed (ref), peekViewDismissedEventModule (ref)
	local var3 = p1.getBriefViewY() - 0
	
	if p1.viewType == brief then
		if p3 or p2 < 0 + var3 * 0.8 then
			p1.goTo(closed, nil, nil, {
				dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
			})
			
			return
		end
		p1.goTo(brief)
		
		return
	elseif p4 or 0 + var3 * 0.2 < p2 then
		p1.goTo(brief)
		
		return
	end
	p1.goTo(closed, nil, nil, {
		dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.swipe
	})
end

function peekView.adjustScrollingFramePosition(p1)
	-- upvalues: guiService (ref), AXMigratePeekViewToFocusNavigation (ref), extended (ref), full (ref), argCheckModule (ref)
	local selectedCoreObject = guiService.SelectedCoreObject
	
	if not selectedCoreObject or not p1.props.contentFrameRef or not selectedCoreObject:IsDescendantOf(p1.props.contentFrameRef.current) then return end
	local var3 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
	
	if p1.viewType ~= extended and p1.viewType ~= full then
		var3.CanvasPosition = Vector2.new(var3.CanvasPosition.X, argCheckModule.isNotNil(p1.getViewSize(p1.viewType), "self.adjustScrollingFramePosition.viewSize").Offset)
		
		return
	end
	local var4 = selectedCoreObject.AbsolutePosition.Y - p1.props.topBarHeight
	local y = selectedCoreObject.AbsoluteSize.Y
	local y_1 = var3.AbsoluteWindowSize.Y
	local var5 = y_1 - (var4 + y)
	local y_2 = var3.CanvasPosition.Y
	
	if var5 < p1.props.bottomDockedContainerHeight then
		y_2 = y_2 + p1.props.bottomDockedContainerHeight - var5
	elseif var4 + y + (y_2 - y_1) < y_1 - p1.props.bottomDockedContainerHeight then
		y_2 = y_1
	end
	var3.CanvasPosition = Vector2.new(var3.CanvasPosition.X, math.max(0, math.min(y_2, (var3.AbsoluteCanvasSize.Y or var3.CanvasSize.Y.Offset) - var3.AbsoluteWindowSize.Y)))
end

function peekView.handleThumbstickInput(p1, p2, p3)
	-- upvalues: gamepadUtils (ref)
	local position = p2.Position
	local value = p1.swipeScrollingFrameRef:getValue()
	
	if p1.containerFrameRef:getValue() and value then
		local var3 = value.CanvasPosition.Y + p3 * -gamepadUtils.normalizeStickByDeadzone(position).Y * 1000
		
		if p1.getFullViewY() < var3 then
			value.CanvasPosition = Vector2.new(0, var3)
		end
	end
end

function peekView.renderWithStyle(p1, p2)
	-- upvalues: roactModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagProfilePlatformPeekDraggerContrast (ref), AXMigratePeekViewToFocusNavigation (ref), superBrief (ref), imageSetLabel (ref), swipe (ref), focusable (ref), roactGamepadModule (ref), fFlagEnablePeekViewFocusNav (ref), fFlagPeekViewFixBriefHeightLayoutRace (ref), rect (ref), brief (ref), full (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), focusNavigableSurfaceWrapper (ref), focusNavigationUtilsModule (ref), externalEventConnection (ref), userInputService (ref)
	local color_1, transparency
	local children = p1.props[roactModule.Children]
	local bottomDockedContainerHeight = p1.props.bottomDockedContainerHeight
	local bottomDockedContainerContent = p1.props.bottomDockedContainerContent
	local scrollableViewType = p1.props.thumbstickScrollEnabled and p1.state.scrollableViewType
	local color = p2.Theme.BackgroundContrast.Color
	local var3 = fFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger
	local _ = nil
	local _ = nil
	
	if fFlagProfilePlatformPeekDraggerContrast then
		local draggerImageStyle = p1.props.draggerImageStyle
		color_1 = if draggerImageStyle then draggerImageStyle.Color3 else p2.Theme.UIEmphasis.Color
		transparency = if draggerImageStyle then draggerImageStyle.Transparency else p2.Theme.UIEmphasis.Transparency
	else
		color_1 = p2.Theme.UIEmphasis.Color
		transparency = p2.Theme.UIEmphasis.Transparency
	end
	local createElement = roactModule.createElement
	createElement = createElement("TextButton", {
		Text = "",
		LayoutOrder = 3,
		ZIndex = 3,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 25),
		[roactModule.Event.Activated] = p1.onPeekHeaderActivated,
		Selectable = false
	}, {
		Dragger = if p1.props.hideDraggerInSuperBrief and p1.props.peekViewState == superBrief then nil else roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Active = false,
			Size = UDim2.new(0, 36, 0, 36),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = swipe,
			ImageColor3 = color_1,
			ImageTransparency = if var3 then (function()
				-- upvalues: AXMigratePeekViewToFocusNavigation (copy), p1 (ref), transparency (write)
				local var4 = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef.current else p1.swipeScrollingFrameRef.current
				
				if var4 then
					local briefViewY = p1.getBriefViewY()
					
					return transparency + math.max(0, math.min(1, (var4.CanvasPosition.Y - briefViewY) / ((if AXMigratePeekViewToFocusNavigation then p1.props.getFullViewY() else p1.getFullViewY()) - briefViewY))) * (1 - transparency)
				end
				return transparency
			end)() else transparency
		})
	})
	local createElement_1 = roactModule.createElement
	createElement_1 = createElement_1(focusable.Frame, {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		[roactModule.Ref] = p1.clipFrameRef,
		restorePreviousChildFocus = true,
		inputBindings = if AXMigratePeekViewToFocusNavigation or not scrollableViewType then nil else {
			ScrollPeekView = roactGamepadModule.Input.onStep(Enum.KeyCode.Thumbstick2, function(p3, p4)
				-- upvalues: p1 (ref)
				p1:handleThumbstickInput(p3, p4)
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
			ElasticBehavior = p1.props.elasticBehavior,
			ScrollingEnabled = p1.props.isScrollingEnabled,
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.swipeScrollingFrameRef else p1.swipeScrollingFrameRef,
			[roactModule.Change.CanvasPosition] = p1.onSwipeScrollingFrameCanvasPositionChanged,
			[roactModule.Change.AbsoluteWindowSize] = p1.onAbsoluteWindowSizeChanged,
			[roactModule.Change.AbsoluteCanvasSize] = if fFlagPeekViewFixBriefHeightLayoutRace then p1.onAbsoluteCanvasSizeChanged else nil
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
				[roactModule.Ref] = p1.fillingAreaRef
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
					BackgroundColor3 = if p1.props.customBackground then p1.props.customBackground else color
				})
			}),
			PeekHeader = if fFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger then nil else createElement,
			ContentFrame = roactModule.createElement(focusable.Frame, {
				LayoutOrder = 4,
				ZIndex = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Ref] = p1.props.contentFrameRef,
				restorePreviousChildFocus = true,
				onFocusGained = function()
					-- upvalues: p1 (ref), brief (copy), full (copy)
					if p1.viewType == brief and p1.props.peekViewState ~= full then
						p1.goTo(full)
					end
				end
			}, if fFlagProfilePlatformNewProfileHeader and not p1.props.hasSolidDragger then {
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
			[roactModule.Ref] = p1.bottomContainerRef
		}, bottomDockedContainerContent)
	})
	
	return roactModule.createFragment({
		DropShadowBackground = roactModule.createElement("Frame", {
			ZIndex = 0,
			Visible = p1.props.showDropShadow,
			[roactModule.Ref] = p1.shadowRef
		}, {
			UIGradient = roactModule.createElement("UIGradient", {
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
		ClipFrameContainer = if fFlagAXMigrateAXToGlobalAutofocus and not p1.props.shouldCaptureFocus then nil elseif fFlagEnablePeekViewFocusNav then roactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PeekView
		}, { ClipFrame = createElement_1 }) else nil,
		ClipFrame = if fFlagAXMigrateAXToGlobalAutofocus and not p1.props.shouldCaptureFocus then createElement_1 elseif fFlagEnablePeekViewFocusNav then nil else createElement_1,
		InputBegan = roactModule.createElement(externalEventConnection, {
			event = userInputService.InputBegan,
			callback = p1.inputBeganCallback
		}),
		InputEnded = roactModule.createElement(externalEventConnection, {
			event = userInputService.InputEnded,
			callback = p1.inputEndedCallback
		})
	})
end

function peekView.render(p1)
	-- upvalues: roactModule (ref), scrimModule (ref), AXMigratePeekViewToFocusNavigation (ref), closed (ref), peekViewDismissedEventModule (ref)
	return p1.withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), scrimModule (copy), AXMigratePeekViewToFocusNavigation (copy), closed (copy), peekViewDismissedEventModule (copy)
		local var3 = if p1.useReducedMotion then roactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			GroupTransparency = p1.state.canvasGroupTransparency
		}, { p1:renderWithStyle(p2) }) else p1:renderWithStyle(p2)
		
		return if p1.props.hasScrim then roactModule.createElement(scrimModule, {
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef else p1.containerFrameRef,
			onActivated = function()
				-- upvalues: p1 (copy), closed (copy), peekViewDismissedEventModule (copy)
				if p1.isInGoToState then
					return
				end
				p1.goTo(closed, nil, nil, {
					dismissMethod = peekViewDismissedEventModule.dismissMethodEnum.scrimTap
				})
			end,
			onSizeChanged = p1.onContainerFrameAbsoluteSizeChanged
		}, var3) else roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			[roactModule.Ref] = if AXMigratePeekViewToFocusNavigation then p1.props.containerFrameRef else p1.containerFrameRef,
			[roactModule.Change.AbsoluteSize] = p1.onContainerFrameAbsoluteSizeChanged
		}, var3)
	end)
end

function peekView.didMount(p1)
	-- upvalues: closed (ref), getFFlagEnablePeekViewStateOnMountParam (ref), full (ref), brief (ref), getInputGroup (ref), userInputService (ref)
	p1.isMounted = true
	
	if p1.props.closeSignal then
		p1.closeSignalConnection = p1.props.closeSignal:connect(function()
			-- upvalues: p1 (ref), closed (copy)
			if not p1.isInGoToState then
				p1.goTo(closed, true, p1.useReducedMotion)
			end
		end)
	end
	local hidden = p1.props.hidden
	local mountAsFullView = p1.props.mountAsFullView
	local mountAnimation = p1.props.mountAnimation
	local var3 = if getFFlagEnablePeekViewStateOnMountParam() then p1.props.stateOnMount else nil
	
	if not hidden then
		if mountAsFullView then
			p1.goTo(full, mountAnimation, p1.useReducedMotion)
		elseif var3 == nil then
			p1.goTo(brief, mountAnimation, p1.useReducedMotion)
		else
			p1.goTo(var3, mountAnimation, p1.useReducedMotion)
		end
	end
	p1:setState({
		lastInputGroup = getInputGroup(userInputService:GetLastInputType())
	})
	userInputService.LastInputTypeChanged:Connect(function(p2)
		-- upvalues: p1 (ref), getInputGroup (copy)
		p1:setState({ lastInputGroup = getInputGroup(p2) })
	end)
end

function peekView.isAnimating(p1)
	return p1.goToAnimationConnection ~= nil
end

function peekView.didUpdate(p1, p2, p3)
	-- upvalues: hidden (ref), brief (ref), extended (ref)
	if p3.absoluteWindowSizeX ~= p1.state.absoluteWindowSizeX or p3.absoluteWindowSizeY ~= p1.state.absoluteWindowSizeY then
		p1.reconcileRbxInstances("didUpdate")
		
		if not p1:isAnimating() then
			p1.updateSwipeScrollingFrame()
		end
	end
	if p2.bottomDockedContainerHeight ~= p1.props.bottomDockedContainerHeight then
		p1.onContainerFrameAbsoluteSizeChanged()
	end
	if p2.briefViewContentHeight ~= p1.props.briefViewContentHeight and not p1:isAnimating() then
		p1.updateSwipeScrollingFrame()
	end
	if p2.hidden == false and p1.props.hidden == true then
		p1.goTo(hidden)
	elseif p2.hidden == true and p1.props.hidden == false then
		p1.goTo(brief)
	end
	local peekViewState = p1.props.peekViewState
	
	if peekViewState ~= p2.peekViewState and p1.viewType == p2.peekViewState and (peekViewState ~= extended and not p1.isInGoToState) then
		p1.goTo(p1.props.peekViewState)
	end
end

function peekView.willUnmount(p1)
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
	-- upvalues: reactModule (ref), fFlagAXScrollingFramesShouldAnimateOnFocus (ref), gamepadUtils (ref), usePeekViewFocusNavigationBindingsModule (ref), peekView (write), cryoModule (ref)
	local var3 = if fFlagAXScrollingFramesShouldAnimateOnFocus and p1.scrollingFrameRef then p1.scrollingFrameRef else reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = if p1.fullViewContentHeight then p1.fullViewContentHeight else UDim.new(1, 0)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var5 (write)
		return var4.current.AbsoluteSize.Y * var5.Scale + var5.Offset
	end, { var5, var4 })
	usePeekViewFocusNavigationBindingsModule(reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (write), var4 (ref), gamepadUtils (copy), var6 (ref)
		local position = p2.Position
		local value = var3:getValue()
		
		if var4:getValue() and value then
			local var7 = value.CanvasPosition.Y + p3 * -gamepadUtils.normalizeStickByDeadzone(position).Y * 1000
			
			if var6() < var7 then
				value.CanvasPosition = Vector2.new(0, var7)
			end
		end
	end, { var6, var3, var4 }))
	
	return reactModule.createElement(peekView, cryoModule.Dictionary.join(p1, {
		swipeScrollingFrameRef = var3,
		containerFrameRef = var4,
		fullViewContentHeight = var5,
		getFullViewY = var6
	}))
end

peekView = roactRoduxModule.connect(function(p1, _)
	return {
		topBarHeight = if p1.TopBar then p1.TopBar.topBarHeight else 0
	}
end, nil)(peekView)

return if AXMigratePeekViewToFocusNavigation then PeekViewContainer else peekView