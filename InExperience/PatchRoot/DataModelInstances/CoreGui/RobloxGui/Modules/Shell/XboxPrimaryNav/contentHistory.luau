local getFFlagXboxFixPrimaryNavABEventsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Flags.GetFFlagXboxFixPrimaryNavABEvents)

return (function()
	-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (ref)
	local t = {}
	local var2 = nil
	
	function t.setLastSelectedContent(_, p0)
		-- upvalues: var2 (write)
		var2 = p0
	end
	
	function t.getLastContentName(_)
		-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (copy), var2 (write)
		local ok, status = pcall(function()
			-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (copy), var2 (copy)
			return if getFFlagXboxFixPrimaryNavABEventsModule() then var2:GetId() else var2:GetName()
		end)
		
		if ok then
			return status
		end
	end
	
	return t
end)()