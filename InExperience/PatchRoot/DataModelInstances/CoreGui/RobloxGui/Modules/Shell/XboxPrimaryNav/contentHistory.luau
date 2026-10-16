local GetFFlagXboxFixPrimaryNavABEventsModule = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Flags.GetFFlagXboxFixPrimaryNavABEvents)

return ((function() --[[ Line: 12 | Named "contentHistory" ]]
	-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (copy)
	local LastSelectedContent = nil
	
	return {
		setLastSelectedContent = function(_, Value) --[[ Line: 17 ]]
			-- upvalues: LastSelectedContent (ref)
			LastSelectedContent = Value
		end,
		getLastContentName = function(_) --[[ Line: 21 ]]
			-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (upval), LastSelectedContent (ref)
			local Success, Result = pcall(function() --[[ Line: 22 ]]
				-- upvalues: GetFFlagXboxFixPrimaryNavABEventsModule (upval), LastSelectedContent (upval)
				return if GetFFlagXboxFixPrimaryNavABEventsModule() then LastSelectedContent:GetId() else LastSelectedContent:GetName()
			end)
			
			if not Success then return end
			return Result
		end
	}
end)())