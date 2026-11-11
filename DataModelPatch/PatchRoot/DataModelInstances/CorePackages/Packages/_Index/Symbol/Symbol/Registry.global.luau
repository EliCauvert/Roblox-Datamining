local SymbolModule = require(script.Parent.Symbol)
local NewResults = {}

return {
	getOrInit = function(Key)
		-- upvalues: NewResults (ref), SymbolModule (copy)
		if NewResults[Key] == nil then
			NewResults[Key] = SymbolModule.new(Key)
		end
		return NewResults[Key]
	end,
	__clear = function()
		-- upvalues: NewResults (ref)
		NewResults = {}
	end
}