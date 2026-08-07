local element = require(script:FindFirstAncestor("Packages").Dev.Rhodium).Element
local findFirstInstanceModule = require(script.Parent.findFirstInstance)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: findFirstInstanceModule (ref), element (ref)
	local var1 = findFirstInstanceModule(p0, p1)
	
	return if var1 then element.new("game." .. var1:GetFullName()) else nil
end