local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p1)
	if typeof(p1) == "number" then
		return `col-{p1}`
	end
	local t = {}
	
	for i, v in p1 do
		if typeof(v) == "number" then
			table.insert(t, `{i}-col-{v}`)
		end
	end
	return table.concat(t, " ")
end