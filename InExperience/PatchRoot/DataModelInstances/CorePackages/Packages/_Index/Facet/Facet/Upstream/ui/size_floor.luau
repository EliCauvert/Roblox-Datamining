local _ = require("../vendor/compose/core")
local self = setmetatable({}, { __mode = "k" })

return {
	of = function(Key, Callback)
		-- upvalues: self (copy)
		local SelfEntry = self[Key]
		
		if SelfEntry == nil then
			SelfEntry = { x = Callback(0), y = Callback(0) }
			self[Key] = SelfEntry
		end
		return SelfEntry
	end,
	peek = function(p1)
		-- upvalues: self (copy)
		return self[p1]
	end
}