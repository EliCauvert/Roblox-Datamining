local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local scrollFrameUtilsModule = require(script.Parent.scrollFrameUtils)

return function(value) --[[ line: 22 | named "useThumbstickScroll" ]]
	-- upvalues: reactModule (ref), runService (ref), guiService (ref), scrollFrameUtilsModule (ref), userInputService (ref)
	reactModule.useEffect(function() --[[ line: 23 ]]
		-- upvalues: value (ref), runService (copy), guiService (copy), scrollFrameUtilsModule (copy), userInputService (copy)
		if value.enabled then
			local var5 = nil
			local heartbeatConnection = runService.Heartbeat:Connect(function(p0) --[[ line: 30 ]]
				-- upvalues: var5 (write), value (copy), guiService (copy), scrollFrameUtilsModule (copy)
				if var5 == nil or var5.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
				local current = value.containerRef.current
				
				if current == nil then return end
				local var8 = scrollFrameUtilsModule.resolveScrollTarget(guiService.SelectedCoreObject, current)
				
				if var8 == nil then
					return
				end
				scrollFrameUtilsModule.scrollByAnalogInput(var8, var5, p0)
			end)
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p1, _) --[[ line: 50 ]]
				-- upvalues: var5 (write)
				if p1.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
				if p1.UserInputState == Enum.UserInputState.Change then
					var5 = p1
					
					return
				elseif p1.UserInputState == Enum.UserInputState.End then
					var5 = nil
				end
			end)
			
			return function() --[[ line: 62 ]]
				-- upvalues: heartbeatConnection (ref), inputChangedConnection (ref)
				heartbeatConnection:Disconnect()
				inputChangedConnection:Disconnect()
			end
		end
	end, { value.enabled, value.containerRef })
end