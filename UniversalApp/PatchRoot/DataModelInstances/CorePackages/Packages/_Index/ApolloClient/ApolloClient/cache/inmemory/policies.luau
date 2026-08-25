local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local map = luauPolyfillModule.Map
local isCallableModule = require(parent.luaUtils.isCallable)
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local luauRegExpModule = require(parent_1.LuauRegExp)
local t = {}
local makeFieldFunctionOptions = nil
local makeMergeObjectsFunction = nil
local keyArgsFnFromSpecifier = nil
local keyFieldsFnFromSpecifier = nil
local makeAliasMap = nil
local computeKeyObject = nil
local _ = require(parent_1.GraphQL)
local trie = require(parent.wry.trie).Trie
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local utilitiesModule = require(script.Parent.Parent.Parent.utilities)
local getFragmentFromSelection = utilitiesModule.getFragmentFromSelection
local isField = utilitiesModule.isField
local getTypenameFromResult = utilitiesModule.getTypenameFromResult
local storeKeyNameFromField = utilitiesModule.storeKeyNameFromField
local argumentsObjectFromField = utilitiesModule.argumentsObjectFromField
local isReference = utilitiesModule.isReference
local getStoreKeyName = utilitiesModule.getStoreKeyName
local canUseWeakMap = utilitiesModule.canUseWeakMap
local isNonNullObject = utilitiesModule.isNonNullObject
local stringifyForDisplay = utilitiesModule.stringifyForDisplay
local helpersModule = require(script.Parent.helpers)
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local fieldNameFromStoreName = helpersModule.fieldNameFromStoreName
local storeValueIsStoreObject = helpersModule.storeValueIsStoreObject
local selectionSetMatchesResult = helpersModule.selectionSetMatchesResult
local typeOrFieldNameRegExp = helpersModule.TypeOrFieldNameRegExp
local cacheSlot = require(script.Parent.reactiveVars).cacheSlot
local _ = require(script.Parent.Parent.core.types.common)
local _ = require(script.Parent.writeToStore_types)
getStoreKeyName:setStringify(require(script.Parent["object-canon"]).canonicalStringify)
local _ = require(script.Parent.policies_types)

local function _(p0)
	-- upvalues: argumentsObjectFromField (ref)
	return if p0.args == nil then if p0.field then argumentsObjectFromField(p0.field, p0.variables) else nil else p0.args
end

local function defaultDataIdFromObject(_, p1, p2)
	-- upvalues: httpService (ref)
	local typename = p1.__typename
	local id = p1.id
	local id_1 = p1._id
	
	if type(typename) == "string" then
		if p2 then
			if id ~= nil then
				p2.keyObject = { id = id }
			elseif id_1 == nil then
				p2.keyObject = nil
			else
				p2.keyObject = { _id = id_1 }
			end
		end
		if id == nil then
			id = id_1
		end
		if id == nil then
			return nil
		end
		local var23 = type(id)
		
		return string.format("%s:%s", typename, if var23 == "number" or var23 == "string" then id else httpService:JSONEncode(id))
	end
end

t.defaultDataIdFromObject = defaultDataIdFromObject

local function nullKeyFieldsFn(_)
	return nil
end

local function simpleKeyArgsFn(_, p3)
	return p3.fieldName
end

local _ = nil

local function mergeTrueFn(_, p4, p5, p6)
	return p6:mergeObjects(p4, p5)
end

local _ = nil

local function mergeFalseFn(_, _, p7)
	return p7
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p8)
	-- upvalues: t_1 (ref), map (ref), object (ref), defaultDataIdFromObject (ref)
	local tbl = setmetatable({}, t_1)
	tbl.typePolicies = {}
	tbl.toBeAdded = {}
	tbl.supertypeMap = map.new(nil)
	tbl.fuzzySubtypes = map.new(nil)
	tbl.cache = nil
	tbl.rootIdsByTypename = {}
	tbl.rootTypenamesById = {}
	tbl.usingPossibleTypes = false
	tbl.config = p8
	tbl.config = object.assign({ dataIdFromObject = defaultDataIdFromObject }, p8)
	tbl.cache = tbl.config.cache
	tbl:setRootTypename("Query")
	tbl:setRootTypename("Mutation")
	tbl:setRootTypename("Subscription")
	
	if p8.possibleTypes then
		tbl:addPossibleTypes(p8.possibleTypes)
	end
	if p8.typePolicies then
		tbl:addTypePolicies(p8.typePolicies)
	end
	return tbl
end

function t_1:identify(p9, p10, p11)
	-- upvalues: getTypenameFromResult (ref), keyFieldsFnFromSpecifier (write)
	local _ = nil
	local var25 = if p10 and p11 then getTypenameFromResult(p9, p10, p11) else p9.__typename
	
	if var25 == self.rootTypenamesById.ROOT_QUERY then
		return { "ROOT_QUERY" }
	end
	local var30
	local t = { typename = var25, selectionSet = p10, fragmentMap = p11 }
	local var27 = nil
	local var28 = var25 and self:getTypePolicy(var25)
	local _ = nil
	local var29 = if var28 and var28.keyFn then var28.keyFn else self.config.dataIdFromObject
	while var29 do
		var30 = var29(var28, p9, t)
		
		if type(var30) == "table" then
			var29 = keyFieldsFnFromSpecifier(var30)
			continue
		end
		var27 = var30
		break
	end
	var27 = if var27 then tostring(var27) else nil
	
	return if t.keyObject then { var27, t.keyObject } else { var27 }
end

function t_1.addTypePolicies(p12, p13)
	-- upvalues: objectKeysForEachModule (ref), object (ref), hasOwnPropertyModule (ref)
	objectKeysForEachModule(p13, function(p14)
		-- upvalues: p13 (ref), object (copy), p12 (ref), hasOwnPropertyModule (copy)
		local var31 = p13[p14]
		local queryType = var31.queryType
		local mutationType = var31.mutationType
		local subscriptionType = var31.subscriptionType
		local var32 = object.assign({}, var31, {
			queryType = object.None,
			mutationType = object.None,
			subscriptionType = object.None
		})
		
		if queryType then
			p12:setRootTypename("Query", p14)
		end
		if mutationType then
			p12:setRootTypename("Mutation", p14)
		end
		if subscriptionType then
			p12:setRootTypename("Subscription", p14)
		end
		if hasOwnPropertyModule(p12.toBeAdded, p14) then
			table.insert(p12.toBeAdded[p14], var32)
			
			return
		end
		p12.toBeAdded[p14] = { var32 }
	end)
end

function t_1:updateTypePolicy(p15, p16)
	-- upvalues: isCallableModule (ref), mergeTrueFn (write), mergeFalseFn (write), nullKeyFieldsFn (ref), keyFieldsFnFromSpecifier (write), objectKeysForEachModule (ref), simpleKeyArgsFn (ref), keyArgsFnFromSpecifier (write)
	local var33 = self:getTypePolicy(p15)
	local keyFields = p16.keyFields
	local fields = p16.fields
	
	local function _(value, p17)
		-- upvalues: isCallableModule (copy), mergeTrueFn (copy), mergeFalseFn (copy)
		if isCallableModule(p17) then
			value.merge = p17
			
			return
		elseif p17 == true then
			value.merge = mergeTrueFn
			
			return
		elseif p17 == false then
			value.merge = mergeFalseFn
			
			return
		end
		value.merge = value.merge
	end
	
	local merge = p16.merge
	
	if isCallableModule(merge) then
		var33.merge = merge
	elseif merge == true then
		var33.merge = mergeTrueFn
	elseif merge == false then
		var33.merge = mergeFalseFn
	else
		var33.merge = var33.merge
	end
	if keyFields == false then
		var33.keyFn = nullKeyFieldsFn
	else
		local var34 = type(keyFields)
		
		if var34 == "table" then
			var33.keyFn = keyFieldsFnFromSpecifier(keyFields)
		elseif var34 == "function" then
			var33.keyFn = keyFields
		else
			var33.keyFn = var33.keyFn
		end
	end
	if fields then
		objectKeysForEachModule(fields, function(p18)
			-- upvalues: self (ref), p15 (ref), fields (ref), simpleKeyArgsFn (copy), keyArgsFnFromSpecifier (copy), isCallableModule (copy), mergeTrueFn (copy), mergeFalseFn (copy)
			local var35 = self:getFieldPolicy(p15, p18, true)
			local var36 = fields[p18]
			
			if type(var36) == "function" then
				var35.read = var36
			else
				local keyArgs = var36.keyArgs
				local read = var36.read
				local merge = var36.merge
				
				if keyArgs == false then
					var35.keyFn = simpleKeyArgsFn
				else
					local var37 = type(keyArgs)
					
					if var37 == "table" then
						var35.keyFn = keyArgsFnFromSpecifier(keyArgs)
					elseif var37 == "function" then
						var35.keyFn = keyArgs
					else
						var35.keyFn = var35.keyFn
					end
				end
				if type(read) == "function" then
					var35.read = read
				end
				if isCallableModule(merge) then
					var35.merge = merge
				elseif merge == true then
					var35.merge = mergeTrueFn
				elseif merge == false then
					var35.merge = mergeFalseFn
				else
					var35.merge = var35.merge
				end
			end
			if var35.read and var35.merge then
				var35.keyFn = var35.keyFn or simpleKeyArgsFn
			end
		end)
	end
end

function t_1:setRootTypename(p19, p20)
	-- upvalues: invariant (ref)
	local var38 = p20
	
	if var38 == nil then
		var38 = p19
	end
	local text = "ROOT_" .. string.upper(p19)
	local var40 = self.rootTypenamesById[text]
	
	if var38 ~= var40 then
		local var41 = not var40 or var40 == p19
		
		if not var41 then
			invariant(var41, ("Cannot change root %s __typename more than once"):format(p19))
		end
		if var40 then
			self.rootIdsByTypename[var40] = nil
		end
		self.rootIdsByTypename[var38] = text
		self.rootTypenamesById[text] = var38
	end
end

function t_1:addPossibleTypes(p21)
	-- upvalues: objectKeysForEachModule (ref), array (ref), typeOrFieldNameRegExp (ref), luauRegExpModule (ref)
	self.usingPossibleTypes = true
	objectKeysForEachModule(p21, function(p22)
		-- upvalues: self (ref), array (copy), p21 (ref), typeOrFieldNameRegExp (copy), luauRegExpModule (copy)
		self:getSupertypeSet(p22, true)
		array.forEach(p21[p22], function(p23)
			-- upvalues: self (copy), p22 (ref), typeOrFieldNameRegExp (copy), luauRegExpModule (copy)
			self:getSupertypeSet(p23, true):add(p22)
			local var42 = typeOrFieldNameRegExp:exec(p23)
			
			if not var42 or var42[1] ~= p23 then
				self.fuzzySubtypes:set(p23, luauRegExpModule.new(p23))
			end
		end)
	end)
end

function t_1:getTypePolicy(p24)
	-- upvalues: hasOwnPropertyModule (ref), object (ref), array (ref)
	if not hasOwnPropertyModule(self.typePolicies, p24) then
		self.typePolicies[p24] = {}
		local var43 = self.typePolicies[p24]
		var43.fields = {}
		local var44 = self.supertypeMap:get(p24)
		
		if var44 and var44.size > 0 then
			var44:forEach(function(p25)
				-- upvalues: self (ref), object (copy), var43 (ref)
				local var46 = self:getTypePolicy(p25)
				local fields = var46.fields
				object.assign(var43, object.assign(table.clone(var46), { fields = object.None }))
				object.assign(var43.fields, fields)
			end)
		end
	end
	local var45 = self.toBeAdded[p24]
	
	if var45 and #var45 > 0 then
		array.forEach(array.splice(var45, 1), function(p26)
			-- upvalues: self (ref), p24 (ref)
			self:updateTypePolicy(p24, p26)
		end)
	end
	return self.typePolicies[p24]
end

function t_1:getFieldPolicy(p27, p28, p29)
	if not p27 then
		return nil
	end
	local fields = self:getTypePolicy(p27).fields
	
	if fields[p28] then
		return fields[p28]
	elseif p29 then
		fields[p28] = {}
		
		return fields[p28]
	end
	return nil
end

function t_1:getSupertypeSet(p30, p31)
	-- upvalues: set (ref)
	local var47 = self.supertypeMap:get(p30)
	
	if not var47 and p31 then
		var47 = set.new()
		self.supertypeMap:set(p30, var47)
	end
	return var47
end

function t_1:fragmentMatches(p32, p33, p34, p35)
	-- upvalues: array (ref), invariant (ref), selectionSetMatchesResult (ref)
	if not p32.typeCondition then
		return true
	elseif not p33 then
		return false
	end
	local value = p32.typeCondition.name.value
	
	if p33 == value then
		return true
	elseif self.usingPossibleTypes and self.supertypeMap:has(value) then
		local var48 = self:getSupertypeSet(p33, true)
		local list = { var48 }
		
		local function maybeEnqueue(p36)
			-- upvalues: self (ref), array (copy), list (ref)
			local var54 = self:getSupertypeSet(p36, false)
			
			if var54 and var54.size > 0 and array.indexOf(list, var54) < 1 then
				table.insert(list, var54)
			end
		end
		
		local var51 = p34 ~= nil and self.fuzzySubtypes.size > 0
		local var52 = false
		
		for i, v in list do
			local var53 = list[i]
			
			if not var53:has(value) then
				var53:forEach(maybeEnqueue)
				
				if var51 and i == #list and selectionSetMatchesResult(p32.selectionSet, p34, p35) then
					var51 = false
					var52 = true
					array.forEach(self.fuzzySubtypes:entries(), function(p37)
						-- upvalues: p33 (ref), self (ref), array (copy), list (ref)
						local var55 = p37[1]
						local var56 = p37[2]:exec(p33)
						
						if var56 and var56[1] == p33 then
							local var57 = self:getSupertypeSet(var55, false)
							
							if var57 and var57.size > 0 and array.indexOf(list, var57) < 1 then
								table.insert(list, var57)
							end
						end
						return 1
					end)
				end
			end
			if not var48:has(value) then
				if var52 then
					invariant.warn(("Inferring subtype %s of supertype %s"):format(p33, value))
				end
				var48:add(value)
			end
			return true
		end
	end
	return false
end

function t_1:hasKeyArgs(p38, p39)
	local var58 = self:getFieldPolicy(p38, p39, false)
	
	return var58 ~= nil and var58.keyFn ~= nil
end

function t_1:getStoreFieldName(p40)
	-- upvalues: argumentsObjectFromField (ref), keyArgsFnFromSpecifier (write), storeKeyNameFromField (ref), getStoreKeyName (ref), fieldNameFromStoreName (ref)
	local typename = p40.typename
	local fieldName = p40.fieldName
	local var59 = self:getFieldPolicy(typename, fieldName, false)
	local var60 = nil
	local var61 = if var59 then var59.keyFn else nil
	
	if var61 and typename then
		local var64
		local t = {
			typename = typename,
			fieldName = fieldName,
			field = p40.field or nil,
			variables = p40.variables
		}
		local var63 = if p40.args ~= nil then if p40.field then argumentsObjectFromField(p40.field, p40.variables) else nil else p40.args
		while var61 do
			var64 = var61(var63, t)
			
			if type(var64) == "table" then
				var61 = keyArgsFnFromSpecifier(var64)
				continue
			end
			var60 = var64 or fieldName
			break
		end
	end
	if var60 == nil then
		var60 = if p40.field then storeKeyNameFromField(p40.field, p40.variables) else getStoreKeyName(fieldName, if p40.args ~= nil then if p40.field then argumentsObjectFromField(p40.field, p40.variables) else nil else p40.args)
	end
	return if var60 == false then fieldName elseif fieldName == fieldNameFromStoreName(var60) then var60 else fieldName .. ":" .. var60
end

function t_1:readField(p41, p42)
	-- upvalues: fieldNameFromStoreName (ref), makeFieldFunctionOptions (write), cacheSlot (ref)
	local from = p41.from
	
	if not from then return end
	if not p41.field and not p41.fieldName then return end
	if p41.typename == nil then
		local var65 = p42.store:getFieldValue(from, "__typename")
		
		if var65 then
			p41.typename = var65
		end
	end
	local var66 = self:getStoreFieldName(p41)
	local var67 = p42.store:getFieldValue(from, var66)
	local typenameFieldPolicy = self:getFieldPolicy(p41.typename, fieldNameFromStoreName(var66), false)
	local var69 = if typenameFieldPolicy then typenameFieldPolicy.read else nil
	
	return if var69 then cacheSlot:withValue(self.cache, var69, {
		var67,
		makeFieldFunctionOptions(self, from, p41, p42, p42.store:getStorage(if from.__ref then from.__ref else from, var66))
	}) else var67
end

function t_1:getMergeFunction(p43, p44, p45)
	local var70 = self:getFieldPolicy(p43, p44, false)
	local var71 = var70 and var70.merge
	
	if not var71 and p45 then
		local var72 = self:getTypePolicy(p45)
		
		if var72 then
			return var72.merge
		end
		var71 = var72
	end
	return var71
end

function t_1.runMergeFunction(p46, p47, p48, p49, p50, p51)
	-- upvalues: mergeTrueFn (write), makeMergeObjectsFunction (write), mergeFalseFn (write), makeFieldFunctionOptions (write)
	local field = p49.field
	local typename = p49.typename
	local merge = p49.merge
	
	if merge == mergeTrueFn then
		return makeMergeObjectsFunction(p50.store)(p49, p47, p48)
	elseif merge == mergeFalseFn then
		return p48
	elseif p50.overwrite then
		p47 = nil
	end
	return merge(p49, p47, p48, makeFieldFunctionOptions(p46, nil, {
		typename = typename,
		fieldName = field.name.value,
		field = field,
		variables = p50.variables
	}, p50, p51 or {}))
end

t.Policies = t_1

makeFieldFunctionOptions = function(p52, p53, p54, p55, p56)
	-- upvalues: fieldNameFromStoreName (ref), argumentsObjectFromField (ref), isReference (ref), object (ref), hasOwnPropertyModule (ref), invariant (ref), stringifyForDisplay (ref), array (ref), makeMergeObjectsFunction (write)
	local var73 = p52:getStoreFieldName(p54)
	local variables = p54.variables or p55.variables
	
	return {
		args = if p54.args ~= nil then if p54.field then argumentsObjectFromField(p54.field, p54.variables) else nil else p54.args,
		field = p54.field or nil,
		fieldName = fieldNameFromStoreName(var73),
		storeFieldName = var73,
		variables = variables,
		isReference = function(_, ...)
			-- upvalues: isReference (copy)
			return isReference(...)
		end,
		toReference = p55.store.toReference,
		storage = p56,
		cache = p52.cache,
		canRead = p55.store.canRead,
		readField = function(_, p57, ...)
			-- upvalues: object (copy), p53 (ref), hasOwnPropertyModule (copy), invariant (copy), stringifyForDisplay (copy), array (copy), variables (ref), p52 (ref), p55 (ref)
			local var75 = type(p57)
			local list = {
				if var75 == "table" then object.assign(table.clone(p57), if p57.from == object.None then { from = "<Object.None>" } else nil) else p57,
				if select("#", ...) >= 1 then "<nil>" else nil
			}
			local var77 = nil
			
			if var75 == "string" then
				var77 = {
					fieldName = p57,
					from = if select("#", ...) >= 1 then ... else p53
				}
			elseif var75 ~= "table" then
				invariant.warn(("Unexpected readField arguments: %s"):format(stringifyForDisplay(array.from(list))))
				
				return
			end
			var77 = object.assign({}, p57)
			
			if not hasOwnPropertyModule(p57, "from") then
				var77.from = p53
			end
			if _G.__DEV__ and var77.from == nil then
				invariant.warn(("Undefined 'from' passed to readField with arguments %s"):format(stringifyForDisplay(array.from(list))))
			end
			if var77.variables == nil then
				var77.variables = variables
			end
			return p52:readField(var77, p55)
		end,
		mergeObjects = makeMergeObjectsFunction(p55.store)
	}
end

makeMergeObjectsFunction = function(p58)
	-- upvalues: array (ref), invariantError (ref), isNonNullObject (ref), isReference (ref), storeValueIsStoreObject (ref), object (ref)
	return function(_, p59, p60)
		-- upvalues: array (copy), invariantError (copy), isNonNullObject (copy), p58 (ref), isReference (copy), storeValueIsStoreObject (copy), object (copy)
		if array.isArray(p59) or array.isArray(p60) then
			error(invariantError.new("Cannot automatically merge arrays"))
		end
		if isNonNullObject(p59) and isNonNullObject(p60) then
			local var78 = p58:getFieldValue(p59, "__typename")
			local var79 = p58:getFieldValue(p60, "__typename")
			
			if var78 ~= nil and (var79 ~= nil and var78 ~= var79) then
				return p60
			elseif isReference(p59) and storeValueIsStoreObject(p60) then
				p58:merge(p59.__ref, p60)
				
				return p59
			elseif storeValueIsStoreObject(p59) and isReference(p60) then
				p58:merge(p59, p60.__ref)
				
				return p60
			end
			return if storeValueIsStoreObject(p59) and storeValueIsStoreObject(p60) then object.assign({}, p59, p60) else p60
		end
	end
end

local function keyObjEncode(p61, p62)
	-- upvalues: array (ref), keyObjEncode (ref), httpService (ref)
	assert(typeof(p62) == "table", "specifier must be an array")
	
	return if next(p62) then "{" .. array.join(array.filter(array.map(p62, function(p63, p64)
		-- upvalues: array (copy), p61 (ref), p62 (ref), keyObjEncode (copy), httpService (copy)
		if array.isArray(p63) then
			return ""
		end
		local _ = nil
		
		return if p61[p63] then if p64 < #p62 then httpService:JSONEncode(p63) .. ":" .. (if array.isArray(p62[p64 + 1]) then keyObjEncode(p61[p63], p62[p64 + 1]) else httpService:JSONEncode(p61[p63])) else httpService:JSONEncode(p63) .. ":" .. httpService:JSONEncode(p61[p63]) else ""
	end), function(p65)
		return p65 ~= ""
	end), ",") .. "}" else "[]"
end

keyArgsFnFromSpecifier = function(p66)
	-- upvalues: keyObjEncode (ref), computeKeyObject (write)
	return function(p67, p68)
		-- upvalues: keyObjEncode (copy), computeKeyObject (copy), p66 (ref)
		return if p67 then ("%s:%s"):format(p68.fieldName, keyObjEncode(computeKeyObject(p67, p66, false), p66)) else p68.fieldName
	end
end

keyFieldsFnFromSpecifier = function(p69)
	-- upvalues: trie (ref), canUseWeakMap (ref), makeAliasMap (write), computeKeyObject (write), keyObjEncode (ref)
	local var80 = trie.new(canUseWeakMap)
	
	return function(_, p70, p71)
		-- upvalues: var80 (ref), makeAliasMap (copy), computeKeyObject (copy), p69 (ref), keyObjEncode (copy)
		local aliasMap = nil
		
		if p71.selectionSet and p71.fragmentMap then
			local var81 = var80:lookupArray({ p71.selectionSet, p71.fragmentMap })
			
			if var81.aliasMap then
				aliasMap = var81.aliasMap
			else
				var81.aliasMap = makeAliasMap(p71.selectionSet, p71.fragmentMap)
				aliasMap = var81.aliasMap
			end
		end
		p71.keyObject = computeKeyObject(p70, p69, true, aliasMap)
		
		return ("%s:%s"):format(p71.typename or "null", keyObjEncode(p71.keyObject, p69))
	end
end

makeAliasMap = function(p72, p73)
	-- upvalues: set (ref), array (ref), isField (ref), makeAliasMap (write), getFragmentFromSelection (ref)
	local t = {}
	local var83 = set.new({ p72 })
	
	for i, v in var83 do
		array.forEach(v.selections, function(p74)
			-- upvalues: isField (copy), t (ref), makeAliasMap (copy), p73 (ref), getFragmentFromSelection (copy), var83 (ref)
			if isField(p74) then
				if p74.alias then
					local value = p74.alias.value
					local value_1 = p74.name.value
					
					if value_1 ~= value then
						local aliases
						local _ = nil
						
						if t.aliases then
							aliases = t.aliases
						else
							t.aliases = {}
							aliases = t.aliases
						end
						aliases[value_1] = value
					end
				end
				if not p74.selectionSet then return end
				local subsets
				local _ = nil
				
				if t.subsets then
					subsets = t.subsets
				else
					t.subsets = {}
					subsets = t.subsets
				end
				subsets[p74.name.value] = makeAliasMap(p74.selectionSet, p73)
				
				return
			else
				local var84 = getFragmentFromSelection(p74, p73)
				
				if var84 then
					var83:add(var84.selectionSet)
				end
			end
		end)
	end
	return t
end

computeKeyObject = function(p75, p76, p77, p78)
	-- upvalues: computeKeyObject (write), hasOwnPropertyModule (ref), invariant (ref)
	local t = {}
	local var86 = nil
	
	for i, v in p76 do
		local var87
		if type(v) == "table" then
			if type(var86) == "string" then
				var87 = p78 and p78.subsets
				t[var86] = computeKeyObject(p75[var86], v, p77, var87 and var87[var86])
			end
		end
		var87 = p78 and p78.aliases
		local _ = nil
		local var88 = if var87 and var87[v] then var87[v] else v
		
		if hasOwnPropertyModule(p75, var88) then
			var86 = v
			t[var86] = p75[var88]
		else
			invariant(not p77, ("Missing field '%s' while computing key fields"):format(var88))
			var86 = nil
		end
	end
	return t
end

t.None = object.None

return t