local Parent = script:FindFirstAncestor("Moments").Parent
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local SnapMathModule = require(script.Parent.snapMath)
local PagerNavigationModule = require(script.Parent.pagerNavigation)
local UsePreferencesFunction = require(Parent.Foundation).Hooks.usePreferences

return function(p1) --[[ Line: 64 | Named "usePagerController" ]]
	-- upvalues: ReactModule (copy), UsePreferencesFunction (copy), SignalsModule (copy), RunService (copy), ConstantsModule (copy), SnapMathModule (copy), PagerNavigationModule (copy), UserInputService (copy), SignalsReactModule (copy)
	local ScrollingFrame = p1.scrollingFrame
	local Store = p1.store
	local ItemHeight = p1.itemHeight
	local Gap = p1.gap
	local Active = p1.active
	local NativeScrollEnabled = p1.nativeScrollEnabled
	local UseRefResult = ReactModule.useRef(Store)
	UseRefResult.current = Store
	local UseRefResult1 = ReactModule.useRef(ItemHeight)
	UseRefResult1.current = ItemHeight
	local UseRefResult2 = ReactModule.useRef(ItemHeight + Gap)
	UseRefResult2.current = ItemHeight + Gap
	local UseRefResult3 = ReactModule.useRef(p1.snapSensitivity)
	UseRefResult3.current = p1.snapSensitivity
	local UseRefResult4 = ReactModule.useRef(p1.animationSpeed)
	UseRefResult4.current = p1.animationSpeed
	local UseRefResult5 = ReactModule.useRef(p1.analytics)
	UseRefResult5.current = p1.analytics
	local UseRefResult6 = ReactModule.useRef(Active)
	UseRefResult6.current = Active
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseRefResult7 = ReactModule.useRef(ReducedMotion)
	UseRefResult7.current = ReducedMotion
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(0)
	local UseRefResult11 = ReactModule.useRef(0)
	local UseRefResult12 = ReactModule.useRef(false)
	local UseRefResult13 = ReactModule.useRef({})
	local UseRefResult14 = ReactModule.useRef(0)
	local UseRefResult15 = ReactModule.useRef(0)
	local UseRefResult16 = ReactModule.useRef(Store.getCurrentIndex(false))
	local UseRefResult17 = ReactModule.useRef(0)
	local UseRefResult18 = ReactModule.useRef(0)
	local UseRefResult19 = ReactModule.useRef(false)
	local UseRefResult20 = ReactModule.useRef(true)
	local UseRefResult21 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 132 ]]
		-- upvalues: SignalsModule (upval), UseRefResult (copy)
		local Signal, Signal2 = SignalsModule.createSignal(UseRefResult.current.getCurrentIndex(false))
		
		return { get = Signal, set = Signal2 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 136 ]]
		-- upvalues: SignalsModule (upval)
		local Idle, Idle2 = SignalsModule.createSignal("Idle")
		
		return { get = Idle, set = Idle2 }
	end, {})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 141 ]]
		-- upvalues: UseMemoResult1 (copy), UseRefResult5 (copy)
		if UseMemoResult1.get(false) == p2 then return end
		UseMemoResult1.set(p2)
		local Current = UseRefResult5.current
		
		if Current and Current.onScrollStateChanged then
			Current.onScrollStateChanged(p2)
		end
	end, { UseMemoResult1 })
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 152 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult5 (copy), UseRefResult (copy)
		if UseMemoResult.get(false) == p2 then return end
		UseMemoResult.set(p2)
		local Current = UseRefResult5.current
		
		if Current and Current.onActiveItemChanged then
			Current.onActiveItemChanged(p2, UseRefResult.current.getItems(false)[p2])
		end
	end, { UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 165 ]]
		-- upvalues: UseRefResult21 (copy), UseRefResult (copy)
		local Current = UseRefResult21.current
		
		if Current ~= nil then
			UseRefResult21.current = nil
			UseRefResult.current.removeItem(Current)
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 173 ]]
		-- upvalues: UseRefResult8 (copy), UseRefResult9 (copy), UseResult2 (copy)
		if UseRefResult8.current then
			UseRefResult8.current:Disconnect()
			UseRefResult8.current = nil
		end
		UseRefResult9.current = false
		UseResult2()
	end, { UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Y) --[[ Line: 184 ]]
		-- upvalues: ScrollingFrame (copy), UseResult3 (copy), UseRefResult9 (copy), UseResult (copy), UseRefResult11 (copy), UseRefResult8 (copy), RunService (upval), UseRefResult12 (copy), UseRefResult20 (copy), ConstantsModule (upval), SnapMathModule (upval), UseRefResult10 (copy), UseRefResult4 (copy)
		if ScrollingFrame then
			UseResult3()
			UseRefResult9.current = true
			UseResult("Settling")
			UseRefResult11.current = ScrollingFrame.CanvasPosition.Y
			ScrollingFrame:ResetScrollVelocity()
			UseRefResult8.current = RunService.Heartbeat:Connect(function(DeltaTime: number) --[[ Line: 200 ]]
				-- upvalues: ScrollingFrame (upval), UseRefResult9 (upval), UseRefResult12 (upval), UseRefResult20 (upval), UseResult3 (upval), ConstantsModule (upval), SnapMathModule (upval), UseRefResult11 (upval), UseRefResult10 (upval), Y (copy), UseRefResult4 (upval), UseResult (upval)
				if not ScrollingFrame or not UseRefResult9.current or UseRefResult12.current or not UseRefResult20.current then
					UseResult3()
					
					return
				end
				ScrollingFrame:ResetScrollVelocity()
				local AdvanceCriticalDampedSpringResult, AdvanceCriticalDampedSpringResult2 = SnapMathModule.advanceCriticalDampedSpring(UseRefResult11.current, UseRefResult10.current, Y, math.min(DeltaTime, ConstantsModule.MAX_SPRING_DELTA), UseRefResult4.current)
				UseRefResult10.current = AdvanceCriticalDampedSpringResult2
				UseRefResult11.current = AdvanceCriticalDampedSpringResult
				ScrollingFrame.CanvasPosition = Vector2.new(0, AdvanceCriticalDampedSpringResult)
				
				if math.abs(Y - AdvanceCriticalDampedSpringResult) < ConstantsModule.POSITION_THRESHOLD and math.abs(UseRefResult10.current) < ConstantsModule.VELOCITY_THRESHOLD then
					ScrollingFrame.CanvasPosition = Vector2.new(0, Y)
					UseRefResult11.current = Y
					UseResult3()
					UseResult("Idle")
				end
			end)
			
			return
		end
	end, { ScrollingFrame, UseResult3, UseResult })
	local UseResult5 = ReactModule.useCallback(function(p2, Current, p3) --[[ Line: 242 ]]
		-- upvalues: ScrollingFrame (copy), UseRefResult (copy), SnapMathModule (upval), UseRefResult5 (copy), UseRefResult16 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult7 (copy), UseResult3 (copy), UseResult1 (copy), UseResult (copy), UseRefResult10 (copy), UseResult4 (copy)
		if not ScrollingFrame then return end
		local Current1 = UseRefResult.current
		local ClampIndexResult = SnapMathModule.clampIndex(p2, Current1.getCount(false))
		local CurrentIndex = Current1.getCurrentIndex(false)
		local Current2 = UseRefResult5.current
		local OnTargetCommitted: (any, any, any) -> () = if ClampIndexResult == CurrentIndex or Current2 == nil then nil else Current2.onTargetCommitted
		local OnUserStep: (any, any) -> () = if p3 and ClampIndexResult ~= CurrentIndex and Current2 ~= nil then Current2.onUserStep else nil
		
		local function _() --[[ Line: 259 | Named "commitTarget" ]]
			-- upvalues: OnTargetCommitted (copy), CurrentIndex (copy), ClampIndexResult (copy), Current1 (copy), OnUserStep (copy)
			if OnTargetCommitted ~= nil then
				OnTargetCommitted(CurrentIndex, ClampIndexResult, Current1.getItems(false)[ClampIndexResult])
			end
			if OnUserStep ~= nil then
				OnUserStep(CurrentIndex, ClampIndexResult)
			end
			Current1.goToItem(ClampIndexResult)
		end
		
		UseRefResult16.current = ClampIndexResult
		
		if UseRefResult1.current <= 0 then
			if OnTargetCommitted ~= nil then
				OnTargetCommitted(CurrentIndex, ClampIndexResult, Current1.getItems(false)[ClampIndexResult])
			end
			if OnUserStep ~= nil then
				OnUserStep(CurrentIndex, ClampIndexResult)
			end
			Current1.goToItem(ClampIndexResult)
			
			return
		else
			local OffsetForIndexResult = SnapMathModule.offsetForIndex(ClampIndexResult, UseRefResult2.current)
			
			if UseRefResult7.current then
				if OnTargetCommitted ~= nil then
					OnTargetCommitted(CurrentIndex, ClampIndexResult, Current1.getItems(false)[ClampIndexResult])
				end
				if OnUserStep ~= nil then
					OnUserStep(CurrentIndex, ClampIndexResult)
				end
				Current1.goToItem(ClampIndexResult)
				UseResult3()
				ScrollingFrame.CanvasPosition = Vector2.new(0, OffsetForIndexResult)
				UseResult1(ClampIndexResult)
				UseResult("Idle")
				
				return
			else
				if OnTargetCommitted ~= nil then
					UseResult("Settling")
				end
				if OnTargetCommitted ~= nil then
					OnTargetCommitted(CurrentIndex, ClampIndexResult, Current1.getItems(false)[ClampIndexResult])
				end
				if OnUserStep ~= nil then
					OnUserStep(CurrentIndex, ClampIndexResult)
				end
				Current1.goToItem(ClampIndexResult)
				UseRefResult10.current = Current
				UseResult4(OffsetForIndexResult)
			end
		end
	end, {
		ScrollingFrame,
		UseResult4,
		UseResult3,
		UseResult,
		UseResult1
	})
	local UseResult6 = ReactModule.useCallback(function(Velocity) --[[ Line: 310 ]]
		-- upvalues: ScrollingFrame (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), SnapMathModule (upval), UseRefResult3 (copy), UseRefResult5 (copy), UseResult5 (copy)
		if not ScrollingFrame then return end
		local Count: number = UseRefResult.current.getCount(false)
		local Current: number = UseRefResult1.current
		
		if Count <= 0 or Current <= 0 then return end
		local Y = ScrollingFrame.CanvasPosition.Y
		local Current1 = UseRefResult2.current
		local ResolveSnapIndexResult = SnapMathModule.resolveSnapIndex(Y, Velocity, Current1, Count, UseRefResult3.current)
		local Current11 = UseRefResult5.current
		
		if Current11 and Current11.onSnap then
			Current11.onSnap({
				fromIndex = SnapMathModule.nearestIndexForOffset(Y, Current1, Count),
				toIndex = ResolveSnapIndexResult,
				velocity = Velocity
			})
		end
		UseResult5(ResolveSnapIndexResult, -Velocity, true)
	end, { ScrollingFrame, UseResult5 })
	local UseResult7 = ReactModule.useCallback(function(p2) --[[ Line: 338 ]]
		-- upvalues: UseResult5 (copy)
		UseResult5(p2, 0)
	end, { UseResult5 })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 342 ]]
		-- upvalues: UseResult5 (copy), UseRefResult (copy)
		UseResult5(UseRefResult.current.getCurrentIndex(false) + 1, 0, true)
	end, { UseResult5 })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 346 ]]
		-- upvalues: UseResult5 (copy), UseRefResult (copy)
		UseResult5(UseRefResult.current.getCurrentIndex(false) - 1, 0, true)
	end, { UseResult5 })
	local UseResult10 = ReactModule.useCallback(function(Current) --[[ Line: 353 ]]
		-- upvalues: UseRefResult (copy), UseRefResult21 (copy), SnapMathModule (upval), UseRefResult1 (copy), ScrollingFrame (copy), UseRefResult7 (copy), UseRefResult16 (copy), UseRefResult10 (copy), UseResult4 (copy), UseRefResult2 (copy)
		local Current1 = UseRefResult.current
		
		if UseRefResult21.current ~= nil then return end
		local CurrentIndex = Current1.getCurrentIndex(false)
		local Count: number = Current1.getCount(false)
		
		if Current ~= CurrentIndex then
			Current1.removeItem(Current)
			
			return
		end
		if Count <= 1 then
			Current1.removeItem(Current)
			
			return
		end
		local NeighborForRemovalResult = SnapMathModule.neighborForRemoval(CurrentIndex, Count)
		local Current2: number = UseRefResult1.current
		
		if ScrollingFrame and Current2 > 0 and not UseRefResult7.current then
			UseRefResult16.current = NeighborForRemovalResult
			UseRefResult10.current = 0
			UseResult4(SnapMathModule.offsetForIndex(NeighborForRemovalResult, UseRefResult2.current))
			UseRefResult21.current = Current
			
			return
		else
			Current1.removeItem(Current)
		end
	end, { ScrollingFrame, UseResult4 })
	ReactModule.useEffect(function() --[[ Line: 395 ]]
		-- upvalues: ScrollingFrame (copy), UseRefResult1 (copy), UseRefResult (copy), UseResult1 (copy), SnapMathModule (upval), UseRefResult2 (copy), UseRefResult12 (copy), UseRefResult9 (copy), Active (copy), UseRefResult18 (copy), UseRefResult19 (copy), UseRefResult20 (copy), UseRefResult6 (copy), ConstantsModule (upval), UseResult5 (copy)
		if not ScrollingFrame then return end
		local Connection = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 401 ]]
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), UseResult1 (upval), SnapMathModule (upval), ScrollingFrame (copy), UseRefResult2 (upval), UseRefResult12 (upval), UseRefResult9 (upval), Active (upval), UseRefResult18 (upval), UseRefResult19 (upval), UseRefResult20 (upval), UseRefResult6 (upval), ConstantsModule (upval), UseResult5 (upval)
			if UseRefResult1.current <= 0 then return end
			UseResult1(SnapMathModule.nearestIndexForOffset(ScrollingFrame.CanvasPosition.Y, UseRefResult2.current, (UseRefResult.current.getCount(false))))
			
			if UseRefResult12.current or UseRefResult9.current or not Active then return end
			UseRefResult18.current = os.clock()
			
			if not UseRefResult19.current then
				UseRefResult19.current = true
				
				local function runSettle() --[[ Line: 423 ]]
					-- upvalues: UseRefResult20 (upval), UseRefResult12 (upval), UseRefResult9 (upval), UseRefResult6 (upval), UseRefResult19 (upval), UseRefResult18 (upval), ConstantsModule (upval), runSettle (copy), UseRefResult1 (upval), UseRefResult2 (upval), ScrollingFrame (upval), UseRefResult (upval), SnapMathModule (upval), UseResult5 (upval)
					if not UseRefResult20.current or UseRefResult12.current or UseRefResult9.current or not UseRefResult6.current then
						UseRefResult19.current = false
						
						return
					end
					if os.clock() - UseRefResult18.current < ConstantsModule.SETTLE_DEBOUNCE_SECONDS then
						task.delay(ConstantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
						
						return
					end
					UseRefResult19.current = false
					
					if UseRefResult1.current <= 0 then return end
					local Current = UseRefResult2.current
					local Y = ScrollingFrame.CanvasPosition.Y
					local CurrentIndex = UseRefResult.current.getCurrentIndex(false)
					local ResolveSettleIndexResult = SnapMathModule.resolveSettleIndex(CurrentIndex, Y, Current, UseRefResult.current.getCount(false), ConstantsModule.WHEEL_PAGE_TURN_FRACTION, 1)
					
					if ResolveSettleIndexResult ~= CurrentIndex or ConstantsModule.POSITION_THRESHOLD < math.abs(Y - SnapMathModule.offsetForIndex(CurrentIndex, Current)) then
						UseResult5(ResolveSettleIndexResult, 0, true)
					end
				end
				
				task.delay(ConstantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
				
				return
			end
		end)
		
		return function() --[[ Line: 465 ]]
			-- upvalues: Connection (copy), UseRefResult19 (upval)
			Connection:Disconnect()
			UseRefResult19.current = false
		end
	end, { ScrollingFrame, Active, UseResult1, UseResult5 })
	ReactModule.useEffect(function() --[[ Line: 476 ]]
		-- upvalues: ScrollingFrame (copy), Active (copy), PagerNavigationModule (upval), NativeScrollEnabled (copy), UseRefResult13 (copy), UserInputService (upval), UseRefResult12 (copy), UseRefResult14 (copy), UseResult3 (copy), UseResult (copy), ConstantsModule (upval), UseResult6 (copy), UseRefResult15 (copy), UseResult5 (copy), UseRefResult (copy)
		if not ScrollingFrame or not Active then return end
		local function _(Input): boolean --[[ Line: 482 | Named "isDragInput" ]]
			return Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1
		end
		
		local ShouldTrackDrag = PagerNavigationModule.shouldTrackDrag(true, NativeScrollEnabled)
		UseRefResult13.current = {}
		
		local _ = function(p2): boolean --[[ Line: 502 | Named "isWithinFrame" ]]
			-- upvalues: ScrollingFrame (copy)
			local Position = p2.Position
			local AbsolutePosition = ScrollingFrame.AbsolutePosition
			local AbsoluteSize = ScrollingFrame.AbsoluteSize
			
			return AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Position.Y) and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
		end
		
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 512 ]]
			-- upvalues: ShouldTrackDrag (copy), UseRefResult13 (upval), ScrollingFrame (copy), UseRefResult12 (upval), UseRefResult14 (upval), UseResult3 (upval), UseResult (upval)
			if ShouldTrackDrag and ((Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and not UseRefResult13.current[Input]) then
				local Position = Input.Position
				local AbsolutePosition = ScrollingFrame.AbsolutePosition
				local AbsoluteSize = ScrollingFrame.AbsoluteSize
				
				if AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Position.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
					UseRefResult13.current[Input] = true
					
					if next(UseRefResult13.current) == nil then
						UseRefResult12.current = true
						UseRefResult14.current = ScrollingFrame.CanvasPosition.Y
						UseResult3()
						UseResult("Dragging")
					end
					return
				end
			end
		end)
		local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input) --[[ Line: 531 ]]
			-- upvalues: UseRefResult13 (upval), UseRefResult12 (upval), ScrollingFrame (copy), UseRefResult14 (upval), ConstantsModule (upval), UseResult (upval), UseResult6 (upval)
			if not UseRefResult13.current[Input] then return end
			UseRefResult13.current[Input] = nil
			
			if next(UseRefResult13.current) ~= nil then return end
			UseRefResult12.current = false
			local Y: number = ScrollingFrame:GetScrollVelocity().Y
			
			if math.abs(ScrollingFrame.CanvasPosition.Y - UseRefResult14.current) > ConstantsModule.POSITION_THRESHOLD or math.abs(Y) >= ConstantsModule.VELOCITY_THRESHOLD then
				UseResult6(Y)
				
				return
			else
				UseResult("Idle")
			end
		end)
		local Connection = nil
		
		local _ = function(p2) --[[ Line: 563 | Named "onWheel" ]]
			-- upvalues: PagerNavigationModule (upval), UseRefResult15 (upval), ConstantsModule (upval), UseResult5 (upval), UseRefResult (upval)
			local ResolveWheelGestureResult, ResolveWheelGestureResult2 = PagerNavigationModule.resolveWheelGesture(os.clock(), UseRefResult15.current, ConstantsModule.WHEEL_COOLDOWN_SECONDS)
			UseRefResult15.current = ResolveWheelGestureResult2
			
			if ResolveWheelGestureResult then
				UseResult5(UseRefResult.current.getCurrentIndex(false) + p2, 0, true)
			end
		end
		
		if not NativeScrollEnabled then
			Connection = UserInputService.InputChanged:Connect(function(Input) --[[ Line: 583 ]]
				-- upvalues: ScrollingFrame (copy), PagerNavigationModule (upval), UseRefResult15 (upval), ConstantsModule (upval), UseResult5 (upval), UseRefResult (upval)
				if Input.UserInputType == Enum.UserInputType.MouseWheel then
					local Position = Input.Position
					local AbsolutePosition = ScrollingFrame.AbsolutePosition
					local AbsoluteSize = ScrollingFrame.AbsoluteSize
					
					if AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and (AbsolutePosition.Y <= Position.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y)) then
						local Z: number = Input.Position.Z
						
						if Z > 0 then
							local ResolveWheelGestureResult, ResolveWheelGestureResult2 = PagerNavigationModule.resolveWheelGesture(os.clock(), UseRefResult15.current, ConstantsModule.WHEEL_COOLDOWN_SECONDS)
							UseRefResult15.current = ResolveWheelGestureResult2
							
							if ResolveWheelGestureResult then
								UseResult5(UseRefResult.current.getCurrentIndex(false) + -1, 0, true)
								
								return
							end
						elseif Z < 0 then
							local ResolveWheelGestureResult1, ResolveWheelGestureResult2_1 = PagerNavigationModule.resolveWheelGesture(os.clock(), UseRefResult15.current, ConstantsModule.WHEEL_COOLDOWN_SECONDS)
							UseRefResult15.current = ResolveWheelGestureResult2_1
							
							if ResolveWheelGestureResult1 then
								UseResult5(UseRefResult.current.getCurrentIndex(false) + 1, 0, true)
							end
						end
						return
					end
				end
			end)
		end
		return function() --[[ Line: 598 ]]
			-- upvalues: InputBeganConnection (copy), InputEndedConnection (copy), Connection (ref)
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
			
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {
		ScrollingFrame, Active, NativeScrollEnabled, UseResult3, UseResult, UseResult6,
		UseResult5, UseResult8, UseResult9
	})
	local UseSignalStateResult = SignalsReactModule.useSignalState(Store.getCount)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Store.getCurrentIndex)
	ReactModule.useEffect(function() --[[ Line: 632 ]]
		-- upvalues: ScrollingFrame (copy), ItemHeight (copy), Gap (copy), UseRefResult17 (copy), SnapMathModule (upval), UseSignalStateResult1 (copy), UseSignalStateResult (copy), UseRefResult16 (copy), UseResult3 (copy), UseResult1 (copy), UseResult (copy)
		local NewItemHeight = ItemHeight + Gap
		
		if not ScrollingFrame or ItemHeight <= 0 then
			UseRefResult17.current = NewItemHeight
			
			return
		end
		local ClampIndexResult = SnapMathModule.clampIndex(UseSignalStateResult1, UseSignalStateResult)
		
		if NewItemHeight ~= UseRefResult17.current or ClampIndexResult ~= UseRefResult16.current then
			UseResult3()
			ScrollingFrame.CanvasPosition = Vector2.new(0, SnapMathModule.offsetForIndex(ClampIndexResult, NewItemHeight))
			UseRefResult16.current = ClampIndexResult
			UseResult1(ClampIndexResult)
			UseResult("Idle")
		end
		UseRefResult17.current = NewItemHeight
	end, {
		ScrollingFrame, UseSignalStateResult, UseSignalStateResult1, ItemHeight, Gap,
		UseResult3, UseResult1, UseResult
	})
	ReactModule.useEffect(function() --[[ Line: 672 ]]
		-- upvalues: Active (copy), UseResult3 (copy), UseResult (copy)
		if not Active then
			UseResult3()
			UseResult("Idle")
		end
	end, { Active, UseResult3, UseResult })
	ReactModule.useEffect(function() --[[ Line: 681 ]]
		-- upvalues: UseRefResult20 (copy), UseResult3 (copy)
		UseRefResult20.current = true
		
		return function() --[[ Line: 683 ]]
			-- upvalues: UseRefResult20 (upval), UseResult3 (upval)
			UseRefResult20.current = false
			UseResult3()
		end
	end, { UseResult3 })
	
	return ReactModule.useMemo(function() --[[ Line: 691 ]]
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy), UseResult7 (copy), UseResult8 (copy), UseResult9 (copy), UseResult10 (copy)
		return {
			getActiveIndex = UseMemoResult.get,
			getScrollState = UseMemoResult1.get,
			scrollToIndex = UseResult7,
			next = UseResult8,
			previous = UseResult9,
			removeItem = UseResult10
		}
	end, {
		UseMemoResult, UseMemoResult1, UseResult7, UseResult8, UseResult9, UseResult10
	})
end