local var1 = require(script:FindFirstAncestor("SquadsCore").Parent.RegExp)("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")

return function(p1)
	-- upvalues: var1 (ref)
	return p1 and p1 ~= "" and var1:exec(p1)
end