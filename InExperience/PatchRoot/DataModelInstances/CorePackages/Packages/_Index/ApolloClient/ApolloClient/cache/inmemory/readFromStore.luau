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

local function missingFromInvariant(a, b)
	-- upvalues: missingFieldError (ref), array (ref)
	return missingFieldError.new(a.message, array.slice(b.path), b.query, b.variables)
end

local function _(value)
	return {
		value.selectionSet,
		value.objectOrReference,
		value.context,
		value.context.canonizeResults
	}
end

local t_1 = {}
t_1.__index = t_1

function t_1:resetCanon()
	-- upvalues: objectCanon (ref)
	self.canon = objectCanon.new()
end

local function makeSelectionSetCacheKey(_, p1, p2, p3, p4)
	-- upvalues: supportsResultCaching (ref), isReference (ref)
	return if supportsResultCaching(p3.store) then p3.store:makeCacheKey(p1, if isReference(p2) then p2.__ref else p2, p3.varString, p4) else nil
end

local function makeSubSelectedCacheKey(_, p1)
	-- upvalues: supportsResultCaching (ref)
	local context = p1.context
	
	return if supportsResultCaching(context.store) then context.store:makeCacheKey(p1.field, p1.array, context.varString) else nil
end

function t_1.new(p1)
	-- upvalues: t_1 (ref), weakMap (ref), object (ref), objectCanon (ref), wrap (ref), maybeDependOnExistenceOfEntity (ref), makeSelectionSetCacheKey (ref), makeSubSelectedCacheKey (ref)
	local tbl = setmetatable({}, t_1)
	tbl.knownResults = weakMap.new()
	tbl.config = object.assign(table.clone(p1), { addTypename = p1.addTypename ~= false })
	tbl.canon = p1.canon or objectCanon.new()
	tbl.executeSelectionSet = wrap(function(_, p2)
		-- upvalues: tbl (ref), object (copy), maybeDependOnExistenceOfEntity (copy)
		local canonizeResults = p2.context.canonizeResults
		local var1 = tbl.executeSelectionSet:peek(table.unpack({
			p2.selectionSet,
			p2.objectOrReference,
			p2.context,
			p2.context.canonizeResults,
			[4] = not canonizeResults
		}))
		
		if var1 == nil then
			maybeDependOnExistenceOfEntity(p2.context.store, p2.enclosingRef.__ref)
			
			return tbl:execSelectionSetImpl(p2)
		end
		return if canonizeResults then object.assign(table.clone(var1), { result = tbl.canon:admit(var1.result) }) else var1
	end, {
		max = tbl.config.resultCacheMaxSize,
		keyArgs = function(_, ...)
			local var1 = ...
			
			return {
				var1.selectionSet,
				var1.objectOrReference,
				var1.context,
				var1.context.canonizeResults
			}
		end,
		makeCacheKey = makeSelectionSetCacheKey
	}, tbl)
	tbl.executeSubSelectedArray = wrap(function(_, p2)
		-- upvalues: maybeDependOnExistenceOfEntity (copy), tbl (ref)
		maybeDependOnExistenceOfEntity(p2.context.store, p2.enclosingRef.__ref)
		
		return tbl:execSubSelectedArrayImpl(p2)
	end, {
		max = tbl.config.resultCacheMaxSize,
		makeCacheKey = makeSubSelectedCacheKey
	}, tbl)
	
	return tbl
end

function t_1:diffQueryAgainstStore(p1)
	-- upvalues: object (ref), getDefaultValues (ref), getQueryDefinition (ref), makeReference (ref), getMainDefinition (ref), canonicalStringify (ref), createFragmentMap (ref), getFragmentDefinitions (ref)
	local store = p1.store
	local query = p1.query
	local rootId = p1.rootId
	local variables = p1.variables
	local returnPartialData = p1.returnPartialData
	local canonizeResults = p1.canonizeResults
	
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
	local var1 = object.assign({}, getDefaultValues(getQueryDefinition(query)), variables)
	local var2 = makeReference(rootId)
	local var3 = self:executeSelectionSet({
		selectionSet = getMainDefinition(query).selectionSet,
		objectOrReference = var2,
		enclosingRef = var2,
		context = {
			store = store,
			query = query,
			policies = policies,
			variables = var1,
			varString = canonicalStringify(var1),
			canonizeResults = canonizeResults,
			fragmentMap = createFragmentMap(getFragmentDefinitions(query)),
			path = {}
		}
	})
	local var4 = var3.missing and #var3.missing > 0
	
	if var4 and not returnPartialData then
		error(var3.missing[1])
	end
	return {
		result = var3.result,
		missing = var3.missing,
		complete = not var4
	}
end

function t_1:isFresh(p1, p2, p3, p4)
	-- upvalues: supportsResultCaching (ref)
	if supportsResultCaching(p4.store) and self.knownResults:get(p1) == p3 then
		local var1 = self.executeSelectionSet:peek(p3, p2, p4, self.canon:isKnown(p1))
		
		return var1 and p1 == var1.result
	end
end

function t_1:execSelectionSetImpl(p1)
	-- upvalues: missingFromInvariant (ref), invariantError (ref), NULL (ref), set (ref), shouldInclude (ref), isField (ref), resultKeyNameFromField (ref), addTypenameToDocument (ref), isReference (ref), httpService (ref), array (ref), invariant (ref), getFragmentFromSelection (ref), mergeDeepArray (ref), maybeDeepFreeze (ref)
	local selectionSet = p1.selectionSet
	local objectOrReference = p1.objectOrReference
	local enclosingRef = p1.enclosingRef
	local context = p1.context
	
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
	local var1 = store:getFieldValue(objectOrReference, "__typename")
	
	if self.config.addTypename and type(var1) == "string" and not policies.rootIdsByTypename[var1] then
		table.insert(t, { __typename = var1 })
	end
	local function _()
		-- upvalues: t_1 (ref)
		if not t_1.missing then
			t_1.missing = {}
		end
		return t_1.missing
	end
	
	local _ = function(p2)
		-- upvalues: t_1 (ref)
		if p2.missing then
			if not t_1.missing then
				t_1.missing = {}
			end
			local missing = t_1.missing
			
			for i, v in p2.missing do
				table.insert(missing, v)
			end
		end
		return p2.result
	end
	
	local var2 = set.new(selectionSet.selections)
	
	for i, v in var2 do
		if shouldInclude(v, variables) then
			if not isField(v) then
				local var3 = getFragmentFromSelection(v, context.fragmentMap)
				
				if var3 and policies:fragmentMatches(var3, var1) then
					array.forEach(var3.selectionSet.selections, var2.add, var2)
				end
			end
			local var4 = policies:readField({
				fieldName = v.name.value,
				field = v,
				variables = context.variables,
				from = objectOrReference
			}, context)
			local var5 = resultKeyNameFromField(v)
			table.insert(context.path, var5)
			
			if var4 == nil then
				if not addTypenameToDocument:added(v) then
					if not t_1.missing then
						t_1.missing = {}
					end
					table.insert(t_1.missing, missingFromInvariant(invariantError.new(("Can't find field '%s' on %s"):format(v.name.value, if isReference(objectOrReference) then objectOrReference.__ref .. " object" else "object " .. httpService:JSONEncode(objectOrReference))), context))
				end
			elseif array.isArray(var4) then
				local var6 = self:executeSubSelectedArray({
					field = v,
					array = var4,
					enclosingRef = enclosingRef,
					context = context
				})
				
				if var6.missing then
					if not t_1.missing then
						t_1.missing = {}
					end
					local missing = t_1.missing
					
					for i_1, v_1 in var6.missing do
						table.insert(missing, v_1)
					end
				end
				var4 = var6.result
			elseif v.selectionSet then
				if var4 ~= NULL then
					local var7 = self:executeSelectionSet({
						selectionSet = v.selectionSet,
						objectOrReference = var4,
						enclosingRef = if isReference(var4) then var4 else enclosingRef,
						context = context
					})
					
					if var7.missing then
						if not t_1.missing then
							t_1.missing = {}
						end
						local missing = t_1.missing
						
						for i_1, v_1 in var7.missing do
							table.insert(missing, v_1)
						end
					end
					var4 = var7.result
				end
			elseif context.canonizeResults then
				var4 = self.canon:pass(var4)
			end
			if var4 ~= nil then
				table.insert(t, { [var5] = var4 })
			end
			local var8 = table.remove(context.path) == var5
			
			if not var8 then
				invariant(var8)
			end
		end
	end
	local var9 = mergeDeepArray(t)
	
	if context.canonizeResults then
		t_1.result = self.canon:admit(var9)
	else
		t_1.result = maybeDeepFreeze(var9)
	end
	self.knownResults:set(t_1.result, selectionSet)
	
	return t_1
end

function t_1:execSubSelectedArrayImpl(p3)
	-- upvalues: invariant (ref), array (ref), NULL (ref), boolean (ref), isReference (ref), assertSelectionSetForIdValue (write)
	local field = p3.field
	local array_1 = p3.array
	local enclosingRef = p3.enclosingRef
	local context = p3.context
	local var10 = nil
	
	local function handleMissing(p4, p5)
		-- upvalues: var10 (write), invariant (copy), context (ref)
		if p4.missing then
			var10 = var10 or {}
			local missing = p4.missing
			
			for i = 1, #missing do
				table.insert(var10, missing[i])
			end
		end
		invariant(table.remove(context.path) == p5)
		
		return p4.result
	end
	
	if field.selectionSet then
		array_1 = array.filter(array_1, function(p6)
			-- upvalues: context (ref)
			return context.store:canRead(p6)
		end)
	end
	local var11 = array.map(array_1, function(p6, p7)
		-- upvalues: NULL (copy), context (ref), array (copy), handleMissing (ref), self (ref), field (ref), enclosingRef (ref), boolean (copy), isReference (copy), assertSelectionSetForIdValue (copy), invariant (copy)
		if p6 == NULL then
			return NULL
		end
		table.insert(context.path, p7)
		
		if array.isArray(p6) and #p6 > 0 then
			return handleMissing(self:executeSubSelectedArray({
				field = field,
				array = p6,
				enclosingRef = enclosingRef,
				context = context
			}), p7)
		elseif boolean.toJSBoolean(field.selectionSet) then
			return handleMissing(self:executeSelectionSet({
				selectionSet = field.selectionSet,
				objectOrReference = p6,
				enclosingRef = if isReference(p6) then p6 else enclosingRef,
				context = context
			}), p7)
		elseif _G.__DEV__ then
			assertSelectionSetForIdValue(context.store, field, p6)
		end
		local var12 = table.remove(context.path) == p7
		
		if not var12 then
			invariant(var12)
		end
		return p6
	end)
	
	return {
		result = if context.canonizeResults then self.canon:admit(var11) else var11,
		missing = var10
	}
end

t.StoreReader = t_1

assertSelectionSetForIdValue = function(value, p4, p5)
	-- upvalues: set (ref), isNonNullObject (ref), invariant (ref), isReference (ref), getTypenameFromStoreObject (ref), array (ref), object (ref)
	if not p4.selectionSet then
		local var11 = set.new({ p5 })
		
		for i, v in var11 do
			if isNonNullObject(v) then
				invariant(not isReference(v), ("Missing selection set for object of type %s returned for query field %s"):format(getTypenameFromStoreObject(value, v) or "nil", p4.name.value))
				array.forEach(object.values(v), var11.add, var11)
			end
		end
	end
end

return t