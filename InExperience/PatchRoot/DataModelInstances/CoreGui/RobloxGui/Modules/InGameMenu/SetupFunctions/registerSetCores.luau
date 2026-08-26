local starterGuiService = game:GetService("StarterGui")
local setRespawnBehaviorModule = require(script.Parent.Parent.Actions.SetRespawnBehavior)

return function(value)
	-- upvalues: starterGuiService (ref), setRespawnBehaviorModule (ref)
	starterGuiService:RegisterSetCore("ResetButtonCallback", function(p1)
		-- upvalues: value (ref), setRespawnBehaviorModule (copy)
		local var1 = true
		local var2 = nil
		
		if typeof(p1) == "boolean" then
			var1 = p1
			var2 = nil
		elseif typeof(p1) == "Instance" and p1:IsA("BindableEvent") then
			var1 = true
			var2 = p1
		else
			error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0)
		end
		value:dispatch(setRespawnBehaviorModule(var1, var2))
	end)
end