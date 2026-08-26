local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local otterModule = require(parent.Otter)
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local view = foundationModule.View
local icon = foundationModule.Icon

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), otterModule (ref), robloxAppEventsModule (ref), userInputService (ref), runService (ref), view (ref), icon (ref)
	local var1, var2 = reactModule.useBinding(0)
	local var3, var4 = reactModule.useBinding(0)
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useBinding(0)
	local idle, idle_1 = reactModule.useState("idle")
	local idle_2 = reactModule.useRef("idle")
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(0)
	local var11 = reactModule.useRef(nil)
	
	if var11.current == nil then
		var11.current = otterModule.createSingleMotor(0)
	end
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var4 (ref), idle_2 (ref), idle_1 (ref)
		local current = var11.current
		local var12 = current:onStep(function(p2)
			-- upvalues: var4 (copy)
			var4(p2)
		end)
		local var13 = current:onComplete(function()
			-- upvalues: idle_2 (copy), idle_1 (copy), var4 (copy)
			if idle_2.current == "tweenBack" then
				idle_2.current = "idle"
				idle_1("idle")
				var4(0)
				
				return
			end
		end)
		
		return function()
			-- upvalues: var12 (ref), var13 (ref), current (ref)
			var12()
			var13()
			current:destroy()
		end
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), idle_2 (ref), idle_1 (ref), var10 (ref), var11 (ref), otterModule (copy), var4 (ref), var8 (ref)
		if not p1.onRefresh or idle_2.current ~= "idle" then return end
		idle_2.current = "refreshing"
		idle_1("refreshing")
		
		if var10.current >= -52 then
			var11.current:setGoal(otterModule.spring(52, { dampingRatio = 0.735, frequency = 1.95 }))
		else
			var4(52)
		end
		local function onSettled()
			-- upvalues: idle_2 (copy), idle_1 (copy), var8 (copy), var11 (copy), otterModule (copy)
			idle_2.current = "tweenBack"
			idle_1("tweenBack")
			var8(0)
			var11.current:setGoal(otterModule.spring(0, {
				dampingRatio = 0.735,
				frequency = 1.95,
				startingValue = 52
			}))
		end
		
		local ok, status = pcall(p1.onRefresh)
		
		if not ok then
			onSettled()
			
			return
		elseif status and typeof(status) == "table" and status.andThen then
			status:finally(onSettled)
			
			return
		end
		onSettled()
	end, { p1.onRefresh })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), robloxAppEventsModule (copy), var12 (ref)
		if p1.appEventName then
			local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
				-- upvalues: p1 (copy), var12 (copy)
				if p2 ~= p1.appEventName then return end
				local current = p1.scrollingFrameRef.current
				
				if not current then return end
				if current.CanvasPosition.Y == 0 then
					var12()
					
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
	end, { var12, p1.appEventName, p1.scrollingFrameRef })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var9 (ref), var10 (ref), idle_2 (ref), var12 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var9 (copy)
			if p2.UserInputType == Enum.UserInputType.Touch then
				var9.current += 1
				
				return
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p2)
			-- upvalues: var9 (copy), var10 (copy), idle_2 (copy), var12 (copy)
			if p2.UserInputType ~= Enum.UserInputType.Touch then return end
			if var9.current > 0 then
				var9.current -= 1
			end
			if var9.current > 0 then return end
			if var10.current < -52 and idle_2.current == "idle" then
				var12()
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var12 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref), var2 (ref)
		local current = p1.scrollingFrameRef and p1.scrollingFrameRef.current
		
		if current then
			local var13 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: p1 (copy), current (ref), var10 (copy), var2 (copy)
				if p1.onRefresh then
					local y = current.CanvasPosition.Y
					var10.current = y
					var2(if y < 0 then y else 0)
					
					return
				end
			end)
			
			return function()
				-- upvalues: var13 (ref)
				var13:Disconnect()
			end
		end
		return nil
	end, { p1.scrollingFrameRef, p1.onRefresh })
	reactModule.useEffect(function()
		-- upvalues: idle (ref), runService (copy), idle_2 (ref), var6 (ref), var8 (ref)
		if idle == "idle" then
			return nil
		end
		local var13 = 0
		local renderSteppedConnection = runService.RenderStepped:Connect(function(p2)
			-- upvalues: var13 (write), idle_2 (copy), var6 (copy), var8 (copy)
			var13 += p2
			
			if idle_2.current == "refreshing" then
				var6(var13 * 540)
				
				return
			elseif idle_2.current == "tweenBack" then
				var8(var13)
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
			-- upvalues: reactModule (copy), var1 (ref), var3 (ref), idle_2 (ref), var9 (ref)
			return reactModule.joinBindings({ var1, var3 }):map(function(p2)
				-- upvalues: idle_2 (copy), var9 (copy)
				local var13 = p2[1]
				local var14 = p2[2]
				
				return if idle_2.current == "idle" then if var9.current == 0 or var13 >= 0 then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 0, math.min(52, math.abs(var13))) elseif idle_2.current == "refreshing" then UDim2.new(1, 0, 0, math.max(var14, 0)) else UDim2.new(1, 0, 0, var14)
			end)
		end, {}),
		GroupTransparency = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var1 (ref), var3 (ref), var7 (ref), idle_2 (ref), var9 (ref)
			return reactModule.joinBindings({ var1, var3, var7 }):map(function(p2)
				-- upvalues: idle_2 (copy), var9 (copy)
				local var13 = p2[1]
				local var14 = p2[2]
				
				return if idle_2.current == "idle" then if var9.current == 0 or var13 >= 0 then 1 elseif var13 <= -52 then 0 else 1 - math.abs(var13) * 0.04 elseif idle_2.current == "refreshing" then if var14 < 52 then math.max(0, 1 - var14 / 52) else 0 else math.min(1, 2 * p2[3])
			end)
		end, {}),
		LayoutOrder = p1.LayoutOrder
	}, {
		Spinner = reactModule.createElement(icon, {
			name = "two-arrows-spin-clockwise",
			Rotation = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), var1 (ref), var5 (ref), idle_2 (ref)
				return reactModule.joinBindings({ var1, var5 }):map(function(p2)
					-- upvalues: idle_2 (copy)
					local var13 = p2[1]
					
					return if idle_2.current == "idle" then if var13 >= 0 or var13 <= -52 then 0 else math.abs(var13) * 9.6 - 240 elseif idle_2.current == "refreshing" then p2[2] else 0
				end)
			end, {}),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		})
	})
end)