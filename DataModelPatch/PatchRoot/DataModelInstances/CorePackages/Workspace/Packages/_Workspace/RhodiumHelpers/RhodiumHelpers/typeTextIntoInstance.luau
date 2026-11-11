local Element = require(script.Parent.Parent.Rhodium).Element
local TypeTextIntoElementModule = require(script.Parent.typeTextIntoElement)

return function(p1, p2)
	-- upvalues: Element (copy), TypeTextIntoElementModule (copy)
	TypeTextIntoElementModule(Element.new(p1), p2)
end