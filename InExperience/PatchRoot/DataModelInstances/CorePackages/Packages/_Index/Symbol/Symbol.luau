local SymbolModule = require(script.Symbol)
local self = setmetatable({}, {
	__call = function(_, p1) --[[ Line: 29 ]]
		-- upvalues: SymbolModule (copy)
		return SymbolModule.new(p1)
	end
})
self.for_ = require(script["Registry.global"]).getOrInit

return self