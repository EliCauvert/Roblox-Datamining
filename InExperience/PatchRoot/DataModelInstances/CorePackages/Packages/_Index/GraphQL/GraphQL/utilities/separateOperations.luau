local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Set = LuauPolyfillModule.Set
local _ = require(Parent.jsutils.ObjMap)
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local VisitFunction = require(Parent.language.visitor).visit
local Callback = nil
local Callback1 = nil

local function separateOperations(p1) --[[ Line: 38 ]]
	-- upvalues: Kind (copy), Callback (ref), Set (copy), Callback1 (ref), Array (copy)
	local List = {}
	local t = {}
	
	for _, definition in pairs(p1.definitions) do
		local Kind1 = definition.kind
		
		if Kind1 == Kind.OPERATION_DEFINITION then
			table.insert(List, definition)
		elseif Kind1 == Kind.FRAGMENT_DEFINITION then
			t[definition.name.value] = Callback(definition.selectionSet)
		end
	end
	local t1 = {}
	
	for _, value in pairs(List) do
		local NewSet = Set.new()
		
		for _, value1 in pairs(Callback(value.selectionSet)) do
			Callback1(NewSet, t, value1)
		end
		t1[value.name and value.name.value or ""] = {
			kind = Kind.DOCUMENT,
			definitions = Array.filter(p1.definitions, function(p2) --[[ Line: 81 ]]
				-- upvalues: value (copy), Kind (upval), NewSet (copy)
				return p2 == value or p2.kind == Kind.FRAGMENT_DEFINITION and NewSet:has(p2.name.value)
			end)
		}
	end
	return t1
end

Callback1 = function(NewResult, p2, p3) --[[ Line: 95 | Named "collectTransitiveDependencies" ]]
	-- upvalues: Callback1 (ref)
	if not NewResult:has(p3) then
		NewResult:add(p3)
		local v1 = p2[p3]
		
		if v1 ~= nil then
			for _, value in pairs(v1) do
				Callback1(NewResult, p2, value)
			end
		end
	end
end

Callback = function(SelectionSet) --[[ Line: 112 | Named "collectDependencies" ]]
	-- upvalues: VisitFunction (copy)
	local List = {}
	VisitFunction(SelectionSet, {
		FragmentSpread = function(_, p4) --[[ Line: 116 ]]
			-- upvalues: List (copy)
			table.insert(List, p4.name.value)
		end
	})
	
	return List
end

return { separateOperations = separateOperations }