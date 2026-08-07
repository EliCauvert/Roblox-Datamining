local symbolModule = require(script.Symbol)
local tbl = setmetatable({}, {
	__call = function(_, p0) --[[ line: 29 ]]
		-- upvalues: symbolModule (ref)
		return symbolModule.new(p0)
	end
})
tbl.for_ = require(script["Registry.global"]).getOrInit

return tbl