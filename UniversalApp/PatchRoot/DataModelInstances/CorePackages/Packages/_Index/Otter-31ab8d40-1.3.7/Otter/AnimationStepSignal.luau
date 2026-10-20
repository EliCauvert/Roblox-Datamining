local RunService = game:GetService("RunService")
local t = {}
local Signal = {
	Connect = function(_, Key)
		-- upvalues: t (copy)
		t[Key] = true
		
		return {
			Disconnect = function()
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end
		}
	end,
	Fire = function(_, p1)
		-- upvalues: t (copy)
		for i, _ in t do
			i(p1)
		end
	end
}

return {
	Connect = function(_, Callback)
		-- upvalues: Signal (copy), RunService (copy)
		return if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then Signal:Connect(Callback) else RunService.RenderStepped:Connect(Callback)
	end,
	Fire = function(_, p2)
		-- upvalues: Signal (copy)
		if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
			Signal:Fire(p2 or 0.016666666666666666)
			
			return
		else
			error("Cannot manually fire real animation step signal")
		end
	end
}