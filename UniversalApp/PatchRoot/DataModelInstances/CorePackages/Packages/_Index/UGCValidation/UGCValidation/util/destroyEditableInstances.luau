local _ = require(script.Parent.Parent.util.Types)

local function destroyHelper(p1)
	for i, v in p1 do
		for i_1, v_1 in v do
			if v_1.created and v_1.instance then
				v_1.instance:Destroy()
			end
		end
	end
	_ = {}
end

return function(p2, p3)
	-- upvalues: destroyHelper (ref)
	destroyHelper(p2)
	destroyHelper(p3)
end