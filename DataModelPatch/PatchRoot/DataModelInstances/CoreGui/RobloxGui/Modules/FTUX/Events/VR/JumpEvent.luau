local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local _ = require(script.Parent.Parent.EventType)
local Flag = false
local RenderSteppedConnection = nil

local function onJumpInput(p1, UserInputState, _)
	-- upvalues: Flag (ref)
	if p1 == "JumpAction" and UserInputState == Enum.UserInputState.Begin then
		Flag = true
	end
	return Enum.ContextActionResult.Pass
end

function startJumpEventListener()
	-- upvalues: ContextActionService (copy), onJumpInput (copy)
	ContextActionService:BindCoreAction("JumpAction", onJumpInput, false, Enum.KeyCode.Space)
end

function stopJumpEventListener()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindAction("JumpAction")
end

return {
	Name = "FirstPersonToggleEvent",
	StartEvent = function(Callback)
		-- upvalues: Flag (ref), RenderSteppedConnection (ref), RunService (copy)
		startJumpEventListener()
		RenderSteppedConnection = RunService.RenderStepped:Connect(function(_)
			-- upvalues: Flag (upval), Callback (copy), RenderSteppedConnection (upval)
			if Flag then
				stopJumpEventListener()
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
			RenderSteppedConnection = nil
		end
		stopJumpEventListener()
	end
}