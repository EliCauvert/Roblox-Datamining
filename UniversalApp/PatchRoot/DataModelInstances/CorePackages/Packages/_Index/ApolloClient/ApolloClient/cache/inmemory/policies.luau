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

local function _(p1)
	-- upvalues: argumentsObjectFromField (ref)
	return if p1.args == nil then if p1.field then argumentsObjectFromField(p1.field, p1.variables) else nil else p1.args
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
		local var1 = type(id)
		
		return string.format("%s:%s", typename, if var1 == "number" or var1 == "string" then id else httpService:JSONEncode(id))
	end
end

t.defaultDataIdFromObject = defaultDataIdFromObject

local function nullKeyFieldsFn(_)
	return nil
end

local function simpleKeyArgsFn(_, p1)
	return p1.fieldName
end

local _ = nil

local function mergeTrueFn(_, p1, p2, p3)
	return p3:mergeObjects(p1, p2)
end

local _ = nil

local function mergeFalseFn(_, _, p1)
	return p1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
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
	tbl.config = p1
	tbl.config = object.assign({ dataIdFromObject = defaultDataIdFromObject }, p1)
	tbl.cache = tbl.config.cache
	tbl:setRootTypename("Query")
	tbl:setRootTypename("Mutation")
	tbl:setRootTypename("Subscription")
	
	if p1.possibleTypes then
		tbl:addPossibleTypes(p1.possibleTypes)
	end
	if p1.typePolicies then
		tbl:addTypePolicies(p1.typePolicies)
	end
	return tbl
end

function t_1:identify(p1, p2, p3)
	-- upvalues: getTypenameFromResult (ref), keyFieldsFnFromSpecifier (write)
	local _ = nil
	local var1 = if p2 and p3 then getTypenameFromResult(p1, p2, p3) else p1.__typename
	
	if var1 == self.rootTypenamesById.ROOT_QUERY then
		return { "ROOT_QUERY" }
	end
	local var2
	local t = { typename = var1, selectionSet = p2, fragmentMap = p3 }
	local var3 = nil
	local var4 = var1 and self:getTypePolicy(var1)
	local _ = nil
	local var5 = if var4 and var4.keyFn then var4.keyFn else self.config.dataIdFromObject
	while var5 do
		var2 = var5(var4, p1, t)
		
		if type(var2) == "table" then
			var5 = keyFieldsFnFromSpecifier(var2)
			continue
		end
		var3 = var2
		break
	end
	var3 = if var3 then tostring(var3) else nil
	
	return if t.keyObject then { var3, t.keyObject } else { var3 }
end

function t_1.addTypePolicies(p4, p5)
	-- upvalues: objectKeysForEachModule (ref), object (ref), hasOwnPropertyModule (ref)
	objectKeysForEachModule(p5, function(p6)
		-- upvalues: p5 (ref), object (copy), p4 (ref), hasOwnPropertyModule (copy)
		local var6 = p5[p6]
		local queryType = var6.queryType
		local mutationType = var6.mutationType
		local subscriptionType = var6.subscriptionType
		local var7 = object.assign({}, var6, {
			queryType = object.None,
			mutationType = object.None,
			subscriptionType = object.None
		})
		
		if queryType then
			p4:setRootTypename("Query", p6)
		end
		if mutationType then
			p4:setRootTypename("Mutation", p6)
		end
		if subscriptionType then
			p4:setRootTypename("Subscription", p6)
		end
		if hasOwnPropertyModule(p4.toBeAdded, p6) then
			table.insert(p4.toBeAdded[p6], var7)
			
			return
		end
		p4.toBeAdded[p6] = { var7 }
	end)
end

function t_1:updateTypePolicy(p4, p5)
	-- upvalues: isCallableModule (ref), mergeTrueFn (write), mergeFalseFn (write), nullKeyFieldsFn (ref), keyFieldsFnFromSpecifier (write), objectKeysForEachModule (ref), simpleKeyArgsFn (ref), keyArgsFnFromSpecifier (write)
	local var6 = self:getTypePolicy(p4)
	local keyFields = p5.keyFields
	local fields = p5.fields
	
	local function _(value, p6)
		-- upvalues: isCallableModule (copy), mergeTrueFn (copy), mergeFalseFn (copy)
		if isCallableModule(p6) then
			value.merge = p6
			
			return
		elseif p6 == true then
			value.merge = mergeTrueFn
			
			return
		elseif p6 == false then
			value.merge = mergeFalseFn
			
			return
		end
		value.merge = value.merge
	end
	
	local merge = p5.merge
	
	if isCallableModule(merge) then
		var6.merge = merge
	elseif merge == true then
		var6.merge = mergeTrueFn
	elseif merge == false then
		var6.merge = mergeFalseFn
	else
		var6.merge = var6.merge
	end
	if keyFields == false then
		var6.keyFn = nullKeyFieldsFn
	else
		local var7 = type(keyFields)
		
		if var7 == "table" then
			var6.keyFn = keyFieldsFnFromSpecifier(keyFields)
		elseif var7 == "function" then
			var6.keyFn = keyFields
		else
			var6.keyFn = var6.keyFn
		end
	end
	if fields then
		objectKeysForEachModule(fields, function(p6)
			-- upvalues: self (ref), p4 (ref), fields (ref), simpleKeyArgsFn (copy), keyArgsFnFromSpecifier (copy), isCallableModule (copy), mergeTrueFn (copy), mergeFalseFn (copy)
			local var8 = self:getFieldPolicy(p4, p6, true)
			local var9 = fields[p6]
			
			if type(var9) == "function" then
				var8.read = var9
			else
				local keyArgs = var9.keyArgs
				local read = var9.read
				local merge = var9.merge
				
				if keyArgs == false then
					var8.keyFn = simpleKeyArgsFn
				else
					local var10 = type(keyArgs)
					
					if var10 == "table" then
						var8.keyFn = keyArgsFnFromSpecifier(keyArgs)
					elseif var10 == "function" then
						var8.keyFn = keyArgs
					else
						var8.keyFn = var8.keyFn
					end
				end
				if type(read) == "function" then
					var8.read = read
				end
				if isCallableModule(merge) then
					var8.merge = merge
				elseif merge == true then
					var8.merge = mergeTrueFn
				elseif merge == false then
					var8.merge = mergeFalseFn
				else
					var8.merge = var8.merge
				end
			end
			if var8.read and var8.merge then
				var8.keyFn = var8.keyFn or simpleKeyArgsFn
			end
		end)
	end
end

function t_1:setRootTypename(p4, p5)
	-- upvalues: invariant (ref)
	local var6 = p5
	
	if var6 == nil then
		var6 = p4
	end
	local text = "ROOT_" .. string.upper(p4)
	local var7 = self.rootTypenamesById[text]
	
	if var6 ~= var7 then
		local var8 = not var7 or var7 == p4
		
		if not var8 then
			invariant(var8, ("Cannot change root %s __typename more than once"):format(p4))
		end
		if var7 then
			self.rootIdsByTypename[var7] = nil
		end
		self.rootIdsByTypename[var6] = text
		self.rootTypenamesById[text] = var6
	end
end

function t_1:addPossibleTypes(p4)
	-- upvalues: objectKeysForEachModule (ref), array (ref), typeOrFieldNameRegExp (ref), luauRegExpModule (ref)
	self.usingPossibleTypes = true
	objectKeysForEachModule(p4, function(p5)
		-- upvalues: self (ref), array (copy), p4 (ref), typeOrFieldNameRegExp (copy), luauRegExpModule (copy)
		self:getSupertypeSet(p5, true)
		array.forEach(p4[p5], function(p6)
			-- upvalues: self (copy), p5 (ref), typeOrFieldNameRegExp (copy), luauRegExpModule (copy)
			self:getSupertypeSet(p6, true):add(p5)
			local var6 = typeOrFieldNameRegExp:exec(p6)
			
			if not var6 or var6[1] ~= p6 then
				self.fuzzySubtypes:set(p6, luauRegExpModule.new(p6))
			end
		end)
	end)
end

function t_1:getTypePolicy(p4)
	-- upvalues: hasOwnPropertyModule (ref), object (ref), array (ref)
	if not hasOwnPropertyModule(self.typePolicies, p4) then
		self.typePolicies[p4] = {}
		local var6 = self.typePolicies[p4]
		var6.fields = {}
		local var7 = self.supertypeMap:get(p4)
		
		if var7 and var7.size > 0 then
			var7:forEach(function(p5)
				-- upvalues: self (ref), object (copy), var6 (ref)
				local var8 = self:getTypePolicy(p5)
				local fields = var8.fields
				object.assign(var6, object.assign(table.clone(var8), { fields = object.None }))
				object.assign(var6.fields, fields)
			end)
		end
	end
	local var8 = self.toBeAdded[p4]
	
	if var8 and #var8 > 0 then
		array.forEach(array.splice(var8, 1), function(p5)
			-- upvalues: self (ref), p4 (ref)
			self:updateTypePolicy(p4, p5)
		end)
	end
	return self.typePolicies[p4]
end

function t_1:getFieldPolicy(p4, p5, p6)
	if not p4 then
		return nil
	end
	local fields = self:getTypePolicy(p4).fields
	
	if fields[p5] then
		return fields[p5]
	elseif p6 then
		fields[p5] = {}
		
		return fields[p5]
	end
	return nil
end

function t_1:getSupertypeSet(p4, p5)
	-- upvalues: set (ref)
	local var6 = self.supertypeMap:get(p4)
	
	if not var6 and p5 then
		var6 = set.new()
		self.supertypeMap:set(p4, var6)
	end
	return var6
end

function t_1:fragmentMatches(p4, p5, p6, p7)
	-- upvalues: array (ref), invariant (ref), selectionSetMatchesResult (ref)
	if not p4.typeCondition then
		return true
	elseif not p5 then
		return false
	end
	local value = p4.typeCondition.name.value
	
	if p5 == value then
		return true
	elseif self.usingPossibleTypes and self.supertypeMap:has(value) then
		local var6 = self:getSupertypeSet(p5, true)
		local list = { var6 }
		
		local function maybeEnqueue(p8)
			-- upvalues: self (ref), array (copy), list (ref)
			local var7 = self:getSupertypeSet(p8, false)
			
			if var7 and var7.size > 0 and array.indexOf(list, var7) < 1 then
				table.insert(list, var7)
			end
		end
		
		local var7 = p6 ~= nil and self.fuzzySubtypes.size > 0
		local var8 = false
		
		for i, v in list do
			local var9 = list[i]
			
			if not var9:has(value) then
				var9:forEach(maybeEnqueue)
				
				if var7 and i == #list and selectionSetMatchesResult(p4.selectionSet, p6, p7) then
					var7 = false
					var8 = true
					array.forEach(self.fuzzySubtypes:entries(), function(p8)
						-- upvalues: p5 (ref), self (ref), array (copy), list (ref)
						local var10 = p8[1]
						local var11 = p8[2]:exec(p5)
						
						if var11 and var11[1] == p5 then
							local var12 = self:getSupertypeSet(var10, false)
							
							if var12 and var12.size > 0 and array.indexOf(list, var12) < 1 then
								table.insert(list, var12)
							end
						end
						return 1
					end)
				end
			end
			if not var6:has(value) then
				if var8 then
					invariant.warn(("Inferring subtype %s of supertype %s"):format(p5, value))
				end
				var6:add(value)
			end
			return true
		end
	end
	return false
end

function t_1:hasKeyArgs(p8, p9)
	local var10 = self:getFieldPolicy(p8, p9, false)
	
	return var10 ~= nil and var10.keyFn ~= nil
end

function t_1:getStoreFieldName(p8)
	-- upvalues: argumentsObjectFromField (ref), keyArgsFnFromSpecifier (write), storeKeyNameFromField (ref), getStoreKeyName (ref), fieldNameFromStoreName (ref)
	local typename = p8.typename
	local fieldName = p8.fieldName
	local var10 = self:getFieldPolicy(typename, fieldName, false)
	local var11 = nil
	local var12 = if var10 then var10.keyFn else nil
	
	if var12 and typename then
		local var13
		local t = {
			typename = typename,
			fieldName = fieldName,
			field = p8.field or nil,
			variables = p8.variables
		}
		local var14 = if p8.args ~= nil then if p8.field then argumentsObjectFromField(p8.field, p8.variables) else nil else p8.args
		while var12 do
			var13 = var12(var14, t)
			
			if type(var13) == "table" then
				var12 = keyArgsFnFromSpecifier(var13)
				continue
			end
			var11 = var13 or fieldName
			break
		end
	end
	if var11 == nil then
		var11 = if p8.field then storeKeyNameFromField(p8.field, p8.variables) else getStoreKeyName(fieldName, if p8.args ~= nil then if p8.field then argumentsObjectFromField(p8.field, p8.variables) else nil else p8.args)
	end
	return if var11 == false then fieldName elseif fieldName == fieldNameFromStoreName(var11) then var11 else fieldName .. ":" .. var60
end

function t_1:readField(p9, p10)
	-- upvalues: fieldNameFromStoreName (ref), makeFieldFunctionOptions (write), cacheSlot (ref)
	local from = p9.from
	
	if not from then return end
	if not p9.field and not p9.fieldName then return end
	if p9.typename == nil then
		local var15 = p10.store:getFieldValue(from, "__typename")
		
		if var15 then
			p9.typename = var15
		end
	end
	local var16 = self:getStoreFieldName(p9)
	local var17 = p10.store:getFieldValue(from, var16)
	local typenameFieldPolicy = self:getFieldPolicy(p9.typename, fieldNameFromStoreName(var16), false)
	local var18 = if typenameFieldPolicy then typenameFieldPolicy.read else nil
	
	return if var18 then cacheSlot:withValue(self.cache, var18, {
		var17,
		makeFieldFunctionOptions(self, from, p9, p10, p10.store:getStorage(if from.__ref then from.__ref else from, var16))
	}) else var17
end

function t_1:getMergeFunction(p9, p10, p11)
	local var15 = self:getFieldPolicy(p9, p10, false)
	local var16 = var15 and var15.merge
	
	if not var16 and p11 then
		local var17 = self:getTypePolicy(p11)
		
		if var17 then
			return var17.merge
		end
		var16 = var17
	end
	return var16
end

function t_1.runMergeFunction(p9, p10, p11, p12, p13, p14)
	-- upvalues: mergeTrueFn (write), makeMergeObjectsFunction (write), mergeFalseFn (write), makeFieldFunctionOptions (write)
	local field = p12.field
	local typename = p12.typename
	local merge = p12.merge
	
	if merge == mergeTrueFn then
		return makeMergeObjectsFunction(p13.store)(p12, p10, p11)
	elseif merge == mergeFalseFn then
		return p11
	elseif p13.overwrite then
		p10 = nil
	end
	return merge(p12, p10, p11, makeFieldFunctionOptions(p9, nil, {
		typename = typename,
		fieldName = field.name.value,
		field = field,
		variables = p13.variables
	}, p13, p14 or {}))
end

t.Policies = t_1

makeFieldFunctionOptions = function(p9, p10, p11, p12, p13)
	-- upvalues: fieldNameFromStoreName (ref), argumentsObjectFromField (ref), isReference (ref), object (ref), hasOwnPropertyModule (ref), invariant (ref), stringifyForDisplay (ref), array (ref), makeMergeObjectsFunction (write)
	local var15 = p9:getStoreFieldName(p11)
	local variables = p11.variables or p12.variables
	
	return {
		args = if p11.args ~= nil then if p11.field then argumentsObjectFromField(p11.field, p11.variables) else nil else p11.args,
		field = p11.field or nil,
		fieldName = fieldNameFromStoreName(var15),
		storeFieldName = var15,
		variables = variables,
		isReference = function(_, ...)
			-- upvalues: isReference (copy)
			return isReference(...)
		end,
		toReference = p12.store.toReference,
		storage = p13,
		cache = p9.cache,
		canRead = p12.store.canRead,
		readField = function(_, p14, ...)
			-- upvalues: object (copy), p10 (ref), hasOwnPropertyModule (copy), invariant (copy), stringifyForDisplay (copy), array (copy), variables (ref), p9 (ref), p12 (ref)
			local var16 = type(p14)
			local list = {
				if var16 == "table" then object.assign(table.clone(p14), if p14.from == object.None then { from = "<Object.None>" } else nil) else p14,
				if select("#", ...) >= 1 then "<nil>" else nil
			}
			local var17 = nil
			
			if var16 == "string" then
				var17 = {
					fieldName = p14,
					from = if select("#", ...) >= 1 then ... else p10
				}
			elseif var16 ~= "table" then
				invariant.warn(("Unexpected readField arguments: %s"):format(stringifyForDisplay(array.from(list))))
				
				return
			end
			var17 = object.assign({}, p14)
			
			if not hasOwnPropertyModule(p14, "from") then
				var17.from = p10
			end
			if _G.__DEV__ and var17.from == nil then
				invariant.warn(("Undefined 'from' passed to readField with arguments %s"):format(stringifyForDisplay(array.from(list))))
			end
			if var17.variables == nil then
				var17.variables = variables
			end
			return p9:readField(var17, p12)
		end,
		mergeObjects = makeMergeObjectsFunction(p12.store)
	}
end

makeMergeObjectsFunction = function(p14)
	-- upvalues: array (ref), invariantError (ref), isNonNullObject (ref), isReference (ref), storeValueIsStoreObject (ref), object (ref)
	return function(_, p15, p16)
		-- upvalues: array (copy), invariantError (copy), isNonNullObject (copy), p14 (ref), isReference (copy), storeValueIsStoreObject (copy), object (copy)
		if array.isArray(p15) or array.isArray(p16) then
			error(invariantError.new("Cannot automatically merge arrays"))
		end
		if isNonNullObject(p15) and isNonNullObject(p16) then
			local var16 = p14:getFieldValue(p15, "__typename")
			local var17 = p14:getFieldValue(p16, "__typename")
			
			if var16 ~= nil and (var17 ~= nil and var16 ~= var17) then
				return p16
			elseif isReference(p15) and storeValueIsStoreObject(p16) then
				p14:merge(p15.__ref, p16)
				
				return p15
			elseif storeValueIsStoreObject(p15) and isReference(p16) then
				p14:merge(p15, p16.__ref)
				
				return p16
			end
			return if storeValueIsStoreObject(p15) and storeValueIsStoreObject(p16) then object.assign({}, p15, p16) else p16
		end
	end
end

local function keyObjEncode(p14, p15)
	-- upvalues: array (ref), keyObjEncode (ref), httpService (ref)
	assert(typeof(p15) == "table", "specifier must be an array")
	
	return if next(p15) then "{" .. array.join(array.filter(array.map(p15, function(p16, p17)
		-- upvalues: array (copy), p14 (ref), p15 (ref), keyObjEncode (copy), httpService (copy)
		if array.isArray(p16) then
			return ""
		end
		local _ = nil
		
		return if p14[p16] then if p17 < #p15 then httpService:JSONEncode(p16) .. ":" .. (if array.isArray(p15[p17 + 1]) then keyObjEncode(p14[p16], p15[p17 + 1]) else httpService:JSONEncode(p14[p16])) else httpService:JSONEncode(p16) .. ":" .. httpService:JSONEncode(p14[p16]) else ""
	end), function(p16)
		return p16 ~= ""
	end), ",") .. "}" else "[]"
end

keyArgsFnFromSpecifier = function(p14)
	-- upvalues: keyObjEncode (ref), computeKeyObject (write)
	return function(p15, p16)
		-- upvalues: keyObjEncode (copy), computeKeyObject (copy), p14 (ref)
		return if p15 then ("%s:%s"):format(p16.fieldName, keyObjEncode(computeKeyObject(p15, p14, false), p14)) else p16.fieldName
	end
end

keyFieldsFnFromSpecifier = function(p14)
	-- upvalues: trie (ref), canUseWeakMap (ref), makeAliasMap (write), computeKeyObject (write), keyObjEncode (ref)
	local var16 = trie.new(canUseWeakMap)
	
	return function(_, p15, p16)
		-- upvalues: var16 (ref), makeAliasMap (copy), computeKeyObject (copy), p14 (ref), keyObjEncode (copy)
		local aliasMap = nil
		
		if p16.selectionSet and p16.fragmentMap then
			local var17 = var16:lookupArray({ p16.selectionSet, p16.fragmentMap })
			
			if var17.aliasMap then
				aliasMap = var17.aliasMap
			else
				var17.aliasMap = makeAliasMap(p16.selectionSet, p16.fragmentMap)
				aliasMap = var17.aliasMap
			end
		end
		p16.keyObject = computeKeyObject(p15, p14, true, aliasMap)
		
		return ("%s:%s"):format(p16.typename or "null", keyObjEncode(p16.keyObject, p14))
	end
end

makeAliasMap = function(p14, p15)
	-- upvalues: set (ref), array (ref), isField (ref), makeAliasMap (write), getFragmentFromSelection (ref)
	local t = {}
	local var16 = set.new({ p14 })
	
	for i, v in var16 do
		array.forEach(v.selections, function(p16)
			-- upvalues: isField (copy), t (ref), makeAliasMap (copy), p15 (ref), getFragmentFromSelection (copy), var16 (ref)
			if isField(p16) then
				if p16.alias then
					local value = p16.alias.value
					local value_1 = p16.name.value
					
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
				if not p16.selectionSet then return end
				local subsets
				local _ = nil
				
				if t.subsets then
					subsets = t.subsets
				else
					t.subsets = {}
					subsets = t.subsets
				end
				subsets[p16.name.value] = makeAliasMap(p16.selectionSet, p15)
				
				return
			else
				local var17 = getFragmentFromSelection(p16, p15)
				
				if var17 then
					var16:add(var17.selectionSet)
				end
			end
		end)
	end
	return t
end

computeKeyObject = function(p16, p17, p18, p19)
	-- upvalues: computeKeyObject (write), hasOwnPropertyModule (ref), invariant (ref)
	local t = {}
	local var17 = nil
	
	for i, v in p17 do
		local var18
		if type(v) == "table" then
			if type(var17) == "string" then
				var18 = p19 and p19.subsets
				t[var17] = computeKeyObject(p16[var17], v, p18, var18 and var18[var17])
			end
		end
		var18 = p19 and p19.aliases
		local _ = nil
		local var19 = if var18 and var18[v] then var18[v] else v
		
		if hasOwnPropertyModule(p16, var19) then
			var17 = v
			t[var17] = p16[var19]
		else
			invariant(not p18, ("Missing field '%s' while computing key fields"):format(var19))
			var17 = nil
		end
	end
	return t
end

t.None = object.None

return t