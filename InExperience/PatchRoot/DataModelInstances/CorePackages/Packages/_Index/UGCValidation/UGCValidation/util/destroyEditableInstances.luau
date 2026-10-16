local _ = require(script.Parent.Parent.util.Types)

local function destroyHelper(List) --[[ Line: 6 ]]
	for _, value in List do
		for _, value1 in value do
			if value1.created and value1.instance then
				value1.instance:Destroy()
			end
		end
	end
end

return function(p1, p2) --[[ Line: 18 ]]
	-- upvalues: destroyHelper (copy)
	destroyHelper(p1)
	destroyHelper(p2)
end