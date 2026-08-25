local var0 = require(script:FindFirstAncestor("SquadsCore").Parent.RegExp)("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")

return function(p0)
	-- upvalues: var0 (ref)
	return p0 and p0 ~= "" and var0:exec(p0)
end