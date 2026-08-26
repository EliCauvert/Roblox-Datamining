local dEV = _G.__DEV__
local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local array = luauPolyfillModule.Array
local NULL = require(parent.utilities).NULL
local httpService = game:GetService("HttpService")
local _ = require(parent_1.GraphQL)
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local equalModule = require(parent.jsutils.equal)
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local utilitiesModule = require(parent.utilities)
local createFragmentMap = utilitiesModule.createFragmentMap
local getFragmentFromSelection = utilitiesModule.getFragmentFromSelection
local getDefaultValues = utilitiesModule.getDefaultValues
local getFragmentDefinitions = utilitiesModule.getFragmentDefinitions
local getOperationDefinition = utilitiesModule.getOperationDefinition
local getTypenameFromResult = utilitiesModule.getTypenameFromResult
local makeReference = utilitiesModule.makeReference
local isField = utilitiesModule.isField
local resultKeyNameFromField = utilitiesModule.resultKeyNameFromField
local isReference = utilitiesModule.isReference
local shouldInclude = utilitiesModule.shouldInclude
local cloneDeep = utilitiesModule.cloneDeep
local addTypenameToDocument = utilitiesModule.addTypenameToDocument
local _ = require(script.Parent.types)
local helpersModule = require(script.Parent.helpers)
local makeProcessedFieldsMerger = helpersModule.makeProcessedFieldsMerger
local fieldNameFromStoreName = helpersModule.fieldNameFromStoreName
local storeValueIsStoreObject = helpersModule.storeValueIsStoreObject
local _ = require(script.Parent.entityStore)
local _ = require(script.Parent.Parent.core.types.Cache)
local canonicalStringify = require(script.Parent["object-canon"]).canonicalStringify
local _ = require(script.Parent.writeToStore_types)
local warnAboutDataLoss = nil
local getChildMergeTree = nil
local maybeRecycleChildMergeTree = nil
local mergeMergeTrees = nil
local mergeTreeIsEmpty = nil
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.cache = p1
	tbl.reader = p2
	
	return tbl
end

function t_1:writeToStore(p1, p2)
	-- upvalues: getOperationDefinition (ref), makeProcessedFieldsMerger (ref), object (ref), getDefaultValues (ref), canonicalStringify (ref), createFragmentMap (ref), getFragmentDefinitions (ref), map (ref), isReference (ref), invariantError (ref), httpService (ref), makeReference (ref), dEV (ref), fieldNameFromStoreName (ref), set (ref), isField (ref), objectKeysForEachModule (ref), warnAboutDataLoss (write)
	local query = p2.query
	local result = p2.result
	local dataId = p2.dataId
	local variables = p2.variables
	local overwrite = p2.overwrite
	local var1 = getOperationDefinition(query)
	local var2 = makeProcessedFieldsMerger()
	local var3 = object.assign(getDefaultValues(var1), variables)
	var3 = {
		clientOnly = false,
		store = p1,
		written = {},
		merge = function(p3, p4)
			-- upvalues: var2 (ref)
			return var2:merge(p3, p4)
		end,
		variables = var3,
		varString = canonicalStringify(var3),
		fragmentMap = createFragmentMap(getFragmentDefinitions(query)),
		overwrite = overwrite or false,
		incomingById = map.new(nil)
	}
	local var4 = self:processSelectionSet({
		result = result or {},
		dataId = dataId,
		selectionSet = var1.selectionSet,
		mergeTree = { map = map.new(nil) },
		context = var3
	})
	
	if not isReference(var4) then
		error(invariantError.new(("Could not identify object %s"):format(httpService:JSONEncode(result))))
	end
	var3.incomingById:forEach(function(p3, p4)
		-- upvalues: makeReference (copy), self (ref), var3 (ref), isReference (copy), dEV (copy), fieldNameFromStoreName (copy), set (copy), isField (copy), objectKeysForEachModule (copy), warnAboutDataLoss (copy), p1 (ref)
		local fields = p3.fields
		local mergeTree = p3.mergeTree
		local selections = p3.selections
		local var5 = makeReference(p4)
		
		if mergeTree.map.size > 0 then
			local var6 = self:applyMerges(mergeTree, var5, fields, var3)
			
			if isReference(var6) then return end
			fields = var6
		end
		if dEV and not var3.overwrite then
			local var7 = nil
			
			local function _(value)
				-- upvalues: var7 (write), fieldNameFromStoreName (copy)
				return var7:has(fieldNameFromStoreName(value))
			end
			
			var7 = set.new()
			selections:forEach(function(p5)
				-- upvalues: isField (copy), var7 (write)
				if isField(p5) and p5.selectionSet then
					var7:add(p5.name.value)
				end
			end)
			
			local _ = function(p5)
				-- upvalues: mergeTree (ref)
				local var8 = mergeTree.map:get(p5)
				
				return var8 ~= nil and (var8.info ~= nil and var8.info.merge ~= nil)
			end
			
			objectKeysForEachModule(fields, function(p5)
				-- upvalues: var7 (write), fieldNameFromStoreName (copy), mergeTree (ref), warnAboutDataLoss (copy), var5 (ref), fields (write), var3 (copy)
				if var7:has(fieldNameFromStoreName(p5)) then
					local var8 = mergeTree.map:get(p5)
					
					if not (var8 ~= nil and (var8.info ~= nil and var8.info.merge ~= nil)) then
						warnAboutDataLoss(var5, fields, p5, var3.store)
					end
				end
			end)
		end
		p1:merge(p4, fields)
	end)
	p1:retain(var4.__ref)
	
	return var4
end

function t_1:processSelectionSet(p1)
	-- upvalues: makeReference (ref), array (ref), getTypenameFromResult (ref), set (ref), shouldInclude (ref), isField (ref), resultKeyNameFromField (ref), getChildMergeTree (write), isReference (ref), maybeRecycleChildMergeTree (write), addTypenameToDocument (ref), invariant (ref), httpService (ref), getFragmentFromSelection (ref), mergeMergeTrees (write)
	local dataId = p1.dataId
	local result = p1.result
	local selectionSet = p1.selectionSet
	local context = p1.context
	local mergeTree = p1.mergeTree
	local policies = self.cache.policies
	local unpacked, unpacked_1 = table.unpack(policies:identify(result, selectionSet, context.fragmentMap), 1, 2)
	dataId = dataId or unpacked
	
	if type(dataId) == "string" then
		local var1
		local _ = nil
		
		if context.written[dataId] == nil then
			var1 = {}
			context.written[dataId] = var1
		else
			var1 = context.written[dataId]
		end
		local var2 = makeReference(dataId)
		
		if array.indexOf(var1, selectionSet) >= 1 then
			return var2
		end
		table.insert(var1, selectionSet)
		
		if self.reader ~= nil and self.reader:isFresh(result, var2, selectionSet, context) then
			return var2
		end
	end
	local t = {}
	
	if unpacked_1 ~= nil then
		t = context.merge(t, unpacked_1)
	end
	local var3 = (dataId and policies.rootTypenamesById[dataId]) or (getTypenameFromResult(result, selectionSet, context.fragmentMap) or (dataId and context.store:get(dataId, "__typename")))
	
	if type(var3) == "string" then
		t.__typename = var3
	end
	local var4 = set.new(selectionSet.selections)
	
	for i, v in var4 do
		if shouldInclude(v, context.variables) then
			if isField(v) then
				local var5 = result[resultKeyNameFromField(v)]
				local clientOnly = context.clientOnly
				context.clientOnly = clientOnly or v.directives and array.some(v.directives, function(p2)
					return p2.name.value == "client"
				end)
				
				if var5 ~= nil then
					local var6 = policies:getStoreFieldName({
						typename = var3,
						fieldName = v.name.value,
						field = v,
						variables = context.variables
					})
					local var7 = getChildMergeTree(mergeTree, var6)
					local var8 = self:processFieldValue(var5, v, context, var7)
					local var9 = nil
					
					if v.selectionSet ~= nil then
						var9 = context.store:getFieldValue(var8, "__typename")
						
						if not var9 and isReference(var8) then
							local ref = context.incomingById:get(var8.__ref)
							var9 = if ref ~= nil then nil else ref.fields.__typename
						end
					end
					local var10 = policies:getMergeFunction(var3, v.name.value, var9)
					
					if var10 == nil then
						maybeRecycleChildMergeTree(mergeTree, var6)
					else
						var7.info = { field = v, typename = var3, merge = var10 }
					end
					t = context.merge(t, { [var6] = var8 })
				elseif not context.clientOnly and not addTypenameToDocument:added(v) then
					invariant.error(string.sub(("Missing field '%s' while writing result %s"):format(resultKeyNameFromField(v), httpService:JSONEncode(result)), 1, 1000))
				end
				context.clientOnly = clientOnly
			else
				local var11 = getFragmentFromSelection(v, context.fragmentMap)
				
				if var11 and policies:fragmentMatches(var11, var3, result, context.variables) then
					array.forEach(var11.selectionSet.selections, var4.add, var4)
				end
			end
		end
	end
	if type(dataId) ~= "string" then
		return t
	end
	local var12 = context.incomingById:get(dataId)
	
	if var12 then
		var12.fields = context.merge(var12.fields, t)
		var12.mergeTree = mergeMergeTrees(var12.mergeTree, mergeTree)
		var12.selections:forEach(var4.add, var4)
		var12.selections = var4
	else
		context.incomingById:set(dataId, { fields = t, mergeTree = mergeTree, selections = var4 })
	end
	return makeReference(dataId)
end

function t_1:processFieldValue(p2, p3, p4, p5)
	-- upvalues: NULL (ref), dEV (ref), cloneDeep (ref), array (ref), getChildMergeTree (write), maybeRecycleChildMergeTree (write)
	return if p3.selectionSet and p2 ~= NULL then if array.isArray(p2) then array.map(p2, function(p6, p7)
		-- upvalues: self (ref), p3 (ref), p4 (ref), getChildMergeTree (copy), p5 (ref), maybeRecycleChildMergeTree (copy)
		local var13 = self:processFieldValue(p6, p3, p4, getChildMergeTree(p5, p7))
		maybeRecycleChildMergeTree(p5, p7)
		
		return var13
	end) else self:processSelectionSet({
		result = p2,
		selectionSet = p3.selectionSet,
		context = p4,
		mergeTree = p5
	}) elseif dEV then cloneDeep(p2) else p2
end

function t_1:applyMerges(p2, p3, p4, p5, p6)
	-- upvalues: isReference (ref), array (ref), storeValueIsStoreObject (ref), map (ref), invariant (ref), boolean (ref)
	if p2.map.size > 0 and not isReference(p4) then
		local var13 = if not array.isArray(p4) and (isReference(p3) or storeValueIsStoreObject(p3)) then p3 else nil
		local var14 = p4
		
		if var13 ~= nil and not p6 then
			p6 = if isReference(var13) then { var13.__ref } else { var13 }
		end
		local var15 = nil
		
		local function _(p7, p8)
			-- upvalues: array (copy), p5 (ref)
			return if array.isArray(p7) then if typeof(p8) == "number" then p7[p8] else nil else p5.store:getFieldValue(p7, tostring(p8))
		end
		
		p2.map:forEach(function(p7, p8)
			-- upvalues: var13 (ref), array (copy), p5 (ref), var14 (ref), p6 (write), self (ref), var15 (write), map (copy), invariant (copy)
			local var16 = if array.isArray(var13) then if typeof(p8) == "number" then var13[p8] else nil else p5.store:getFieldValue(var13, tostring(p8))
			local var17 = if array.isArray(var14) then if typeof(p8) == "number" then var14[p8] else nil else p5.store:getFieldValue(var14, tostring(p8))
			
			if var17 == nil then return end
			if p6 ~= nil then
				table.insert(p6, p8)
			end
			local var18 = self:applyMerges(p7, var16, var17, p5, p6)
			
			if var18 ~= var17 then
				var15 = var15 or map.new(nil)
				var15:set(p8, var18)
			end
			if p6 ~= nil then
				invariant(table.remove(p6, #p6) == p8)
			end
		end)
		
		if var15 ~= nil then
			p4 = table.clone(var14)
			var15:forEach(function(p7, p8)
				-- upvalues: p4 (write)
				p4[p8] = p7
			end)
		end
	end
	return if p2.info then self.cache.policies:runMergeFunction(p3, p4, p2.info, p5, boolean.toJSBoolean(p6) and p5.store:getStorage(table.unpack(p6)) or nil) else p4
end

t.StoreWriter = t_1
local t_2 = {}

getChildMergeTree = function(p2, p3)
	-- upvalues: t_2 (ref), map (ref)
	local map_1 = p2.map
	
	if not map_1:has(p3) then
		map_1:set(p3, table.remove(t_2, #t_2) or { map = map.new(nil) })
	end
	return map_1:get(p3)
end

mergeMergeTrees = function(p2, p3)
	-- upvalues: mergeTreeIsEmpty (write), object (ref), map (ref), set (ref), mergeMergeTrees (write)
	if p2 == p3 or p3 == nil or mergeTreeIsEmpty(p3) then
		return p2
	elseif p2 == nil or mergeTreeIsEmpty(p2) then
		return p3
	end
	local var13 = if p2.map.size > 0 then p3.map.size else p2.map.size
	local t = {
		info = if p2.info and p3.info then object.assign(table.clone(p2.info), p3.info) else p2.info or p3.info,
		map = if var13 > 0 then map.new() elseif p2.map.size > 0 then p2.map else p3.map
	}
	
	if var13 > 0 then
		local var14 = set.new(p3.map:keys())
		p2.map:forEach(function(p4, p5)
			-- upvalues: t (ref), mergeMergeTrees (copy), p3 (ref), var14 (ref)
			t.map:set(p5, mergeMergeTrees(p4, p3.map:get(p5)))
			var14:delete(p5)
		end)
		var14:forEach(function(p4)
			-- upvalues: t (ref), mergeMergeTrees (copy), p3 (ref), p2 (ref)
			t.map:set(p4, mergeMergeTrees(p3.map:get(p4), p2.map:get(p4)))
		end)
	end
	return t
end

mergeTreeIsEmpty = function(p2)
	local var13 = not p2
	
	if not var13 then
		var13 = not (p2.info or p2.map.size > 0)
	end
	return var13
end

maybeRecycleChildMergeTree = function(p2, p3)
	-- upvalues: mergeTreeIsEmpty (write), t_2 (ref)
	local map = p2.map
	local var13 = map:get(p3)
	
	if var13 ~= nil and mergeTreeIsEmpty(var13) then
		table.insert(t_2, var13)
		map:delete(p3)
	end
end

local var13 = set.new()

warnAboutDataLoss = function(p2, p3, p4, p5)
	-- upvalues: isReference (ref), equalModule (ref), array (ref), object (ref), boolean (ref), fieldNameFromStoreName (ref), var13 (ref), invariant (ref), httpService (ref)
	local function _(p6)
		-- upvalues: p5 (ref), p4 (ref)
		local var14 = p5:getFieldValue(p6, p4)
		
		return typeof(var14) == "table" and var14
	end
	
	local var14 = p5:getFieldValue(p2, p4)
	local var15 = typeof(var14) == "table" and var14
	
	if not var15 then return end
	local var16 = p5:getFieldValue(p3, p4)
	local var17 = typeof(var16) == "table" and var16
	
	if not var17 then return end
	if isReference(var15) then return end
	if equalModule(var15, var17) then return end
	if array.every(object.keys(var15), function(p6)
		-- upvalues: p5 (ref), var17 (ref)
		return p5:getFieldValue(var17, p6) ~= nil
	end) then return end
	local var18 = p5:getFieldValue(p2, "__typename")
	local var19 = if boolean.toJSBoolean(var18) then var18 else p5:getFieldValue(p3, "__typename")
	local var20 = fieldNameFromStoreName(p4)
	local var21 = ("%s.%s"):format(var19, var20)
	
	if var13:has(var21) then return end
	var13:add(var21)
	local t = {}
	
	if not array.isArray(var15) and not array.isArray(var17) then
		array.forEach({ var15, var17 }, function(p6)
			-- upvalues: p5 (ref), array (copy), t (ref)
			local var22 = p5:getFieldValue(p6, "__typename")
			
			if typeof(var22) == "string" and not array.includes(t, var22) then
				table.insert(t, var22)
			end
		end)
	end
	invariant.warn(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(var20, var19, if boolean.toJSBoolean(#t) then "either ensure all objects of type " .. array.join(t, " and ") .. " have an ID or a custom merge function, or " else "", var21, string.sub(httpService:JSONEncode(var15), 1, 1000), string.sub(httpService:JSONEncode(var17), 1, 1000)))
end

return t