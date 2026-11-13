local _ = require("../vendor/compose/core")
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })

return {
	bind = function(Key, p1)
		-- upvalues: self (copy)
		self[Key] = p1
	end,
	ready = function(p1)
		-- upvalues: self (copy)
		return self[p1]
	end,
	prepare = function(Key, p1)
		-- upvalues: self1 (copy)
		self1[Key] = p1
	end,
	prepared = function(p1)
		-- upvalues: self1 (copy)
		return self1[p1]
	end
}