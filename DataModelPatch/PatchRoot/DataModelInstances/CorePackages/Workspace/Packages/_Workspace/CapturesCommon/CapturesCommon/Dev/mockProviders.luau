local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local MockFoundationFunction = require(Parent.Dev.UnitTestHelpers).mockFoundation

return function(p1, _)
	-- upvalues: MockFoundationFunction (copy), ReactModule (copy)
	return MockFoundationFunction(ReactModule.createElement(ReactModule.Fragment, nil, p1))
end