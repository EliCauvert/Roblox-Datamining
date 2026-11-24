local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local RunService = game:GetService("RunService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.WorldTouchControls.createWorldTouchInput)
local JoystickMathModule = require(BuildExperience.WorldTouchControls.joystickMath)

local function toScreenPoint(Input): Vector2
	return Vector2.new(Input.Position.X, Input.Position.Y)
end

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1
end

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), RunService (copy), JoystickMathModule (copy), toScreenPoint (copy)
	local TouchInput = p1.touchInput
	local StickRadius = p1.stickRadius
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2_1 (copy), ReducedMotion (copy), RunService (upval)
		if not p1.isVisible then
			UseBindingResult2_1(0)
			
			return nil
		elseif ReducedMotion then
			UseBindingResult2_1(1)
			
			return nil
		else
			UseBindingResult2_1(0)
			local Total = 0
			local Connection = nil
			Connection = RunService.Heartbeat:Connect(function(DeltaTime: number)
				-- upvalues: Total (ref), UseBindingResult2_1 (upval), Connection (ref)
				Total += DeltaTime
				local Smallest = math.min(Total / 0.2, 1)
				UseBindingResult2_1(1 - (1 - Smallest) * (1 - Smallest))
				
				if Smallest >= 1 and Connection ~= nil then
					Connection:Disconnect()
				end
			end)
			
			return function()
				-- upvalues: Connection (ref)
				if Connection ~= nil then
					Connection:Disconnect()
				end
			end
		end
	end, { p1.isVisible, ReducedMotion, UseBindingResult2_1 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), TouchInput (copy), UseBindingResult2 (copy)
		UseRefResult.current = nil
		TouchInput.setMove(Vector2.zero)
		UseBindingResult2(Vector2.zero)
	end, { TouchInput })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), TouchInput (copy)
		UseRefResult1.current = nil
		TouchInput.setElevate(0)
	end, { TouchInput })
	
	local function moveStick(p2)
		-- upvalues: UseRefResult (copy), TouchInput (copy), JoystickMathModule (upval), StickRadius (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil and Current.center ~= nil then
			TouchInput.setMove(JoystickMathModule.getMoveVector(Current.center, p2, StickRadius, 0.15))
			UseBindingResult2(JoystickMathModule.getKnobOffset(Current.center, p2, StickRadius))
			
			return
		end
	end
	
	local function OnStickInputBegan(Frame: Frame, Input)
		-- upvalues: p1 (copy), UseRefResult (copy), moveStick (copy), toScreenPoint (upval)
		if p1.isVisible and UseRefResult.current == nil and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
			UseRefResult.current = {
				input = Input,
				center = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
			}
			moveStick(toScreenPoint(Input))
			
			return
		end
	end
	
	local function _(p2)
		-- upvalues: p1 (copy), UseRefResult1 (copy), TouchInput (copy)
		return function(_, Input)
			-- upvalues: p1 (upval), UseRefResult1 (upval), TouchInput (upval), p2 (copy)
			if p1.isVisible and UseRefResult1.current == nil and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
				UseRefResult1.current = { input = Input }
				TouchInput.setElevate(p2)
				
				return
			end
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult (copy), UseResult1 (copy), UseRefResult (copy), moveStick (copy), toScreenPoint (upval), UseRefResult1 (copy)
		if p1.isVisible then
			local UserInputService = p1.userInputService or game:GetService("UserInputService")
			
			local function _(Input): boolean
				-- upvalues: UseRefResult (upval)
				local Current = UseRefResult.current
				
				return Current ~= nil and (Input == Current.input or Current.input.UserInputType == Enum.UserInputType.MouseButton1 and Input.UserInputType == Enum.UserInputType.MouseMovement)
			end
			
			local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input)
				-- upvalues: UseRefResult (upval), moveStick (upval), toScreenPoint (upval)
				local Current = UseRefResult.current
				
				if Current ~= nil and (Input == Current.input or Current.input.UserInputType == Enum.UserInputType.MouseButton1 and Input.UserInputType == Enum.UserInputType.MouseMovement) then
					moveStick(toScreenPoint(Input))
				end
			end)
			local InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
				-- upvalues: UseRefResult (upval), UseResult (upval), UseRefResult1 (upval), UseResult1 (upval)
				if UseRefResult.current ~= nil and UseRefResult.current.input == Input then
					UseResult()
				end
				if UseRefResult1.current ~= nil and UseRefResult1.current.input == Input then
					UseResult1()
				end
			end)
			local WindowFocusReleasedConnection = UserInputService.WindowFocusReleased:Connect(function()
				-- upvalues: UseResult (upval), UseResult1 (upval)
				UseResult()
				UseResult1()
			end)
			
			return function()
				-- upvalues: InputChangedConnection (copy), InputEndedConnection (copy), WindowFocusReleasedConnection (copy), UseResult (upval), UseResult1 (upval)
				InputChangedConnection:Disconnect()
				InputEndedConnection:Disconnect()
				WindowFocusReleasedConnection:Disconnect()
				UseResult()
				UseResult1()
			end
		else
			UseResult()
			UseResult1()
			
			return nil
		end
	end, {
		p1.isVisible,
		p1.userInputService,
		StickRadius,
		UseResult,
		UseResult1
	})
	local v1 = 1
	
	local function OnRaiseInputBegan(_, Input)
		-- upvalues: p1 (copy), UseRefResult1 (copy), TouchInput (copy), v1 (copy)
		if p1.isVisible and UseRefResult1.current == nil and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
			UseRefResult1.current = { input = Input }
			TouchInput.setElevate(v1)
			
			return
		end
	end
	
	local v2 = -1
	
	return {
		knobOffset = UseBindingResult,
		opacity = UseBindingResult1,
		onStickInputBegan = OnStickInputBegan,
		onRaiseInputBegan = OnRaiseInputBegan,
		onLowerInputBegan = function(_, Input)
			-- upvalues: p1 (copy), UseRefResult1 (copy), TouchInput (copy), v2 (copy)
			if p1.isVisible and UseRefResult1.current == nil and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) then
				UseRefResult1.current = { input = Input }
				TouchInput.setElevate(v2)
				
				return
			end
		end
	}
end