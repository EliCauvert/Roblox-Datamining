local _ = require(script:FindFirstAncestor("MomentsCreation").Types.CreationFlowTypes)

return function(List)
	local t = {}
	local List1 = {}
	
	local function rebuildOrdered()
		-- upvalues: List1 (ref), t (copy)
		List1 = {}
		
		for _, value in t do
			table.insert(List1, value)
		end
		table.sort(List1, function(A, B): boolean
			return (A.cta.order or 0) < (B.cta.order or 0)
		end)
	end
	
	local function register(List)
		-- upvalues: t (copy), rebuildOrdered (copy)
		for _, value in List do
			t[value.kind] = value
		end
		rebuildOrdered()
	end
	
	local function get(p1)
		-- upvalues: t (copy)
		return t[p1]
	end
	
	local function getAll()
		-- upvalues: List1 (ref)
		return List1
	end
	
	if List ~= nil then
		for _, value in List do
			t[value.kind] = value
		end
		rebuildOrdered()
	end
	return { register = register, get = get, getAll = getAll }
end