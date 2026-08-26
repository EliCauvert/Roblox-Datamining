local element = require(script:FindFirstAncestor("Packages").Dev.Rhodium).Element
local findFirstInstanceModule = require(script.Parent.findFirstInstance)

return function(p1, p2)
	-- upvalues: findFirstInstanceModule (ref), element (ref)
	local var1 = findFirstInstanceModule(p1, p2)
	
	return if var1 then element.new("game." .. var1:GetFullName()) else nil
end