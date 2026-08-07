local starterGuiService = game:GetService("StarterGui")
local setRespawnBehaviorModule = require(script.Parent.Parent.Actions.SetRespawnBehavior)

return function(value) --[[ line: 8 | named "registerSetCores" ]]
	-- upvalues: starterGuiService (ref), setRespawnBehaviorModule (ref)
	starterGuiService:RegisterSetCore("ResetButtonCallback", function(p0) --[[ line: 9 ]]
		-- upvalues: value (ref), setRespawnBehaviorModule (copy)
		local var2 = true
		local var3 = nil
		
		if typeof(p0) == "boolean" then
			var2 = p0
			var3 = nil
		elseif typeof(p0) == "Instance" and p0:IsA("BindableEvent") then
			var2 = true
			var3 = p0
		else
			error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0)
		end
		value:dispatch(setRespawnBehaviorModule(var2, var3))
	end)
end