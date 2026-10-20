local v1 = nil
local Signal, Signal2 = require(script.Parent.Parent.Parent.Signals).createSignal(false)

return ((function()
	-- upvalues: v1 (ref), Signal (copy), Signal2 (copy)
	return {
		register = function(p1)
			-- upvalues: v1 (upval)
			v1 = p1
		end,
		hubRef = function()
			-- upvalues: v1 (upval)
			return v1 and v1.HubRef or nil
		end,
		pageRef = function()
			-- upvalues: v1 (upval)
			return v1 and v1.Page or nil
		end,
		showMenuButtonsContainer = Signal,
		setShowMenuButtonsContainer = Signal2
	}
end)())