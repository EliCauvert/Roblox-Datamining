local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(Input): boolean --[[ Line: 22 | Named "isPointerInput" ]]
	return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
end

local _ = function(Input): boolean --[[ Line: 26 | Named "isGamepadActivation" ]]
	return Input.KeyCode == Enum.KeyCode.ButtonA
end

local _ = function(Input): boolean --[[ Line: 33 | Named "isGestureInput" ]]
	-- upvalues: UserInputService (copy)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
		return true
	elseif UserInputService.GamepadEnabled and Input.KeyCode == Enum.KeyCode.ButtonA then
		return true
	else
		return false
	end
end

return function(p1) --[[ Line: 53 | Named "useLongPress" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local OnLongPressFunction = p1.onLongPress
	local OnTapFunction = p1.onTap
	local ThresholdSeconds = p1.thresholdSeconds or 0.5
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 68 ]]
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				pcall(task.cancel, Current)
				UseRefResult.current = nil
			end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 77 ]]
		-- upvalues: UseRefResult1 (copy), OnTapFunction (copy)
		if UseRefResult1.current then
			UseRefResult1.current = false
			
			return
		end
		if OnTapFunction ~= nil then
			OnTapFunction()
		end
	end, { OnTapFunction })
	local UseResult1 = ReactModule.useCallback(function(_, Input) --[[ Line: 87 ]]
		-- upvalues: OnLongPressFunction (copy), UserInputService (upval), UseRefResult (copy), UseRefResult1 (copy), ThresholdSeconds (copy)
		if OnLongPressFunction ~= nil then
			local Flag = nil
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Flag = true
			elseif UserInputService.GamepadEnabled and Input.KeyCode == Enum.KeyCode.ButtonA then
				Flag = true
			else
				Flag = false
			end
			if Flag then
				local Current = UseRefResult.current
				
				if Current ~= nil then
					pcall(task.cancel, Current)
					UseRefResult.current = nil
				end
				UseRefResult1.current = false
				UseRefResult.current = task.delay(ThresholdSeconds, function() --[[ Line: 100 ]]
					-- upvalues: UseRefResult (upval), UseRefResult1 (upval), OnLongPressFunction (upval)
					UseRefResult.current = nil
					UseRefResult1.current = true
					
					if OnLongPressFunction ~= nil then
						OnLongPressFunction()
					end
				end)
				
				return
			end
		end
	end, { OnLongPressFunction, ThresholdSeconds })
	local UseResult2 = ReactModule.useCallback(function(_, Input) --[[ Line: 109 ]]
		-- upvalues: OnLongPressFunction (copy), UserInputService (upval), UseRefResult (copy)
		if OnLongPressFunction ~= nil then
			local Flag = nil
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Flag = true
			elseif UserInputService.GamepadEnabled and Input.KeyCode == Enum.KeyCode.ButtonA then
				Flag = true
			else
				Flag = false
			end
			if Flag then
				local Current = UseRefResult.current
				
				if Current ~= nil then
					pcall(task.cancel, Current)
					UseRefResult.current = nil
				end
				return
			end
		end
	end, { OnLongPressFunction })
	
	return if OnLongPressFunction == nil then nil else {
		[ReactModule.Event.Activated] = UseResult,
		[ReactModule.Event.InputBegan] = UseResult1,
		[ReactModule.Event.InputEnded] = UseResult2
	}
end