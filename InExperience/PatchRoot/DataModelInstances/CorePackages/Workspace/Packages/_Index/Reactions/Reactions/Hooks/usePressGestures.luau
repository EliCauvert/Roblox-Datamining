local Parent = script:FindFirstAncestor("Reactions").Parent
local UserInputService = game:GetService("UserInputService")
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1
end

local function toVector2(Position): Vector2
	return Vector2.new(Position.X, Position.Y)
end

return function(p1, Current)
	-- upvalues: ReactModule (copy), toVector2 (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(Vector2.zero)
	local UseRefResult9 = ReactModule.useRef(nil)
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult5 (copy), UseRefResult6 (copy), UseRefResult2 (copy), UseRefResult4 (copy)
		UseRefResult1.current = nil
		UseRefResult5.current = false
		UseRefResult6.current = false
		
		if UseRefResult2.current ~= nil then
			UseRefResult2.current:Disconnect()
			UseRefResult2.current = nil
		end
		if UseRefResult4.current ~= nil then
			task.cancel(UseRefResult4.current)
			UseRefResult4.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult5 (copy), UseRefResult (copy), UseRefResult3 (copy), UseResult (copy)
		if UseRefResult5.current then
			local OnHoldMovedFunction: (any) -> () = UseRefResult.current.onHoldMoved
			
			if OnHoldMovedFunction then
				OnHoldMovedFunction(p2)
				
				return
			end
		elseif (p2 - UseRefResult3.current).Magnitude > 10 then
			UseResult()
		end
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function(Input)
		-- upvalues: UseRefResult5 (copy), UseRefResult6 (copy), UseResult (copy), UseRefResult (copy), UseRefResult8 (copy), UseRefResult7 (copy)
		local Current = UseRefResult5.current
		local Current1 = UseRefResult6.current
		local IsUserInputStateMatch = Input.UserInputState == Enum.UserInputState.Cancel
		UseResult()
		local Current2 = UseRefResult.current
		
		if Current then
			if Current2.onHoldEnded then
				local OnHoldEndedFunction: (any) -> () = Current2.onHoldEnded
				local v1 = nil
				
				if IsUserInputStateMatch then
					v1 = nil
				else
					local Position = Input.Position
					v1 = Vector2.new(Position.X, Position.Y)
				end
				OnHoldEndedFunction(v1)
			end
			return
		elseif IsUserInputStateMatch then return end
		local Position = Input.Position
		local _Vector2 = Vector2.new(Position.X, Position.Y)
		
		if Current2.onDoubleTap == nil then
			if Current2.onTap then
				Current2.onTap()
				
				return
			end
		elseif Current1 then
			Current2.onDoubleTap(_Vector2)
			
			return
		else
			UseRefResult8.current = _Vector2
			UseRefResult7.current = task.delay(0.25, function()
				-- upvalues: UseRefResult7 (upval), UseRefResult (upval)
				UseRefResult7.current = nil
				local OnTapFunction: () -> () = UseRefResult.current.onTap
				
				if OnTapFunction then
					OnTapFunction()
				end
			end)
		end
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function(Input)
		-- upvalues: UseRefResult1 (copy), UseRefResult7 (copy), UseRefResult8 (copy), UseRefResult6 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult2 (copy), UseResult1 (copy), toVector2 (upval), UseResult2 (copy), UseRefResult4 (copy), UseRefResult5 (copy)
		if Input.UserInputType ~= Enum.UserInputType.Touch and Input.UserInputType ~= Enum.UserInputType.MouseButton1 or UseRefResult1.current ~= nil then return end
		local Position = Input.Position
		local _Vector2 = Vector2.new(Position.X, Position.Y)
		local Current = UseRefResult7.current
		
		if Current ~= nil then
			task.cancel(Current)
			UseRefResult7.current = nil
			
			if (_Vector2 - UseRefResult8.current).Magnitude <= 50 then
				UseRefResult6.current = true
			else
				local OnTapFunction: () -> () = UseRefResult.current.onTap
				
				if OnTapFunction then
					OnTapFunction()
				end
			end
		end
		UseRefResult1.current = Input
		UseRefResult3.current = _Vector2
		UseRefResult2.current = Input.Changed:Connect(function(p2)
			-- upvalues: UseResult1 (upval), toVector2 (upval), Input (copy), UseResult2 (upval)
			if p2 == "Position" then
				UseResult1(toVector2(Input.Position))
				
				return
			end
			if p2 == "UserInputState" then
				local UserInputState = Input.UserInputState
				
				if UserInputState == Enum.UserInputState.End or UserInputState == Enum.UserInputState.Cancel then
					UseResult2(Input)
				end
			end
		end)
		
		if UseRefResult.current.onHold ~= nil then
			UseRefResult4.current = task.delay(UseRefResult.current.holdDuration or 0.4, function()
				-- upvalues: UseRefResult4 (upval), UseRefResult1 (upval), Input (copy), UseRefResult5 (upval), UseRefResult (upval)
				UseRefResult4.current = nil
				
				if UseRefResult1.current ~= Input then return end
				UseRefResult5.current = true
				local OnHoldFunction: () -> () = UseRefResult.current.onHold
				
				if OnHoldFunction then
					OnHoldFunction()
				end
			end)
			
			return
		end
	end, { UseResult1, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(Input)
		-- upvalues: UseRefResult1 (copy), UseResult1 (copy), toVector2 (upval)
		local Current = UseRefResult1.current
		
		if Current ~= nil and Current.UserInputType == Enum.UserInputType.MouseButton1 and Input.UserInputType == Enum.UserInputType.MouseMovement then
			UseResult1(toVector2(Input.Position))
			
			return
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult9 (copy), UseRefResult10 (copy), UseResult3 (copy)
		local Current = p1.current
		
		if Current == UseRefResult9.current then return end
		if UseRefResult10.current ~= nil then
			UseRefResult10.current:Disconnect()
			UseRefResult10.current = nil
		end
		UseRefResult9.current = Current
		
		if Current ~= nil and (if typeof(Current) == "Instance" then Current:IsA("GuiObject") else Current.InputBegan ~= nil) then
			UseRefResult10.current = Current.InputBegan:Connect(UseResult3)
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseResult4 (copy)
		local InputChangedConnection = UserInputService.InputChanged:Connect(UseResult4)
		
		return function()
			-- upvalues: InputChangedConnection (copy)
			InputChangedConnection:Disconnect()
		end
	end, { UseResult4 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseRefResult10 (copy), UseRefResult7 (copy)
		return function()
			-- upvalues: UseResult (upval), UseRefResult10 (upval), UseRefResult7 (upval)
			UseResult()
			
			if UseRefResult10.current ~= nil then
				UseRefResult10.current:Disconnect()
				UseRefResult10.current = nil
			end
			if UseRefResult7.current ~= nil then
				task.cancel(UseRefResult7.current)
				UseRefResult7.current = nil
			end
		end
	end, { UseResult })
	
	return { onInputBegan = UseResult3, onInputChanged = UseResult4 }
end