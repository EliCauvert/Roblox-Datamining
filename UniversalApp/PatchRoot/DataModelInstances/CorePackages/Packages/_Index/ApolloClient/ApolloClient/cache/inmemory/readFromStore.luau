local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Boolean = LuauPolyfillModule.Boolean
local Set = LuauPolyfillModule.Set
local WeakMap = LuauPolyfillModule.WeakMap
local HttpService = game:GetService("HttpService")
local NULL = require(Parent.utilities).NULL
local Callback = nil
local ReadFromStore = {}
local _ = require(Parent1.GraphQL)
local WrapFunction = require(Parent.optimism).wrap
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local UtilitiesModule = require(script.Parent.Parent.Parent.utilities)
local IsFieldFunction = UtilitiesModule.isField
local ResultKeyNameFromFieldFunction = UtilitiesModule.resultKeyNameFromField
local IsReferenceFunction = UtilitiesModule.isReference
local MakeReferenceFunction = UtilitiesModule.makeReference
local CreateFragmentMapFunction = UtilitiesModule.createFragmentMap
local ShouldIncludeFunction = UtilitiesModule.shouldInclude
local AddTypenameToDocument = UtilitiesModule.addTypenameToDocument
local GetDefaultValuesFunction = UtilitiesModule.getDefaultValues
local GetFragmentDefinitionsFunction = UtilitiesModule.getFragmentDefinitions
local GetMainDefinitionFunction = UtilitiesModule.getMainDefinition
local GetQueryDefinitionFunction = UtilitiesModule.getQueryDefinition
local MergeDeepArrayFunction = UtilitiesModule.mergeDeepArray
local GetFragmentFromSelectionFunction = UtilitiesModule.getFragmentFromSelection
local MaybeDeepFreezeFunction = UtilitiesModule.maybeDeepFreeze
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local _ = UtilitiesModule.canUseWeakMap
local _ = require(script.Parent.Parent.core.types.Cache)
local _ = require(script.Parent.types)
local EntityStoreModule = require(script.Parent.entityStore)
local MaybeDependOnExistenceOfEntityFunction = EntityStoreModule.maybeDependOnExistenceOfEntity
local SupportsResultCachingFunction = EntityStoreModule.supportsResultCaching
local GetTypenameFromStoreObjectFunction = require(script.Parent.helpers).getTypenameFromStoreObject
local _ = require(script.Parent.policies)
local MissingFieldError = require(script.Parent.Parent.core.types.common).MissingFieldError
local ObjectCanonModule = require(script.Parent["object-canon"])
local CanonicalStringifyFunction = ObjectCanonModule.canonicalStringify
local ObjectCanon = ObjectCanonModule.ObjectCanon

local function missingFromInvariant(NewResult, Context) --[[ Line: 114 ]]
	-- upvalues: MissingFieldError (copy), Array (copy)
	return MissingFieldError.new(NewResult.message, Array.slice(Context.path), Context.query, Context.variables)
end

local function _(p1) --[[ Line: 147 | Named "execSelectionSetKeyArgs" ]]
	return {
		p1.selectionSet,
		p1.objectOrReference,
		p1.context,
		p1.context.canonizeResults
	}
end

local Module = {}
Module.__index = Module

function Module:resetCanon() --[[ Line: 195 ]]
	-- upvalues: ObjectCanon (copy)
	self.canon = ObjectCanon.new()
end

local function makeSelectionSetCacheKey(_, p1, p2, p3, p4) --[[ Line: 200 ]]
	-- upvalues: SupportsResultCachingFunction (copy), IsReferenceFunction (copy)
	return if SupportsResultCachingFunction(p3.store) then p3.store:makeCacheKey(p1, IsReferenceFunction(p2) and p2.__ref or p2, p3.varString, p4) else nil
end

local function makeSubSelectedCacheKey(_, p1) --[[ Line: 212 ]]
	-- upvalues: SupportsResultCachingFunction (copy)
	local Field = p1.field
	local Array = p1.array
	local Context = p1.context
	
	return if SupportsResultCachingFunction(Context.store) then Context.store:makeCacheKey(Field, Array, Context.varString) else nil
end

function Module.new(Tbl) --[[ Line: 221 ]]
	-- upvalues: Module (copy), WeakMap (copy), Object (copy), ObjectCanon (copy), WrapFunction (copy), MaybeDependOnExistenceOfEntityFunction (copy), makeSelectionSetCacheKey (copy), makeSubSelectedCacheKey (copy)
	local self = setmetatable({}, Module)
	self.knownResults = WeakMap.new()
	self.config = Object.assign(table.clone(Tbl), { addTypename = Tbl.addTypename ~= false })
	self.canon = Tbl.canon or ObjectCanon.new()
	self.executeSelectionSet = WrapFunction(function(_, p1) --[[ Line: 236 ]]
		-- upvalues: self (copy), Object (upval), MaybeDependOnExistenceOfEntityFunction (upval)
		local CanonizeResults = p1.context.canonizeResults
		local PeekResult = self.executeSelectionSet:peek(table.unpack({
			p1.selectionSet,
			p1.objectOrReference,
			p1.context,
			p1.context.canonizeResults,
			[4] = not CanonizeResults
		}))
		
		if PeekResult == nil then
			MaybeDependOnExistenceOfEntityFunction(p1.context.store, p1.enclosingRef.__ref)
			
			return self:execSelectionSetImpl(p1)
		else
			return if CanonizeResults then Object.assign(table.clone(PeekResult), { result = self.canon:admit(PeekResult.result) }) else PeekResult
		end
	end, {
		max = self.config.resultCacheMaxSize,
		keyArgs = function(_, ...) --[[ Line: 271 ]]
			local v1 = (...)
			
			return {
				v1.selectionSet,
				v1.objectOrReference,
				v1.context,
				v1.context.canonizeResults
			}
		end,
		makeCacheKey = makeSelectionSetCacheKey
	}, self)
	self.executeSubSelectedArray = WrapFunction(function(_, p1) --[[ Line: 281 ]]
		-- upvalues: MaybeDependOnExistenceOfEntityFunction (upval), self (copy)
		MaybeDependOnExistenceOfEntityFunction(p1.context.store, p1.enclosingRef.__ref)
		
		return self:execSubSelectedArrayImpl(p1)
	end, {
		max = self.config.resultCacheMaxSize,
		makeCacheKey = makeSubSelectedCacheKey
	}, self)
	
	return self
end

function Module:diffQueryAgainstStore(p1) --[[ Line: 301 ]]
	-- upvalues: Object (copy), GetDefaultValuesFunction (copy), GetQueryDefinitionFunction (copy), MakeReferenceFunction (copy), GetMainDefinitionFunction (copy), CanonicalStringifyFunction (copy), CreateFragmentMapFunction (copy), GetFragmentDefinitionsFunction (copy)
	local Store = p1.store
	local Query = p1.query
	local RootId = p1.rootId
	local Variables = p1.variables
	local ReturnPartialData = p1.returnPartialData
	local CanonizeResults = p1.canonizeResults
	
	if RootId == nil then
		RootId = "ROOT_QUERY"
	end
	if ReturnPartialData == nil then
		ReturnPartialData = true
	end
	if CanonizeResults == nil then
		CanonizeResults = true
	end
	local Policies = self.config.cache.policies
	local AssignResult = Object.assign({}, GetDefaultValuesFunction(GetQueryDefinitionFunction(Query)), Variables)
	local Reference = MakeReferenceFunction(RootId)
	local ExecuteSelectionSetResult = self:executeSelectionSet({
		selectionSet = GetMainDefinitionFunction(Query).selectionSet,
		objectOrReference = Reference,
		enclosingRef = Reference,
		context = {
			store = Store,
			query = Query,
			policies = Policies,
			variables = AssignResult,
			varString = CanonicalStringifyFunction(AssignResult),
			canonizeResults = CanonizeResults,
			fragmentMap = CreateFragmentMapFunction(GetFragmentDefinitionsFunction(Query)),
			path = {}
		}
	})
	local v1: boolean = ExecuteSelectionSetResult.missing and #ExecuteSelectionSetResult.missing > 0
	
	if v1 and not ReturnPartialData then
		error(ExecuteSelectionSetResult.missing[1])
	end
	return {
		result = ExecuteSelectionSetResult.result,
		missing = ExecuteSelectionSetResult.missing,
		complete = not v1
	}
end

function Module:isFresh(p1, p2, p3, p4): boolean --[[ Line: 349 ]]
	-- upvalues: SupportsResultCachingFunction (copy)
	if SupportsResultCachingFunction(p4.store) and self.knownResults:get(p1) == p3 then
		local PeekResult = self.executeSelectionSet:peek(p3, p2, p4, self.canon:isKnown(p1))
		
		if PeekResult and p1 == PeekResult.result then
			return true
		end
	end
	return false
end

function Module:execSelectionSetImpl(p1) --[[ Line: 375 ]]
	-- upvalues: missingFromInvariant (copy), InvariantError (copy), NULL (copy), Set (copy), ShouldIncludeFunction (copy), IsFieldFunction (copy), ResultKeyNameFromFieldFunction (copy), AddTypenameToDocument (copy), IsReferenceFunction (copy), HttpService (copy), Array (copy), InvariantFunction (copy), GetFragmentFromSelectionFunction (copy), MergeDeepArrayFunction (copy), MaybeDeepFreezeFunction (copy)
	local SelectionSet = p1.selectionSet
	local ObjectOrReference = p1.objectOrReference
	local EnclosingRef = p1.enclosingRef
	local Context = p1.context
	
	if ObjectOrReference.__ref and not Context.policies.rootTypenamesById[ObjectOrReference.__ref] and not Context.store:has(ObjectOrReference.__ref) then
		return {
			result = self.canon.empty,
			missing = {
				missingFromInvariant(InvariantError.new(("Dangling reference to missing %s object"):format(ObjectOrReference.__ref)), Context)
			}
		}
	end
	local Variables = Context.variables
	local Policies = Context.policies
	local List = {}
	local config = { result = NULL }
	local TypenameFieldValue = Context.store:getFieldValue(ObjectOrReference, "__typename")
	
	if self.config.addTypename and type(TypenameFieldValue) == "string" and not Policies.rootIdsByTypename[TypenameFieldValue] then
		table.insert(List, { __typename = TypenameFieldValue })
	end
	local function _() --[[ Line: 412 | Named "getMissing" ]]
		-- upvalues: config (copy)
		if not config.missing then
			config.missing = {}
		end
		return config.missing
	end
	
	local _ = function(p2) --[[ Line: 421 | Named "handleMissing" ]]
		-- upvalues: config (copy)
		if p2.missing then
			if not config.missing then
				config.missing = {}
			end
			local Missing = config.missing
			
			for _, value in p2.missing do
				table.insert(Missing, value)
			end
		end
		return p2.result
	end
	
	local NewSet = Set.new(SelectionSet.selections)
	
	for _, Field in NewSet do
		if ShouldIncludeFunction(Field, Variables) then
			if not IsFieldFunction(Field) then
				local FragmentFromSelection = GetFragmentFromSelectionFunction(Field, Context.fragmentMap)
				
				if FragmentFromSelection and Policies:fragmentMatches(FragmentFromSelection, TypenameFieldValue) then
					Array.forEach(FragmentFromSelection.selectionSet.selections, NewSet.add, NewSet)
					continue
				end
				continue
			end
			local Field1 = Policies:readField({
				fieldName = Field.name.value,
				field = Field,
				variables = Context.variables,
				from = ObjectOrReference
			}, Context)
			local ResultKeyNameFromFieldResult = ResultKeyNameFromFieldFunction(Field)
			table.insert(Context.path, ResultKeyNameFromFieldResult)
			
			if Field1 == nil then
				if not AddTypenameToDocument:added(Field) then
					if not config.missing then
						config.missing = {}
					end
					table.insert(config.missing, missingFromInvariant(InvariantError.new(("Can't find field '%s' on %s"):format(Field.name.value, IsReferenceFunction(ObjectOrReference) and ObjectOrReference.__ref .. " object" or "object " .. HttpService:JSONEncode(ObjectOrReference))), Context))
				end
			elseif Array.isArray(Field1) then
				local ExecuteSubSelectedArrayResult = self:executeSubSelectedArray({
					field = Field,
					array = Field1,
					enclosingRef = EnclosingRef,
					context = Context
				})
				
				if ExecuteSubSelectedArrayResult.missing then
					if not config.missing then
						config.missing = {}
					end
					local Missing = config.missing
					
					for _, value in ExecuteSubSelectedArrayResult.missing do
						table.insert(Missing, value)
					end
				end
				Field1 = ExecuteSubSelectedArrayResult.result
			elseif Field.selectionSet then
				if Field1 ~= NULL then
					local ExecuteSelectionSetResult = self:executeSelectionSet({
						selectionSet = Field.selectionSet,
						objectOrReference = Field1,
						enclosingRef = IsReferenceFunction(Field1) and Field1 or EnclosingRef,
						context = Context
					})
					
					if ExecuteSelectionSetResult.missing then
						if not config.missing then
							config.missing = {}
						end
						local Missing = config.missing
						
						for _, value1 in ExecuteSelectionSetResult.missing do
							table.insert(Missing, value1)
						end
					end
					Field1 = ExecuteSelectionSetResult.result
				end
			elseif Context.canonizeResults then
				Field1 = self.canon:pass(Field1)
			end
			if Field1 ~= nil then
				table.insert(List, { [ResultKeyNameFromFieldResult] = Field1 })
			end
			local IsRemovedMatch = table.remove(Context.path) == ResultKeyNameFromFieldResult
			
			if not IsRemovedMatch then
				InvariantFunction(IsRemovedMatch)
			end
		end
	end
	local MergeDeepArrayResult = MergeDeepArrayFunction(List)
	
	if Context.canonizeResults then
		config.result = self.canon:admit(MergeDeepArrayResult)
	else
		config.result = MaybeDeepFreezeFunction(MergeDeepArrayResult)
	end
	self.knownResults:set(config.result, SelectionSet)
	
	return config
end

function Module.execSubSelectedArrayImpl(p3, p4) --[[ Line: 553 ]]
	-- upvalues: InvariantFunction (copy), Array (copy), NULL (copy), Boolean (copy), IsReferenceFunction (copy), Callback (ref)
	local Field = p4.field
	local Array1 = p4.array
	local EnclosingRef = p4.enclosingRef
	local Context = p4.context
	local List = nil
	
	local function handleMissing(ExecuteSelectionSetResult, Removed) --[[ Line: 558 ]]
		-- upvalues: List (ref), InvariantFunction (upval), Context (copy)
		if ExecuteSelectionSetResult.missing then
			List = List or {}
			local Missing = ExecuteSelectionSetResult.missing
			
			for i = 1, #Missing do
				table.insert(List, Missing[i])
			end
		end
		InvariantFunction(table.remove(Context.path) == Removed)
		
		return ExecuteSelectionSetResult.result
	end
	
	if Field.selectionSet then
		Array1 = Array.filter(Array1, function(p5) --[[ Line: 577 ]]
			-- upvalues: Context (copy)
			return Context.store:canRead(p5)
		end)
	end
	local MapResult = Array.map(Array1, function(Array1, Removed) --[[ Line: 582 ]]
		-- upvalues: NULL (upval), Context (copy), Array (upval), handleMissing (copy), p3 (copy), Field (copy), EnclosingRef (copy), Boolean (upval), IsReferenceFunction (upval), Callback (upval), InvariantFunction (upval)
		if Array1 == NULL then
			return NULL
		end
		table.insert(Context.path, Removed)
		
		if Array.isArray(Array1) and #Array1 > 0 then
			return (handleMissing(p3:executeSubSelectedArray({
				field = Field,
				array = Array1,
				enclosingRef = EnclosingRef,
				context = Context
			}), Removed))
		end
		if Boolean.toJSBoolean(Field.selectionSet) then
			return (handleMissing(p3:executeSelectionSet({
				selectionSet = Field.selectionSet,
				objectOrReference = Array1,
				enclosingRef = IsReferenceFunction(Array1) and Array1 or EnclosingRef,
				context = Context
			}), Removed))
		end
		if _G.__DEV__ then
			Callback(Context.store, Field, Array1)
		end
		local IsRemovedMatch = table.remove(Context.path) == Removed
		
		if not IsRemovedMatch then
			InvariantFunction(IsRemovedMatch)
		end
		return Array1
	end)
	
	return {
		result = if Context.canonizeResults then p3.canon:admit(MapResult) else MapResult,
		missing = List
	}
end

ReadFromStore.StoreReader = Module

Callback = function(Store, Field, Array1) --[[ Line: 643 | Named "assertSelectionSetForIdValue" ]]
	-- upvalues: Set (copy), IsNonNullObjectFunction (copy), InvariantFunction (copy), IsReferenceFunction (copy), GetTypenameFromStoreObjectFunction (copy), Array (copy), Object (copy)
	if not Field.selectionSet then
		local NewSet = Set.new({ Array1 })
		
		for _, value in NewSet do
			if IsNonNullObjectFunction(value) then
				InvariantFunction(not IsReferenceFunction(value), ("Missing selection set for object of type %s returned for query field %s"):format(GetTypenameFromStoreObjectFunction(Store, value) or "nil", Field.name.value))
				Array.forEach(Object.values(value), NewSet.add, NewSet)
			end
		end
	end
end

return ReadFromStore