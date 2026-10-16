local v1 = nil
local Signal, Signal2 = require(script.Parent.Parent.Parent.Signals).createSignal(false)

return ((function() --[[ Line: 11 | Named "createSettingsHubService" ]]
	-- upvalues: v1 (ref), Signal (copy), Signal2 (copy)
	return {
		register = function(p1) --[[ Line: 14 ]]
			-- upvalues: v1 (upval)
			v1 = p1
		end,
		hubRef = function() --[[ Line: 19 ]]
			-- upvalues: v1 (upval)
			return v1 and v1.HubRef or nil
		end,
		pageRef = function() --[[ Line: 22 ]]
			-- upvalues: v1 (upval)
			return v1 and v1.Page or nil
		end,
		showMenuButtonsContainer = Signal,
		setShowMenuButtonsContainer = Signal2
	}
end)())