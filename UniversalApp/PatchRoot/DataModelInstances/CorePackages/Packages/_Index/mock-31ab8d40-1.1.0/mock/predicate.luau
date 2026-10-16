local SymbolsModule = require(script.Parent.symbols)

return function(Callback) --[[ Line: 3 ]]
	-- upvalues: SymbolsModule (copy)
	assert(type(Callback) == "function", "Mock Error: Mock.predicate must be given a function")
	
	return (setmetatable({ [SymbolsModule.isPredicate] = true, predicate = Callback }, {
		__tostring = function(): string --[[ Line: 10 ]]
			return "<Predicate>"
		end
	}))
end