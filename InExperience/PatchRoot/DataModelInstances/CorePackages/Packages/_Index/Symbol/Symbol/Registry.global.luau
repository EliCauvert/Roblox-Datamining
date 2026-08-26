local symbolModule = require(script.Parent.Symbol)
local t = {}

return {
	getOrInit = function(p1)
		-- upvalues: t (write), symbolModule (ref)
		if t[p1] == nil then
			t[p1] = symbolModule.new(p1)
		end
		return t[p1]
	end,
	__clear = function()
		-- upvalues: t (write)
		t = {}
	end
}