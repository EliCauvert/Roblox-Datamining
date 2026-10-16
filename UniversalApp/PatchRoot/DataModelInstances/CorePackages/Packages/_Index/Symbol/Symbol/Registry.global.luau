local SymbolModule = require(script.Parent.Symbol)
local NewResults = {}

return {
	getOrInit = function(Key) --[[ Line: 20 ]]
		-- upvalues: NewResults (ref), SymbolModule (copy)
		if NewResults[Key] == nil then
			NewResults[Key] = SymbolModule.new(Key)
		end
		return NewResults[Key]
	end,
	__clear = function() --[[ Line: 28 ]]
		-- upvalues: NewResults (ref)
		NewResults = {}
	end
}