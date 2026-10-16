local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local NullModule = require(Parent.luaUtils.null)
local Language = Parent.language
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local InspectFunction = require(Parent.jsutils.inspect).inspect
local Kind = require(Language.kinds).Kind
local PrintFunction = require(Language.printer).print
local DefinitionModule = require(Parent.type.definition)
local GetNamedTypeFunction = DefinitionModule.getNamedType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local TypeFromASTFunction = require(Parent.utilities.typeFromAST).typeFromAST
local Callback1 = nil
local Callback4 = nil
local Callback6 = nil
local Callback3 = nil
local Callback = nil
local Callback2 = nil
local Callback5 = nil
local Callback7 = nil
local Callback9 = nil
local Callback8 = nil
local Callback10 = nil
local v1 = nil

local function reasonMessage(p1) --[[ Line: 49 ]]
	-- upvalues: Array (copy), reasonMessage (copy)
	return if Array.isArray(p1) then table.concat(Array.map(p1, function(Entry): string --[[ Line: 52 ]]
		-- upvalues: reasonMessage (upval)
		return ("subfields \"%s\" conflict because "):format(Entry[1]) .. reasonMessage(Entry[2])
	end), " and ") else p1
end

local OverlappingFieldsCanBeMergedRuleModule = {
	OverlappingFieldsCanBeMergedRule = function(p1) --[[ Line: 70 ]]
		-- upvalues: v1 (ref), Callback1 (ref), Array (copy), reasonMessage (copy), GraphQLError (copy)
		local NewResult = v1.new()
		local t = {}
		
		return {
			SelectionSet = function(_, p2) --[[ Line: 82 ]]
				-- upvalues: Callback1 (upval), p1 (copy), t (copy), NewResult (copy), Array (upval), reasonMessage (upval), GraphQLError (upval)
				for _, value in ipairs((Callback1(p1, t, NewResult, p1:getParentType(), p2))) do
					local v2 = value[1]
					local v3 = v2[2]
					p1:reportError(GraphQLError.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(v2[1], if Array.isArray(v3) then table.concat(Array.map(v3, function(Entry): string --[[ Line: 52 ]]
						-- upvalues: reasonMessage (upval)
						return ("subfields \"%s\" conflict because "):format(Entry[1]) .. reasonMessage(Entry[2])
					end), " and ") else v3), Array.concat(value[2], value[3])))
				end
			end
		}
	end
}

Callback1 = function(p2, p3, NewResult, ParentType, p4) --[[ Line: 168 | Named "findConflictsWithinSelectionSet" ]]
	-- upvalues: Callback2 (ref), Callback3 (ref), Callback4 (ref), Callback (ref)
	local t = {}
	local CallbackResult = Callback2(p2, p3, ParentType, p4)
	local CallbackResultEntry = CallbackResult[1]
	local CallbackResultEntry1 = CallbackResult[2]
	Callback3(p2, t, p3, NewResult, CallbackResultEntry)
	
	if #CallbackResultEntry1 ~= 0 then
		for i = 1, #CallbackResultEntry1 do
			Callback4(p2, t, p3, NewResult, false, CallbackResultEntry, CallbackResultEntry1[i])
			
			for i1 = i + 1, #CallbackResultEntry1 do
				Callback(p2, t, p3, NewResult, false, CallbackResultEntry1[i], CallbackResultEntry1[i1])
			end
		end
	end
	return t
end

Callback4 = function(p5, p6, p7, p8, p9, p10, p11) --[[ Line: 230 | Named "collectConflictsBetweenFieldsAndFragment" ]]
	-- upvalues: Callback5 (ref), Callback6 (ref), Callback4 (ref)
	local Fragment = p5:getFragment(p11)
	
	if not Fragment then return end
	local CallbackResult = Callback5(p5, p7, Fragment)
	local CallbackResultEntry = CallbackResult[1]
	local CallbackResultEntry1 = CallbackResult[2]
	
	if p10 == CallbackResultEntry then return end
	Callback6(p5, p6, p7, p8, p9, p10, CallbackResultEntry)
	
	for i = 1, #CallbackResultEntry1 do
		Callback4(p5, p6, p7, p8, p9, p10, CallbackResultEntry1[i])
	end
end

Callback = function(p12, p13, p14, p15, p16, p17, p18) --[[ Line: 285 | Named "collectConflictsBetweenFragments" ]]
	-- upvalues: Callback5 (ref), Callback6 (ref), Callback (ref)
	if p17 == p18 then return end
	if p15:has(p17, p18, p16) then return end
	p15:add(p17, p18, p16)
	local Fragment = p12:getFragment(p17)
	local Fragment1 = p12:getFragment(p18)
	
	if not Fragment or not Fragment1 then return end
	local CallbackResult = Callback5(p12, p14, Fragment)
	local CallbackResultEntry = CallbackResult[1]
	local CallbackResultEntry1 = CallbackResult[2]
	local CallbackResult1 = Callback5(p12, p14, Fragment1)
	local CallbackResultEntry2 = CallbackResult1[2]
	Callback6(p12, p13, p14, p15, p16, CallbackResultEntry, CallbackResult1[1])
	
	for i = 1, #CallbackResultEntry2 do
		Callback(p12, p13, p14, p15, p16, p17, CallbackResultEntry2[i])
	end
	for i1 = 1, #CallbackResultEntry1 do
		Callback(p12, p13, p14, p15, p16, CallbackResultEntry1[i1], p18)
	end
end

local function findConflictsBetweenSubSelectionSets(p19, p20, p21, p22, p23, SelectionSet, p24, SelectionSet1) --[[ Line: 370 ]]
	-- upvalues: Callback2 (ref), Callback6 (ref), Callback4 (ref), Callback (ref)
	local t = {}
	local CallbackResult = Callback2(p19, p20, p23, SelectionSet)
	local CallbackResultEntry = CallbackResult[1]
	local CallbackResultEntry1 = CallbackResult[2]
	local CallbackResult1 = Callback2(p19, p20, p24, SelectionSet1)
	local CallbackResultEntry2 = CallbackResult1[1]
	local CallbackResultEntry3 = CallbackResult1[2]
	Callback6(p19, t, p20, p21, p22, CallbackResultEntry, CallbackResultEntry2)
	
	if #CallbackResultEntry3 ~= 0 then
		for i = 1, #CallbackResultEntry3 do
			Callback4(p19, t, p20, p21, p22, CallbackResultEntry, CallbackResultEntry3[i])
		end
	end
	if #CallbackResultEntry1 ~= 0 then
		for i1 = 1, #CallbackResultEntry1 do
			Callback4(p19, t, p20, p21, p22, CallbackResultEntry2, CallbackResultEntry1[i1])
		end
	end
	for i2 = 1, #CallbackResultEntry1 do
		for i3 = 1, #CallbackResultEntry3 do
			Callback(p19, t, p20, p21, p22, CallbackResultEntry1[i2], CallbackResultEntry3[i3])
		end
	end
	return t
end

Callback3 = function(p25, List, p26, p27, List1) --[[ Line: 461 | Named "collectConflictsWithin" ]]
	-- upvalues: Callback7 (ref)
	for _, value in List1 do
		local v2 = value[1]
		local v3 = value[2]
		
		if #v3 > 1 then
			for i = 1, #v3 do
				for i1 = i + 1, #v3 do
					local CallbackResult = Callback7(p25, p26, p27, false, v2, v3[i], v3[i1])
					
					if CallbackResult then
						table.insert(List, CallbackResult)
					end
				end
			end
		end
	end
end

Callback6 = function(p28, List, p29, p30, p31, p32, p33) --[[ Line: 506 | Named "collectConflictsBetween" ]]
	-- upvalues: Callback7 (ref)
	for _, value in ipairs(p32:keys()) do
		local v4 = p33[value]
		
		if v4 then
			local v5 = p32[value]
			
			for i = 1, #v5 do
				for i1 = 1, #v4 do
					local CallbackResult = Callback7(p28, p29, p30, p31, value, v5[i], v4[i1])
					
					if CallbackResult then
						table.insert(List, CallbackResult)
					end
				end
			end
		end
	end
end

Callback7 = function(p34, p35, p36, p37, p38, Entry, Entry1) --[[ Line: 547 | Named "findConflict" ]]
	-- upvalues: IsObjectTypeFunction (copy), Callback9 (ref), Callback8 (ref), InspectFunction (copy), findConflictsBetweenSubSelectionSets (copy), GetNamedTypeFunction (copy), Callback10 (ref)
	local Entry2 = Entry[1]
	local Entry3 = Entry[2]
	local Entry4 = Entry[3]
	local Entry5 = Entry1[1]
	local Entry6 = Entry1[2]
	local Entry7 = Entry1[3]
	local P44 = p37 or Entry2 ~= Entry5 and (IsObjectTypeFunction(Entry2) and IsObjectTypeFunction(Entry5))
	
	if not P44 then
		local Value = Entry3.name.value
		local Value1 = Entry6.name.value
		
		if Value ~= Value1 then
			return {
				{
					p38,
					("\"%s\" and \"%s\" are different fields"):format(Value, Value1)
				},
				{ Entry3 },
				{ Entry6 }
			}
		elseif not Callback9(Entry3.arguments or {}, Entry6.arguments or {}) then
			return {
				{ p38, "they have differing arguments" },
				{ Entry3 },
				{ Entry6 }
			}
		end
	end
	local Type = Entry4 and Entry4.type
	local Type1 = Entry7 and Entry7.type
	
	if Type and Type1 and Callback8(Type, Type1) then
		return {
			{
				p38,
				("they return conflicting types \"%s\" and \"%s\""):format(InspectFunction(Type), InspectFunction(Type1))
			},
			{ Entry3 },
			{ Entry6 }
		}
	else
		local SelectionSet = Entry3.selectionSet
		local SelectionSet1 = Entry6.selectionSet
		
		return if SelectionSet and SelectionSet1 then Callback10(findConflictsBetweenSubSelectionSets(p34, p35, p36, P44, GetNamedTypeFunction(Type), SelectionSet, GetNamedTypeFunction(Type1), SelectionSet1), p38, Entry3, Entry6) else nil
	end
end

local Callback11 = nil
local Callback12 = nil

Callback9 = function(Arguments, Arguments1) --[[ Line: 645 | Named "sameArguments" ]]
	-- upvalues: Array (copy), Callback11 (ref)
	return #Arguments == #Arguments1 and Array.every(Arguments, function(p34) --[[ Line: 649 ]]
		-- upvalues: Array (upval), Arguments1 (copy), Callback11 (upval)
		local FindResult = Array.find(Arguments1, function(p35): boolean --[[ Line: 650 ]]
			-- upvalues: p34 (copy)
			return p35.name.value == p34.name.value
		end)
		
		return if FindResult then Callback11(p34.value, FindResult.value) else false
	end)
end

Callback11 = function(p34, p35): boolean --[[ Line: 660 | Named "sameValue" ]]
	-- upvalues: PrintFunction (copy)
	return PrintFunction(p34) == PrintFunction(p35)
end

Callback8 = function(OfType, OfType1) --[[ Line: 667 | Named "doTypesConflict" ]]
	-- upvalues: IsListTypeFunction (copy), Callback8 (ref), IsNonNullTypeFunction (copy), IsLeafTypeFunction (copy)
	return if IsListTypeFunction(OfType) then not IsListTypeFunction(OfType1) or Callback8(OfType.ofType, OfType1.ofType) elseif IsListTypeFunction(OfType1) then true elseif IsNonNullTypeFunction(OfType) then not IsNonNullTypeFunction(OfType1) or Callback8(OfType.ofType, OfType1.ofType) elseif IsNonNullTypeFunction(OfType1) then true elseif IsLeafTypeFunction(OfType) or IsLeafTypeFunction(OfType1) then OfType ~= OfType1 else false
end

Callback2 = function(p34, p35, p36, SelectionSet) --[[ Line: 695 | Named "getFieldsAndFragmentNames" ]]
	-- upvalues: Map (copy), Callback12 (ref), Object (copy)
	local v6 = p35[SelectionSet]
	
	if not v6 then
		local NewMap = Map.new()
		local t = {}
		Callback12(p34, p36, SelectionSet, NewMap, t)
		v6 = { NewMap, Object.keys(t) }
		p35[SelectionSet] = v6
	end
	return v6
end

Callback5 = function(p34, p35, Fragment) --[[ Line: 717 | Named "getReferencedFieldsAndFragmentNames" ]]
	-- upvalues: TypeFromASTFunction (copy), Callback2 (ref)
	local v6 = p35[Fragment.selectionSet]
	
	return if v6 then v6 else Callback2(p34, p35, TypeFromASTFunction(p34:getSchema(), Fragment.typeCondition), Fragment.selectionSet)
end

Callback12 = function(p34, p35, Key, NewResult, p36) --[[ Line: 733 | Named "_collectFieldsAndFragmentNames" ]]
	-- upvalues: Kind (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), NullModule (copy), TypeFromASTFunction (copy), Callback12 (ref)
	for _, selection in ipairs(Key.selections) do
		local Kind1 = selection.kind
		
		if Kind1 == Kind.FIELD then
			local Value = selection.name.value
			local GetResult = if IsObjectTypeFunction(p35) or IsInterfaceTypeFunction(p35) then p35:getFields():get(Value) else nil
			local Value1 = if selection.alias then selection.alias.value else Value
			
			if not NewResult[Value1] then
				NewResult[Value1] = {}
			end
			table.insert(NewResult[Value1], {
				p35 or NullModule,
				selection or NullModule,
				GetResult or NullModule
			})
		elseif Kind1 == Kind.FRAGMENT_SPREAD then
			p36[selection.name.value] = true
		elseif Kind1 == Kind.INLINE_FRAGMENT then
			local TypeCondition = selection.typeCondition
			Callback12(p34, if TypeCondition then TypeFromASTFunction(p34:getSchema(), TypeCondition) else p35, selection.selectionSet, NewResult, p36)
		end
	end
end

Callback10 = function(p37, p38, p39, p40) --[[ Line: 780 | Named "subfieldConflicts" ]]
	-- upvalues: Array (copy)
	return if #p37 > 0 then {
		{
			p38,
			Array.map(p37, function(Entry) --[[ Line: 785 ]]
				return Entry[1]
			end)
		},
		Array.reduce(p37, function(p41, Entry) --[[ Line: 789 ]]
			-- upvalues: Array (upval)
			return Array.concat(p41, Entry[2])
		end, { p39 }),
		Array.reduce(p37, function(p41, Entry) --[[ Line: 793 ]]
			-- upvalues: Array (upval)
			return Array.concat(p41, Entry[3])
		end, { p40 })
	} else nil
end

v1 = {}
local config = { __index = v1 }

function v1.new() --[[ Line: 819 ]]
	-- upvalues: config (copy)
	local self = setmetatable({}, config)
	self._data = {}
	
	return self
end

function v1.has(p37, p38, p39, Enabled): boolean --[[ Line: 825 ]]
	local Entry = p37._data[p38]
	local Entry1 = Entry and Entry[p39]
	
	return Entry1 ~= nil and (Enabled ~= false or Entry1 == false)
end

function v1.add(p37, p38, p39, p40) --[[ Line: 840 ]]
	p37:_pairSetAdd(p38, p39, p40)
	p37:_pairSetAdd(p39, p38, p40)
end

function v1._pairSetAdd(p37, p38, Key, p39) --[[ Line: 845 ]]
	local Entry = p37._data[p38]
	
	if not Entry then
		Entry = {}
		p37._data[p38] = Entry
	end
	Entry[Key] = p39
end

return OverlappingFieldsCanBeMergedRuleModule