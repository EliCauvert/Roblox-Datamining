local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local snapMathModule = require(script.Parent.snapMath)
local pagerNavigationModule = require(script.Parent.pagerNavigation)
local getFFlagMomentsFixNavButtonSnapModule = require(moments.Flags.GetFFlagMomentsFixNavButtonSnap)
local usePreferences = foundationModule.Hooks.usePreferences

return function(p1)
	-- upvalues: reactModule (ref), usePreferences (ref), signalsModule (ref), runService (ref), constantsModule (ref), snapMathModule (ref), pagerNavigationModule (ref), getFFlagMomentsFixNavButtonSnapModule (ref), userInputService (ref), signalsReactModule (ref)
	local scrollingFrame = p1.scrollingFrame
	local store = p1.store
	local itemHeight = p1.itemHeight
	local gap = p1.gap
	local active = p1.active
	local nativeScrollEnabled = p1.nativeScrollEnabled
	local var1 = reactModule.useRef(store)
	var1.current = store
	local var2 = reactModule.useRef(itemHeight)
	var2.current = itemHeight
	local var3 = reactModule.useRef(itemHeight + gap)
	var3.current = itemHeight + gap
	local var4 = reactModule.useRef(p1.snapSensitivity)
	var4.current = p1.snapSensitivity
	local var5 = reactModule.useRef(p1.animationSpeed)
	var5.current = p1.animationSpeed
	local var6 = reactModule.useRef(p1.analytics)
	var6.current = p1.analytics
	local var7 = reactModule.useRef(active)
	var7.current = active
	local reducedMotion = usePreferences().reducedMotion
	local var8 = reactModule.useRef(reducedMotion)
	var8.current = reducedMotion
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(0)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef({})
	local var15 = reactModule.useRef(0)
	local var16 = reactModule.useRef(0)
	local var17 = reactModule.useRef(store.getCurrentIndex(false))
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useRef(0)
	local var20 = reactModule.useRef(false)
	local var21 = reactModule.useRef(true)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref)
		local var24, var25 = signalsModule.createSignal(var1.current.getCurrentIndex(false))
		
		return { get = var24, set = var25 }
	end, {})
	local var24 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local idle, idle_1 = signalsModule.createSignal("Idle")
		
		return { get = idle, set = idle_1 }
	end, {})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var24 (ref), var6 (ref)
		if var24.get(false) == p2 then return end
		var24.set(p2)
		local current = var6.current
		
		if current and current.onScrollStateChanged then
			current.onScrollStateChanged(p2)
		end
	end, { var24 })
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: var23 (ref), var6 (ref), var1 (ref)
		if var23.get(false) == p2 then return end
		var23.set(p2)
		local current = var6.current
		
		if current and current.onActiveItemChanged then
			current.onActiveItemChanged(p2, var1.current.getItems(false)[p2])
		end
	end, { var23 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var1 (ref)
		local current = var22.current
		
		if current ~= nil then
			var22.current = nil
			var1.current.removeItem(current)
		end
	end, {})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var10 (ref), var27 (ref)
		if var9.current then
			var9.current:Disconnect()
			var9.current = nil
		end
		var10.current = false
		var27()
	end, { var27 })
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: scrollingFrame (ref), var28 (ref), var10 (ref), var25 (ref), var12 (ref), var9 (ref), runService (copy), var13 (ref), var21 (ref), constantsModule (copy), snapMathModule (copy), var11 (ref), var5 (ref)
		if scrollingFrame then
			var28()
			var10.current = true
			var25("Settling")
			var12.current = scrollingFrame.CanvasPosition.Y
			scrollingFrame:ResetScrollVelocity()
			var9.current = runService.Heartbeat:Connect(function(p3)
				-- upvalues: scrollingFrame (copy), var10 (copy), var13 (copy), var21 (copy), var28 (copy), constantsModule (copy), snapMathModule (copy), var12 (copy), var11 (copy), p2 (ref), var5 (copy), var25 (copy)
				if not scrollingFrame or not var10.current or (var13.current or not var21.current) then
					var28()
					
					return
				end
				scrollingFrame:ResetScrollVelocity()
				local var30, var31 = snapMathModule.advanceCriticalDampedSpring(var12.current, var11.current, p2, math.min(p3, constantsModule.MAX_SPRING_DELTA), var5.current)
				var11.current = var31
				var12.current = var30
				scrollingFrame.CanvasPosition = Vector2.new(0, var30)
				
				if math.abs(p2 - var30) < constantsModule.POSITION_THRESHOLD and math.abs(var11.current) < constantsModule.VELOCITY_THRESHOLD then
					scrollingFrame.CanvasPosition = Vector2.new(0, p2)
					var12.current = p2
					var28()
					var25("Idle")
				end
			end)
			
			return
		end
	end, { scrollingFrame, var28, var25 })
	local var30 = reactModule.useCallback(function(p2, p3)
		-- upvalues: scrollingFrame (ref), var1 (ref), snapMathModule (copy), var6 (ref), var17 (ref), var2 (ref), var3 (ref), var8 (ref), var28 (ref), var26 (ref), var25 (ref), var11 (ref), var29 (ref)
		if not scrollingFrame then return end
		local current = var1.current
		local var31 = snapMathModule.clampIndex(p2, current.getCount(false))
		local currentIndex = current.getCurrentIndex(false)
		local current_1 = var6.current
		local var32 = if var31 == currentIndex or current_1 == nil then nil else current_1.onTargetCommitted
		
		local function _()
			-- upvalues: var32 (ref), currentIndex (ref), var31 (ref), current (ref)
			if var32 ~= nil then
				var32(currentIndex, var31, current.getItems(false)[var31])
			end
			current.goToItem(var31)
		end
		
		var17.current = var31
		
		if var2.current <= 0 then
			if var32 ~= nil then
				var32(currentIndex, var31, current.getItems(false)[var31])
			end
			current.goToItem(var31)
			
			return
		else
			local var33 = snapMathModule.offsetForIndex(var31, var3.current)
			
			if var8.current then
				if var32 ~= nil then
					var32(currentIndex, var31, current.getItems(false)[var31])
				end
				current.goToItem(var31)
				var28()
				scrollingFrame.CanvasPosition = Vector2.new(0, var33)
				var26(var31)
				var25("Idle")
				
				return
			elseif var32 ~= nil then
				var25("Settling")
			end
			if var32 ~= nil then
				var32(currentIndex, var31, current.getItems(false)[var31])
			end
			current.goToItem(var31)
			var11.current = p3
			var29(var33)
		end
	end, {
		scrollingFrame,
		var29,
		var28,
		var25,
		var26
	})
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: scrollingFrame (ref), var1 (ref), var2 (ref), var3 (ref), snapMathModule (copy), var4 (ref), var6 (ref), var30 (ref)
		if not scrollingFrame then return end
		local count = var1.current.getCount(false)
		
		if count <= 0 or var2.current <= 0 then return end
		local y = scrollingFrame.CanvasPosition.Y
		local current = var3.current
		local var32 = snapMathModule.resolveSnapIndex(y, p2, current, count, var4.current)
		local current_1 = var6.current
		
		if current_1 and current_1.onSnap then
			current_1.onSnap({
				fromIndex = snapMathModule.nearestIndexForOffset(y, current, count),
				toIndex = var32,
				velocity = p2
			})
		end
		var30(var32, -p2)
	end, { scrollingFrame, var30 })
	local var32 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref)
		var30(p2, 0)
	end, { var30 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var1 (ref)
		var30(var1.current.getCurrentIndex(false) + 1, 0)
	end, { var30 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var1 (ref)
		var30(var1.current.getCurrentIndex(false) - 1, 0)
	end, { var30 })
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var22 (ref), snapMathModule (copy), var2 (ref), scrollingFrame (ref), var8 (ref), var17 (ref), var11 (ref), var29 (ref), var3 (ref)
		local current = var1.current
		
		if var22.current ~= nil then return end
		local currentIndex = current.getCurrentIndex(false)
		local count = current.getCount(false)
		
		if p2 ~= currentIndex then
			current.removeItem(p2)
			
			return
		elseif count <= 1 then
			current.removeItem(p2)
			
			return
		end
		local var36 = snapMathModule.neighborForRemoval(currentIndex, count)
		
		if scrollingFrame and var2.current > 0 and not var8.current then
			var17.current = var36
			var11.current = 0
			var29(snapMathModule.offsetForIndex(var36, var3.current))
			var22.current = p2
			
			return
		end
		current.removeItem(p2)
	end, { scrollingFrame, var29 })
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), var2 (ref), var1 (ref), var26 (ref), snapMathModule (copy), var3 (ref), var13 (ref), var10 (ref), active (ref), var19 (ref), var20 (ref), var21 (ref), var7 (ref), constantsModule (copy), var30 (ref)
		if scrollingFrame then
			local var36 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var2 (copy), var1 (copy), var26 (copy), snapMathModule (copy), scrollingFrame (ref), var3 (copy), var13 (copy), var10 (copy), active (copy), var19 (copy), var20 (copy), var21 (copy), var7 (copy), constantsModule (copy), var30 (copy)
				if var2.current <= 0 then return end
				var26(snapMathModule.nearestIndexForOffset(scrollingFrame.CanvasPosition.Y, var3.current, var1.current.getCount(false)))
				
				if var13.current or var10.current or not active then return end
				var19.current = os.clock()
				
				if var20.current then
					return
				end
				var20.current = true
				
				local function runSettle()
					-- upvalues: var21 (copy), var13 (copy), var10 (copy), var7 (copy), var20 (copy), var19 (copy), constantsModule (copy), runSettle (ref), var2 (copy), var3 (copy), scrollingFrame (copy), var1 (copy), snapMathModule (copy), var30 (copy)
					if not var21.current or var13.current or (var10.current or not var7.current) then
						var20.current = false
						
						return
					elseif os.clock() - var19.current < constantsModule.SETTLE_DEBOUNCE_SECONDS then
						task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
						
						return
					end
					var20.current = false
					
					if var2.current <= 0 then return end
					local current = var3.current
					local y = scrollingFrame.CanvasPosition.Y
					local currentIndex = var1.current.getCurrentIndex(false)
					local var37 = snapMathModule.resolveSettleIndex(currentIndex, y, current, var1.current.getCount(false), constantsModule.WHEEL_PAGE_TURN_FRACTION, 1)
					
					if var37 ~= currentIndex or constantsModule.POSITION_THRESHOLD < math.abs(y - snapMathModule.offsetForIndex(currentIndex, current)) then
						var30(var37, 0)
					end
				end
				
				task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
			end)
			
			return function()
				-- upvalues: var36 (ref), var20 (copy)
				var36:Disconnect()
				var20.current = false
			end
		end
	end, { scrollingFrame, active, var26, var30 })
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), active (ref), pagerNavigationModule (copy), getFFlagMomentsFixNavButtonSnapModule (copy), nativeScrollEnabled (ref), var14 (ref), userInputService (copy), var13 (ref), var15 (ref), var28 (ref), var25 (ref), constantsModule (copy), var31 (ref), var16 (ref), var30 (ref), var1 (ref)
		if not scrollingFrame or not active then return end
		local function _(p2)
			return if p2.UserInputType ~= Enum.UserInputType.Touch then p2.UserInputType == Enum.UserInputType.MouseButton1 else true
		end
		
		local var36 = pagerNavigationModule.shouldTrackDrag(getFFlagMomentsFixNavButtonSnapModule(), nativeScrollEnabled)
		var14.current = {}
		
		local _ = function(p2)
			-- upvalues: scrollingFrame (ref)
			local position = p2.Position
			local absolutePosition = scrollingFrame.AbsolutePosition
			local absoluteSize = scrollingFrame.AbsoluteSize
			
			return absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))
		end
		
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var36 (ref), var14 (copy), scrollingFrame (ref), var13 (copy), var15 (copy), var28 (copy), var25 (copy)
			local var37
			if var36 then
				var37 = if p2.UserInputType ~= Enum.UserInputType.Touch then p2.UserInputType == Enum.UserInputType.MouseButton1 else true
				
				if var37 and not var14.current[p2] then
					local position = p2.Position
					local absolutePosition = scrollingFrame.AbsolutePosition
					local absoluteSize = scrollingFrame.AbsoluteSize
					
					if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
					var37 = next(var14.current) == nil
					var14.current[p2] = true
					
					if var37 then
						var13.current = true
						var15.current = scrollingFrame.CanvasPosition.Y
						var28()
						var25("Dragging")
					end
					return
				end
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: var14 (copy), var13 (copy), scrollingFrame (ref), var15 (copy), constantsModule (copy), var25 (copy), var31 (copy)
			if not var14.current[p2] then return end
			var14.current[p2] = nil
			
			if next(var14.current) ~= nil then return end
			var13.current = false
			local y = scrollingFrame:GetScrollVelocity().Y
			
			if constantsModule.POSITION_THRESHOLD < math.abs(scrollingFrame.CanvasPosition.Y - var15.current) or math.abs(y) >= constantsModule.VELOCITY_THRESHOLD then
				var31(y)
				
				return
			end
			var25("Idle")
		end)
		local inputChangedConnection = nil
		
		local _ = function(p2)
			-- upvalues: pagerNavigationModule (copy), var16 (copy), constantsModule (copy), var30 (copy), var1 (copy)
			local var37, var38 = pagerNavigationModule.resolveWheelGesture(os.clock(), var16.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
			var16.current = var38
			
			if var37 then
				var30(var1.current.getCurrentIndex(false) + p2, 0)
			end
		end
		
		if not nativeScrollEnabled then
			inputChangedConnection = userInputService.InputChanged:Connect(function(p2)
				-- upvalues: scrollingFrame (ref), pagerNavigationModule (copy), var16 (copy), constantsModule (copy), var30 (copy), var1 (copy)
				if p2.UserInputType == Enum.UserInputType.MouseWheel then
					local position = p2.Position
					local absolutePosition = scrollingFrame.AbsolutePosition
					local absoluteSize = scrollingFrame.AbsoluteSize
					
					if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
					local z = p2.Position.Z
					
					if z > 0 then
						local var37, var38 = pagerNavigationModule.resolveWheelGesture(os.clock(), var16.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
						var16.current = var38
						
						if var37 then
							var30(var1.current.getCurrentIndex(false) + -1, 0)
							
							return
						end
					elseif z < 0 then
						local var39, var40 = pagerNavigationModule.resolveWheelGesture(os.clock(), var16.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
						var16.current = var40
						
						if var39 then
							var30(var1.current.getCurrentIndex(false) + 1, 0)
						end
					end
					return
				end
			end)
		end
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref), inputChangedConnection (write)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
			
			if inputChangedConnection then
				inputChangedConnection:Disconnect()
			end
		end
	end, {
		scrollingFrame, active, nativeScrollEnabled, var28, var25, var31, var30, var33,
		var34
	})
	local var36 = signalsReactModule.useSignalState(store.getCount)
	local var37 = signalsReactModule.useSignalState(store.getCurrentIndex)
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), itemHeight (ref), gap (ref), var18 (ref), snapMathModule (copy), var37 (ref), var36 (ref), var17 (ref), var28 (ref), var26 (ref), var25 (ref)
		local var38 = itemHeight + gap
		
		if not scrollingFrame or itemHeight <= 0 then
			var18.current = var38
			
			return
		end
		local var39 = snapMathModule.clampIndex(var37, var36)
		
		if var38 ~= var18.current or var39 ~= var17.current then
			var28()
			scrollingFrame.CanvasPosition = Vector2.new(0, snapMathModule.offsetForIndex(var39, var38))
			var17.current = var39
			var26(var39)
			var25("Idle")
		end
		var18.current = var38
	end, {
		scrollingFrame, var36, var37, itemHeight, gap, var28, var26, var25
	})
	reactModule.useEffect(function()
		-- upvalues: active (ref), var28 (ref), var25 (ref)
		if not active then
			var28()
			var25("Idle")
		end
	end, { active, var28, var25 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var28 (ref)
		var21.current = true
		
		return function()
			-- upvalues: var21 (copy), var28 (copy)
			var21.current = false
			var28()
		end
	end, { var28 })
	
	return reactModule.useMemo(function()
		-- upvalues: var23 (ref), var24 (ref), var32 (ref), var33 (ref), var34 (ref), var35 (ref)
		return {
			getActiveIndex = var23.get,
			getScrollState = var24.get,
			scrollToIndex = var32,
			next = var33,
			previous = var34,
			removeItem = var35
		}
	end, {
		var23, var24, var32, var33, var34, var35
	})
end