local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local t = { Name = "FirstPersonToggleEvent" }
local var3 = false
local var4 = nil

local function onFirstPersonToggleInput(p0, p1, _) --[[ line: 16 ]]
	-- upvalues: var3 (write)
	if p0 == "FirstPersonToggleAction" and p1 == Enum.UserInputState.Begin then
		var3 = true
	end
	return Enum.ContextActionResult.Pass
end

function startFirstPersonToggleListener() --[[ line: 26 ]]
	-- upvalues: contextActionService (ref), onFirstPersonToggleInput (ref)
	contextActionService:BindCoreAction("FirstPersonToggleAction", onFirstPersonToggleInput, false, Enum.KeyCode.ButtonR3)
end

function stopFirstPersonToggleListener() --[[ line: 35 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindAction("FirstPersonToggleAction")
end

function t.StartEvent(p2) --[[ line: 39 ]]
	-- upvalues: var3 (write), var4 (write), runService (ref)
	startFirstPersonToggleListener()
	var4 = runService.RenderStepped:Connect(function(_) --[[ line: 44 | named "onRenderStepped" ]]
		-- upvalues: var3 (copy), p2 (ref), var4 (copy)
		if var3 then
			stopFirstPersonToggleListener()
			task.wait(0.2)
			p2()
			
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
		end
	end)
end

function t.StopEvent() --[[ line: 64 ]]
	-- upvalues: var4 (write)
	if var4 then
		var4:Disconnect()
	end
	stopFirstPersonToggleListener()
end

return t