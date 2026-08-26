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

local function reasonMessage(p1)
	-- upvalues: array (ref), reasonMessage (ref)
	return if array.isArray(p1) then table.concat(array.map(p1, function(p2)
		-- upvalues: reasonMessage (copy)
		return ("subfields \"%s\" conflict because "):format(p2[1]) .. reasonMessage(p2[2])
	end), " and ") else p1
end

function t.OverlappingFieldsCanBeMergedRule(p1)
	-- upvalues: t_1 (write), findConflictsWithinSelectionSet (write), array (ref), reasonMessage (ref), graphQLError (ref)
	local var1 = t_1.new()
	local t = {}
	
	return {
		SelectionSet = function(_, p2)
			-- upvalues: findConflictsWithinSelectionSet (copy), p1 (ref), t (ref), var1 (ref), array (copy), reasonMessage (copy), graphQLError (copy)
			for i, v in ipairs(findConflictsWithinSelectionSet(p1, t, var1, p1:getParentType(), p2)) do
				local var2 = v[1]
				local var3 = var2[2]
				p1:reportError(graphQLError.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(var2[1], if array.isArray(var3) then table.concat(array.map(var3, function(p3)
					-- upvalues: reasonMessage (copy)
					return ("subfields \"%s\" conflict because "):format(p3[1]) .. reasonMessage(p3[2])
				end), " and ") else var3), array.concat(v[2], v[3])))
			end
		end
	}
end

findConflictsWithinSelectionSet = function(value, p2, p3, p4, p5)
	-- upvalues: getFieldsAndFragmentNames (write), collectConflictsWithin (write), collectConflictsBetweenFieldsAndFragment (write), collectConflictsBetweenFragments (write)
	local t = {}
	local var2 = getFieldsAndFragmentNames(value, p2, p4, p5)
	local var3 = var2[1]
	local var4 = var2[2]
	collectConflictsWithin(value, t, p2, p3, var3)
	
	if #var4 ~= 0 then
		for i_1 = 1, #var4 do
			collectConflictsBetweenFieldsAndFragment(value, t, p2, p3, false, var3, var4[i_1])
			
			for i = i_1 + 1, #var4 do
				collectConflictsBetweenFragments(value, t, p2, p3, false, var4[i_1], var4[i])
			end
		end
	end
	return t
end

collectConflictsBetweenFieldsAndFragment = function(p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: getReferencedFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFieldsAndFragment (write)
	local var5 = p6:getFragment(p12)
	
	if not var5 then return end
	local var6 = getReferencedFieldsAndFragmentNames(p6, p8, var5)
	local var7 = var6[1]
	local var8 = var6[2]
	
	if p11 == var7 then return end
	collectConflictsBetween(p6, p7, p8, p9, p10, p11, var7)
	
	for i = 1, #var8 do
		collectConflictsBetweenFieldsAndFragment(p6, p7, p8, p9, p10, p11, var8[i])
	end
end

collectConflictsBetweenFragments = function(p13, p14, p15, p16, p17, p18, p19)
	-- upvalues: getReferencedFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFragments (write)
	if p18 == p19 then return end
	if p16:has(p18, p19, p17) then return end
	p16:add(p18, p19, p17)
	local var9 = p13:getFragment(p18)
	local var10 = p13:getFragment(p19)
	
	if not var9 or not var10 then return end
	local var11 = getReferencedFieldsAndFragmentNames(p13, p15, var9)
	local var12 = var11[1]
	local var13 = var11[2]
	local var14 = getReferencedFieldsAndFragmentNames(p13, p15, var10)
	local var15 = var14[2]
	collectConflictsBetween(p13, p14, p15, p16, p17, var12, var14[1])
	
	for i = 1, #var15 do
		collectConflictsBetweenFragments(p13, p14, p15, p16, p17, p18, var15[i])
	end
	for i_1 = 1, #var13 do
		collectConflictsBetweenFragments(p13, p14, p15, p16, p17, var13[i_1], p19)
	end
end

local function findConflictsBetweenSubSelectionSets(value, p20, p21, p22, p23, p24, p25, p26)
	-- upvalues: getFieldsAndFragmentNames (write), collectConflictsBetween (write), collectConflictsBetweenFieldsAndFragment (write), collectConflictsBetweenFragments (write)
	local t = {}
	local var16 = getFieldsAndFragmentNames(value, p20, p23, p24)
	local var17 = var16[1]
	local var18 = var16[2]
	local var19 = getFieldsAndFragmentNames(value, p20, p25, p26)
	local var20 = var19[1]
	local var21 = var19[2]
	collectConflictsBetween(value, t, p20, p21, p22, var17, var20)
	
	if #var21 ~= 0 then
		for i = 1, #var21 do
			collectConflictsBetweenFieldsAndFragment(value, t, p20, p21, p22, var17, var21[i])
		end
	end
	if #var18 ~= 0 then
		for i_1 = 1, #var18 do
			collectConflictsBetweenFieldsAndFragment(value, t, p20, p21, p22, var20, var18[i_1])
		end
	end
	for i_3 = 1, #var18 do
		for i_2 = 1, #var21 do
			collectConflictsBetweenFragments(value, t, p20, p21, p22, var18[i_3], var21[i_2])
		end
	end
	return t
end

collectConflictsWithin = function(p27, p28, p29, p30, p31)
	-- upvalues: findConflict (write)
	for i, v in p31 do
		local var22 = v[1]
		local var23 = v[2]
		
		if #var23 > 1 then
			for i_2 = 1, #var23 do
				for i_1 = i_2 + 1, #var23 do
					local var24 = findConflict(p27, p29, p30, false, var22, var23[i_2], var23[i_1])
					
					if var24 then
						table.insert(p28, var24)
					end
				end
			end
		end
	end
end

collectConflictsBetween = function(p32, p33, p34, p35, p36, p37, p38)
	-- upvalues: findConflict (write)
	for i, v in ipairs(p37:keys()) do
		local var25 = p38[v]
		
		if var25 then
			local var26 = p37[v]
			
			for i_2 = 1, #var26 do
				for i_1 = 1, #var25 do
					local var27 = findConflict(p32, p34, p35, p36, v, var26[i_2], var25[i_1])
					
					if var27 then
						table.insert(p33, var27)
					end
				end
			end
		end
	end
end

findConflict = function(p39, p40, p41, p42, p43, p44, p45)
	-- upvalues: isObjectType (ref), sameArguments (write), doTypesConflict (write), inspect (ref), findConflictsBetweenSubSelectionSets (ref), getNamedType (ref), subfieldConflicts (write)
	local var28 = p44[1]
	local var29 = p44[2]
	local var30 = p44[3]
	local var31 = p45[1]
	local var32 = p45[2]
	local var33 = p45[3]
	local var34 = p42 or (var28 ~= var31 and (isObjectType(var28) and isObjectType(var31)))
	
	if not var34 then
		local value = var29.name.value
		local value_1 = var32.name.value
		
		if value ~= value_1 then
			return {
				{
					p43,
					("\"%s\" and \"%s\" are different fields"):format(value, value_1)
				},
				{ var29 },
				{ var32 }
			}
		elseif not sameArguments(var29.arguments or {}, var32.arguments or {}) then
			return {
				{ p43, "they have differing arguments" },
				{ var29 },
				{ var32 }
			}
		end
	end
	local type = var30 and var30.type
	local type_1 = var33 and var33.type
	
	if type and type_1 and doTypesConflict(type, type_1) then
		return {
			{
				p43,
				("they return conflicting types \"%s\" and \"%s\""):format(inspect(type), inspect(type_1))
			},
			{ var29 },
			{ var32 }
		}
	end
	local selectionSet = var29.selectionSet
	local selectionSet_1 = var32.selectionSet
	
	return if selectionSet and selectionSet_1 then subfieldConflicts(findConflictsBetweenSubSelectionSets(p39, p40, p41, var34, getNamedType(type), selectionSet, getNamedType(type_1), selectionSet_1), p43, var29, var32) else nil
end

local sameValue = nil
local _collectFieldsAndFragmentNames = nil

sameArguments = function(p39, p40)
	-- upvalues: array (ref), sameValue (write)
	return #p39 == #p40 and array.every(p39, function(p41)
		-- upvalues: array (copy), p40 (ref), sameValue (copy)
		local var28 = array.find(p40, function(p42)
			-- upvalues: p41 (ref)
			return p42.name.value == p41.name.value
		end)
		
		return if var28 then sameValue(p41.value, var28.value) else false
	end)
end

sameValue = function(p39, p40)
	-- upvalues: print (ref)
	return print(p39) == print(p40)
end

doTypesConflict = function(vectorA, vectorB)
	-- upvalues: isListType (ref), doTypesConflict (write), isNonNullType (ref), isLeafType (ref)
	return if isListType(vectorA) then if isListType(vectorB) then doTypesConflict(vectorA.ofType, vectorB.ofType) else true elseif isListType(vectorB) then true elseif isNonNullType(vectorA) then if isNonNullType(vectorB) then doTypesConflict(vectorA.ofType, vectorB.ofType) else true elseif isNonNullType(vectorB) then true elseif isLeafType(vectorA) or isLeafType(vectorB) then vectorA ~= vectorB else false
end

getFieldsAndFragmentNames = function(p39, p40, p41, p42)
	-- upvalues: map (ref), _collectFieldsAndFragmentNames (write), object (ref)
	local var28 = p40[p42]
	
	if not var28 then
		local var29 = map.new()
		local t = {}
		_collectFieldsAndFragmentNames(p39, p41, p42, var29, t)
		var28 = { var29, object.keys(t) }
		p40[p42] = var28
	end
	return var28
end

getReferencedFieldsAndFragmentNames = function(p39, p40, p41)
	-- upvalues: typeFromAST (ref), getFieldsAndFragmentNames (write)
	local selectionSet = p40[p41.selectionSet]
	
	return selectionSet or getFieldsAndFragmentNames(p39, p40, typeFromAST(p39:getSchema(), p41.typeCondition), p41.selectionSet)
end

_collectFieldsAndFragmentNames = function(p39, p40, p41, p42, p43)
	-- upvalues: kind (ref), isObjectType (ref), isInterfaceType (ref), nullModule (ref), typeFromAST (ref), _collectFieldsAndFragmentNames (write)
	for i, v in ipairs(p41.selections) do
		local kind_1 = v.kind
		
		if kind_1 ~= kind.FIELD then
			if kind_1 == kind.FRAGMENT_SPREAD then
				p43[v.name.value] = true
			elseif kind_1 == kind.INLINE_FRAGMENT then
				local typeCondition = v.typeCondition
				_collectFieldsAndFragmentNames(p39, if typeCondition then typeFromAST(p39:getSchema(), typeCondition) else p40, v.selectionSet, p42, p43)
			end
		end
		local value = v.name.value
		local var28 = if isObjectType(p40) or isInterfaceType(p40) then p40:getFields():get(value) else nil
		local var29 = if v.alias then v.alias.value else value
		
		if not p42[var29] then
			p42[var29] = {}
		end
		table.insert(p42[var29], { p40 or nullModule, v or nullModule, var28 or nullModule })
	end
end

subfieldConflicts = function(p44, p45, p46, p47)
	-- upvalues: array (ref)
	return if #p44 > 0 then {
		{
			p45,
			array.map(p44, function(p48)
				return p48[1]
			end)
		},
		array.reduce(p44, function(p48, p49)
			-- upvalues: array (copy)
			return array.concat(p48, p49[2])
		end, { p46 }),
		array.reduce(p44, function(p48, p49)
			-- upvalues: array (copy)
			return array.concat(p48, p49[3])
		end, { p47 })
	} else nil
end

t_1 = {}
local t_2 = { __index = t_1 }

function t_1.new()
	-- upvalues: t_2 (ref)
	local tbl = setmetatable({}, t_2)
	tbl._data = {}
	
	return tbl
end

function t_1.has(p44, p45, p46, p47)
	local var30 = p44._data[p45]
	local var31 = var30 and var30[p46]
	
	return if var31 == nil then false elseif p47 == false then var31 == false else true
end

function t_1.add(p44, p45, p46, p47)
	p44:_pairSetAdd(p45, p46, p47)
	p44:_pairSetAdd(p46, p45, p47)
end

function t_1._pairSetAdd(value, p44, p45, p46)
	local var30 = value._data[p44]
	
	if not var30 then
		var30 = {}
		value._data[p44] = var30
	end
	var30[p45] = p46
end

return t