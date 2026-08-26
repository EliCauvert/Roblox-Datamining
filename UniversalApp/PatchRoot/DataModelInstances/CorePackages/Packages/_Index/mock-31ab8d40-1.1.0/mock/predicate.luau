local symbolsModule = require(script.Parent.symbols)

return function(p1)
	-- upvalues: symbolsModule (ref)
	assert(type(p1) == "function", "Mock Error: Mock.predicate must be given a function")
	
	return setmetatable({ [symbolsModule.isPredicate] = true, predicate = p1 }, {
		__tostring = function()
			return "<Predicate>"
		end
	})
end