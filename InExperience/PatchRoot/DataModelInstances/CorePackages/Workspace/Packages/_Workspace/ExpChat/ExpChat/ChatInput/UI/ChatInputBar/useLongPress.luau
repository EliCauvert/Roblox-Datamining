local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(p0) --[[ line: 22 | named "isPointerInput" ]]
	return if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then p0.UserInputType == Enum.UserInputType.Touch else true
end

local _ = function(p1) --[[ line: 26 | named "isGamepadActivation" ]]
	return p1.KeyCode == Enum.KeyCode.ButtonA
end

local _ = function(p2) --[[ line: 33 | named "isGestureInput" ]]
	-- upvalues: userInputService (ref)
	return if if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true then true else userInputService.GamepadEnabled and p2.KeyCode == Enum.KeyCode.ButtonA
end

return function(p3) --[[ line: 53 | named "useLongPress" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local onLongPress = p3.onLongPress
	local onTap = p3.onTap
	local thresholdSeconds = p3.thresholdSeconds or 0.5
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var3 (ref)
		return function() --[[ line: 68 ]]
			-- upvalues: var3 (copy)
			local current = var3.current
			
			if current ~= nil then
				pcall(task.cancel, current)
				var3.current = nil
			end
		end
	end, {})
	
	return if onLongPress == nil then nil else {
		[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 77 ]]
			-- upvalues: var4 (ref), onTap (ref)
			if var4.current then
				var4.current = false
				
				return
			elseif onTap ~= nil then
				onTap()
			end
		end, { onTap }),
		[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p4) --[[ line: 87 ]]
			-- upvalues: onLongPress (ref), userInputService (copy), var3 (ref), var4 (ref), thresholdSeconds (ref)
			if onLongPress ~= nil then
				local var5
				if if p4.UserInputType ~= Enum.UserInputType.MouseButton1 then p4.UserInputType == Enum.UserInputType.Touch else true then
					var5 = true
				elseif userInputService.GamepadEnabled then
					var5 = p4.KeyCode == Enum.KeyCode.ButtonA
				end
				if not var5 then return end
				local current = var3.current
				
				if current ~= nil then
					pcall(task.cancel, current)
					var3.current = nil
				end
				var4.current = false
				var3.current = task.delay(thresholdSeconds, function() --[[ line: 100 ]]
					-- upvalues: var3 (copy), var4 (copy), onLongPress (copy)
					var3.current = nil
					var4.current = true
					
					if onLongPress ~= nil then
						onLongPress()
					end
				end)
				
				return
			end
		end, { onLongPress, thresholdSeconds }),
		[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p5) --[[ line: 109 ]]
			-- upvalues: onLongPress (ref), userInputService (copy), var3 (ref)
			if onLongPress ~= nil then
				local var6
				if if p5.UserInputType ~= Enum.UserInputType.MouseButton1 then p5.UserInputType == Enum.UserInputType.Touch else true then
					var6 = true
				elseif userInputService.GamepadEnabled then
					var6 = p5.KeyCode == Enum.KeyCode.ButtonA
				end
				if not var6 then return end
				local current = var3.current
				
				if current ~= nil then
					pcall(task.cancel, current)
					var3.current = nil
				end
				return
			end
		end, { onLongPress })
	}
end