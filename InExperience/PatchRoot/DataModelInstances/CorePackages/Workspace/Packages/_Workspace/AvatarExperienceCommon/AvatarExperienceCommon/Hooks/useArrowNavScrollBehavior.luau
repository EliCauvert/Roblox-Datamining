local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local RunService = game:GetService("RunService")
local Parent = AvatarExperienceCommon.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local config = { dampingRatio = 1, frequency = 3.5 }

return function(p1) --[[ Line: 42 | Named "useArrowNavScrollBehavior" ]]
	-- upvalues: ReactModule (copy), OtterModule (copy), ConstantsModule (copy), config (copy), RunService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(0)
	
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
	local function disconnectHoldConn() --[[ Line: 79 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end
	
	local function _(X): Vector2 --[[ Line: 86 | Named "getNewCanvasPosition" ]]
		-- upvalues: p1 (copy)
		return p1.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new(X, 0)
	end
	
	local function setMotor(X) --[[ Line: 91 ]]
		-- upvalues: UseRefResult1 (copy), OtterModule (upval), p1 (copy)
		if UseRefResult1.current then
			UseRefResult1.current:destroy()
		end
		UseRefResult1.current = OtterModule.createSingleMotor(X)
		
		if UseRefResult1.current then
			UseRefResult1.current:onStep(function(X) --[[ Line: 97 ]]
				-- upvalues: p1 (upval)
				p1.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
			end)
			UseRefResult1.current:onComplete(function(X) --[[ Line: 100 ]]
				-- upvalues: p1 (upval)
				p1.defaultUseProps.updateCanvasPosition(Vector2.new(X, 0))
			end)
		end
	end
	
	local function getScrollToLocation(ISLEFT): number --[[ Line: 106 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval)
		local List = {}
		local ButtonRefs = p1.defaultUseProps.buttonRefs
		local ButtonWidth = p1.defaultUseProps.buttonWidth
		local NumButtons = p1.defaultUseProps.numButtons
		
		if ButtonWidth and NumButtons then
			List = table.create(NumButtons, ButtonWidth)
		elseif ButtonRefs then
			for _, buttonRef in ButtonRefs do
				if buttonRef and buttonRef.current then
					local Offset = buttonRef.current.Size.X.Offset or 0
					
					if Offset == 0 then
						Offset = buttonRef.current.AbsoluteSize.X
					end
					table.insert(List, Offset)
				end
			end
		end
		local Current = p1.defaultUseProps.scrollingFrameRef.current
		local ButtonPadding = p1.defaultUseProps.buttonPadding
		
		if ISLEFT == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then
			local v1 = 0
			
			for _, value in List do
				if v1 + value + ButtonPadding > Current.CanvasPosition.X then break end
				v1 = v1 + value + ButtonPadding
			end
			local v2: number = v1
			local v3 = 0
			
			for _, value1 in List do
				if v3 + value1 + ButtonPadding > Current.AbsoluteSize.X * 0.8 then break end
				v3 = v3 + value1 + ButtonPadding
				v2 = v2 - value1 - ButtonPadding
			end
			return (math.max(0, v2))
		else
			local v4 = 0
			
			for _, value2 in List do
				if v4 + value2 + ButtonPadding > Current.CanvasPosition.X then break end
				v4 = v4 + value2 + ButtonPadding
			end
			local v5: number = v4
			local v6 = 0
			
			for _, value3 in List do
				if v6 + value3 + ButtonPadding > Current.AbsoluteSize.X * 0.8 then break end
				v6 = v6 + value3 + ButtonPadding
				v5 = v5 + value3 + ButtonPadding
			end
			return v5
		end
	end
	
	local function getGoal(p2) --[[ Line: 193 ]]
		-- upvalues: OtterModule (upval), getScrollToLocation (copy), config (upval)
		return OtterModule.spring(getScrollToLocation(p2), config)
	end
	
	local function onPressHoldInputBegan(Input, ISLEFT) --[[ Line: 197 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), RunService (upval), ConstantsModule (upval), p1 (copy)
		if Input.UserInputState ~= Enum.UserInputState.Begin then return end
		UseRefResult2.current = tick()
		
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		UseRefResult.current = RunService.RenderStepped:Connect(function(DeltaTime) --[[ Line: 203 ]]
			-- upvalues: UseRefResult2 (upval), ConstantsModule (upval), ISLEFT (copy), p1 (upval)
			p1.defaultUseProps.updateCanvasPosition(p1.defaultUseProps.scrollingFrameRef.current.CanvasPosition + Vector2.new((if ISLEFT == ConstantsModule.NAVIGATION_DIRECTION.IS_LEFT then -1 else 1) * 500 * DeltaTime * (tick() - UseRefResult2.current) ^ 2, 0))
		end)
	end
	
	local function onPressHoldInputEnded(Input, p2) --[[ Line: 212 ]]
		-- upvalues: p1 (copy), UseRefResult2 (copy), UseRefResult1 (copy), setMotor (copy), getGoal (copy), OtterModule (upval), UseRefResult (copy)
		if Input.UserInputState ~= Enum.UserInputState.End then return end
		local Current = p1.defaultUseProps.scrollingFrameRef.current
		
		if tick() - UseRefResult2.current <= 0.5 then
			if UseRefResult1.current then
				UseRefResult1.current:destroy()
			end
			setMotor(Current.CanvasPosition.X)
			
			if UseRefResult1.current then
				UseRefResult1.current:setGoal(getGoal(p2))
			end
		elseif UseRefResult1.current then
			UseRefResult1.current:setGoal(OtterModule.instant(Current.CanvasPosition.X))
		end
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end
	
	local function handleInputBegan(_, p2) --[[ Line: 233 ]]
		-- upvalues: p1 (copy), onPressHoldInputBegan (copy)
		local OnPressHoldInputBegan: (any, any) -> () = p1.onPressHoldInputBegan or onPressHoldInputBegan
		
		if OnPressHoldInputBegan then
			OnPressHoldInputBegan(p2, p1.navDirection or "")
		end
	end
	
	local function handleInputEnded(_, p2) --[[ Line: 240 ]]
		-- upvalues: p1 (copy), onPressHoldInputEnded (copy)
		local OnPressHoldInputEnded: (any, any) -> () = p1.onPressHoldInputEnded or onPressHoldInputEnded
		
		if OnPressHoldInputEnded then
			OnPressHoldInputEnded(p2, p1.navDirection or "")
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 248 ]]
		-- upvalues: p1 (copy), setMotor (copy), UseRefResult (copy), UseRefResult1 (copy)
		if p1.defaultUseProps then
			setMotor(0)
		end
		return function() --[[ Line: 254 ]]
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
			if UseRefResult1.current then
				UseRefResult1.current:destroy()
				UseRefResult1.current = nil
			end
		end
	end, {})
	
	return {
		holdConnRef = UseRefResult,
		motorRef = UseRefResult1,
		timeOfInputBeganRef = UseRefResult2,
		handleInputBegan = handleInputBegan,
		handleInputEnded = handleInputEnded,
		disconnectHoldConn = disconnectHoldConn
	}
end