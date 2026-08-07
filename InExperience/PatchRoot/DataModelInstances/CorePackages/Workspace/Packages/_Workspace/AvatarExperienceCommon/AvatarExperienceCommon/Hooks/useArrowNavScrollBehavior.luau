local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local runService = game:GetService("RunService")
local parent = avatarExperienceCommon.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local constantsModule = require(avatarExperienceCommon.Constants)
local t = { dampingRatio = 1, frequency = 3.5 }

return function(p0) --[[ line: 42 | named "useArrowNavScrollBehavior" ]]
	-- upvalues: reactModule (ref), otterModule (ref), constantsModule (ref), t (ref), runService (ref)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(0)
	
	if p0.defaultUseProps then
		if p0.defaultUseProps.buttonRefs ~= nil then
			if p0.defaultUseProps.buttonWidth ~= nil then
				error("Cannot set both buttonWidth and buttonRefs")
			end
			if p0.defaultUseProps.numButtons ~= nil then
				error("Cannot set both numButtons and buttonRefs")
			end
		end
		if p0.defaultUseProps.buttonWidth ~= nil and p0.defaultUseProps.numButtons == nil then
			error("If setting buttonWidth must also set numButtons")
		end
		if p0.defaultUseProps.buttonWidth == nil and p0.defaultUseProps.numButtons ~= nil then
			error("If setting numButtons must also set buttonWidth")
		end
		if p0.defaultUseProps.buttonRefs == nil and p0.defaultUseProps.buttonWidth == nil and p0.defaultUseProps.numButtons == nil then
			error("Must set either buttonRefs or (buttonWidth and numButtons)")
		end
	end
	local function disconnectHoldConn() --[[ line: 79 ]]
		-- upvalues: var6 (ref)
		if var6.current then
			var6.current:Disconnect()
			var6.current = nil
		end
	end
	
	local function _(p1) --[[ line: 86 | named "getNewCanvasPosition" ]]
		-- upvalues: p0 (ref)
		return p0.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(p1, 0)
	end
	
	local function setMotor(value) --[[ line: 91 ]]
		-- upvalues: var7 (ref), otterModule (copy), p0 (ref)
		if var7.current then
			var7.current:destroy()
		end
		var7.current = otterModule.createSingleMotor(value)
		
		if var7.current then
			var7.current:onStep(function(p2) --[[ line: 97 ]]
				-- upvalues: p0 (copy)
				p0.defaultUseProps.updateCanvasPosition(Vector2.new(p2, 0))
			end)
			var7.current:onComplete(function(p3) --[[ line: 100 ]]
				-- upvalues: p0 (copy)
				p0.defaultUseProps.updateCanvasPosition(Vector2.new(p3, 0))
			end)
		end
	end
	
	local function getScrollToLocation(p4) --[[ line: 106 ]]
		-- upvalues: p0 (ref), constantsModule (copy)
		local t = {}
		local buttonRefs = p0.defaultUseProps.buttonRefs
		local buttonWidth = p0.defaultUseProps.buttonWidth
		local numButtons = p0.defaultUseProps.numButtons
		
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
		local current = p0.defaultUseProps.scrollingFrameRef.current
		local buttonPadding = p0.defaultUseProps.buttonPadding
		local _ = 0
		
		if p4 == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then
			local var19 = 0
			local _ = 0
			
			for i, v in t do
				if var19 + v + buttonPadding > current.CanvasPosition.X then break end
				var19 = var19 + v + buttonPadding
			end
			local var20 = var19
			local var21 = 0
			
			for i_1, v_1 in t do
				if var21 + v_1 + buttonPadding > current.AbsoluteSize.X * 0.8 then break end
				var21 = var21 + v_1 + buttonPadding
				var20 = var20 - v_1 - buttonPadding
			end
			return math.max(0, var20)
		else
			local var22 = 0
			local _ = 0
			
			for i, v in t do
				if var22 + v + buttonPadding > current.CanvasPosition.X then break end
				var22 = var22 + v + buttonPadding
			end
			local var23 = var22
			local var24 = 0
			
			for i_1, v_1 in t do
				if var24 + v_1 + buttonPadding > current.AbsoluteSize.X * 0.8 then break end
				var24 = var24 + v_1 + buttonPadding
				var23 = var23 + v_1 + buttonPadding
			end
			return var23
		end
	end
	
	local function getGoal(p5) --[[ line: 193 ]]
		-- upvalues: otterModule (copy), getScrollToLocation (ref), t (copy)
		return otterModule.spring(getScrollToLocation(p5), t)
	end
	
	local function onPressHoldInputBegan(p6, p7) --[[ line: 197 ]]
		-- upvalues: var8 (ref), var6 (ref), runService (copy), constantsModule (copy), p0 (ref)
		if p6.UserInputState ~= Enum.UserInputState.Begin then return end
		var8.current = tick()
		
		if var6.current then
			var6.current:Disconnect()
			var6.current = nil
		end
		var6.current = runService.RenderStepped:Connect(function(p8) --[[ line: 203 ]]
			-- upvalues: var8 (copy), constantsModule (copy), p7 (ref), p0 (copy)
			p0.defaultUseProps.updateCanvasPosition(p0.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new((if p7 == constantsModule.NAVIGATION_DIRECTION.IS_LEFT then -1 else 1) * 500 * p8 * (tick() - var8.current) ^ 2, 0))
		end)
	end
	
	local function onPressHoldInputEnded(p9, p10) --[[ line: 212 ]]
		-- upvalues: p0 (ref), var8 (ref), var7 (ref), setMotor (ref), getGoal (ref), otterModule (copy), var6 (ref)
		if p9.UserInputState ~= Enum.UserInputState.End then return end
		local current = p0.defaultUseProps.scrollingFrameRef.current
		
		if tick() - var8.current <= 0.5 then
			if var7.current then
				var7.current:destroy()
			end
			setMotor(current.CanvasPosition.X)
			
			if var7.current then
				var7.current:setGoal(getGoal(p10))
			end
		elseif var7.current then
			var7.current:setGoal(otterModule.instant(current.CanvasPosition.X))
		end
		if var6.current then
			var6.current:Disconnect()
			var6.current = nil
		end
	end
	
	local function handleInputBegan(_, p11) --[[ line: 233 ]]
		-- upvalues: p0 (ref), onPressHoldInputBegan (ref)
		local onPressHoldInputBegan_1 = p0.onPressHoldInputBegan or onPressHoldInputBegan
		
		if onPressHoldInputBegan_1 then
			onPressHoldInputBegan_1(p11, p0.navDirection or "")
		end
	end
	
	local function handleInputEnded(_, p12) --[[ line: 240 ]]
		-- upvalues: p0 (ref), onPressHoldInputEnded (ref)
		local onPressHoldInputEnded_1 = p0.onPressHoldInputEnded or onPressHoldInputEnded
		
		if onPressHoldInputEnded_1 then
			onPressHoldInputEnded_1(p12, p0.navDirection or "")
		end
	end
	
	reactModule.useEffect(function() --[[ line: 248 ]]
		-- upvalues: p0 (ref), setMotor (ref), var6 (ref), var7 (ref)
		if p0.defaultUseProps then
			setMotor(0)
		end
		return function() --[[ line: 254 ]]
			-- upvalues: var6 (copy), var7 (copy)
			if var6.current then
				var6.current:Disconnect()
				var6.current = nil
			end
			if var7.current then
				var7.current:destroy()
				var7.current = nil
			end
		end
	end, {})
	
	return {
		holdConnRef = var6,
		motorRef = var7,
		timeOfInputBeganRef = var8,
		handleInputBegan = handleInputBegan,
		handleInputEnded = handleInputEnded,
		disconnectHoldConn = disconnectHoldConn
	}
end