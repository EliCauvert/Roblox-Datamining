local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local nullModule = require(parent.luaUtils.null)
local jsutils = parent.jsutils
local language = parent.language
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local inspect = require(jsutils.inspect).inspect
local kind = require(language.kinds).Kind
local print = require(language.printer).print
local definitionModule = require(parent.type.definition)
local getNamedType = definitionModule.getNamedType
local isNonNullType = definitionModule.isNonNullType
local isLeafType = definitionModule.isLeafType
local isObjectType = definitionModule.isObjectType
local isListType = definitionModule.isListType
local isInterfaceType = definitionModule.isInterfaceType
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST
local t = {}
local findConflictsWithinSelectionSet = nil
local collectConflictsBetweenFieldsAndFragment = nil
local collectConflictsBetween = nil
local collectConflictsWithin = nil
local collectConflictsBetweenFragments = nil
local getFieldsAndFragmentNames = nil
local getReferencedFieldsAndFragmentNames = nil
local findConflict = nil
local sameArguments = nil
local doTypesConflict = nil
local subfieldConflicts = nil
local t_1 = nil

local function reasonMessage(p0) --[[ line: 49 ]]
	-- upvalues: array (ref), reasonMessage (ref)
	return if array.isArray(p0) then table.concat(array.map(p0, function(p1) --[[ line: 52 ]]
		-- upvalues: reasonMessage (copy)
		return ("subfields \"%s\" conflict because "):format(p1[1]) .. reasonMessage(p1[2])
	end), " and ") else p0
end

function t.OverlappingFieldsCanBeMergedRule(p2) --[[ line: 70 ]]
	-- upvalues: t_1 (write), findConflictsWithinSelectionSet (write), array (ref), reasonMessage (ref), graphQLError (ref)
	local var21 = t_1.new()
	local t = {}
	
	return {
		SelectionSet = function(_, p3) --[[ line: 82 ]]
			-- upvalues: findConflictsWithinSelectionSet (copy), p2 (ref), t (ref), var21 (ref), array (copy), reasonMessage (copy), graphQLError (copy)
			for i, v in ipairs(findConflictsWithinSelectionSet(p2, t, var21, p2:getParentType(), p3)) do
				local var23 = v[1]
				local var24 = var23[2]
				p2:reportError(graphQLError.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(var23[1], if array.isArray(var24) then table.concat(array.map(var24, function(p4) --[[ line: 52 ]]
					-- upvalues: reasonMessage (copy)
					return ("subfields \"%s\" conflict because "):format(p4[1]) .. reasonMessage(p4[2])
				end), " and ") else var24), array.concat(v[2], v[3])))
			end
		end
	}
end

findConflictsWithinSelectionSet = function(value, p5, p6, p7, p8) --[[ line: 168 | named "findConflictsWithinSelectionSet" ]]
	-- upvalues: getFieldsAndFragmentNames (write), collectConflictsWithin (write), collectConflictsBetweenFieldsAndFragment (write), collectConflictsBetweenFragments (write)
	local t = {}
	local var26 = getFieldsAndFragmentNames(value, p5, p7, p8)
	local var27 = var26[1]
	local var28 = var26[2]
	collectConflictsWithin(value, t, p5, p6, var27)
	
	if #var28 ~= 0 then
		for i_1 = 1, #var28 do
			collectConflictsBetweenFieldsAndFragment(value, t, p5, p6, false, var27, var28[i_1])
			
			for i = i_1 + 1, #var28 do
				collectConflictsBetweenFragments(value, t, p5, p6, false, var28[i_1], var28[i])
			end
		end
	end
	return t
end

collectConflictsBetweenFieldsAndFragment = function(p9, p10, p11, p12, p13, p14, p15) --[[ line: 230 | named "collectConflictsBetweenFieldsAndFragment" ]]
	-- upvalues: getReferencedFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFieldsAndFragment (write)
	local var29 = p9:getFragment(p15)
	
	if not var29 then return end
	local var30 = getReferencedFieldsAndFragmentNames(p9, p11, var29)
	local var31 = var30[1]
	local var32 = var30[2]
	
	if p14 == var31 then return end
	collectConflictsBetween(p9, p10, p11, p12, p13, p14, var31)
	
	for i = 1, #var32 do
		collectConflictsBetweenFieldsAndFragment(p9, p10, p11, p12, p13, p14, var32[i])
	end
end

collectConflictsBetweenFragments = function(p16, p17, p18, p19, p20, p21, p22) --[[ line: 285 | named "collectConflictsBetweenFragments" ]]
	-- upvalues: getReferencedFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFragments (write)
	if p21 == p22 then return end
	if p19:has(p21, p22, p20) then return end
	p19:add(p21, p22, p20)
	local var33 = p16:getFragment(p21)
	local var34 = p16:getFragment(p22)
	
	if not var33 or not var34 then return end
	local var35 = getReferencedFieldsAndFragmentNames(p16, p18, var33)
	local var36 = var35[1]
	local var37 = var35[2]
	local var38 = getReferencedFieldsAndFragmentNames(p16, p18, var34)
	local var39 = var38[2]
	collectConflictsBetween(p16, p17, p18, p19, p20, var36, var38[1])
	
	for i = 1, #var39 do
		collectConflictsBetweenFragments(p16, p17, p18, p19, p20, p21, var39[i])
	end
	for i_1 = 1, #var37 do
		collectConflictsBetweenFragments(p16, p17, p18, p19, p20, var37[i_1], p22)
	end
end

local function findConflictsBetweenSubSelectionSets(value, p23, p24, p25, p26, p27, p28, p29) --[[ line: 370 ]]
	-- upvalues: getFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFieldsAndFragment (write), collectConflictsBetweenFragments (write)
	local t = {}
	local var41 = getFieldsAndFragmentNames(value, p23, p26, p27)
	local var42 = var41[1]
	local var43 = var41[2]
	local var44 = getFieldsAndFragmentNames(value, p23, p28, p29)
	local var45 = var44[1]
	local var46 = var44[2]
	collectConflictsBetween(value, t, p23, p24, p25, var42, var45)
	
	if #var46 ~= 0 then
		for i = 1, #var46 do
			collectConflictsBetweenFieldsAndFragment(value, t, p23, p24, p25, var42, var46[i])
		end
	end
	if #var43 ~= 0 then
		for i_1 = 1, #var43 do
			collectConflictsBetweenFieldsAndFragment(value, t, p23, p24, p25, var45, var43[i_1])
		end
	end
	for i_3 = 1, #var43 do
		for i_2 = 1, #var46 do
			collectConflictsBetweenFragments(value, t, p23, p24, p25, var43[i_3], var46[i_2])
		end
	end
	return t
end

collectConflictsWithin = function(p30, p31, p32, p33, p34) --[[ line: 461 | named "collectConflictsWithin" ]]
	-- upvalues: findConflict (write)
	for i, v in p34 do
		local var47 = v[1]
		local var48 = v[2]
		
		if #var48 > 1 then
			for i_2 = 1, #var48 do
				for i_1 = i_2 + 1, #var48 do
					local var49 = findConflict(p30, p32, p33, false, var47, var48[i_2], var48[i_1])
					
					if var49 then
						table.insert(p31, var49)
					end
				end
			end
		end
	end
end

collectConflictsBetween = function(p35, p36, p37, p38, p39, p40, p41) --[[ line: 506 | named "collectConflictsBetween" ]]
	-- upvalues: findConflict (write)
	for i, v in ipairs(p40:keys()) do
		local var50 = p41[v]
		
		if var50 then
			local var51 = p40[v]
			
			for i_2 = 1, #var51 do
				for i_1 = 1, #var50 do
					local var52 = findConflict(p35, p37, p38, p39, v, var51[i_2], var50[i_1])
					
					if var52 then
						table.insert(p36, var52)
					end
				end
			end
		end
	end
end

findConflict = function(p42, p43, p44, p45, p46, p47, p48) --[[ line: 547 | named "findConflict" ]]
	-- upvalues: isObjectType (ref), sameArguments (write), doTypesConflict (write), inspect (ref), findConflictsBetweenSubSelectionSets (ref), getNamedType (ref), subfieldConflicts (write)
	local var53 = p47[1]
	local var54 = p47[2]
	local var55 = p47[3]
	local var56 = p48[1]
	local var57 = p48[2]
	local var58 = p48[3]
	local var59 = p45 or (var53 ~= var56 and (isObjectType(var53) and isObjectType(var56)))
	
	if not var59 then
		local value = var54.name.value
		local value_1 = var57.name.value
		
		if value ~= value_1 then
			return {
				{
					p46,
					("\"%s\" and \"%s\" are different fields"):format(value, value_1)
				},
				{ var54 },
				{ var57 }
			}
		elseif not sameArguments(var54.arguments or {}, var57.arguments or {}) then
			return {
				{ p46, "they have differing arguments" },
				{ var54 },
				{ var57 }
			}
		end
	end
	local type = var55 and var55.type
	local type_1 = var58 and var58.type
	
	if type and type_1 and doTypesConflict(type, type_1) then
		return {
			{
				p46,
				("they return conflicting types \"%s\" and \"%s\""):format(inspect(type), inspect(type_1))
			},
			{ var54 },
			{ var57 }
		}
	end
	local selectionSet = var54.selectionSet
	local selectionSet_1 = var57.selectionSet
	
	return if selectionSet and selectionSet_1 then subfieldConflicts(findConflictsBetweenSubSelectionSets(p42, p43, p44, var59, getNamedType(type), selectionSet, getNamedType(type_1), selectionSet_1), p46, var54, var57) else nil
end

local sameValue = nil
local _collectFieldsAndFragmentNames = nil

sameArguments = function(p49, p50) --[[ line: 645 | named "sameArguments" ]]
	-- upvalues: array (ref), sameValue (write)
	return #p49 == #p50 and array.every(p49, function(p51) --[[ line: 649 ]]
		-- upvalues: array (copy), p50 (ref), sameValue (copy)
		local var62 = array.find(p50, function(p52) --[[ line: 650 ]]
			-- upvalues: p51 (ref)
			return p52.name.value == p51.name.value
		end)
		
		return if var62 then sameValue(p51.value, var62.value) else false
	end)
end

sameValue = function(p53, p54) --[[ line: 660 | named "sameValue" ]]
	-- upvalues: print (ref)
	return print(p53) == print(p54)
end

doTypesConflict = function(vectorA, vectorB) --[[ line: 667 | named "doTypesConflict" ]]
	-- upvalues: isListType (ref), doTypesConflict (write), isNonNullType (ref), isLeafType (ref)
	return if isListType(vectorA) then if isListType(vectorB) then doTypesConflict(vectorA.ofType, vectorB.ofType) else true elseif isListType(vectorB) then true elseif isNonNullType(vectorA) then if isNonNullType(vectorB) then doTypesConflict(vectorA.ofType, vectorB.ofType) else true elseif isNonNullType(vectorB) then true elseif isLeafType(vectorA) or isLeafType(vectorB) then vectorA ~= vectorB else false
end

getFieldsAndFragmentNames = function(p55, p56, p57, p58) --[[ line: 695 | named "getFieldsAndFragmentNames" ]]
	-- upvalues: map (ref), _collectFieldsAndFragmentNames (write), object (ref)
	local var63 = p56[p58]
	
	if not var63 then
		local var64 = map.new()
		local t = {}
		_collectFieldsAndFragmentNames(p55, p57, p58, var64, t)
		var63 = { var64, object.keys(t) }
		p56[p58] = var63
	end
	return var63
end

getReferencedFieldsAndFragmentNames = function(p59, p60, p61) --[[ line: 717 | named "getReferencedFieldsAndFragmentNames" ]]
	-- upvalues: typeFromAST (ref), getFieldsAndFragmentNames (write)
	local selectionSet = p60[p61.selectionSet]
	
	return selectionSet or getFieldsAndFragmentNames(p59, p60, typeFromAST(p59:getSchema(), p61.typeCondition), p61.selectionSet)
end

_collectFieldsAndFragmentNames = function(p62, p63, p64, p65, p66) --[[ line: 733 | named "_collectFieldsAndFragmentNames" ]]
	-- upvalues: kind (ref), isObjectType (ref), isInterfaceType (ref), nullModule (ref), typeFromAST (ref), _collectFieldsAndFragmentNames (write)
	for i, v in ipairs(p64.selections) do
		local kind_1 = v.kind
		
		if kind_1 ~= kind.FIELD then
			if kind_1 == kind.FRAGMENT_SPREAD then
				p66[v.name.value] = true
			elseif kind_1 == kind.INLINE_FRAGMENT then
				local typeCondition = v.typeCondition
				_collectFieldsAndFragmentNames(p62, if typeCondition then typeFromAST(p62:getSchema(), typeCondition) else p63, v.selectionSet, p65, p66)
			end
		end
		local value = v.name.value
		local var66 = if isObjectType(p63) or isInterfaceType(p63) then p63:getFields():get(value) else nil
		local var67 = if v.alias then v.alias.value else value
		
		if not p65[var67] then
			p65[var67] = {}
		end
		table.insert(p65[var67], { p63 or nullModule, v or nullModule, var66 or nullModule })
	end
end

subfieldConflicts = function(p67, p68, p69, p70) --[[ line: 780 | named "subfieldConflicts" ]]
	-- upvalues: array (ref)
	return if #p67 > 0 then {
		{
			p68,
			array.map(p67, function(p71) --[[ line: 785 ]]
				return p71[1]
			end)
		},
		array.reduce(p67, function(p72, p73) --[[ line: 789 ]]
			-- upvalues: array (copy)
			return array.concat(p72, p73[2])
		end, { p69 }),
		array.reduce(p67, function(p74, p75) --[[ line: 793 ]]
			-- upvalues: array (copy)
			return array.concat(p74, p75[3])
		end, { p70 })
	} else nil
end

t_1 = {}
local t_2 = { __index = t_1 }

function t_1.new() --[[ line: 819 ]]
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl._data = {}
	
	return tbl
end

function t_1.has(p76, p77, p78, p79) --[[ line: 825 ]]
	local var69 = p76._data[p77]
	local var70 = var69 and var69[p78]
	
	return if var70 == nil then false elseif p79 == false then var70 == false else true
end

function t_1.add(p80, p81, p82, p83) --[[ line: 840 ]]
	p80:_pairSetAdd(p81, p82, p83)
	p80:_pairSetAdd(p82, p81, p83)
end

function t_1._pairSetAdd(value, p84, p85, p86) --[[ line: 845 ]]
	local var71 = value._data[p84]
	
	if not var71 then
		var71 = {}
		value._data[p84] = var71
	end
	var71[p85] = p86
end

return t