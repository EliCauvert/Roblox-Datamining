local _ = require(script:FindFirstAncestor("Markdown").Types)

local function assignIndex(value, p1)
	-- upvalues: assignIndex (ref)
	value.index = p1
	
	if value.children then
		for i, v in value.children do
			assignIndex(v, i)
		end
	end
end

return function(p2)
	-- upvalues: assignIndex (ref)
	p2.index = 1
	
	if p2.children then
		for i, v in p2.children do
			assignIndex(v, i)
		end
	end
	return p2
end