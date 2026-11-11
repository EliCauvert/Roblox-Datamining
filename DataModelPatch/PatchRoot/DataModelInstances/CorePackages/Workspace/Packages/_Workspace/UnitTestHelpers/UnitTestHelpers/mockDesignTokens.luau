local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local StyleModule = require(Parent.Style)

return function(Element, p1)
	-- upvalues: RoactModule (copy), StyleModule (copy)
	return RoactModule.createElement(StyleModule.DesignTokenProvider, { tokenMappers = p1 or {} }, { Element = Element })
end