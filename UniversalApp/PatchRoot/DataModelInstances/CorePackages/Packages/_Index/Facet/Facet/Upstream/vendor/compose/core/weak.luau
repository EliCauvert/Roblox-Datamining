local Frozen = table.freeze({ __mode = "ks" })
local Frozen1 = table.freeze({ __mode = "vs" })
local Frozen2 = table.freeze({ __mode = "kvs" })

return {
	keys = function(p1)
		-- upvalues: Frozen (copy)
		setmetatable(p1, Frozen)
	end,
	values = function(p1)
		-- upvalues: Frozen1 (copy)
		setmetatable(p1, Frozen1)
	end,
	entries = function(p1)
		-- upvalues: Frozen2 (copy)
		setmetatable(p1, Frozen2)
	end
}