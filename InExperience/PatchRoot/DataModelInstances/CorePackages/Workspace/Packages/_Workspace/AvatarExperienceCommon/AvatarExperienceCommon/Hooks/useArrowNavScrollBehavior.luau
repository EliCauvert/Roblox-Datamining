local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local runService = game:GetService("RunService")
local parent = avatarExperienceCommon.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local constantsModule = require(avatarExperienceCommon.Constants)
local t = { dampingRatio = 1, frequency = 3.5 }

return function(p1)
	-- upvalues: reactModule (ref), otterModule (ref), constantsModule (ref), t (ref), runService (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(0)
	
	if p1.defaultUseProps then
		if p1.defaultUseProps.buttonRefs ~= nil then
			if p1.defaultUseProps.buttonWidth ~= nil then
				error("Cannot set both buttonWidth and buttonRefs")
			end
			if p1.defaultUseProps.numButtons ~= nil then
				error("Cannot set both numButtons and buttonRefs")
			end
		end
		if p1.defaultUseProps.buttonWidth ~= nil and p1.defaultUseProps.numButtons == nil then
			error("If setting buttonWidth must also set numButtons")
		end
		if p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons ~= nil then
			error("If setting numButtons must also set buttonWidth")
		end
		if p1.defaultUseProps.buttonRefs == nil and p1.defaultUseProps.buttonWidth == nil and p1.defaultUseProps.numButtons == nil then
			error("Must set either buttonRefs or (buttonWidth and numButtons)")
		end
	end
	local function disconnectHoldConn()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
	end
	
	local function _(p2)
		-- upvalues: p1 (ref)
		return p1.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(p2, 0)
	end
	
	local function setMotor(value)
		-- upvalues: var2 (ref), otterModule (copy), p1 (ref)
		if var2.current then
			var2.current:destroy()
		end
		var2.current = otterModule.createSingleMotor(value)
		
		if var2.current then
			var2.current:onStep(function(p2)
				-- upvalues: p1 (copy)
				p1.defaultUseProps.updateCanvasPosition(Vector2.new(p2, 0))
			end)
			var2.current:onComplete(function(p2)
				-- upvalues: p1 (copy)
				p1.defaultUseProps.updateCanvasPosition(Vector2.new(p2, 0))
			end)
		end
	end
	
	local function getScrollToLocation(p2)
		-- upvalues: p1 (ref), constantsModule (copy)
		local t = {}
		local buttonRefs = p1.defaultUseProps.buttonRefs
		local buttonWidth = p1.defaultUseProps.buttonWidth
		local numButtons = p1.defaultUseProps.numButtons
		
		if buttonWidth and numButtons then
			t = table.create(numButtons, buttonWidth)
		elseif buttonRefs then
			for i, v in buttonRefs do
				if v and v.current then
					local offset = v.current.Size.X.Offset or 0
					
					if offset == 0 then
						offset = v.current.AbsoluteSize.X
					end
					table.insert(t, offset)
				end
			end
		end
		local current = p1.defaultUseProps.scrollingFrameRef.current
		local buttonPadding = p1.defaultUseProps.buttonPadding
		local _ = 0
		
		if p2 == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then
			local var4 = 0
			local _ = 0
			
			for i, v in t do
				if var4 + v + buttonPadding > current.CanvasPosition.X then break end
				var4 = var4 + v + buttonPadding
			end
			local var5 = var4
			local var6 = 0
			
			for i_1, v_1 in t do
				if var6 + v_1 + buttonPadding > current.AbsoluteSize.X * 0.8 then break end
				var6 = var6 + v_1 + buttonPadding
				var5 = var5 - v_1 - buttonPadding
			end
			return math.max(0, var5)
		else
			local var7 = 0
			local _ = 0
			
			for i, v in t do
				if var7 + v + buttonPadding > current.CanvasPosition.X then break end
				var7 = var7 + v + buttonPadding
			end
			local var8 = var7
			local var9 = 0
			
			for i_1, v_1 in t do
				if var9 + v_1 + buttonPadding > current.AbsoluteSize.X * 0.8 then break end
				var9 = var9 + v_1 + buttonPadding
				var8 = var8 + v_1 + buttonPadding
			end
			return var8
		end
	end
	
	local function getGoal(p3)
		-- upvalues: otterModule (copy), getScrollToLocation (ref), t (copy)
		return otterModule.spring(getScrollToLocation(p3), t)
	end
	
	local function onPressHoldInputBegan(p3, p4)
		-- upvalues: var3 (ref), var1 (ref), runService (copy), constantsModule (copy), p1 (ref)
		if p3.UserInputState ~= Enum.UserInputState.Begin then return end
		var3.current = tick()
		
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
		var1.current = runService.RenderStepped:Connect(function(p5)
			-- upvalues: var3 (copy), constantsModule (copy), p4 (ref), p1 (copy)
			p1.defaultUseProps.updateCanvasPosition(p1.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new((if p4 == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then -1 else 1) * 500 * p5 * (tick() - var3.current) ^ 2, 0))
		end)
	end
	
	local function onPressHoldInputEnded(p3, p4)
		-- upvalues: p1 (ref), var3 (ref), var2 (ref), setMotor (ref), getGoal (ref), otterModule (copy), var1 (ref)
		if p3.UserInputState ~= Enum.UserInputState.End then return end
		local current = p1.defaultUseProps.scrollingFrameRef.current
		
		if tick() - var3.current <= 0.5 then
			if var2.current then
				var2.current:destroy()
			end
			setMotor(current.CanvasPosition.X)
			
			if var2.current then
				var2.current:setGoal(getGoal(p4))
			end
		elseif var2.current then
			var2.current:setGoal(otterModule.instant(current.CanvasPosition.X))
		end
		if var1.current then
			var1.current:Disconnect()
			var1.current = nil
		end
	end
	
	local function handleInputBegan(_, p3)
		-- upvalues: p1 (ref), onPressHoldInputBegan (ref)
		local onPressHoldInputBegan_1 = p1.onPressHoldInputBegan or onPressHoldInputBegan
		
		if onPressHoldInputBegan_1 then
			onPressHoldInputBegan_1(p3, p1.navDirection or "")
		end
	end
	
	local function handleInputEnded(_, p3)
		-- upvalues: p1 (ref), onPressHoldInputEnded (ref)
		local onPressHoldInputEnded_1 = p1.onPressHoldInputEnded or onPressHoldInputEnded
		
		if onPressHoldInputEnded_1 then
			onPressHoldInputEnded_1(p3, p1.navDirection or "")
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), setMotor (ref), var1 (ref), var2 (ref)
		if p1.defaultUseProps then
			setMotor(0)
		end
		return function()
			-- upvalues: var1 (copy), var2 (copy)
			if var1.current then
				var1.current:Disconnect()
				var1.current = nil
			end
			if var2.current then
				var2.current:destroy()
				var2.current = nil
			end
		end
	end, {})
	
	return {
		holdConnRef = var1,
		motorRef = var2,
		timeOfInputBeganRef = var3,
		handleInputBegan = handleInputBegan,
		handleInputEnded = handleInputEnded,
		disconnectHoldConn = disconnectHoldConn
	}
end