local starterGuiService = game:GetService("StarterGui")
local createSignal = require(script:FindFirstAncestor("InExperienceTopBar").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref), starterGuiService (ref)
	local var1, var2 = createSignal(true)
	starterGuiService:RegisterSetCore("TopbarEnabled", function(p0)
		-- upvalues: var2 (ref)
		if type(p0) == "boolean" then
			var2(p0)
			
			return
		end
		error("SetCore TopbarEnabled argument must be a boolean", 2)
	end)
	starterGuiService:RegisterGetCore("TopbarEnabled", function()
		-- upvalues: var1 (ref)
		return var1(false)
	end)
	
	return { getTopBarCoreGuiEnabled = var1 }
end