local symbolsModule = require(script.Parent.symbols)

return function(p0)
	-- upvalues: symbolsModule (ref)
	assert(type(p0) == "function", "Mock Error: Mock.predicate must be given a function")
	
	return setmetatable({ [symbolsModule.isPredicate] = true, predicate = p0 }, {
		__tostring = function()
			return "<Predicate>"
		end
	})
end