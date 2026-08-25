local runService = game:GetService("RunService")
local t = {}
local t_1 = {
	Connect = function(_, p0)
		-- upvalues: t (ref)
		t[p0] = true
		
		return {
			Disconnect = function()
				-- upvalues: t (copy), p0 (ref)
				t[p0] = nil
			end
		}
	end,
	Fire = function(_, p1)
		-- upvalues: t (ref)
		for i, v in t do
			i(p1)
		end
	end
}

return {
	Connect = function(_, p2)
		-- upvalues: t_1 (ref), runService (ref)
		return if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then t_1:Connect(p2) else runService.RenderStepped:Connect(p2)
	end,
	Fire = function(_, p3)
		-- upvalues: t_1 (ref)
		if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
			t_1:Fire(p3 or 0.016666666667)
			
			return
		end
		error("Cannot manually fire real animation step signal")
	end
}