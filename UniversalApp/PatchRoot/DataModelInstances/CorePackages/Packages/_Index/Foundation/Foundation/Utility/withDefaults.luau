local parent = script:FindFirstAncestor("Foundation").Parent
local dashModule = require(parent.Dash)
local reactIsModule = require(parent.ReactIs)

local function _(p1)
	-- upvalues: reactIsModule (ref)
	return type(p1) == "table" and not reactIsModule.isBinding(p1)
end

local function deepJoin(p1, p2)
	-- upvalues: reactIsModule (ref), deepJoin (ref)
	local cloned = table.clone(p1)
	
	for i, v in p2 do
		if type(v) == "table" and not reactIsModule.isBinding(v) then
			local var1 = cloned[i]
			
			if type(var1) == "table" and not reactIsModule.isBinding(var1) then
				cloned[i] = deepJoin(cloned[i], v)
			else
				cloned[i] = v
			end
		end
	end
	return cloned
end

return function(p3, p4)
	-- upvalues: deepJoin (ref), dashModule (ref)
	local t = {}
	
	if type(p3) == "table" and type(p4) == "table" then
		for i, v in p4 do
			t[i] = p3[i]
		end
	end
	return dashModule.union(p3, deepJoin(p4, t))
end