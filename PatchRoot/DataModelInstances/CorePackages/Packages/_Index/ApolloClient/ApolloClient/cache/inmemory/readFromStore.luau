-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:13 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local boolean = luauPolyfillModule.Boolean
local set = luauPolyfillModule.Set
local weakMap = luauPolyfillModule.WeakMap
local httpService = game:GetService("HttpService")
local NULL = require(parent.utilities).NULL
local assertSelectionSetForIdValue = nil
local t = {}
local _ = require(parent_1.GraphQL)
local wrap = require(parent.optimism).wrap
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local utilitiesModule = require(script.Parent.Parent.Parent.utilities)
local isField = utilitiesModule.isField
local resultKeyNameFromField = utilitiesModule.resultKeyNameFromField
local isReference = utilitiesModule.isReference
local makeReference = utilitiesModule.makeReference
local createFragmentMap = utilitiesModule.createFragmentMap
local shouldInclude = utilitiesModule.shouldInclude
local addTypenameToDocument = utilitiesModule.addTypenameToDocument
local getDefaultValues = utilitiesModule.getDefaultValues
local getFragmentDefinitions = utilitiesModule.getFragmentDefinitions
local getMainDefinition = utilitiesModule.getMainDefinition
local getQueryDefinition = utilitiesModule.getQueryDefinition
local mergeDeepArray = utilitiesModule.mergeDeepArray
local getFragmentFromSelection = utilitiesModule.getFragmentFromSelection
local maybeDeepFreeze = utilitiesModule.maybeDeepFreeze
local isNonNullObject = utilitiesModule.isNonNullObject
local _ = utilitiesModule.canUseWeakMap
local _ = require(script.Parent.Parent.core.types.Cache)
local _ = require(script.Parent.types)
local entityStoreModule = require(script.Parent.entityStore)
local maybeDependOnExistenceOfEntity = entityStoreModule.maybeDependOnExistenceOfEntity
local supportsResultCaching = entityStoreModule.supportsResultCaching
local getTypenameFromStoreObject = require(script.Parent.helpers).getTypenameFromStoreObject
local _ = require(script.Parent.policies)
local missingFieldError = require(script.Parent.Parent.core.types.common).MissingFieldError
local unknownModule = require(script.Parent["object-canon"])
local canonicalStringify = unknownModule.canonicalStringify
local objectCanon = unknownModule.ObjectCanon

local function missingFromInvariant(a, b) --[[ line: 114 ]]
	-- upvalues: missingFieldError (ref), array (ref)
	return missingFieldError.new(a.message, array.slice(b.path), b.query, b.variables)
end

local function _(value) --[[ line: 147 | named "execSelectionSetKeyArgs" ]]
	return {
		value.selectionSet,
		value.objectOrReference,
		value.context,
		value.context.canonizeResults
	}
end

local t_1 = {}
t_1.__index = t_1

function t_1:resetCanon() --[[ line: 195 ]]
	-- upvalues: objectCanon (ref)
	self.canon = objectCanon.new()
end

local function makeSelectionSetCacheKey(_, p0, p1, p2, p3) --[[ line: 200 ]]
	-- upvalues: supportsResultCaching (ref), isReference (ref)
	return if supportsResultCaching(p2.store) then p2.store:makeCacheKey(p0, if isReference(p1) then p1.__ref else p1, p2.varString, p3) else nil
end

local function makeSubSelectedCacheKey(_, p4) --[[ line: 212 ]]
	-- upvalues: supportsResultCaching (ref)
	local context = p4.context
	
	return if supportsResultCaching(context.store) then context.store:makeCacheKey(p4.field, p4.array, context.varString) else nil
end

function t_1.new(p5) --[[ line: 221 ]]
	-- upvalues: t_1 (ref), weakMap (ref), object (ref), objectCanon (ref), wrap (ref), maybeDependOnExistenceOfEntity (ref), makeSelectionSetCacheKey (ref), makeSubSelectedCacheKey (ref)
	local tbl = setmetatable({}, t_1)
	tbl.knownResults = weakMap.new()
	tbl.config = object.assign(table.clone(p5), { addTypename = p5.addTypename ~= false })
	tbl.canon = p5.canon or objectCanon.new()
	tbl.executeSelectionSet = wrap(function(_, p6) --[[ line: 236 ]]
		-- upvalues: tbl (ref), object (copy), maybeDependOnExistenceOfEntity (copy)
		local canonizeResults = p6.context.canonizeResults
		local var13 = tbl.executeSelectionSet:peek(table.unpack({
			p6.selectionSet,
			p6.objectOrReference,
			p6.context,
			p6.context.canonizeResults,
			[4] = not canonizeResults
		}))
		
		if var13 == nil then
			maybeDependOnExistenceOfEntity(p6.context.store, p6.enclosingRef.__ref)
			
			return tbl:execSelectionSetImpl(p6)
		end
		return if canonizeResults then object.assign(table.clone(var13), { result = tbl.canon:admit(var13.result) }) else var13
	end, {
		max = tbl.config.resultCacheMaxSize,
		keyArgs = function(_, ...) --[[ line: 271 ]]
			local var14 = ...
			
			return {
				var14.selectionSet,
				var14.objectOrReference,
				var14.context,
				var14.context.canonizeResults
			}
		end,
		makeCacheKey = makeSelectionSetCacheKey
	}, tbl)
	tbl.executeSubSelectedArray = wrap(function(_, p7) --[[ line: 281 ]]
		-- upvalues: maybeDependOnExistenceOfEntity (copy), tbl (ref)
		maybeDependOnExistenceOfEntity(p7.context.store, p7.enclosingRef.__ref)
		
		return tbl:execSubSelectedArrayImpl(p7)
	end, {
		max = tbl.config.resultCacheMaxSize,
		makeCacheKey = makeSubSelectedCacheKey
	}, tbl)
	
	return tbl
end

function t_1:diffQueryAgainstStore(p8) --[[ line: 301 ]]
	-- upvalues: object (ref), getDefaultValues (ref), getQueryDefinition (ref), makeReference (ref), getMainDefinition (ref), canonicalStringify (ref), createFragmentMap (ref), getFragmentDefinitions (ref)
	local store = p8.store
	local query = p8.query
	local rootId = p8.rootId
	local variables = p8.variables
	local returnPartialData = p8.returnPartialData
	local canonizeResults = p8.canonizeResults
	
	if rootId == nil then
		rootId = "ROOT_QUERY"
	end
	if returnPartialData == nil then
		returnPartialData = true
	end
	if canonizeResults == nil then
		canonizeResults = true
	end
	local policies = self.config.cache.policies
	local var15 = object.assign({}, getDefaultValues(getQueryDefinition(query)), variables)
	local var16 = makeReference(rootId)
	local var17 = self:executeSelectionSet({
		selectionSet = getMainDefinition(query).selectionSet,
		objectOrReference = var16,
		enclosingRef = var16,
		context = {
			store = store,
			query = query,
			policies = policies,
			variables = var15,
			varString = canonicalStringify(var15),
			canonizeResults = canonizeResults,
			fragmentMap = createFragmentMap(getFragmentDefinitions(query)),
			path = {}
		}
	})
	local var18 = var17.missing and #var17.missing > 0
	
	if var18 and not returnPartialData then
		error(var17.missing[1])
	end
	return {
		result = var17.result,
		missing = var17.missing,
		complete = not var18
	}
end

function t_1:isFresh(p9, p10, p11, p12) --[[ line: 349 ]]
	-- upvalues: supportsResultCaching (ref)
	if supportsResultCaching(p12.store) and self.knownResults:get(p9) == p11 then
		local var19 = self.executeSelectionSet:peek(p11, p10, p12, self.canon:isKnown(p9))
		
		return var19 and p9 == var19.result
	end
end

function t_1:execSelectionSetImpl(p13) --[[ line: 375 ]]
	-- upvalues: missingFromInvariant (ref), invariantError (ref), NULL (ref), set (ref), shouldInclude (ref), isField (ref), resultKeyNameFromField (ref), addTypenameToDocument (ref), isReference (ref), httpService (ref), array (ref), invariant (ref), getFragmentFromSelection (ref), mergeDeepArray (ref), maybeDeepFreeze (ref)
	local selectionSet = p13.selectionSet
	local objectOrReference = p13.objectOrReference
	local enclosingRef = p13.enclosingRef
	local context = p13.context
	
	if objectOrReference.__ref and not context.policies.rootTypenamesById[objectOrReference.__ref] and not context.store:has(objectOrReference.__ref) then
		return {
			result = self.canon.empty,
			missing = {
				missingFromInvariant(invariantError.new(("Dangling reference to missing %s object"):format(objectOrReference.__ref)), context)
			}
		}
	end
	local variables = context.variables
	local policies = context.policies
	local store = context.store
	local t = {}
	local t_1 = { result = NULL }
	local var22 = store:getFieldValue(objectOrReference, "__typename")
	
	if self.config.addTypename and type(var22) == "string" and not policies.rootIdsByTypename[var22] then
		table.insert(t, { __typename = var22 })
	end
	local function _() --[[ line: 412 | named "getMissing" ]]
		-- upvalues: t_1 (ref)
		if not t_1.missing then
			t_1.missing = {}
		end
		return t_1.missing
	end
	
	local _ = function(p14) --[[ line: 421 | named "handleMissing" ]]
		-- upvalues: t_1 (ref)
		if p14.missing then
			if not t_1.missing then
				t_1.missing = {}
			end
			local missing = t_1.missing
			
			for i, v in p14.missing do
				table.insert(missing, v)
			end
		end
		return p14.result
	end
	
	local var23 = set.new(selectionSet.selections)
	
	for i, v in var23 do
		if shouldInclude(v, variables) then
			if not isField(v) then
				local var30 = getFragmentFromSelection(v, context.fragmentMap)
				
				if var30 and policies:fragmentMatches(var30, var22) then
					array.forEach(var30.selectionSet.selections, var23.add, var23)
				end
			end
			local var25 = policies:readField({
				fieldName = v.name.value,
				field = v,
				variables = context.variables,
				from = objectOrReference
			}, context)
			local var26 = resultKeyNameFromField(v)
			table.insert(context.path, var26)
			
			if var25 == nil then
				if not addTypenameToDocument:added(v) then
					if not t_1.missing then
						t_1.missing = {}
					end
					table.insert(t_1.missing, missingFromInvariant(invariantError.new(("Can't find field '%s' on %s"):format(v.name.value, if isReference(objectOrReference) then objectOrReference.__ref .. " object" else "object " .. httpService:JSONEncode(objectOrReference))), context))
				end
			elseif array.isArray(var25) then
				local var27 = self:executeSubSelectedArray({
					field = v,
					array = var25,
					enclosingRef = enclosingRef,
					context = context
				})
				
				if var27.missing then
					if not t_1.missing then
						t_1.missing = {}
					end
					local missing = t_1.missing
					
					for i_1, v_1 in var27.missing do
						table.insert(missing, v_1)
					end
				end
				var25 = var27.result
			elseif v.selectionSet then
				if var25 ~= NULL then
					local var28 = self:executeSelectionSet({
						selectionSet = v.selectionSet,
						objectOrReference = var25,
						enclosingRef = if isReference(var25) then var25 else enclosingRef,
						context = context
					})
					
					if var28.missing then
						if not t_1.missing then
							t_1.missing = {}
						end
						local missing = t_1.missing
						
						for i_1, v_1 in var28.missing do
							table.insert(missing, v_1)
						end
					end
					var25 = var28.result
				end
			elseif context.canonizeResults then
				var25 = self.canon:pass(var25)
			end
			if var25 ~= nil then
				table.insert(t, { [var26] = var25 })
			end
			local var29 = table.remove(context.path) == var26
			
			if not var29 then
				invariant(var29)
			end
		end
	end
	local var24 = mergeDeepArray(t)
	
	if context.canonizeResults then
		t_1.result = self.canon:admit(var24)
	else
		t_1.result = maybeDeepFreeze(var24)
	end
	self.knownResults:set(t_1.result, selectionSet)
	
	return t_1
end

function t_1:execSubSelectedArrayImpl(p15) --[[ line: 553 ]]
	-- upvalues: invariant (ref), array (ref), NULL (ref), boolean (ref), isReference (ref), assertSelectionSetForIdValue (write)
	local field = p15.field
	local array_1 = p15.array
	local enclosingRef = p15.enclosingRef
	local context = p15.context
	local var31 = nil
	
	local function handleMissing(p16, p17) --[[ line: 558 ]]
		-- upvalues: var31 (write), invariant (copy), context (ref)
		if p16.missing then
			var31 = var31 or {}
			local missing = p16.missing
			
			for i = 1, #missing do
				table.insert(var31, missing[i])
			end
		end
		invariant(table.remove(context.path) == p17)
		
		return p16.result
	end
	
	if field.selectionSet then
		array_1 = array.filter(array_1, function(p18) --[[ line: 577 ]]
			-- upvalues: context (ref)
			return context.store:canRead(p18)
		end)
	end
	local var33 = array.map(array_1, function(p19, p20) --[[ line: 582 ]]
		-- upvalues: NULL (copy), context (ref), array (copy), handleMissing (ref), self (ref), field (ref), enclosingRef (ref), boolean (copy), isReference (copy), assertSelectionSetForIdValue (copy), invariant (copy)
		if p19 == NULL then
			return NULL
		end
		table.insert(context.path, p20)
		
		if array.isArray(p19) and #p19 > 0 then
			return handleMissing(self:executeSubSelectedArray({
				field = field,
				array = p19,
				enclosingRef = enclosingRef,
				context = context
			}), p20)
		elseif boolean.toJSBoolean(field.selectionSet) then
			return handleMissing(self:executeSelectionSet({
				selectionSet = field.selectionSet,
				objectOrReference = p19,
				enclosingRef = if isReference(p19) then p19 else enclosingRef,
				context = context
			}), p20)
		elseif _G.__DEV__ then
			assertSelectionSetForIdValue(context.store, field, p19)
		end
		local var34 = table.remove(context.path) == p20
		
		if not var34 then
			invariant(var34)
		end
		return p19
	end)
	
	return {
		result = if context.canonizeResults then self.canon:admit(var33) else var33,
		missing = var31
	}
end

t.StoreReader = t_1

assertSelectionSetForIdValue = function(value, p21, p22) --[[ line: 643 | named "assertSelectionSetForIdValue" ]]
	-- upvalues: set (ref), isNonNullObject (ref), invariant (ref), isReference (ref), getTypenameFromStoreObject (ref), array (ref), object (ref)
	if not p21.selectionSet then
		local var35 = set.new({ p22 })
		
		for i, v in var35 do
			if isNonNullObject(v) then
				invariant(not isReference(v), ("Missing selection set for object of type %s returned for query field %s"):format(getTypenameFromStoreObject(value, v) or "nil", p21.name.value))
				array.forEach(object.values(v), var35.add, var35)
			end
		end
	end
end

return t