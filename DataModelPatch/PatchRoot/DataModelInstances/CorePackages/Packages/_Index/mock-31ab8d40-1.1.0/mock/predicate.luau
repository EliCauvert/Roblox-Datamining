local SymbolsModule = require(script.Parent.symbols)

return function(Callback)
	-- upvalues: SymbolsModule (copy)
	assert(type(Callback) == "function", "Mock Error: Mock.predicate must be given a function")
	
	return (setmetatable({ [SymbolsModule.isPredicate] = true, predicate = Callback }, {
		__tostring = function(): string
			return "<Predicate>"
		end
	}))
end