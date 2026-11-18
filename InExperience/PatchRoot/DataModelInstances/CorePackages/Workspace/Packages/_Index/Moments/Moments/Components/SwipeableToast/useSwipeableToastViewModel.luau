local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.SwipeableToastView)
local CreateSwipeMachineModule = require(script.Parent.createSwipeMachine)
local SwipeMathModule = require(script.Parent.swipeMath)
local PagerPressBlockersModule = require(Moments.Components.VerticalPager.pagerPressBlockers)
local SnapMathModule = require(Moments.Components.VerticalPager.snapMath)
local UseTouchScrollEnabledModule = require(Moments.Hooks.useTouchScrollEnabled)
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences

local function _(Frame: Frame, Vector): boolean
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	
	return AbsolutePosition.X <= Vector.X and (Vector.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Vector.Y) and Vector.Y <= AbsolutePosition.Y + AbsoluteSize.Y
end

return function(Current)
	-- upvalues: UsePreferencesFunction (copy), UseTouchScrollEnabledModule (copy), ReactModule (copy), SwipeMathModule (copy), CreateSwipeMachineModule (copy), RunService (copy), SnapMathModule (copy), ConstantsModule (copy), PagerPressBlockersModule (copy), UserInputService (copy)
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseTouchScrollEnabledModuleResult = UseTouchScrollEnabledModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local Layout = SwipeMathModule.createLayout(Current.hostSize.X, Current.width, Current.restTop, UseStateResult1)
	local UseRefResult = ReactModule.useRef(Layout)
	UseRefResult.current = Layout
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local UseStateResult3 = ReactModule.useState(function()
		-- upvalues: CreateSwipeMachineModule (upval), ReducedMotion (copy)
		return CreateSwipeMachineModule(ReducedMotion)
	end)
	UseStateResult3.setReducedMotion(ReducedMotion)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(false)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), SwipeMathModule (upval), RunService (upval), SnapMathModule (upval), ConstantsModule (upval), UseBindingResult2 (copy), UseStateResult3 (copy), UseStateResult (copy), PagerPressBlockersModule (upval), UseBindingResult2_3 (copy), UseBindingResult2_1 (copy), UseBindingResult2_2 (copy), UseRefResult3 (copy), UseRefResult1 (copy)
		local Flag = false
		local HeartbeatConnection = nil
		local DelayedThread = nil
		local RegisterResult: (() -> ())? = nil
		local Callback = nil
		
		local function _(p1)
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			
			return if p1 == "exit" then Current.exit else Current.rest
		end
		
		local _ = function(p1)
			-- upvalues: SwipeMathModule (upval), UseRefResult (upval)
			local Current = UseRefResult.current
			
			return SwipeMathModule.offsetForCanvas(if p1 == "exit" then Current.exit else Current.rest, UseRefResult.current)
		end
		
		local _ = function()
			-- upvalues: HeartbeatConnection (ref)
			if HeartbeatConnection then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
		end
		
		local _ = function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
		
		local function startSpring(ScrollFrame, Target, Current)
			-- upvalues: HeartbeatConnection (ref), SwipeMathModule (upval), UseRefResult (upval), RunService (upval), SnapMathModule (upval), ConstantsModule (upval), UseBindingResult2 (upval), Callback (ref), UseStateResult3 (upval)
			if HeartbeatConnection then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			local Y = ScrollFrame.CanvasPosition.Y
			local OffsetForCanvasResult = SwipeMathModule.offsetForCanvas(Y, UseRefResult.current)
			local ScaledCurrent = Current * SwipeMathModule.offsetSlope(Y, UseRefResult.current)
			ScrollFrame:ResetScrollVelocity()
			HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime: number)
				-- upvalues: ScrollFrame (copy), Target (copy), SwipeMathModule (upval), UseRefResult (upval), OffsetForCanvasResult (ref), ScaledCurrent (ref), SnapMathModule (upval), ConstantsModule (upval), UseBindingResult2 (upval), HeartbeatConnection (upval), Callback (upval), UseStateResult3 (upval)
				ScrollFrame:ResetScrollVelocity()
				local Current = UseRefResult.current
				local OffsetForCanvasResult1 = SwipeMathModule.offsetForCanvas(if Target == "exit" then Current.exit else Current.rest, UseRefResult.current)
				OffsetForCanvasResult, ScaledCurrent = SnapMathModule.advanceCriticalDampedSpring(OffsetForCanvasResult, ScaledCurrent, OffsetForCanvasResult1, math.min(DeltaTime, ConstantsModule.MAX_SPRING_DELTA), ConstantsModule.ANIMATION_SPEED)
				local IsMagnitudeBelow: boolean = math.abs(OffsetForCanvasResult1 - OffsetForCanvasResult) < ConstantsModule.POSITION_THRESHOLD and math.abs(ScaledCurrent) < ConstantsModule.VELOCITY_THRESHOLD
				
				if IsMagnitudeBelow then
					OffsetForCanvasResult = OffsetForCanvasResult1
				end
				local Exit = nil
				if IsMagnitudeBelow then
					local Current1 = UseRefResult.current
					Exit = if Target == "exit" then Current1.exit else Current1.rest
				else
					Exit = SwipeMathModule.canvasForOffset(OffsetForCanvasResult, UseRefResult.current)
				end
				ScrollFrame.CanvasPosition = Vector2.new(0, Exit)
				UseBindingResult2(ScrollFrame.CanvasPosition.Y)
				
				if IsMagnitudeBelow or Target == "exit" and SwipeMathModule.isOffscreen(Exit, UseRefResult.current) then
					if HeartbeatConnection then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
					Callback(UseStateResult3.settled())
				end
			end)
		end
		
		local function syncInteractive()
			-- upvalues: UseStateResult3 (upval), RegisterResult (ref), UseStateResult (upval), PagerPressBlockersModule (upval), UseBindingResult2_3 (upval)
			local Phase = UseStateResult3.getPhase()
			local IsResting: boolean = Phase == "resting" or (Phase == "dragging" or Phase == "settling")
			
			if IsResting and RegisterResult == nil and UseStateResult then
				RegisterResult = PagerPressBlockersModule.register(UseStateResult)
			elseif not IsResting and RegisterResult ~= nil then
				RegisterResult()
				RegisterResult = nil
			end
			UseBindingResult2_3(IsResting)
		end
		
		Callback = function(SettledResult)
			-- upvalues: Flag (ref), UseBindingResult2_1 (upval), HeartbeatConnection (ref), UseBindingResult2_2 (upval), UseStateResult (upval), UseRefResult (upval), UseBindingResult2 (upval), UseRefResult3 (upval), startSpring (copy), UseRefResult1 (upval), DelayedThread (ref), syncInteractive (copy)
			if Flag then return end
			for _, value in SettledResult do
				local Kind = value.kind
				
				if Kind == "expand" then
					UseBindingResult2_1(true)
				elseif Kind == "collapse" then
					UseBindingResult2_1(false)
				elseif Kind == "jump" then
					if HeartbeatConnection then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
					UseBindingResult2_2(true)
					
					if UseStateResult then
						UseStateResult:ResetScrollVelocity()
						local Current = UseRefResult.current
						UseStateResult.CanvasPosition = Vector2.new(0, if (value.target or "rest") == "exit" then Current.exit else Current.rest)
						UseBindingResult2(UseStateResult.CanvasPosition.Y)
					end
				elseif Kind == "spring" then
					UseBindingResult2_2(true)
					
					if UseStateResult then
						startSpring(UseStateResult, value.target or "rest", if value.carryVelocity then UseRefResult3.current else 0)
					end
				elseif Kind == "stopSpring" then
					if HeartbeatConnection then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
				elseif Kind == "dismiss" then
					UseRefResult1.current.onDismiss()
				elseif Kind == "exited" then
					UseBindingResult2_2(false)
					UseRefResult1.current.onExited()
				elseif Kind ~= "pauseTimer" then
					if Kind == "restartTimer" then
						if DelayedThread then
							task.cancel(DelayedThread)
							DelayedThread = nil
						end
						DelayedThread = task.delay(UseRefResult1.current.duration, function()
							-- upvalues: DelayedThread (upval), Flag (upval), UseRefResult1 (upval)
							DelayedThread = nil
							
							if not Flag then
								UseRefResult1.current.onDismiss()
							end
						end)
					end
				elseif DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
			if not Flag then
				syncInteractive()
			end
		end
		
		return {
			runActions = Callback,
			syncInteractive = syncInteractive,
			dispose = function()
				-- upvalues: Flag (ref), HeartbeatConnection (ref), DelayedThread (ref), RegisterResult (ref)
				Flag = true
				
				if HeartbeatConnection then
					HeartbeatConnection:Disconnect()
					HeartbeatConnection = nil
				end
				if DelayedThread then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
				if RegisterResult ~= nil then
					RegisterResult()
					RegisterResult = nil
				end
			end
		}
	end, { UseStateResult, UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.syncInteractive()
		
		return UseMemoResult.dispose
	end, { UseMemoResult })
	local IsUseStateResultAbove = UseStateResult1 > 0
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), IsUseStateResultAbove (copy), UseMemoResult (copy), UseStateResult3 (copy)
		if UseStateResult and IsUseStateResultAbove then
			UseMemoResult.runActions(UseStateResult3.start())
		end
	end, {
		UseMemoResult,
		UseStateResult3,
		IsUseStateResultAbove,
		UseStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseMemoResult (copy), UseStateResult3 (copy)
		if Current.isExiting then
			UseMemoResult.runActions(UseStateResult3.requestExit())
		end
	end, { UseMemoResult, UseStateResult3, Current.isExiting })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UserInputService (upval), UseRefResult2 (copy), UseBindingResult4 (copy), UseMemoResult (copy), UseStateResult3 (copy), UseRefResult3 (copy), UseRefResult (copy), SwipeMathModule (upval)
		if UseStateResult then
			local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
				-- upvalues: UseRefResult2 (upval), UseBindingResult4 (upval), UseStateResult (copy), UseMemoResult (upval), UseStateResult3 (upval)
				if Input.UserInputType == Enum.UserInputType.Touch and UseRefResult2.current == nil and UseBindingResult4:getValue() then
					local Position = Input.Position
					local AbsolutePosition = UseStateResult.AbsolutePosition
					local AbsoluteSize = UseStateResult.AbsoluteSize
					
					if AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Position.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
						UseRefResult2.current = { input = Input, canvasY = UseStateResult.CanvasPosition.Y }
						UseMemoResult.runActions(UseStateResult3.press())
						
						return
					end
				end
			end)
			local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
				-- upvalues: UseRefResult2 (upval), UseStateResult (copy), UseRefResult3 (upval), UseRefResult (upval), SwipeMathModule (upval), UseMemoResult (upval), UseStateResult3 (upval)
				local Current = UseRefResult2.current
				
				if Current ~= nil and Current.input == Input then
					UseRefResult2.current = nil
					local Y = UseStateResult:GetScrollVelocity().Y
					UseRefResult3.current = Y
					local Current1 = UseRefResult.current
					local Y1 = UseStateResult.CanvasPosition.Y
					UseMemoResult.runActions(UseStateResult3.release(SwipeMathModule.resolveRelease(SwipeMathModule.offsetForCanvas(Y1, Current1), Y * SwipeMathModule.offsetSlope(Y1, Current1), Current1.cardHeight)))
					
					return
				end
			end)
			
			return function()
				-- upvalues: InputBeganConnection (copy), InputEndedConnection (copy), UseRefResult2 (upval), UseRefResult3 (upval), UseMemoResult (upval), UseStateResult3 (upval)
				InputBeganConnection:Disconnect()
				InputEndedConnection:Disconnect()
				
				if UseRefResult2.current ~= nil then
					UseRefResult2.current = nil
					UseRefResult3.current = 0
					UseMemoResult.runActions(UseStateResult3.release("rest"))
				end
			end
		else
			return nil
		end
	end, { UseMemoResult, UseStateResult3, UseStateResult })
	
	return {
		scrollerRef = UseStateResult2,
		scrollerPosition = UseBindingResult1:map(function(p1): UDim2
			-- upvalues: Layout (copy)
			return if p1 then UDim2.new() else UDim2.fromOffset(Layout.restLeft, Layout.restTop)
		end),
		scrollerSize = UseBindingResult1:map(function(p1): UDim2
			-- upvalues: Layout (copy)
			return if p1 then UDim2.fromScale(1, 1) else UDim2.fromOffset(Layout.width, Layout.cardHeight)
		end),
		canvasSize = UDim2.new(0, 0, 1, Layout.exit),
		scrollingEnabled = UseBindingResult4:map(function(p1)
			-- upvalues: UseTouchScrollEnabledModuleResult (copy)
			return p1 and UseTouchScrollEnabledModuleResult
		end),
		onCanvasPositionChanged = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: UseBindingResult2 (copy), UseRefResult2 (copy), ConstantsModule (upval), UseMemoResult (copy), UseStateResult3 (copy)
			local Y = ScrollFrame.CanvasPosition.Y
			UseBindingResult2(Y)
			local Current = UseRefResult2.current
			
			if Current ~= nil and ConstantsModule.POSITION_THRESHOLD < math.abs(Y - Current.canvasY) then
				UseMemoResult.runActions(UseStateResult3.scroll())
			end
		end, { UseMemoResult, UseStateResult3 }),
		cardPosition = ReactModule.joinBindings({ canvasY = UseBindingResult, expanded = UseBindingResult1 }):map(function(p1): UDim2
			-- upvalues: SwipeMathModule (upval), Layout (copy)
			local CardCanvasPositionResult, CardCanvasPositionResult2 = SwipeMathModule.cardCanvasPosition(p1.canvasY, p1.expanded, Layout)
			
			return UDim2.fromOffset(CardCanvasPositionResult, CardCanvasPositionResult2)
		end),
		cardVisible = UseBindingResult3,
		cardWidth = Current.width,
		onCardSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(Frame.AbsoluteSize.Y)
		end, {}),
		card = Current.card,
		ZIndex = Current.ZIndex
	}
end