local parent = script:FindFirstAncestor("PeekView").Parent
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)

return function(p0)
	-- upvalues: reactModule (ref), runService (ref), userInputService (ref)
	reactModule.useEffect(function()
		-- upvalues: runService (copy), p0 (ref), userInputService (copy)
		local var3 = nil
		local heartbeatConnection = runService.Heartbeat:Connect(function(p1)
			-- upvalues: var3 (write), p0 (copy)
			if var3 and var3.KeyCode == Enum.KeyCode.Thumbstick2 then
				p0(var3, p1)
			end
		end)
		local inputChangedConnection = userInputService.InputChanged:Connect(function(p2, _)
			-- upvalues: var3 (write)
			if p2.KeyCode == Enum.KeyCode.Thumbstick2 then
				if p2.UserInputState == Enum.UserInputState.Change then
					var3 = p2
					
					return
				elseif p2.UserInputState == Enum.UserInputState.End then
					var3 = nil
				end
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (ref), inputChangedConnection (ref)
			heartbeatConnection:Disconnect()
			inputChangedConnection:Disconnect()
		end
	end, { p0 })
end