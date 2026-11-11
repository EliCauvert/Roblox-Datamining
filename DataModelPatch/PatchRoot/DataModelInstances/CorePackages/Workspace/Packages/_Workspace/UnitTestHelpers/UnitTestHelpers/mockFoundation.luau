local Parent = script.Parent.Parent
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local RoactModule = require(Parent.Roact)

return function(Element)
	-- upvalues: RoactModule (copy), FoundationProvider (copy)
	return RoactModule.createElement(FoundationProvider, nil, { Element = Element })
end