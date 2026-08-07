local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local t = { Name = "FirstPersonToggleEvent" }
local var3 = false
local var4 = nil

local function onJumpInput(p0, p1, _) --[[ line: 16 ]]
	-- upvalues: var3 (write)
	if p0 == "JumpAction" and p1 == Enum.UserInputState.Begin then
		var3 = true
	end
	return Enum.ContextActionResult.Pass
end

function startJumpEventListener() --[[ line: 26 ]]
	-- upvalues: contextActionService (ref), onJumpInput (ref)
	contextActionService:BindCoreAction("JumpAction", onJumpInput, false, Enum.KeyCode.Space)
end

function stopJumpEventListener() --[[ line: 30 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("JumpAction")
end

function t.StartEvent(p2) --[[ line: 34 ]]
	-- upvalues: var3 (write), var4 (write), runService (ref)
	startJumpEventListener()
	var4 = runService.RenderStepped:Connect(function(_) --[[ line: 39 | named "onRenderStepped" ]]
		-- upvalues: var3 (copy), p2 (ref), var4 (copy)
		if var3 then
			stopJumpEventListener()
			p2()
			
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
		end
	end)
end

function t.StopEvent() --[[ line: 58 ]]
	-- upvalues: var4 (write)
	if var4 then
		var4:Disconnect()
		var4 = nil
	end
	stopJumpEventListener()
end

return t