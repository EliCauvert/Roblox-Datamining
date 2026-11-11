local StarterGui = game:GetService("StarterGui")
local SetRespawnBehaviorModule = require(script.Parent.Parent.Actions.SetRespawnBehavior)

return function(p1)
	-- upvalues: StarterGui (copy), SetRespawnBehaviorModule (copy)
	StarterGui:RegisterSetCore("ResetButtonCallback", function(BindableEvent)
		-- upvalues: p1 (copy), SetRespawnBehaviorModule (upval)
		local Flag = true
		local v1 = nil
		
		if typeof(BindableEvent) == "boolean" then
			Flag = BindableEvent
			v1 = nil
		elseif typeof(BindableEvent) == "Instance" and BindableEvent:IsA("BindableEvent") then
			Flag = true
			v1 = BindableEvent
		else
			error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0)
		end
		p1:dispatch(SetRespawnBehaviorModule(Flag, v1))
	end)
end