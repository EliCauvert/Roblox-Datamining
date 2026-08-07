-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)

return function(p0) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	assert(type(p0) == "function", "Mock Error: Mock.predicate must be given a function")
	
	return setmetatable({ [symbolsModule.isPredicate] = true, predicate = p0 }, {
		__tostring = function() --[[ line: 10 ]]
			return "<Predicate>"
		end
	})
end