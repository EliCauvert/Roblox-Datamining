local _ = require(script:FindFirstAncestor("MomentsCreation").Types.CreationFlowTypes)

return function(p1)
	local t = {}
	local t_1 = {}
	
	local function rebuildOrdered()
		-- upvalues: t_1 (write), t (ref)
		t_1 = {}
		
		for i, v in t do
			table.insert(t_1, v)
		end
		table.sort(t_1, function(p2, p3)
			return (p2.cta.order or 0) < (p3.cta.order or 0)
		end)
	end
	
	local function register(p2)
		-- upvalues: t (ref), rebuildOrdered (ref)
		for i, v in p2 do
			t[v.kind] = v
		end
		rebuildOrdered()
	end
	
	local function get(p3)
		-- upvalues: t (ref)
		return t[p3]
	end
	
	local function getAll()
		-- upvalues: t_1 (write)
		return t_1
	end
	
	if p1 ~= nil then
		for i, v in p1 do
			t[v.kind] = v
		end
		rebuildOrdered()
	end
	return { register = register, get = get, getAll = getAll }
end