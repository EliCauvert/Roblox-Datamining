local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local Flag = false
local RenderSteppedConnection = nil

local function onFirstPersonToggleInput(p1, UserInputState, _) --[[ Line: 16 ]]
	-- upvalues: Flag (ref)
	if p1 == "FirstPersonToggleAction" and UserInputState == Enum.UserInputState.Begin then
		Flag = true
	end
	return Enum.ContextActionResult.Pass
end

function startFirstPersonToggleListener() --[[ Line: 26 ]]
	-- upvalues: ContextActionService (copy), onFirstPersonToggleInput (copy)
	ContextActionService:BindCoreAction("FirstPersonToggleAction", onFirstPersonToggleInput, false, Enum.KeyCode.ButtonR3)
end

function stopFirstPersonToggleListener() --[[ Line: 35 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("FirstPersonToggleAction")
end

return {
	Name = "FirstPersonToggleEvent",
	StartEvent = function(Callback) --[[ Line: 39 ]]
		-- upvalues: Flag (ref), RenderSteppedConnection (ref), RunService (copy)
		startFirstPersonToggleListener()
		RenderSteppedConnection = RunService.RenderStepped:Connect(function(_) --[[ Line: 44 | Named "onRenderStepped" ]]
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
	StopEvent = function() --[[ Line: 64 ]]
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection then
			RenderSteppedConnection:Disconnect()
		end
		stopFirstPersonToggleListener()
	end
}