local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p0) --[[ line: 6 | named "getGridSizeTag" ]]
	if typeof(p0) == "number" then
		return `col-{p0}`
	end
	local t = {}
	
	for i, v in p0 do
		if typeof(v) == "number" then
			table.insert(t, `{i}-col-{v}`)
		end
	end
	return table.concat(t, " ")
end