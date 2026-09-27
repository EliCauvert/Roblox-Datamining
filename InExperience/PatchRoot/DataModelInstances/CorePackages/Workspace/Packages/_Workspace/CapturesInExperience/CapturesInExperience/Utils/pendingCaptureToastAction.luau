local _ = require(script.Parent.Parent.Types)
local var1 = nil

return {
	set = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	consume = function()
		-- upvalues: var1 (write)
		var1 = nil
		
		return var1
	end
}