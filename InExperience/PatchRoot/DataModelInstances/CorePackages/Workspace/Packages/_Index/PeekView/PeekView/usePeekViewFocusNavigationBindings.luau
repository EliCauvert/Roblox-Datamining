local parent = script:FindFirstAncestor("PeekView").Parent
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref), runService (ref), userInputService (ref)
	reactModule.useEffect(function()
		-- upvalues: runService (copy), p1 (ref), userInputService (copy)
		local var1 = nil
		local heartbeatConnection = runService.Heartbeat:Connect(function(p2)
			-- upvalues: var1 (write), p1 (copy)
			if var1 and var1.KeyCode == Enum.KeyCode.Thumbstick2 then
				p1(var1, p2)
			end
		end)
		local inputChangedConnection = userInputService.InputChanged:Connect(function(p2, _)
			-- upvalues: var1 (write)
			if p2.KeyCode == Enum.KeyCode.Thumbstick2 then
				if p2.UserInputState == Enum.UserInputState.Change then
					var1 = p2
					
					return
				elseif p2.UserInputState == Enum.UserInputState.End then
					var1 = nil
				end
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (ref), inputChangedConnection (ref)
			heartbeatConnection:Disconnect()
			inputChangedConnection:Disconnect()
		end
	end, { p1 })
end