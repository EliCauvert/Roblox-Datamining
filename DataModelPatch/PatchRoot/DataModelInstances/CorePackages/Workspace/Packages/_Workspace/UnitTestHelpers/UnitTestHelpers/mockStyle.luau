local CreateStyleProviderModule = require(script.Parent.createStyleProvider)

return function(TestElement)
	-- upvalues: CreateStyleProviderModule (copy)
	return CreateStyleProviderModule({ TestElement = TestElement })
end