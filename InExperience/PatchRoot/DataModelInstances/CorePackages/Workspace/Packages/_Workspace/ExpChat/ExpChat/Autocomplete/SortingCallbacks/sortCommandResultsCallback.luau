local List = require(script:FindFirstAncestor("ExpChat").Parent.llama).List

return function(p1) --[[ Line: 5 ]]
	-- upvalues: List (copy)
	return List.sort(p1)
end