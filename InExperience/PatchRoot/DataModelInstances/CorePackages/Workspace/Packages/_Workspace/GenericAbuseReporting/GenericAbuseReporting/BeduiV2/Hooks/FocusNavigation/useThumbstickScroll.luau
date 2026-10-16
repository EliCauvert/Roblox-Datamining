local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local ScrollFrameUtilsModule = require(script.Parent.scrollFrameUtils)

return function(p1) --[[ Line: 22 | Named "useThumbstickScroll" ]]
	-- upvalues: ReactModule (copy), RunService (copy), GuiService (copy), ScrollFrameUtilsModule (copy), UserInputService (copy)
	ReactModule.useEffect(function() --[[ Line: 23 ]]
		-- upvalues: p1 (copy), RunService (upval), GuiService (upval), ScrollFrameUtilsModule (upval), UserInputService (upval)
		if not p1.enabled then return end
		local Input = nil
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime) --[[ Line: 30 ]]
			-- upvalues: Input (ref), p1 (upval), GuiService (upval), ScrollFrameUtilsModule (upval)
			if Input == nil or Input.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
			local Current = p1.containerRef.current
			
			if Current == nil then return end
			local ResolveScrollTargetResult = ScrollFrameUtilsModule.resolveScrollTarget(GuiService.SelectedCoreObject, Current)
			
			if ResolveScrollTargetResult ~= nil then
				ScrollFrameUtilsModule.scrollByAnalogInput(ResolveScrollTargetResult, Input, DeltaTime)
				
				return
			end
		end)
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input1, _) --[[ Line: 50 ]]
			-- upvalues: Input (ref)
			if Input1.KeyCode ~= Enum.KeyCode.Thumbstick2 then return end
			if Input1.UserInputState == Enum.UserInputState.Change then
				Input = Input1
				
				return
			end
			if Input1.UserInputState == Enum.UserInputState.End then
				Input = nil
			end
		end)
		
		return function() --[[ Line: 62 ]]
			-- upvalues: HeartbeatConnection (copy), InputChangedConnection (copy)
			HeartbeatConnection:Disconnect()
			InputChangedConnection:Disconnect()
		end
	end, { p1.enabled, p1.containerRef })
end