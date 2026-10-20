local _ = require(script.Parent.Parent.Types)
local v1 = nil

return {
	set = function(p1)
		-- upvalues: v1 (ref)
		v1 = p1
	end,
	consume = function()
		-- upvalues: v1 (ref)
		local v2 = v1
		v1 = nil
		
		return v2
	end
}