local UnitTestHelpersModule = require(script.Parent.Parent.Parent.Dev.UnitTestHelpers)

return function(p1, p2)
	-- upvalues: UnitTestHelpersModule (copy)
	return UnitTestHelpersModule.mockProviders(p1, { mockFoundation = p2 and not p2.mockFoundation })
end