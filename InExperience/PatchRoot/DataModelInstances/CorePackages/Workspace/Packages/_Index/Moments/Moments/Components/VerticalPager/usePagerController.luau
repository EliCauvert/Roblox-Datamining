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
local getFFlagMomentsDesktopWheelPagingModule = require(moments.Flags.GetFFlagMomentsDesktopWheelPaging)
local getFFlagMomentsFixNavButtonSnapModule = require(moments.Flags.GetFFlagMomentsFixNavButtonSnap)
local usePreferences = foundationModule.Hooks.usePreferences

return function(p0) --[[ line: 67 | named "usePagerController" ]]
	-- upvalues: reactModule (ref), usePreferences (ref), signalsModule (ref), runService (ref), constantsModule (ref), snapMathModule (ref), getFFlagMomentsDesktopWheelPagingModule (ref), pagerNavigationModule (ref), getFFlagMomentsFixNavButtonSnapModule (ref), userInputService (ref), signalsReactModule (ref)
	local scrollingFrame = p0.scrollingFrame
	local store = p0.store
	local itemHeight = p0.itemHeight
	local gap = p0.gap
	local active = p0.active
	local nativeScrollEnabled = p0.nativeScrollEnabled
	local var12 = reactModule.useRef(store)
	var12.current = store
	local var13 = reactModule.useRef(itemHeight)
	var13.current = itemHeight
	local var14 = reactModule.useRef(itemHeight + gap)
	var14.current = itemHeight + gap
	local var15 = reactModule.useRef(p0.snapSensitivity)
	var15.current = p0.snapSensitivity
	local var16 = reactModule.useRef(p0.animationSpeed)
	var16.current = p0.animationSpeed
	local var17 = reactModule.useRef(p0.analytics)
	var17.current = p0.analytics
	local var18 = reactModule.useRef(active)
	var18.current = active
	local reducedMotion = usePreferences().reducedMotion
	local var19 = reactModule.useRef(reducedMotion)
	var19.current = reducedMotion
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useRef(0)
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef({})
	local var26 = reactModule.useRef(0)
	local var27 = reactModule.useRef(0)
	local var28 = reactModule.useRef(store.getCurrentIndex(false))
	local var29 = reactModule.useRef(0)
	local var30 = reactModule.useRef(0)
	local var31 = reactModule.useRef(false)
	local var32 = reactModule.useRef(true)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useMemo(function() --[[ line: 135 ]]
		-- upvalues: signalsModule (copy), var12 (ref)
		local var49, var50 = signalsModule.createSignal(var12.current.getCurrentIndex(false))
		
		return { get = var49, set = var50 }
	end, {})
	local var35 = reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: signalsModule (copy)
		local idle, idle_1 = signalsModule.createSignal("Idle")
		
		return { get = idle, set = idle_1 }
	end, {})
	local var36 = reactModule.useCallback(function(p1) --[[ line: 144 ]]
		-- upvalues: var35 (ref), var17 (ref)
		if var35.get(false) == p1 then return end
		var35.set(p1)
		local current = var17.current
		
		if current and current.onScrollStateChanged then
			current.onScrollStateChanged(p1)
		end
	end, { var35 })
	local var37 = reactModule.useCallback(function(p2) --[[ line: 155 ]]
		-- upvalues: var34 (ref), var17 (ref), var12 (ref)
		if var34.get(false) == p2 then return end
		var34.set(p2)
		local current = var17.current
		
		if current and current.onActiveItemChanged then
			current.onActiveItemChanged(p2, var12.current.getItems(false)[p2])
		end
	end, { var34 })
	local var38 = reactModule.useCallback(function() --[[ line: 168 ]]
		-- upvalues: var33 (ref), var12 (ref)
		local current = var33.current
		
		if current ~= nil then
			var33.current = nil
			var12.current.removeItem(current)
		end
	end, {})
	local var39 = reactModule.useCallback(function() --[[ line: 176 ]]
		-- upvalues: var20 (ref), var21 (ref), var38 (ref)
		if var20.current then
			var20.current:Disconnect()
			var20.current = nil
		end
		var21.current = false
		var38()
	end, { var38 })
	local var40 = reactModule.useCallback(function(p3) --[[ line: 187 ]]
		-- upvalues: scrollingFrame (ref), var39 (ref), var21 (ref), var36 (ref), var23 (ref), var20 (ref), runService (copy), var24 (ref), var32 (ref), constantsModule (copy), snapMathModule (copy), var22 (ref), var16 (ref)
		if scrollingFrame then
			var39()
			var21.current = true
			var36("Settling")
			var23.current = scrollingFrame.CanvasPosition.Y
			scrollingFrame:ResetScrollVelocity()
			var20.current = runService.Heartbeat:Connect(function(p4) --[[ line: 203 ]]
				-- upvalues: scrollingFrame (copy), var21 (copy), var24 (copy), var32 (copy), var39 (copy), constantsModule (copy), snapMathModule (copy), var23 (copy), var22 (copy), p3 (ref), var16 (copy), var36 (copy)
				if not scrollingFrame or not var21.current or (var24.current or not var32.current) then
					var39()
					
					return
				end
				scrollingFrame:ResetScrollVelocity()
				local var53, var54 = snapMathModule.advanceCriticalDampedSpring(var23.current, var22.current, p3, math.min(p4, constantsModule.MAX_SPRING_DELTA), var16.current)
				var22.current = var54
				var23.current = var53
				scrollingFrame.CanvasPosition = Vector2.new(0, var53)
				
				if math.abs(p3 - var53) < constantsModule.POSITION_THRESHOLD and math.abs(var22.current) < constantsModule.VELOCITY_THRESHOLD then
					scrollingFrame.CanvasPosition = Vector2.new(0, p3)
					var23.current = p3
					var39()
					var36("Idle")
				end
			end)
			
			return
		end
	end, { scrollingFrame, var39, var36 })
	local var41 = reactModule.useCallback(function(p5, p6) --[[ line: 244 ]]
		-- upvalues: scrollingFrame (ref), var12 (ref), snapMathModule (copy), var28 (ref), var13 (ref), var14 (ref), var19 (ref), var39 (ref), var37 (ref), var36 (ref), var22 (ref), var40 (ref)
		if not scrollingFrame then return end
		local current = var12.current
		local var55 = snapMathModule.clampIndex(p5, current.getCount(false))
		var28.current = var55
		current.goToItem(var55)
		
		if var13.current <= 0 then return end
		local var56 = snapMathModule.offsetForIndex(var55, var14.current)
		
		if var19.current then
			var39()
			scrollingFrame.CanvasPosition = Vector2.new(0, var56)
			var37(var55)
			var36("Idle")
			
			return
		end
		var22.current = p6
		var40(var56)
	end, {
		scrollingFrame,
		var40,
		var39,
		var36,
		var37
	})
	local var42 = reactModule.useCallback(function(p7) --[[ line: 276 ]]
		-- upvalues: scrollingFrame (ref), var12 (ref), var13 (ref), var14 (ref), snapMathModule (copy), var15 (ref), var17 (ref), var41 (ref)
		if not scrollingFrame then return end
		local count = var12.current.getCount(false)
		
		if count <= 0 or var13.current <= 0 then return end
		local y = scrollingFrame.CanvasPosition.Y
		local current = var14.current
		local var58 = snapMathModule.resolveSnapIndex(y, p7, current, count, var15.current)
		local current_1 = var17.current
		
		if current_1 and current_1.onSnap then
			current_1.onSnap({
				fromIndex = snapMathModule.nearestIndexForOffset(y, current, count),
				toIndex = var58,
				velocity = p7
			})
		end
		var41(var58, -p7)
	end, { scrollingFrame, var41 })
	local var43 = reactModule.useCallback(function(p8) --[[ line: 304 ]]
		-- upvalues: var41 (ref)
		var41(p8, 0)
	end, { var41 })
	local var44 = reactModule.useCallback(function() --[[ line: 308 ]]
		-- upvalues: var41 (ref), var12 (ref)
		var41(var12.current.getCurrentIndex(false) + 1, 0)
	end, { var41 })
	local var45 = reactModule.useCallback(function() --[[ line: 312 ]]
		-- upvalues: var41 (ref), var12 (ref)
		var41(var12.current.getCurrentIndex(false) - 1, 0)
	end, { var41 })
	local var46 = reactModule.useCallback(function(p9) --[[ line: 319 ]]
		-- upvalues: var12 (ref), var33 (ref), snapMathModule (copy), var13 (ref), scrollingFrame (ref), var19 (ref), var28 (ref), var22 (ref), var40 (ref), var14 (ref)
		local current = var12.current
		
		if var33.current ~= nil then return end
		local currentIndex = current.getCurrentIndex(false)
		local count = current.getCount(false)
		
		if p9 ~= currentIndex then
			current.removeItem(p9)
			
			return
		elseif count <= 1 then
			current.removeItem(p9)
			
			return
		end
		local var61 = snapMathModule.neighborForRemoval(currentIndex, count)
		
		if scrollingFrame and var13.current > 0 and not var19.current then
			var28.current = var61
			var22.current = 0
			var40(snapMathModule.offsetForIndex(var61, var14.current))
			var33.current = p9
			
			return
		end
		current.removeItem(p9)
	end, { scrollingFrame, var40 })
	reactModule.useEffect(function() --[[ line: 361 ]]
		-- upvalues: scrollingFrame (ref), var13 (ref), var12 (ref), var37 (ref), snapMathModule (copy), var14 (ref), var24 (ref), var21 (ref), active (ref), var30 (ref), var31 (ref), var32 (ref), var18 (ref), constantsModule (copy), getFFlagMomentsDesktopWheelPagingModule (copy), var41 (ref)
		if scrollingFrame then
			local var62 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 367 ]]
				-- upvalues: var13 (copy), var12 (copy), var37 (copy), snapMathModule (copy), scrollingFrame (ref), var14 (copy), var24 (copy), var21 (copy), active (copy), var30 (copy), var31 (copy), var32 (copy), var18 (copy), constantsModule (copy), getFFlagMomentsDesktopWheelPagingModule (copy), var41 (copy)
				if var13.current <= 0 then return end
				var37(snapMathModule.nearestIndexForOffset(scrollingFrame.CanvasPosition.Y, var14.current, var12.current.getCount(false)))
				
				if var24.current or var21.current or not active then return end
				var30.current = os.clock()
				
				if var31.current then
					return
				end
				var31.current = true
				
				local function runSettle() --[[ line: 389 ]]
					-- upvalues: var32 (copy), var24 (copy), var21 (copy), var18 (copy), var31 (copy), var30 (copy), constantsModule (copy), runSettle (ref), var13 (copy), var14 (copy), scrollingFrame (copy), var12 (copy), snapMathModule (copy), getFFlagMomentsDesktopWheelPagingModule (copy), var41 (copy)
					if not var32.current or var24.current or (var21.current or not var18.current) then
						var31.current = false
						
						return
					elseif os.clock() - var30.current < constantsModule.SETTLE_DEBOUNCE_SECONDS then
						task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
						
						return
					end
					var31.current = false
					
					if var13.current <= 0 then return end
					local current = var14.current
					local y = scrollingFrame.CanvasPosition.Y
					local currentIndex = var12.current.getCurrentIndex(false)
					local var65 = snapMathModule.resolveSettleIndex(currentIndex, y, current, var12.current.getCount(false), constantsModule.WHEEL_PAGE_TURN_FRACTION, if getFFlagMomentsDesktopWheelPagingModule() then 1 else nil)
					
					if var65 ~= currentIndex or constantsModule.POSITION_THRESHOLD < math.abs(y - snapMathModule.offsetForIndex(currentIndex, current)) then
						var41(var65, 0)
					end
				end
				
				task.delay(constantsModule.SETTLE_DEBOUNCE_SECONDS, runSettle)
			end)
			
			return function() --[[ line: 431 ]]
				-- upvalues: var62 (ref), var31 (copy)
				var62:Disconnect()
				var31.current = false
			end
		end
	end, { scrollingFrame, active, var37, var41 })
	reactModule.useEffect(function() --[[ line: 442 ]]
		-- upvalues: scrollingFrame (ref), active (ref), pagerNavigationModule (copy), getFFlagMomentsFixNavButtonSnapModule (copy), nativeScrollEnabled (ref), var25 (ref), userInputService (copy), var24 (ref), var26 (ref), var39 (ref), var36 (ref), constantsModule (copy), var42 (ref), getFFlagMomentsDesktopWheelPagingModule (copy), var27 (ref), var41 (ref), var12 (ref), var45 (ref), var44 (ref)
		if not scrollingFrame or not active then return end
		local function _(p10) --[[ line: 448 | named "isDragInput" ]]
			return if p10.UserInputType ~= Enum.UserInputType.Touch then p10.UserInputType == Enum.UserInputType.MouseButton1 else true
		end
		
		local var66 = pagerNavigationModule.shouldTrackDrag(getFFlagMomentsFixNavButtonSnapModule(), nativeScrollEnabled)
		var25.current = {}
		
		local _ = function(p11) --[[ line: 469 | named "isWithinFrame" ]]
			-- upvalues: scrollingFrame (ref)
			local position = p11.Position
			local absolutePosition = scrollingFrame.AbsolutePosition
			local absoluteSize = scrollingFrame.AbsoluteSize
			
			return absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))
		end
		
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p12) --[[ line: 479 ]]
			-- upvalues: var66 (ref), var25 (copy), scrollingFrame (ref), var24 (copy), var26 (copy), var39 (copy), var36 (copy)
			local var73
			if var66 then
				var73 = if p12.UserInputType ~= Enum.UserInputType.Touch then p12.UserInputType == Enum.UserInputType.MouseButton1 else true
				
				if var73 and not var25.current[p12] then
					local position = p12.Position
					local absolutePosition = scrollingFrame.AbsolutePosition
					local absoluteSize = scrollingFrame.AbsoluteSize
					
					if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
					var73 = next(var25.current) == nil
					var25.current[p12] = true
					
					if var73 then
						var24.current = true
						var26.current = scrollingFrame.CanvasPosition.Y
						var39()
						var36("Dragging")
					end
					return
				end
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p13) --[[ line: 498 ]]
			-- upvalues: var25 (copy), var24 (copy), scrollingFrame (ref), var26 (copy), constantsModule (copy), var36 (copy), var42 (copy)
			if not var25.current[p13] then return end
			var25.current[p13] = nil
			
			if next(var25.current) ~= nil then return end
			var24.current = false
			local y = scrollingFrame:GetScrollVelocity().Y
			
			if constantsModule.POSITION_THRESHOLD < math.abs(scrollingFrame.CanvasPosition.Y - var26.current) or math.abs(y) >= constantsModule.VELOCITY_THRESHOLD then
				var42(y)
				
				return
			end
			var36("Idle")
		end)
		local inputChangedConnection = nil
		local mouseWheelForwardConnection = nil
		local mouseWheelBackwardConnection = nil
		
		if getFFlagMomentsDesktopWheelPagingModule() then
			local function onWheel(p14) --[[ line: 532 ]]
				-- upvalues: pagerNavigationModule (copy), var27 (copy), constantsModule (copy), var41 (copy), var12 (copy)
				local var74, var75 = pagerNavigationModule.resolveWheelGesture(os.clock(), var27.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
				var27.current = var75
				
				if var74 then
					var41(var12.current.getCurrentIndex(false) + p14, 0)
				end
			end
			
			if not nativeScrollEnabled then
				inputChangedConnection = userInputService.InputChanged:Connect(function(p15) --[[ line: 552 ]]
					-- upvalues: scrollingFrame (ref), pagerNavigationModule (copy), var27 (copy), constantsModule (copy), var41 (copy), var12 (copy)
					if p15.UserInputType == Enum.UserInputType.MouseWheel then
						local position = p15.Position
						local absolutePosition = scrollingFrame.AbsolutePosition
						local absoluteSize = scrollingFrame.AbsoluteSize
						
						if not (absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))) then return end
						local z = p15.Position.Z
						
						if z > 0 then
							local var76, var77 = pagerNavigationModule.resolveWheelGesture(os.clock(), var27.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
							var27.current = var77
							
							if var76 then
								var41(var12.current.getCurrentIndex(false) + -1, 0)
								
								return
							end
						elseif z < 0 then
							local var78, var79 = pagerNavigationModule.resolveWheelGesture(os.clock(), var27.current, constantsModule.WHEEL_COOLDOWN_SECONDS)
							var27.current = var79
							
							if var78 then
								var41(var12.current.getCurrentIndex(false) + 1, 0)
							end
						end
						return
					end
				end)
			end
		else
			local function onWheel(p16) --[[ line: 571 ]]
				-- upvalues: var27 (copy), constantsModule (copy)
				local processTime = os.clock()
				
				if processTime - var27.current < constantsModule.WHEEL_COOLDOWN_SECONDS then
					return
				end
				var27.current = processTime
				p16()
			end
			
			mouseWheelForwardConnection = scrollingFrame.MouseWheelForward:Connect(function() --[[ line: 580 ]]
				-- upvalues: var45 (copy), var27 (copy), constantsModule (copy)
				local processTime = os.clock()
				
				if processTime - var27.current < constantsModule.WHEEL_COOLDOWN_SECONDS then
					return
				end
				var27.current = processTime
				var45()
			end)
			mouseWheelBackwardConnection = scrollingFrame.MouseWheelBackward:Connect(function() --[[ line: 583 ]]
				-- upvalues: var44 (copy), var27 (copy), constantsModule (copy)
				local processTime = os.clock()
				
				if processTime - var27.current < constantsModule.WHEEL_COOLDOWN_SECONDS then
					return
				end
				var27.current = processTime
				var44()
			end)
		end
		return function() --[[ line: 588 ]]
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref), inputChangedConnection (write), mouseWheelForwardConnection (write), mouseWheelBackwardConnection (write)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
			
			if inputChangedConnection then
				inputChangedConnection:Disconnect()
			end
			if mouseWheelForwardConnection then
				mouseWheelForwardConnection:Disconnect()
			end
			if mouseWheelBackwardConnection then
				mouseWheelBackwardConnection:Disconnect()
			end
		end
	end, {
		scrollingFrame, active, nativeScrollEnabled, var39, var36, var42, var41, var44,
		var45
	})
	local var47 = signalsReactModule.useSignalState(store.getCount)
	local var48 = signalsReactModule.useSignalState(store.getCurrentIndex)
	reactModule.useEffect(function() --[[ line: 622 ]]
		-- upvalues: scrollingFrame (ref), itemHeight (ref), gap (ref), var29 (ref), snapMathModule (copy), var48 (ref), var47 (ref), var28 (ref), var39 (ref), var37 (ref), var36 (ref)
		local var83 = itemHeight + gap
		
		if not scrollingFrame or itemHeight <= 0 then
			var29.current = var83
			
			return
		end
		local var84 = snapMathModule.clampIndex(var48, var47)
		
		if var83 ~= var29.current or var84 ~= var28.current then
			var39()
			scrollingFrame.CanvasPosition = Vector2.new(0, snapMathModule.offsetForIndex(var84, var83))
			var28.current = var84
			var37(var84)
			var36("Idle")
		end
		var29.current = var83
	end, {
		scrollingFrame, var47, var48, itemHeight, gap, var39, var37, var36
	})
	reactModule.useEffect(function() --[[ line: 662 ]]
		-- upvalues: active (ref), var39 (ref), var36 (ref)
		if not active then
			var39()
			var36("Idle")
		end
	end, { active, var39, var36 })
	reactModule.useEffect(function() --[[ line: 671 ]]
		-- upvalues: var32 (ref), var39 (ref)
		var32.current = true
		
		return function() --[[ line: 673 ]]
			-- upvalues: var32 (copy), var39 (copy)
			var32.current = false
			var39()
		end
	end, { var39 })
	
	return reactModule.useMemo(function() --[[ line: 680 ]]
		-- upvalues: var34 (ref), var35 (ref), var43 (ref), var44 (ref), var45 (ref), var46 (ref)
		return {
			getActiveIndex = var34.get,
			getScrollState = var35.get,
			scrollToIndex = var43,
			next = var44,
			previous = var45,
			removeItem = var46
		}
	end, {
		var34, var35, var43, var44, var45, var46
	})
end