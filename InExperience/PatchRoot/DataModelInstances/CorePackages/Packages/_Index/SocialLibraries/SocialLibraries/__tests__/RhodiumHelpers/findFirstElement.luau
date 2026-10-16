local Element = require(script:FindFirstAncestor("Packages").Dev.Rhodium).Element
local FindFirstInstanceModule = require(script.Parent.findFirstInstance)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: FindFirstInstanceModule (copy), Element (copy)
	local FirstInstanceModule = FindFirstInstanceModule(p1, p2)
	
	return if FirstInstanceModule then Element.new("game." .. FirstInstanceModule:GetFullName()) else nil
end