-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:14 2026 Pacific Standard Time.

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

function t_1.new(p0, p1) --[[ line: 138 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.cache = p0
	tbl.reader = p1
	
	return tbl
end

function t_1:writeToStore(p2, p3) --[[ line: 145 ]]
	-- upvalues: getOperationDefinition (ref), makeProcessedFieldsMerger (ref), object (ref), getDefaultValues (ref), canonicalStringify (ref), createFragmentMap (ref), getFragmentDefinitions (ref), map (ref), isReference (ref), invariantError (ref), httpService (ref), makeReference (ref), dEV (ref), fieldNameFromStoreName (ref), set (ref), isField (ref), objectKeysForEachModule (ref), warnAboutDataLoss (write)
	local query = p3.query
	local result = p3.result
	local dataId = p3.dataId
	local variables = p3.variables
	local overwrite = p3.overwrite
	local var17 = getOperationDefinition(query)
	local var18 = makeProcessedFieldsMerger()
	local var19 = object.assign(getDefaultValues(var17), variables)
	var19 = {
		clientOnly = false,
		store = p2,
		written = {},
		merge = function(p4, p5) --[[ line: 159 ]]
			-- upvalues: var18 (ref)
			return var18:merge(p4, p5)
		end,
		variables = var19,
		varString = canonicalStringify(var19),
		fragmentMap = createFragmentMap(getFragmentDefinitions(query)),
		overwrite = overwrite or false,
		incomingById = map.new(nil)
	}
	local var20 = self:processSelectionSet({
		result = result or {},
		dataId = dataId,
		selectionSet = var17.selectionSet,
		mergeTree = { map = map.new(nil) },
		context = var19
	})
	
	if not isReference(var20) then
		error(invariantError.new(("Could not identify object %s"):format(httpService:JSONEncode(result))))
	end
	var19.incomingById:forEach(function(p6, p7) --[[ line: 192 ]]
		-- upvalues: makeReference (copy), self (ref), var19 (ref), isReference (copy), dEV (copy), fieldNameFromStoreName (copy), set (copy), isField (copy), objectKeysForEachModule (copy), warnAboutDataLoss (copy), p2 (ref)
		local fields = p6.fields
		local mergeTree = p6.mergeTree
		local selections = p6.selections
		local var21 = makeReference(p7)
		
		if mergeTree.map.size > 0 then
			local var22 = self:applyMerges(mergeTree, var21, fields, var19)
			
			if isReference(var22) then return end
			fields = var22
		end
		if dEV and not var19.overwrite then
			local var23 = nil
			
			local function _(value) --[[ line: 215 | named "hasSelectionSet" ]]
				-- upvalues: var23 (write), fieldNameFromStoreName (copy)
				return var23:has(fieldNameFromStoreName(value))
			end
			
			var23 = set.new()
			selections:forEach(function(p8) --[[ line: 219 ]]
				-- upvalues: isField (copy), var23 (write)
				if isField(p8) and p8.selectionSet then
					var23:add(p8.name.value)
				end
			end)
			
			local _ = function(p9) --[[ line: 227 | named "hasMergeFunction" ]]
				-- upvalues: mergeTree (ref)
				local var24 = mergeTree.map:get(p9)
				
				return var24 ~= nil and (var24.info ~= nil and var24.info.merge ~= nil)
			end
			
			objectKeysForEachModule(fields, function(p10) --[[ line: 233 ]]
				-- upvalues: var23 (write), fieldNameFromStoreName (copy), mergeTree (ref), warnAboutDataLoss (copy), var21 (ref), fields (write), var19 (copy)
				if var23:has(fieldNameFromStoreName(p10)) then
					local var25 = mergeTree.map:get(p10)
					
					if not (var25 ~= nil and (var25.info ~= nil and var25.info.merge ~= nil)) then
						warnAboutDataLoss(var21, fields, p10, var19.store)
					end
				end
			end)
		end
		p2:merge(p7, fields)
	end)
	p2:retain(var20.__ref)
	
	return var20
end

function t_1:processSelectionSet(p11) --[[ line: 258 ]]
	-- upvalues: makeReference (ref), array (ref), getTypenameFromResult (ref), set (ref), shouldInclude (ref), isField (ref), resultKeyNameFromField (ref), getChildMergeTree (write), isReference (ref), maybeRecycleChildMergeTree (write), addTypenameToDocument (ref), invariant (ref), httpService (ref), getFragmentFromSelection (ref), mergeMergeTrees (write)
	local dataId = p11.dataId
	local result = p11.result
	local selectionSet = p11.selectionSet
	local context = p11.context
	local mergeTree = p11.mergeTree
	local policies = self.cache.policies
	local unpacked, unpacked_1 = table.unpack(policies:identify(result, selectionSet, context.fragmentMap), 1, 2)
	dataId = dataId or unpacked
	
	if type(dataId) == "string" then
		local var28
		local _ = nil
		
		if context.written[dataId] == nil then
			var28 = {}
			context.written[dataId] = var28
		else
			var28 = context.written[dataId]
		end
		local var29 = makeReference(dataId)
		
		if array.indexOf(var28, selectionSet) >= 1 then
			return var29
		end
		table.insert(var28, selectionSet)
		
		if self.reader ~= nil and self.reader:isFresh(result, var29, selectionSet, context) then
			return var29
		end
	end
	local t = {}
	
	if unpacked_1 ~= nil then
		t = context.merge(t, unpacked_1)
	end
	local var31 = (dataId and policies.rootTypenamesById[dataId]) or (getTypenameFromResult(result, selectionSet, context.fragmentMap) or (dataId and context.store:get(dataId, "__typename")))
	
	if type(var31) == "string" then
		t.__typename = var31
	end
	local var32 = set.new(selectionSet.selections)
	
	for i, v in var32 do
		if shouldInclude(v, context.variables) then
			if isField(v) then
				local var34 = result[resultKeyNameFromField(v)]
				local clientOnly = context.clientOnly
				context.clientOnly = clientOnly or v.directives and array.some(v.directives, function(p12) --[[ line: 351 ]]
					return p12.name.value == "client"
				end)
				
				if var34 ~= nil then
					local var35 = policies:getStoreFieldName({
						typename = var31,
						fieldName = v.name.value,
						field = v,
						variables = context.variables
					})
					local var36 = getChildMergeTree(mergeTree, var35)
					local var37 = self:processFieldValue(var34, v, context, var36)
					local var38 = nil
					
					if v.selectionSet ~= nil then
						var38 = context.store:getFieldValue(var37, "__typename")
						
						if not var38 and isReference(var37) then
							local ref = context.incomingById:get(var37.__ref)
							var38 = if ref ~= nil then nil else ref.fields.__typename
						end
					end
					local var40 = policies:getMergeFunction(var31, v.name.value, var38)
					
					if var40 == nil then
						maybeRecycleChildMergeTree(mergeTree, var35)
					else
						var36.info = { field = v, typename = var31, merge = var40 }
					end
					t = context.merge(t, { [var35] = var37 })
				elseif not context.clientOnly and not addTypenameToDocument:added(v) then
					invariant.error(string.sub(("Missing field '%s' while writing result %s"):format(resultKeyNameFromField(v), httpService:JSONEncode(result)), 1, 1000))
				end
				context.clientOnly = clientOnly
			else
				local var41 = getFragmentFromSelection(v, context.fragmentMap)
				
				if var41 and policies:fragmentMatches(var41, var31, result, context.variables) then
					array.forEach(var41.selectionSet.selections, var32.add, var32)
				end
			end
		end
	end
	if type(dataId) ~= "string" then
		return t
	end
	local var33 = context.incomingById:get(dataId)
	
	if var33 then
		var33.fields = context.merge(var33.fields, t)
		var33.mergeTree = mergeMergeTrees(var33.mergeTree, mergeTree)
		var33.selections:forEach(var32.add, var32)
		var33.selections = var32
	else
		context.incomingById:set(dataId, { fields = t, mergeTree = mergeTree, selections = var32 })
	end
	return makeReference(dataId)
end

function t_1:processFieldValue(p13, p14, p15, p16) --[[ line: 497 ]]
	-- upvalues: NULL (ref), dEV (ref), cloneDeep (ref), array (ref), getChildMergeTree (write), maybeRecycleChildMergeTree (write)
	return if p14.selectionSet and p13 ~= NULL then if array.isArray(p13) then array.map(p13, function(p17, p18) --[[ line: 517 ]]
		-- upvalues: self (ref), p14 (ref), p15 (ref), getChildMergeTree (copy), p16 (ref), maybeRecycleChildMergeTree (copy)
		local var42 = self:processFieldValue(p17, p14, p15, getChildMergeTree(p16, p18))
		maybeRecycleChildMergeTree(p16, p18)
		
		return var42
	end) else self:processSelectionSet({
		result = p13,
		selectionSet = p14.selectionSet,
		context = p15,
		mergeTree = p16
	}) elseif dEV then cloneDeep(p13) else p13
end

function t_1:applyMerges(p19, p20, p21, p22, p23) --[[ line: 532 ]]
	-- upvalues: isReference (ref), array (ref), storeValueIsStoreObject (ref), map (ref), invariant (ref), boolean (ref)
	if p19.map.size > 0 and not isReference(p21) then
		local var43 = if not array.isArray(p21) and (isReference(p20) or storeValueIsStoreObject(p20)) then p20 else nil
		local var44 = p21
		
		if var43 ~= nil and not p23 then
			p23 = if isReference(var43) then { var43.__ref } else { var43 }
		end
		local var45 = nil
		
		local function _(p24, p25) --[[ line: 590 | named "getValue" ]]
			-- upvalues: array (copy), p22 (ref)
			return if array.isArray(p24) then if typeof(p25) == "number" then p24[p25] else nil else p22.store:getFieldValue(p24, tostring(p25))
		end
		
		p19.map:forEach(function(p26, p27) --[[ line: 602 ]]
			-- upvalues: var43 (ref), array (copy), p22 (ref), var44 (ref), p23 (write), self (ref), var45 (write), map (copy), invariant (copy)
			local var46 = if array.isArray(var43) then if typeof(p27) == "number" then var43[p27] else nil else p22.store:getFieldValue(var43, tostring(p27))
			local var47 = if array.isArray(var44) then if typeof(p27) == "number" then var44[p27] else nil else p22.store:getFieldValue(var44, tostring(p27))
			
			if var47 == nil then return end
			if p23 ~= nil then
				table.insert(p23, p27)
			end
			local var48 = self:applyMerges(p26, var46, var47, p22, p23)
			
			if var48 ~= var47 then
				var45 = var45 or map.new(nil)
				var45:set(p27, var48)
			end
			if p23 ~= nil then
				invariant(table.remove(p23, #p23) == p27)
			end
		end)
		
		if var45 ~= nil then
			p21 = table.clone(var44)
			var45:forEach(function(p28, p29) --[[ line: 631 ]]
				-- upvalues: p21 (write)
				p21[p29] = p28
			end)
		end
	end
	return if p19.info then self.cache.policies:runMergeFunction(p20, p21, p19.info, p22, boolean.toJSBoolean(p23) and p22.store:getStorage(table.unpack(p23)) or nil) else p21
end

t.StoreWriter = t_1
local t_2 = {}

getChildMergeTree = function(p30, p31) --[[ line: 656 | named "getChildMergeTree" ]]
	-- upvalues: t_2 (ref), map (ref)
	local map_1 = p30.map
	
	if not map_1:has(p31) then
		map_1:set(p31, table.remove(t_2, #t_2) or { map = map.new(nil) })
	end
	return map_1:get(p31)
end

mergeMergeTrees = function(p32, p33) --[[ line: 666 | named "mergeMergeTrees" ]]
	-- upvalues: mergeTreeIsEmpty (write), object (ref), map (ref), set (ref), mergeMergeTrees (write)
	if p32 == p33 or p33 == nil or mergeTreeIsEmpty(p33) then
		return p32
	elseif p32 == nil or mergeTreeIsEmpty(p32) then
		return p33
	end
	local var49 = if p32.map.size > 0 then p33.map.size else p32.map.size
	local t = {
		info = if p32.info and p33.info then object.assign(table.clone(p32.info), p33.info) else p32.info or p33.info,
		map = if var49 > 0 then map.new() elseif p32.map.size > 0 then p32.map else p33.map
	}
	
	if var49 > 0 then
		local var51 = set.new(p33.map:keys())
		p32.map:forEach(function(p34, p35) --[[ line: 696 ]]
			-- upvalues: t (ref), mergeMergeTrees (copy), p33 (ref), var51 (ref)
			t.map:set(p35, mergeMergeTrees(p34, p33.map:get(p35)))
			var51:delete(p35)
		end)
		var51:forEach(function(p36) --[[ line: 701 ]]
			-- upvalues: t (ref), mergeMergeTrees (copy), p33 (ref), p32 (ref)
			t.map:set(p36, mergeMergeTrees(p33.map:get(p36), p32.map:get(p36)))
		end)
	end
	return t
end

mergeTreeIsEmpty = function(p37) --[[ line: 712 | named "mergeTreeIsEmpty" ]]
	local var52 = not p37
	
	if not var52 then
		var52 = not (p37.info or p37.map.size > 0)
	end
	return var52
end

maybeRecycleChildMergeTree = function(p38, p39) --[[ line: 718 | named "maybeRecycleChildMergeTree" ]]
	-- upvalues: mergeTreeIsEmpty (write), t_2 (ref)
	local map = p38.map
	local var53 = map:get(p39)
	
	if var53 ~= nil and mergeTreeIsEmpty(var53) then
		table.insert(t_2, var53)
		map:delete(p39)
	end
end

local var15 = set.new()

warnAboutDataLoss = function(p40, p41, p42, p43) --[[ line: 733 | named "warnAboutDataLoss" ]]
	-- upvalues: isReference (ref), equalModule (ref), array (ref), object (ref), boolean (ref), fieldNameFromStoreName (ref), var15 (ref), invariant (ref), httpService (ref)
	local function _(p44) --[[ line: 740 | named "getChild" ]]
		-- upvalues: p43 (ref), p42 (ref)
		local var63 = p43:getFieldValue(p44, p42)
		
		return typeof(var63) == "table" and var63
	end
	
	local var54 = p43:getFieldValue(p40, p42)
	local var55 = typeof(var54) == "table" and var54
	
	if not var55 then return end
	local var56 = p43:getFieldValue(p41, p42)
	local var57 = typeof(var56) == "table" and var56
	
	if not var57 then return end
	if isReference(var55) then return end
	if equalModule(var55, var57) then return end
	if array.every(object.keys(var55), function(p45) --[[ line: 771 ]]
		-- upvalues: p43 (ref), var57 (ref)
		return p43:getFieldValue(var57, p45) ~= nil
	end) then return end
	local var58 = p43:getFieldValue(p40, "__typename")
	local var59 = if boolean.toJSBoolean(var58) then var58 else p43:getFieldValue(p41, "__typename")
	local var60 = fieldNameFromStoreName(p42)
	local var61 = ("%s.%s"):format(var59, var60)
	
	if var15:has(var61) then return end
	var15:add(var61)
	local t = {}
	
	if not array.isArray(var55) and not array.isArray(var57) then
		array.forEach({ var55, var57 }, function(p46) --[[ line: 794 ]]
			-- upvalues: p43 (ref), array (copy), t (ref)
			local var64 = p43:getFieldValue(p46, "__typename")
			
			if typeof(var64) == "string" and not array.includes(t, var64) then
				table.insert(t, var64)
			end
		end)
	end
	invariant.warn(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(var60, var59, if boolean.toJSBoolean(#t) then "either ensure all objects of type " .. array.join(t, " and ") .. " have an ID or a custom merge function, or " else "", var61, string.sub(httpService:JSONEncode(var55), 1, 1000), string.sub(httpService:JSONEncode(var57), 1, 1000)))
end

return t