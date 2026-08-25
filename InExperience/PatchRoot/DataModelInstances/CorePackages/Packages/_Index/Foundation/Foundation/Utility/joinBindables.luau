local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0, p1)
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local t_1 = {}
	local var5 = false
	
	for i, v in p0 do
		if reactIsModule.isBinding(v) then
			t[i] = v
			var5 = true
		else
			t_1[i] = v
		end
	end
	return if var5 then reactModule.joinBindings(t):map(function(p2)
		-- upvalues: t_1 (ref), p1 (ref)
		local cloned = table.clone(t_1)
		
		for i, v in p2 do
			cloned[i] = v
		end
		return p1(cloned)
	end) else p1(t_1)
end