local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local otterModule = require(parent.Otter)
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local view = foundationModule.View
local icon = foundationModule.Icon

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), otterModule (ref), robloxAppEventsModule (ref), userInputService (ref), runService (ref), view (ref), icon (ref)
	local var6, var7 = reactModule.useBinding(0)
	local var8, var9 = reactModule.useBinding(0)
	local var10, var11 = reactModule.useBinding(0)
	local var12, var13 = reactModule.useBinding(0)
	local idle, idle_1 = reactModule.useState("idle")
	local idle_2 = reactModule.useRef("idle")
	local var17 = reactModule.useRef(0)
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useRef(nil)
	
	if var19.current == nil then
		var19.current = otterModule.createSingleMotor(0)
	end
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var9 (ref), idle_2 (ref), idle_1 (ref)
		local current = var19.current
		local var21 = current:onStep(function(p1)
			-- upvalues: var9 (copy)
			var9(p1)
		end)
		local var22 = current:onComplete(function()
			-- upvalues: idle_2 (copy), idle_1 (copy), var9 (copy)
			if idle_2.current == "tweenBack" then
				idle_2.current = "idle"
				idle_1("idle")
				var9(0)
				
				return
			end
		end)
		
		return function()
			-- upvalues: var21 (ref), var22 (ref), current (ref)
			var21()
			var22()
			current:destroy()
		end
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), idle_2 (ref), idle_1 (ref), var18 (ref), var19 (ref), otterModule (copy), var9 (ref), var13 (ref)
		if not p0.onRefresh or idle_2.current ~= "idle" then return end
		idle_2.current = "refreshing"
		idle_1("refreshing")
		
		if var18.current >= -52 then
			var19.current:setGoal(otterModule.spring(52, { dampingRatio = 0.735, frequency = 1.95 }))
		else
			var9(52)
		end
		local function onSettled()
			-- upvalues: idle_2 (copy), idle_1 (copy), var13 (copy), var19 (copy), otterModule (copy)
			idle_2.current = "tweenBack"
			idle_1("tweenBack")
			var13(0)
			var19.current:setGoal(otterModule.spring(0, {
				dampingRatio = 0.735,
				frequency = 1.95,
				startingValue = 52
			}))
		end
		
		local ok, status = pcall(p0.onRefresh)
		
		if not ok then
			onSettled()
			
			return
		elseif status and typeof(status) == "table" and status.andThen then
			status:finally(onSettled)
			
			return
		end
		onSettled()
	end, { p0.onRefresh })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), robloxAppEventsModule (copy), var20 (ref)
		if p0.appEventName then
			local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
				-- upvalues: p0 (copy), var20 (copy)
				if p2 ~= p0.appEventName then return end
				local current = p0.scrollingFrameRef.current
				
				if not current then return end
				if current.CanvasPosition.Y == 0 then
					var20()
					
					return
				end
				current:ScrollToTop()
			end)
			
			return function()
				-- upvalues: reloadPageConnection (ref)
				reloadPageConnection:disconnect()
			end
		end
		return nil
	end, { var20, p0.appEventName, p0.scrollingFrameRef })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var17 (ref), var18 (ref), idle_2 (ref), var20 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p3)
			-- upvalues: var17 (copy)
			if p3.UserInputType == Enum.UserInputType.Touch then
				var17.current += 1
				
				return
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p4)
			-- upvalues: var17 (copy), var18 (copy), idle_2 (copy), var20 (copy)
			if p4.UserInputType ~= Enum.UserInputType.Touch then return end
			if var17.current > 0 then
				var17.current -= 1
			end
			if var17.current > 0 then return end
			if var18.current < -52 and idle_2.current == "idle" then
				var20()
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var20 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var18 (ref), var7 (ref)
		local current = p0.scrollingFrameRef and p0.scrollingFrameRef.current
		
		if current then
			local var28 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: p0 (copy), current (ref), var18 (copy), var7 (copy)
				if p0.onRefresh then
					local y = current.CanvasPosition.Y
					var18.current = y
					var7(if y < 0 then y else 0)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var28 (ref)
				var28:Disconnect()
			end
		end
		return nil
	end, { p0.scrollingFrameRef, p0.onRefresh })
	reactModule.useEffect(function()
		-- upvalues: idle (ref), runService (copy), idle_2 (ref), var11 (ref), var13 (ref)
		if idle == "idle" then
			return nil
		end
		local var29 = 0
		local renderSteppedConnection = runService.RenderStepped:Connect(function(p5)
			-- upvalues: var29 (write), idle_2 (copy), var11 (copy), var13 (copy)
			var29 += p5
			
			if idle_2.current == "refreshing" then
				var11(var29 * 540)
				
				return
			elseif idle_2.current == "tweenBack" then
				var13(var29)
			end
		end)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, { idle })
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var6 (ref), var8 (ref), idle_2 (ref), var17 (ref)
			return reactModule.joinBindings({ var6, var8 }):map(function(p6)
				-- upvalues: idle_2 (copy), var17 (copy)
				local var31 = p6[1]
				local var32 = p6[2]
				
				return if idle_2.current == "idle" then if var17.current == 0 or var31 >= 0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, math.min(52, math.abs(var31))) elseif idle_2.current == "refreshing" then UDim2.new(1, 0, 0, math.max(var32, 0)) else UDim2.new(1, 0, 0, var32)
			end)
		end, {}),
		GroupTransparency = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var6 (ref), var8 (ref), var12 (ref), idle_2 (ref), var17 (ref)
			return reactModule.joinBindings({ var6, var8, var12 }):map(function(p7)
				-- upvalues: idle_2 (copy), var17 (copy)
				local var33 = p7[1]
				local var34 = p7[2]
				
				return if idle_2.current == "idle" then if var17.current == 0 or var33 >= 0 then 1 elseif var33 <= -52 then 0 else 1 - math.abs(var33) * 0.04 elseif idle_2.current == "refreshing" then if var34 < 52 then math.max(0, 1 - var34 / 52) else 0 else math.min(1, 2 * p7[3])
			end)
		end, {}),
		LayoutOrder = p0.LayoutOrder
	}, {
		Spinner = reactModule.createElement(icon, {
			name = "two-arrows-spin-clockwise",
			Rotation = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), var6 (ref), var10 (ref), idle_2 (ref)
				return reactModule.joinBindings({ var6, var10 }):map(function(p8)
					-- upvalues: idle_2 (copy)
					local var35 = p8[1]
					
					return if idle_2.current == "idle" then if var35 >= 0 or var35 <= -52 then 0 else math.abs(var35) * 9.6 - 240 elseif idle_2.current == "refreshing" then p8[2] else 0
				end)
			end, {}),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end)