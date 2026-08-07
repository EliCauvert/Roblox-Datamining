local _ = require(script.Parent.Parent.util.Types)

local function destroyHelper(p0) --[[ line: 6 ]]
	for i, v in p0 do
		for i_1, v_1 in v do
			if v_1.created and v_1.instance then
				v_1.instance:Destroy()
			end
		end
	end
	_ = {}
end

return function(p1, p2) --[[ line: 18 ]]
	-- upvalues: destroyHelper (ref)
	destroyHelper(p1)
	destroyHelper(p2)
end