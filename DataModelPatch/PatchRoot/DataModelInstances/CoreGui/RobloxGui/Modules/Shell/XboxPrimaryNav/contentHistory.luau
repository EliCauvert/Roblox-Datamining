local GetFFlagXboxFixPrimaryNavABEventsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Flags.GetFFlagXboxFixPrimaryNavABEvents)

return ((function()
	-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (copy)
	local LastSelectedContent = nil
	
	return {
		setLastSelectedContent = function(_, Value)
			-- upvalues: LastSelectedContent (ref)
			LastSelectedContent = Value
		end,
		getLastContentName = function(_)
			-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (upval), LastSelectedContent (ref)
			local Success, Result = pcall(function()
				-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (upval), LastSelectedContent (upval)
				return if GetFFlagXboxFixPrimaryNavABEventsModule() then LastSelectedContent:GetId() else LastSelectedContent:GetName()
			end)
			
			if not Success then return end
			return Result
		end
	}
end)())