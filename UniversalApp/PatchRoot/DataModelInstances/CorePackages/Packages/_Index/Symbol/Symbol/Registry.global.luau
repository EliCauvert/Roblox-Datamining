local symbolModule = require(script.Parent.Symbol)
local t = {}

return {
	getOrInit = function(p0) --[[ line: 20 ]]
		-- upvalues: t (write), symbolModule (ref)
		if t[p0] == nil then
			t[p0] = symbolModule.new(p0)
		end
		return t[p0]
	end,
	__clear = function() --[[ line: 28 ]]
		-- upvalues: t (write)
		t = {}
	end
}