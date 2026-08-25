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

return function(p0)
	-- upvalues: reactModule (ref), usePreferences (ref), signalsModule (ref), runService (ref), constantsModule (ref), snapMathModule (ref), pagerNavigationModule (ref), getFFlagMomentsFixNavButtonSnapModule (ref), userInputService (ref), signalsReactModule (ref)
	local scrollingFrame = p0.scrollingFrame
	local store = p0.store
	local itemHeight = p0.itemHeight
	local gap = p0.gap
	local active = p0.active
	local nativeScrollEnabled = p0.nativeScrollEnabled
	local var11 = reactModule.useRef(store)
	var11.current = store
	local var12 = reactModule.useRef(itemHeight)
	var12.current = itemHeight
	local var13 = reactModule.useRef(itemHeight + gap)
	var13.current = itemHeight + gap
	local var14 = reactModule.useRef(p0.snapSensitivity)
	var14.current = p0.snapSensitivity
	local var15 = reactModule.useRef(p0.animationSpeed)
	var15.current = p0.animationSpeed
	local var16 = reactModule.useRef(p0.analytics)
	var16.current = p0.analytics
	local var17 = reactModule.useRef(active)
	var17.current = active
	local reducedMotion = usePreferences().reducedMotion
	local var18 = reactModule.useRef(reducedMotion)
	var18.current = reducedMotion
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(false)
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useRef(false)
	local var24 = reactModule.useRef({})
	local var25 = reactModule.useRef(0)
	local var26 = reactModule.useRef(0)
	local var27 = reactModule.useRef(store.getCurrentIndex(false))
	local var28 = reactModule.useRef(0)
	local var29 = reactModule.useRef(0)
	local var30 = reactModule.useRef(false)
	local var31 = reactModule.useRef(true)
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var11 (ref)
		local var48, var49 = signalsModule.createSignal(var11.current.getCurrentIndex(false))
		
		return { get = var48, set = var49 }
	end, {})
	local var34 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy)
		local idle, idle_1 = signalsModule.createSignal("Idle")
		
		return { get = idle, set = idle_1 }
	end, {})
	local var35 = reactModule.useCallback(function(p1)
		-- upvalues: var34 (ref), var16 (ref)
		if var34.get(false) == p1 then return end
		var34.set(p1)
		local current = var16.current
		
		if current and current.onScrollStateChanged then
			current.onScrollStateChanged(p1)
		end
	end, { var34 })
	local var36 = reactModule.useCallback(function(p2)
		-- upvalues: var33 (ref), var16 (ref), var11 (ref)
		if var33.get(false) == p2 then return end
		var33.set(p2)
		local current = var16.current
		
		if current and current.onActiveItemChanged then
			current.onActiveItemChanged(p2, var11.current.getItems(false)[p2])
		end
	end, { var33 })
	local var37 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var11 (ref)
		local current = var32.current
		
		if current ~= nil then
			var32.current = nil
			var11.current.removeItem(current)
		end
	end, {})
	local var38 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var20 (ref), var37 (ref)
		if var19.current then
			var19.current:Disconnect()
			var19.current = nil
		end
		var20.current = false
		var37()
	end, { var37 })
	local var39 = reactModule.useCallback(function(p3)
		-- upvalues: scrollingFrame (ref), var38 (ref), var20 (ref), var35 (ref), var22 (ref), var19 (ref), runService (copy), var23 (ref), var31 (ref), constantsModule (copy), snapMathModule (copy), var21 (ref), var15 (ref)
		if scrollingFrame then
			var38()
			var20.current = true
			var35("Settling")
			var22.current = scrollingFrame.CanvasPosition.Y
			scrollingFrame:ResetScrollVelocity()
			var19.current = runService.Heartbeat:Connect(function(p4)
				-- upvalues: scrollingFrame (copy), var20 (copy), var23 (copy), var31 (copy), var38 (copy), constantsModule (copy), snapMathModule (copy), var22 (copy), var21 (copy), p3 (ref), var15 (copy), var35 (copy)
				if not scrollingFrame or not var20.current or (var23.current or not var31.current) then
					var38()
					
					return
				end
				scrollingFrame:ResetScrollVelocity()
				local var52, var53 = snapMathModule.advanceCriticalDampedSpring(var22.current, var21.current, p3, math.min(p4, constantsModule.MAX_SPRING_DELTA), var15.current)
				var21.current = var53
				var22.current = var52
				scrollingFrame.CanvasPosition = Vector2.new(0, var52)
				
				if math.abs(p3 - var52) < constantsModule.POSITION_THRESHOLD and math.abs(var21.current) < constantsModule.VELOCITY_THRESHOLD then
					scrollingFrame.CanvasPosition = Vector2.new(0, p3)
					var22.current = p3
					var38()
					var35("Idle")
				end
			end)
			
			return
		end
	end, { scrollingFrame, var38, var35 })
	local var40 = reactModule.useCallback(function(p5, p6)
		-- upvalues: scrollingFrame (ref), var11 (ref), snapMathModule (copy), var16 (ref), var27 (ref), var12 (ref), var13 (ref), var18 (ref), var38 (ref), var36 (ref), var35 (ref), var21 (ref), var39 (ref)
		if not scrollingFrame then return end
		local current = var11.current
		local var54 = snapMathModule.clampIndex(p5, current.getCount(false))
		local currentIndex = current.getCurrentIndex(false)
		local current_1 = var16.current
		local var56 = if var54 == currentIndex or current_1 == nil then nil else current_1.onTargetCommitted
		
		local function _()
			-- upvalues: var56 (ref), currentIndex (ref), var54 (ref), current (ref)
			if var56 ~= nil then
				var56(currentIndex, var54, current.getItems(false)[var54])
			end
			current.goToItem(var54)
		end
		
		var27.current = var54
		
		if var12.current <= 0 then
			if var56 ~= nil then
				var56(currentIndex, var54, current.getItems(false)[var54])
			end
			current.goToItem(var54)
			
			return
		else
			local var57 = snapMathModule.offsetForIndex(var54, var13.current)
			
			if var18.current then
				if var56 ~= nil then
					var56(currentIndex, var54, current.getItems(false)[var54])
				end
				current.goToItem(var54)
				var38()
				scrollingFrame.CanvasPosition = Vector2.new(0, var57)
				var36(var54)
				var35("Idle")
				
				return
			elseif var56 ~= nil then
				var35("Settling")
			end
			if var56 ~= nil then
				var56(currentIndex, var54, current.getItems(false)[var54])
			end
			current.goToItem(var54)
			var21.current = p6
			var39(var57)
		end
	end, {
		scrollingFrame,
		var39,
		var38,
		var35,
		var36
	})
	local var41 = reactModule.useCallback(function(p7)
		-- upvalues: scrollingFrame (ref), var11 (ref), var12 (ref), var13 (ref), snapMathModule (copy), var14 (ref), var16 (ref), var40 (ref)
		if not scrollingFrame then return end
		local count = var11.current.getCount(false)
		
		if count <= 0 or var12.current <= 0 then return end
		local y = scrollingFrame.CanvasPosition.Y
		local current = var13.current
		local var59 = snapMathModule.resolveSnapIndex(y, p7, current, count, var14.current)
		local current_1 = var16.current
		
		if current_1 and current_1.onSnap then
			current_1.onSnap({
				fromIndex = snapMathModule.nearestIndexForOffset(y, current, count),
				toIndex = var59,
				velocity = p7
			})
		end
		var40(var59, -p7)
	end, { scrollingFrame, var40 })
	local var42 = reactModule.useCallback(function(p8)
		-- upvalues: var40 (ref)
		var40(p8, 0)
	end, { var40 })
	local var43 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var11 (ref)
		var40(var11.current.getCurrentIndex(false) + 1, 0)
	end, { var40 })
	local var44 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var11 (ref)
		var40(var11.current.getCurrentIndex(false) - 1, 0)
	end, { var40 })
	local var45 = reactModule.useCallback(function(p9)
		-- upvalues: var11 (ref), var32 (ref), snapMathModule (copy), var12 (ref), scrollingFrame (ref), var18 (ref), var27 (ref), var21 (ref), var39 (ref), var13 (ref)
		local current = var11.current
		
		if var32.current ~= nil then return end
		local currentIndex = current.getCurrentIndex(false)
		local count = current.getCount(false)
		
		if p9 ~= currentIndex then
			current.removeItem(p9)
			
			return
		elseif count <= 1 then
			current.removeItem(p9)
			
			return
		end
		local var62 = snapMathModule.neighborForRemoval(currentIndex, count)
		
		if scrollingFrame and var12.current > 0 and not var18.current then
			var27.current = var62
			var21.current = 0
			var39(snapMathModule.offsetForIndex(var62, var13.current))
			var32.current = p9
			
			return
		end
		current.removeItem(p9)
	end, { scrollingFrame, var39 })
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), var12 (ref), var11 (ref), var36 (ref), snapMathModule (copy), var13 (ref), var23 (ref), var20 (ref), active (ref), var29 (ref), var30 (ref), var31 (ref), var17 (ref), constantsModule (copy), var40 (ref)
		if scrollingFrame then
			local var63 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var12 (copy), var11 (copy), var36 (copy), snapMathModule (copy), scrollingFrame (ref), var13 (copy), var23 (copy), var20 (copy), active (copy), var29 (copy), var30 (copy), var31 (copy), var17 (copy), constantsModule (copy), var40 (copy)
				if var12.current <= 0 then return end
				var36(snapMathModule.nearestIndexForOffset(scrollingFrame.CanvasPosition.Y, var13.current, var11.current.getCount(false)))
				
				if var23.current or var20.current or not active then return end
				var29.current = os.clock()
				
				if var30.current then
					return
				end
				var30.current = true
				
				local function runSettle()
					-- upvalues: var31 (copy), var23 (copy), var20 (copy), var17 (copy), var30 (copy), var29 (copy), constantsModule (copy), runSettle (ref), var12 (copy), var13 (copy), scrollingFrame (copy), var11 (copy), snapMathModule (copy), var40 (copy)
					if not var31.current or var23.current or (var20.current or not var17.current) then
						var30.current = false
						
						return
					elseif os.clock() - var29.current < constantsModule.SETTLE_DEBOUNCE_SECONDS then
						task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
						
						return
					end
					var30.current = false
					
					if var12.current <= 0 then return end
					local current = var13.current
					local y = scrollingFrame.CanvasPosition.Y
					local currentIndex = var11.current.getCurrentIndex(false)
					local var66 = snapMathModule.resolveSettleIndex(currentIndex, y, current, var11.current.getCount(false), constantsModule.WHEEL_PAGE_TURN_FRACTION, 1)
					
					if var66 ~= currentIndex or constantsModule.POSITION_THRESHOLD < math.abs(y - snapMathModule.offsetForIndex(currentIndex, current)) then
						var40(var66, 0)
					end
				end
				
				task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
			end)
			
			return function()
				-- upvalues: var63 (ref), var30 (copy)
				var63:Disconnect()
				var30.current = false
			end
		end
	end, { scrollingFrame, active, var36, var40 })
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), active (ref), pagerNavigationModule (copy), getFFlagMomentsFixNavButtonSnapModule (copy), nativeScrollEnabled (ref), var24 (ref), userInputService (copy), var23 (ref), var25 (ref), var38 (ref), var35 (ref), constantsModule (copy), var41 (ref), var26 (ref), var40 (ref), var11 (ref)
		if not scrollingFrame or not active then return end
		local function _(p10)
			return if p10.UserInputType ~= Enum.UserInputType.Touch then p10.UserInputType == Enum.UserInputType.MouseButton1 else true
		end
		
		local var67 = pagerNavigationModule.shouldTrackDrag(getFFlagMomentsFixNavButtonSnapModule(), nativeScrollEnabled)
		var24.current = {}
		
		local _ = function(p11)
			-- upvalues: scrollingFrame (ref)
			local position = p11.Position
			local absolutePosition = scrollingFrame.AbsolutePosition
			local absoluteSize = scrollingFrame.AbsoluteSize
			
			return absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))
		end
		
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p12)
			-- upvalues: var67 (ref), var24 (copy), scrollingFrame (ref), var23 (copy), var25 (copy), var38 (copy), var35 (copy)
			local var71
			if var67 then
				var71 = if p12.UserInputType ~= Enum.UserInputType.Touch then p12.UserInputType == Enum.UserInputType.MouseButton1 else true
				
				if var71 and not var24.current[p12] then
					local position = p12.Position
					local absolutePosition = scrollingFrame.AbsolutePosition
					local absoluteSize = scrollingFrame.AbsoluteSize
					
					if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
					var71 = next(var24.current) == nil
					var24.current[p12] = true
					
					if var71 then
						var23.current = true
						var25.current = scrollingFrame.CanvasPosition.Y
						var38()
						var35("Dragging")
					end
					return
				end
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p13)
			-- upvalues: var24 (copy), var23 (copy), scrollingFrame (ref), var25 (copy), constantsModule (copy), var35 (copy), var41 (copy)
			if not var24.current[p13] then return end
			var24.current[p13] = nil
			
			if next(var24.current) ~= nil then return end
			var23.current = false
			local y = scrollingFrame:GetScrollVelocity().Y
			
			if constantsModule.POSITION_THRESHOLD < math.abs(scrollingFrame.CanvasPosition.Y - var25.current) or math.abs(y) >= constantsModule.VELOCITY_THRESHOLD then
				var41(y)
				
				return
			end
			var35("Idle")
		end)
		local inputChangedConnection = nil
		
		local _ = function(p14)
			-- upvalues: pagerNavigationModule (copy), var26 (copy), constantsModule (copy), var40 (copy), var11 (copy)
			local var72, var73 = pagerNavigationModule.resolveWheelGesture(os.clock(), var26.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
			var26.current = var73
			
			if var72 then
				var40(var11.current.getCurrentIndex(false) + p14, 0)
			end
		end
		
		if not nativeScrollEnabled then
			inputChangedConnection = userInputService.InputChanged:Connect(function(p15)
				-- upvalues: scrollingFrame (ref), pagerNavigationModule (copy), var26 (copy), constantsModule (copy), var40 (copy), var11 (copy)
				if p15.UserInputType == Enum.UserInputType.MouseWheel then
					local position = p15.Position
					local absolutePosition = scrollingFrame.AbsolutePosition
					local absoluteSize = scrollingFrame.AbsoluteSize
					
					if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
					local z = p15.Position.Z
					
					if z > 0 then
						local var74, var75 = pagerNavigationModule.resolveWheelGesture(os.clock(), var26.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
						var26.current = var75
						
						if var74 then
							var40(var11.current.getCurrentIndex(false) + -1, 0)
							
							return
						end
					elseif z < 0 then
						local var76, var77 = pagerNavigationModule.resolveWheelGesture(os.clock(), var26.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
						var26.current = var77
						
						if var76 then
							var40(var11.current.getCurrentIndex(false) + 1, 0)
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
		scrollingFrame, active, nativeScrollEnabled, var38, var35, var41, var40, var43,
		var44
	})
	local var46 = signalsReactModule.useSignalState(store.getCount)
	local var47 = signalsReactModule.useSignalState(store.getCurrentIndex)
	reactModule.useEffect(function()
		-- upvalues: scrollingFrame (ref), itemHeight (ref), gap (ref), var28 (ref), snapMathModule (copy), var47 (ref), var46 (ref), var27 (ref), var38 (ref), var36 (ref), var35 (ref)
		local var78 = itemHeight + gap
		
		if not scrollingFrame or itemHeight <= 0 then
			var28.current = var78
			
			return
		end
		local var79 = snapMathModule.clampIndex(var47, var46)
		
		if var78 ~= var28.current or var79 ~= var27.current then
			var38()
			scrollingFrame.CanvasPosition = Vector2.new(0, snapMathModule.offsetForIndex(var79, var78))
			var27.current = var79
			var36(var79)
			var35("Idle")
		end
		var28.current = var78
	end, {
		scrollingFrame, var46, var47, itemHeight, gap, var38, var36, var35
	})
	reactModule.useEffect(function()
		-- upvalues: active (ref), var38 (ref), var35 (ref)
		if not active then
			var38()
			var35("Idle")
		end
	end, { active, var38, var35 })
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), var38 (ref)
		var31.current = true
		
		return function()
			-- upvalues: var31 (copy), var38 (copy)
			var31.current = false
			var38()
		end
	end, { var38 })
	
	return reactModule.useMemo(function()
		-- upvalues: var33 (ref), var34 (ref), var42 (ref), var43 (ref), var44 (ref), var45 (ref)
		return {
			getActiveIndex = var33.get,
			getScrollState = var34.get,
			scrollToIndex = var42,
			next = var43,
			previous = var44,
			removeItem = var45
		}
	end, {
		var33, var34, var42, var43, var44, var45
	})
end