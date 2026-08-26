local list = require(script:FindFirstAncestor("ExpChat").Parent.llama).List

return function(p1)
	-- upvalues: list (ref)
	return list.sort(p1)
end