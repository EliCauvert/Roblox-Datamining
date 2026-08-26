local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local _ = require(parent.jsutils.ObjMap)
local _ = require(parent.language.ast)
local kind = require(parent.language.kinds).Kind
local visit = require(parent.language.visitor).visit
local collectDependencies = nil
local collectTransitiveDependencies = nil

local function separateOperations(p1)
	-- upvalues: kind (ref), collectDependencies (write), set (ref), collectTransitiveDependencies (write), array (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(p1.definitions) do
		local kind_1 = v.kind
		
		if kind_1 == kind.OPERATION_DEFINITION then
			table.insert(t, v)
		elseif kind_1 == kind.FRAGMENT_DEFINITION then
			t_1[v.name.value] = collectDependencies(v.selectionSet)
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in pairs(t) do
		local var1 = set.new()
		
		for i_2, v_2 in pairs(collectDependencies(v_1.selectionSet)) do
			collectTransitiveDependencies(var1, t_1, v_2)
		end
		t_2[if v_1.name then v_1.name.value else ""] = {
			kind = kind.DOCUMENT,
			definitions = array.filter(p1.definitions, function(p2)
				-- upvalues: v_1 (ref), kind (copy), var1 (ref)
				return if p2 ~= v_1 then p2.kind == kind.FRAGMENT_DEFINITION and var1:has(p2.name.value) else true
			end)
		}
	end
	return t_2
end

collectTransitiveDependencies = function(p2, p3, p4)
	-- upvalues: collectTransitiveDependencies (write)
	if not p2:has(p4) then
		p2:add(p4)
		local var2 = p3[p4]
		
		if var2 ~= nil then
			for i, v in pairs(var2) do
				collectTransitiveDependencies(p2, p3, v)
			end
		end
	end
end

collectDependencies = function(p5)
	-- upvalues: visit (ref)
	local t = {}
	visit(p5, {
		FragmentSpread = function(_, p6)
			-- upvalues: t (ref)
			table.insert(t, p6.name.value)
		end
	})
	
	return t
end

return { separateOperations = separateOperations }