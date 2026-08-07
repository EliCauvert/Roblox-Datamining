-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:38 2026 Pacific Standard Time.

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

local function separateOperations(p0) --[[ line: 38 ]]
	-- upvalues: kind (ref), collectDependencies (write), set (ref), collectTransitiveDependencies (write), array (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in pairs(p0.definitions) do
		local kind_1 = v.kind
		
		if kind_1 == kind.OPERATION_DEFINITION then
			table.insert(t, v)
		elseif kind_1 == kind.FRAGMENT_DEFINITION then
			t_1[v.name.value] = collectDependencies(v.selectionSet)
		end
	end
	local t_2 = {}
	
	for i_1, v_1 in pairs(t) do
		local var7 = set.new()
		
		for i_2, v_2 in pairs(collectDependencies(v_1.selectionSet)) do
			collectTransitiveDependencies(var7, t_1, v_2)
		end
		t_2[if v_1.name then v_1.name.value else ""] = {
			kind = kind.DOCUMENT,
			definitions = array.filter(p0.definitions, function(p1) --[[ line: 81 ]]
				-- upvalues: v_1 (ref), kind (copy), var7 (ref)
				return if p1 ~= v_1 then p1.kind == kind.FRAGMENT_DEFINITION and var7:has(p1.name.value) else true
			end)
		}
	end
	return t_2
end

collectTransitiveDependencies = function(p2, p3, p4) --[[ line: 95 | named "collectTransitiveDependencies" ]]
	-- upvalues: collectTransitiveDependencies (write)
	if not p2:has(p4) then
		p2:add(p4)
		local var8 = p3[p4]
		
		if var8 ~= nil then
			for i, v in pairs(var8) do
				collectTransitiveDependencies(p2, p3, v)
			end
		end
	end
end

collectDependencies = function(p5) --[[ line: 112 | named "collectDependencies" ]]
	-- upvalues: visit (ref)
	local t = {}
	visit(p5, {
		FragmentSpread = function(_, p6) --[[ line: 116 ]]
			-- upvalues: t (ref)
			table.insert(t, p6.name.value)
		end
	})
	
	return t
end

return { separateOperations = separateOperations }