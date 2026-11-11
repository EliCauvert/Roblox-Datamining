local StarterGui = game:GetService("StarterGui")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/console" },
	clientRun = function()
		-- upvalues: StarterGui (copy)
		local Success, Result = pcall(function()
			-- upvalues: StarterGui (upval)
			return StarterGui:GetCore("DevConsoleVisible")
		end)
		
		if Success then
			pcall(function()
				-- upvalues: StarterGui (upval), Result (copy)
				StarterGui:SetCore("DevConsoleVisible", not Result)
			end)
		end
		return nil
	end
}