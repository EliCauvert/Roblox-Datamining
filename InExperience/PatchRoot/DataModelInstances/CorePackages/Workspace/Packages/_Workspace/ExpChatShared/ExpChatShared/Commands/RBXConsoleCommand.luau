local starterGuiService = game:GetService("StarterGui")
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/console" },
	clientRun = function() --[[ line: 7 ]]
		-- upvalues: starterGuiService (ref)
		local ok, status = pcall(function() --[[ line: 8 ]]
			-- upvalues: starterGuiService (copy)
			return starterGuiService:GetCore("DevConsoleVisible")
		end)
		
		if ok then
			pcall(function() --[[ line: 12 ]]
				-- upvalues: starterGuiService (copy), status (ref)
				starterGuiService:SetCore("DevConsoleVisible", not status)
			end)
		end
		return nil
	end
}