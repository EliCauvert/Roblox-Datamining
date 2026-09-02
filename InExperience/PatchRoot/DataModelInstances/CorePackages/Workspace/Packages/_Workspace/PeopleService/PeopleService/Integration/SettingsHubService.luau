local var1 = nil
local var2, var3 = require(script.Parent.Parent.Parent.Signals).createSignal(false)

return (function()
	-- upvalues: var1 (write), var2 (ref), var3 (ref)
	return {
		register = function(p1)
			-- upvalues: var1 (copy)
			var1 = p1
		end,
		hubRef = function()
			-- upvalues: var1 (copy)
			return if var1 then var1.HubRef else nil
		end,
		pageRef = function()
			-- upvalues: var1 (copy)
			return if var1 then var1.Page else nil
		end,
		showMenuButtonsContainer = var2,
		setShowMenuButtonsContainer = var3
	}
end)()