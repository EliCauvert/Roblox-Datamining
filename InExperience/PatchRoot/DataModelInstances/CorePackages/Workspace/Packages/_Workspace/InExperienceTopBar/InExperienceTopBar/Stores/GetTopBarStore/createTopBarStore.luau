local StarterGui = game:GetService("StarterGui")
local CreateSignalFunction = require(script:FindFirstAncestor("InExperienceTopBar").Parent.Signals).createSignal

return function() --[[ Line: 12 ]]
	-- upvalues: CreateSignalFunction (copy), StarterGui (copy)
	local Signal, Signal2 = CreateSignalFunction(true)
	StarterGui:RegisterSetCore("TopbarEnabled", function(p1: boolean) --[[ Line: 15 ]]
		-- upvalues: Signal2 (copy)
		if type(p1) == "boolean" then
			Signal2(p1)
			
			return
		else
			error("SetCore TopbarEnabled argument must be a boolean", 2)
		end
	end)
	StarterGui:RegisterGetCore("TopbarEnabled", function() --[[ Line: 23 ]]
		-- upvalues: Signal (copy)
		return Signal(false)
	end)
	
	return { getTopBarCoreGuiEnabled = Signal }
end