local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("PeekView").Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy), RunService (copy), UserInputService (copy)
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), Callback (copy), UserInputService (upval)
		local Input = nil
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: Input (ref), Callback (upval)
			if Input and Input.KeyCode == Enum.KeyCode.Thumbstick2 then
				Callback(Input, DeltaTime)
			end
		end)
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input1, _)
			-- upvalues: Input (ref)
			if Input1.KeyCode == Enum.KeyCode.Thumbstick2 then
				if Input1.UserInputState == Enum.UserInputState.Change then
					Input = Input1
					
					return
				end
				if Input1.UserInputState == Enum.UserInputState.End then
					Input = nil
				end
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy), InputChangedConnection (copy)
			HeartbeatConnection:Disconnect()
			InputChangedConnection:Disconnect()
		end
	end, { Callback })
end