local list = require(script:FindFirstAncestor("ExpChat").Parent.llama).List

return function(p0) --[[ line: 5 ]]
	-- upvalues: list (ref)
	return list.sort(p0)
end