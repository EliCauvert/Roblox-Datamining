local Parent = script.Parent.Parent
local Element = require(Parent.Rhodium).Element
local FindFirstInstanceFunction = require(Parent.TestUtils).findFirstInstance

return function(p1, p2)
	-- upvalues: FindFirstInstanceFunction (copy), Element (copy)
	local FirstInstance = FindFirstInstanceFunction(p1, p2)
	
	return if FirstInstance then Element.new("game." .. FirstInstance:GetFullName()) else nil
end