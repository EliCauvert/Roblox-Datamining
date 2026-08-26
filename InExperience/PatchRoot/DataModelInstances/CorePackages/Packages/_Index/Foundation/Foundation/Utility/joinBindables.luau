local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p1, p2)
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = false
	
	for i, v in p1 do
		if reactIsModule.isBinding(v) then
			t[i] = v
			var1 = true
		else
			t_1[i] = v
		end
	end
	return if var1 then reactModule.joinBindings(t):map(function(p3)
		-- upvalues: t_1 (ref), p2 (ref)
		local cloned = table.clone(t_1)
		
		for i, v in p3 do
			cloned[i] = v
		end
		return p2(cloned)
	end) else p2(t_1)
end