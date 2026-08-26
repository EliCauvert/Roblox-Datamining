local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

local function _(p1)
	return if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true
end

local _ = function(p1)
	return p1.KeyCode == Enum.KeyCode.ButtonA
end

local _ = function(p1)
	-- upvalues: userInputService (ref)
	return if if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true then true else userInputService.GamepadEnabled and p1.KeyCode == Enum.KeyCode.ButtonA
end

return function(p1)
	-- upvalues: reactModule (ref), userInputService (ref)
	local onLongPress = p1.onLongPress
	local onTap = p1.onTap
	local thresholdSeconds = p1.thresholdSeconds or 0.5
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			local current = var1.current
			
			if current ~= nil then
				pcall(task.cancel, current)
				var1.current = nil
			end
		end
	end, {})
	
	return if onLongPress == nil then nil else {
		[reactModule.Event.Activated] = reactModule.useCallback(function()
			-- upvalues: var2 (ref), onTap (ref)
			if var2.current then
				var2.current = false
				
				return
			elseif onTap ~= nil then
				onTap()
			end
		end, { onTap }),
		[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2)
			-- upvalues: onLongPress (ref), userInputService (copy), var1 (ref), var2 (ref), thresholdSeconds (ref)
			if onLongPress ~= nil then
				local var3
				if if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true then
					var3 = true
				elseif userInputService.GamepadEnabled then
					var3 = p2.KeyCode == Enum.KeyCode.ButtonA
				end
				if not var3 then return end
				local current = var1.current
				
				if current ~= nil then
					pcall(task.cancel, current)
					var1.current = nil
				end
				var2.current = false
				var1.current = task.delay(thresholdSeconds, function()
					-- upvalues: var1 (copy), var2 (copy), onLongPress (copy)
					var1.current = nil
					var2.current = true
					
					if onLongPress ~= nil then
						onLongPress()
					end
				end)
				
				return
			end
		end, { onLongPress, thresholdSeconds }),
		[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p2)
			-- upvalues: onLongPress (ref), userInputService (copy), var1 (ref)
			if onLongPress ~= nil then
				local var3
				if if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true then
					var3 = true
				elseif userInputService.GamepadEnabled then
					var3 = p2.KeyCode == Enum.KeyCode.ButtonA
				end
				if not var3 then return end
				local current = var1.current
				
				if current ~= nil then
					pcall(task.cancel, current)
					var1.current = nil
				end
				return
			end
		end, { onLongPress })
	}
end