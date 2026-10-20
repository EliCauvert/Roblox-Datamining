local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(List): string
	if typeof(List) == "number" then
		return `col-{List}`
	end
	local List1 = {}
	
	for i, value in List do
		if typeof(value) == "number" then
			table.insert(List1, `{i}-col-{value}`)
		end
	end
	return table.concat(List1, " ")
end