local _ = require(script:FindFirstAncestor("Markdown").Types)

local function assignIndex(p1, Index)
	-- upvalues: assignIndex (copy)
	p1.index = Index
	
	if p1.children then
		for i, child in p1.children do
			assignIndex(child, i)
		end
	end
end

return function(p2)
	-- upvalues: assignIndex (copy)
	p2.index = 1
	
	if p2.children then
		for i, child in p2.children do
			assignIndex(child, i)
		end
	end
	return p2
end