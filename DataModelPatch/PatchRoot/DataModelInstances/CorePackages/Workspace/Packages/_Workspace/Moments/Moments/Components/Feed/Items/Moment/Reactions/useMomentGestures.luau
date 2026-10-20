local Parent = script:FindFirstAncestor("Moments").Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function _(Input): boolean
	return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
end

local _ = function(p1, p2, p3): boolean
	return (p1 - p2).Magnitude <= p3
end

return function(p1, Current, p2)
	-- upvalues: ReactModule (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local Callback = p2 or os.clock
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(Vector2.zero)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseRefResult9 = ReactModule.useRef(nil)
	local UseRefResult10 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Input)
		-- upvalues: p1 (copy), UseRefResult7 (copy), UseRefResult8 (copy), UseRefResult10 (copy), Callback (copy), UseRefResult9 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult1 (copy)
		if not p1 or Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		UseRefResult7.current = Input
		UseRefResult8.current = false
		UseRefResult10.current = false
		local CallbackResult = Callback()
		local _Vector2 = Vector2.new(Input.Position.X, Input.Position.Y)
		UseRefResult9.current = _Vector2
		local IsMagnitudeBelow = (_Vector2 - UseRefResult3.current).Magnitude <= 50
		
		if CallbackResult - UseRefResult2.current <= 0.25 and IsMagnitudeBelow then
			UseRefResult4.current += 1
		else
			UseRefResult4.current = 1
		end
		UseRefResult2.current = CallbackResult
		UseRefResult3.current = _Vector2
		
		if UseRefResult4.current >= 2 and UseRefResult6.current then
			task.cancel(UseRefResult6.current)
			UseRefResult6.current = nil
		end
		if UseRefResult5.current then
			task.cancel(UseRefResult5.current)
		end
		UseRefResult5.current = task.delay(0.5, function()
			-- upvalues: p1 (upval), UseRefResult7 (upval), Input (copy), UseRefResult8 (upval), UseRefResult1 (upval)
			if not p1 then return end
			if UseRefResult7.current == Input and not UseRefResult8.current then
				UseRefResult8.current = true
				local OnLongPressFunction: () -> () = UseRefResult1.current.onLongPress
				
				if OnLongPressFunction then
					OnLongPressFunction()
				end
			end
		end)
	end, { p1, Callback })
	local UseResult1 = ReactModule.useCallback(function(Input)
		-- upvalues: p1 (copy), UseRefResult7 (copy), UseRefResult9 (copy), UseRefResult10 (copy), UseRefResult5 (copy)
		if not p1 or UseRefResult7.current == nil then return end
		if Input.UserInputType == Enum.UserInputType.Touch and Input ~= UseRefResult7.current then return end
		if UseRefResult9.current ~= nil and not UseRefResult10.current and (Vector2.new(Input.Position.X, Input.Position.Y) - UseRefResult9.current).Magnitude > 50 then
			UseRefResult10.current = true
			
			if UseRefResult5.current then
				task.cancel(UseRefResult5.current)
				UseRefResult5.current = nil
			end
		end
	end, { p1 })
	UseEventConnectionFunction(UserInputService.InputChanged, UseResult1, { UseResult1 })
	local UseResult2 = ReactModule.useCallback(function(Input)
		-- upvalues: UseRefResult7 (copy), UseRefResult5 (copy), UseRefResult8 (copy), UseRefResult10 (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult6 (copy), UseRefResult3 (copy)
		if UseRefResult7.current ~= Input then return end
		UseRefResult7.current = nil
		
		if UseRefResult5.current then
			task.cancel(UseRefResult5.current)
			UseRefResult5.current = nil
		end
		if UseRefResult8.current or UseRefResult10.current or Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		local OnTapFunction: () -> () = UseRefResult1.current.onTap
		
		if OnTapFunction then
			OnTapFunction()
		end
		if UseRefResult4.current >= 2 then
			if UseRefResult6.current then
				task.cancel(UseRefResult6.current)
				UseRefResult6.current = nil
			end
			UseRefResult4.current = 0
			local OnDoubleTapFunction: (any) -> () = UseRefResult1.current.onDoubleTap
			
			if OnDoubleTapFunction then
				OnDoubleTapFunction(UseRefResult3.current)
				
				return
			end
		else
			if UseRefResult6.current then
				task.cancel(UseRefResult6.current)
			end
			UseRefResult6.current = task.delay(0.25, function()
				-- upvalues: UseRefResult6 (upval), UseRefResult4 (upval), UseRefResult1 (upval)
				UseRefResult6.current = nil
				
				if UseRefResult4.current == 1 then
					local OnSingleTapConfirmedFunction: () -> () = UseRefResult1.current.onSingleTapConfirmed
					
					if OnSingleTapConfirmedFunction then
						OnSingleTapConfirmedFunction()
					end
				end
				UseRefResult4.current = 0
			end)
		end
	end, {})
	UseEventConnectionFunction(UserInputService.InputEnded, UseResult2, { UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local InputBeganConnection = Current.InputBegan:Connect(UseResult)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), UseRefResult6 (copy)
		return function()
			-- upvalues: UseRefResult5 (upval), UseRefResult6 (upval)
			if UseRefResult5.current then
				task.cancel(UseRefResult5.current)
			end
			if UseRefResult6.current then
				task.cancel(UseRefResult6.current)
			end
		end
	end, {})
	
	return {
		ref = UseRefResult,
		onInputBegan = UseResult,
		onInputChanged = UseResult1,
		onInputEnded = UseResult2
	}
end