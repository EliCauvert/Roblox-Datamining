local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local Flag = false
local RenderSteppedConnection = nil

local function onFirstPersonToggleInput(p1, UserInputState, _)
	-- upvalues: Flag (ref)
	if p1 == "FirstPersonToggleAction" and UserInputState == Enum.UserInputState.Begin then
		Flag = true
	end
	return Enum.ContextActionResult.Pass
end

function startFirstPersonToggleListener()
	-- upvalues: ContextActionService (copy), onFirstPersonToggleInput (copy)
	ContextActionService:BindCoreAction("FirstPersonToggleAction", onFirstPersonToggleInput, false, Enum.KeyCode.ButtonR3)
end

function stopFirstPersonToggleListener()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("FirstPersonToggleAction")
end

return {
	Name = "FirstPersonToggleEvent",
	StartEvent = function(Callback)
		-- upvalues: Flag (ref), RenderSteppedConnection (ref), RunService (copy)
		startFirstPersonToggleListener()
		RenderSteppedConnection = RunService.RenderStepped:Connect(function(_)
			-- upvalues: Flag (upval), Callback (copy), RenderSteppedConnection (upval)
			if Flag then
				stopFirstPersonToggleListener()
				task.wait(0.2)
				Callback()
				
				if RenderSteppedConnection then
					RenderSteppedConnection:Disconnect()
					RenderSteppedConnection = nil
				end
			end
		end)
	end,
	StopEvent = function()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
		end
		stopFirstPersonToggleListener()
	end
}