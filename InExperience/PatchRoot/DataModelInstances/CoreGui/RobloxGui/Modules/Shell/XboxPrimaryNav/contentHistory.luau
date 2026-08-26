local getFFlagXboxFixPrimaryNavABEventsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Flags.GetFFlagXboxFixPrimaryNavABEvents)

return (function()
	-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (ref)
	local t = {}
	local var1 = nil
	
	function t.setLastSelectedContent(_, p1)
		-- upvalues: var1 (write)
		var1 = p1
	end
	
	function t.getLastContentName(_)
		-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (copy), var1 (write)
		local ok, status = pcall(function()
			-- upvalues: getFFlagXboxFixPrimaryNavABEventsModule (copy), var1 (copy)
			return if getFFlagXboxFixPrimaryNavABEventsModule() then var1:GetId() else var1:GetName()
		end)
		
		if ok then
			return status
		end
	end
	
	return t
end)()