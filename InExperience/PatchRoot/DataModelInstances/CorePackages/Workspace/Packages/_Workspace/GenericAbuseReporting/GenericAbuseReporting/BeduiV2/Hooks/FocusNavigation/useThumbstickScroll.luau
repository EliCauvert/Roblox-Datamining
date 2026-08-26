local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local scrollFrameUtilsModule = require(script.Parent.scrollFrameUtils)

return function(value)
	-- upvalues: reactModule (ref), runService (ref), guiService (ref), scrollFrameUtilsModule (ref), userInputService (ref)
	reactModule.useEffect(function()
		-- upvalues: value (ref), runService (copy), guiService (copy), scrollFrameUtilsModule (copy), userInputService (copy)
		if value.enabled then
			local var1 = nil
			local heartbeatConnection = runService.Heartbeat:Connect(function(p1)
				-- upvalues: var1 (write), value (copy), guiService (copy), scrollFrameUtilsModule (copy)
				if var1 == nil or var1.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
				local current = value.containerRef.current
				
				if current == nil then return end
				local var2 = scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current)
				
				if var2 == nil then
					return
				end
				scrollFrameUtilsModule.scrollByAnalogInput(var2, var1, p1)
			end)
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p1, _)
				-- upvalues: var1 (write)
				if p1.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
				if p1.UserInputState == Enum.UserInputState.Change then
					var1 = p1
					
					return
				elseif p1.UserInputState == Enum.UserInputState.End then
					var1 = nil
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref), inputChangedConnection (ref)
				heartbeatConnection:Disconnect()
				inputChangedConnection:Disconnect()
			end
		end
	end, { value.enabled, value.containerRef })
end