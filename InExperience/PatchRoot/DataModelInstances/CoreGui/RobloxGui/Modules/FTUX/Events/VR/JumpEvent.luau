local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local t = { Name = "FirstPersonToggleEvent" }
local var1 = false
local var2 = nil

local function onJumpInput(p1, p2, _)
	-- upvalues: var1 (write)
	if p1 == "JumpAction" and p2 == Enum.UserInputState.Begin then
		var1 = true
	end
	return Enum.ContextActionResult.Pass
end

function startJumpEventListener()
	-- upvalues: contextActionService (ref), onJumpInput (ref)
	contextActionService:BindCoreAction("JumpAction", onJumpInput, false, Enum.KeyCode.Space)
end

function stopJumpEventListener()
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("JumpAction")
end

function t.StartEvent(p1)
	-- upvalues: var1 (write), var2 (write), runService (ref)
	startJumpEventListener()
	var2 = runService.RenderStepped:Connect(function(_)
		-- upvalues: var1 (copy), p1 (ref), var2 (copy)
		if var1 then
			stopJumpEventListener()
			p1()
			
			if var2 then
				var2:Disconnect()
				var2 = nil
			end
		end
	end)
end

function t.StopEvent()
	-- upvalues: var2 (write)
	if var2 then
		var2:Disconnect()
		var2 = nil
	end
	stopJumpEventListener()
end

return t