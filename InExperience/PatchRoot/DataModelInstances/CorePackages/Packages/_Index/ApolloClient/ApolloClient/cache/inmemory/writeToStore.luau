local DEV = _G.__DEV__
local WriteToStore = {}
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local Array = LuauPolyfillModule.Array
local NULL = require(Parent.utilities).NULL
local HttpService = game:GetService("HttpService")
local _ = require(Parent1.GraphQL)
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local EqualModule = require(Parent.jsutils.equal)
local ObjectKeysForEachModule = require(Parent.luaUtils.objectKeysForEach)
local UtilitiesModule = require(Parent.utilities)
local CreateFragmentMapFunction = UtilitiesModule.createFragmentMap
local GetFragmentFromSelectionFunction = UtilitiesModule.getFragmentFromSelection
local GetDefaultValuesFunction = UtilitiesModule.getDefaultValues
local GetFragmentDefinitionsFunction = UtilitiesModule.getFragmentDefinitions
local GetOperationDefinitionFunction = UtilitiesModule.getOperationDefinition
local GetTypenameFromResultFunction = UtilitiesModule.getTypenameFromResult
local MakeReferenceFunction = UtilitiesModule.makeReference
local IsFieldFunction = UtilitiesModule.isField
local ResultKeyNameFromFieldFunction = UtilitiesModule.resultKeyNameFromField
local IsReferenceFunction = UtilitiesModule.isReference
local ShouldIncludeFunction = UtilitiesModule.shouldInclude
local CloneDeepFunction = UtilitiesModule.cloneDeep
local AddTypenameToDocument = UtilitiesModule.addTypenameToDocument
local _ = require(script.Parent.types)
local HelpersModule = require(script.Parent.helpers)
local MakeProcessedFieldsMergerFunction = HelpersModule.makeProcessedFieldsMerger
local FieldNameFromStoreNameFunction = HelpersModule.fieldNameFromStoreName
local StoreValueIsStoreObjectFunction = HelpersModule.storeValueIsStoreObject
local _ = require(script.Parent.entityStore)
local _ = require(script.Parent.Parent.core.types.Cache)
local CanonicalStringifyFunction = require(script.Parent["object-canon"]).canonicalStringify
local _ = require(script.Parent.writeToStore_types)
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Module = {}
Module.__index = Module

function Module.new(Cache, Reader)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.cache = Cache
	self.reader = Reader
	
	return self
end

function Module:writeToStore(Store, Context)
	-- upvalues: GetOperationDefinitionFunction (copy), MakeProcessedFieldsMergerFunction (copy), Object (copy), GetDefaultValuesFunction (copy), CanonicalStringifyFunction (copy), CreateFragmentMapFunction (copy), GetFragmentDefinitionsFunction (copy), Map (copy), IsReferenceFunction (copy), InvariantError (copy), HttpService (copy), MakeReferenceFunction (copy), DEV (copy), FieldNameFromStoreNameFunction (copy), Set (copy), IsFieldFunction (copy), ObjectKeysForEachModule (copy), Callback (ref)
	local Query = Context.query
	local Result = Context.result
	local DataId = Context.dataId
	local Variables = Context.variables
	local Overwrite = Context.overwrite
	local OperationDefinition = GetOperationDefinitionFunction(Query)
	local ProcessedFieldsMerger = MakeProcessedFieldsMergerFunction()
	local AssignResult = Object.assign(GetDefaultValuesFunction(OperationDefinition), Variables)
	local Context1 = {
		clientOnly = false,
		store = Store,
		written = {},
		merge = function(MergeResult, MergeResult1)
			-- upvalues: ProcessedFieldsMerger (copy)
			return ProcessedFieldsMerger:merge(MergeResult, MergeResult1)
		end,
		variables = AssignResult,
		varString = CanonicalStringifyFunction(AssignResult),
		fragmentMap = CreateFragmentMapFunction(GetFragmentDefinitionsFunction(Query)),
		overwrite = Overwrite or false,
		incomingById = Map.new(nil)
	}
	local ProcessSelectionSetResult = self:processSelectionSet({
		result = Result or {},
		dataId = DataId,
		selectionSet = OperationDefinition.selectionSet,
		mergeTree = { map = Map.new(nil) },
		context = Context1
	})
	
	if not IsReferenceFunction(ProcessSelectionSetResult) then
		error(InvariantError.new(("Could not identify object %s"):format(HttpService:JSONEncode(Result))))
	end
	Context1.incomingById:forEach(function(p1, p2)
		-- upvalues: MakeReferenceFunction (upval), self (copy), Context1 (copy), IsReferenceFunction (upval), DEV (upval), FieldNameFromStoreNameFunction (upval), Set (upval), IsFieldFunction (upval), ObjectKeysForEachModule (upval), Callback (upval), Store (copy)
		local Fields = p1.fields
		local MergeTree = p1.mergeTree
		local Selections = p1.selections
		local Reference = MakeReferenceFunction(p2)
		
		if MergeTree.map.size > 0 then
			local ApplyMergesResult = self:applyMerges(MergeTree, Reference, Fields, Context1)
			
			if IsReferenceFunction(ApplyMergesResult) then return end
			Fields = ApplyMergesResult
		end
		if DEV and not Context1.overwrite then
			local NewResult = nil
			
			local function _(p3)
				-- upvalues: NewResult (ref), FieldNameFromStoreNameFunction (upval)
				return NewResult:has(FieldNameFromStoreNameFunction(p3))
			end
			
			NewResult = Set.new()
			Selections:forEach(function(p3)
				-- upvalues: IsFieldFunction (upval), NewResult (ref)
				if IsFieldFunction(p3) and p3.selectionSet then
					NewResult:add(p3.name.value)
				end
			end)
			
			local _ = function(p3): boolean
				-- upvalues: MergeTree (copy)
				local GetResult = MergeTree.map:get(p3)
				
				return GetResult ~= nil and (GetResult.info ~= nil and GetResult.info.merge ~= nil)
			end
			
			ObjectKeysForEachModule(Fields, function(p3)
				-- upvalues: NewResult (ref), FieldNameFromStoreNameFunction (upval), MergeTree (copy), Callback (upval), Reference (copy), Fields (ref), Context1 (upval)
				if NewResult:has(FieldNameFromStoreNameFunction(p3)) then
					local GetResult = MergeTree.map:get(p3)
					
					if GetResult == nil or (GetResult.info == nil or GetResult.info.merge == nil) then
						Callback(Reference, Fields, p3, Context1.store)
					end
				end
			end)
		end
		Store:merge(p2, Fields)
	end)
	Store:retain(ProcessSelectionSetResult.__ref)
	
	return ProcessSelectionSetResult
end

function Module:processSelectionSet(p1)
	-- upvalues: MakeReferenceFunction (copy), Array (copy), GetTypenameFromResultFunction (copy), Set (copy), ShouldIncludeFunction (copy), IsFieldFunction (copy), ResultKeyNameFromFieldFunction (copy), Callback1 (ref), IsReferenceFunction (copy), Callback2 (ref), AddTypenameToDocument (copy), InvariantFunction (copy), HttpService (copy), GetFragmentFromSelectionFunction (copy), Callback3 (ref)
	local DataId = p1.dataId
	local Result = p1.result
	local SelectionSet = p1.selectionSet
	local Context = p1.context
	local MergeTree = p1.mergeTree
	local Policies = self.cache.policies
	local Unpacked, Unpacked2 = table.unpack(Policies:identify(Result, SelectionSet, Context.fragmentMap), 1, 2)
	local DataId1 = DataId or Unpacked
	
	if type(DataId1) == "string" then
		local WrittenEntry = nil
		if Context.written[DataId1] == nil then
			WrittenEntry = {}
			Context.written[DataId1] = WrittenEntry
		else
			WrittenEntry = Context.written[DataId1]
		end
		local Reference = MakeReferenceFunction(DataId1)
		
		if Array.indexOf(WrittenEntry, SelectionSet) >= 1 then
			return Reference
		end
		table.insert(WrittenEntry, SelectionSet)
		
		if self.reader ~= nil and self.reader:isFresh(Result, Reference, SelectionSet, Context) then
			return Reference
		end
	end
	local MergeResult = {}
	
	if Unpacked2 ~= nil then
		MergeResult = Context.merge(MergeResult, Unpacked2)
	end
	local RootTypenamesByIdEntry = (if DataId1 then Policies.rootTypenamesById[DataId1] else DataId1) or (GetTypenameFromResultFunction(Result, SelectionSet, Context.fragmentMap) or (if DataId1 then Context.store:get(DataId1, "__typename") else DataId1))
	
	if type(RootTypenamesByIdEntry) == "string" then
		MergeResult.__typename = RootTypenamesByIdEntry
	end
	local NewSet = Set.new(SelectionSet.selections)
	
	for _, Field in NewSet do
		if ShouldIncludeFunction(Field, Context.variables) then
			if not IsFieldFunction(Field) then
				local FragmentFromSelection = GetFragmentFromSelectionFunction(Field, Context.fragmentMap)
				
				if FragmentFromSelection and Policies:fragmentMatches(FragmentFromSelection, RootTypenamesByIdEntry, Result, Context.variables) then
					Array.forEach(FragmentFromSelection.selectionSet.selections, NewSet.add, NewSet)
					continue
				end
				continue
			end
			local Entry = Result[ResultKeyNameFromFieldFunction(Field)]
			local ClientOnly = Context.clientOnly
			Context.clientOnly = ClientOnly or Field.directives and Array.some(Field.directives, function(p2): boolean
				return p2.name.value == "client"
			end)
			
			if Entry == nil then
				if not Context.clientOnly and not AddTypenameToDocument:added(Field) then
					InvariantFunction.error((string.sub(("Missing field '%s' while writing result %s"):format(ResultKeyNameFromFieldFunction(Field), HttpService:JSONEncode(Result)), 1, 1000)))
				end
			else
				local StoreFieldName = Policies:getStoreFieldName({
					typename = RootTypenamesByIdEntry,
					fieldName = Field.name.value,
					field = Field,
					variables = Context.variables
				})
				local CallbackResult = Callback1(MergeTree, StoreFieldName)
				local ProcessFieldValueResult = self:processFieldValue(Entry, Field, Context, CallbackResult)
				local Typename = nil
				local NoSelectionSet = Field.selectionSet == nil
				
				if not NoSelectionSet then
					Typename = Context.store:getFieldValue(ProcessFieldValueResult, "__typename")
					NoSelectionSet = Typename or not IsReferenceFunction(ProcessFieldValueResult)
				end
				if not NoSelectionSet then
					local GetResult = Context.incomingById:get(ProcessFieldValueResult.__ref)
					Typename = if GetResult == nil then nil else GetResult.fields.__typename
				end
				local MergeFunction = Policies:getMergeFunction(RootTypenamesByIdEntry, Field.name.value, Typename)
				
				if MergeFunction == nil then
					Callback2(MergeTree, StoreFieldName)
				else
					CallbackResult.info = {
						field = Field,
						typename = RootTypenamesByIdEntry,
						merge = MergeFunction
					}
				end
				MergeResult = Context.merge(MergeResult, { [StoreFieldName] = ProcessFieldValueResult })
			end
			Context.clientOnly = ClientOnly
		end
	end
	if type(DataId1) ~= "string" then
		return MergeResult
	end
	local GetResult = Context.incomingById:get(DataId1)
	
	if GetResult then
		GetResult.fields = Context.merge(GetResult.fields, MergeResult)
		GetResult.mergeTree = Callback3(GetResult.mergeTree, MergeTree)
		GetResult.selections:forEach(NewSet.add, NewSet)
		GetResult.selections = NewSet
	else
		Context.incomingById:set(DataId1, {
			fields = MergeResult,
			mergeTree = MergeTree,
			selections = NewSet
		})
	end
	return MakeReferenceFunction(DataId1)
end

function Module.processFieldValue(p2, Result, Field, Context, MergeTree)
	-- upvalues: NULL (copy), DEV (copy), CloneDeepFunction (copy), Array (copy), Callback1 (ref), Callback2 (ref)
	return if Field.selectionSet and Result ~= NULL then if Array.isArray(Result) then Array.map(Result, function(p3, p4)
		-- upvalues: p2 (copy), Field (copy), Context (copy), Callback1 (upval), MergeTree (copy), Callback2 (upval)
		local ProcessFieldValueResult = p2:processFieldValue(p3, Field, Context, Callback1(MergeTree, p4))
		Callback2(MergeTree, p4)
		
		return ProcessFieldValueResult
	end) else p2:processSelectionSet({
		result = Result,
		selectionSet = Field.selectionSet,
		context = Context,
		mergeTree = MergeTree
	}) elseif DEV then CloneDeepFunction(Result) else Result
end

function Module.applyMerges(p2, MergeTree, FieldValue, FieldValue1, Context, List)
	-- upvalues: IsReferenceFunction (copy), Array (copy), StoreValueIsStoreObjectFunction (copy), Map (copy), InvariantFunction (copy), Boolean (copy)
	if MergeTree.map.size > 0 and not IsReferenceFunction(FieldValue1) then
		local IsReference = not Array.isArray(FieldValue1) and (IsReferenceFunction(FieldValue) or StoreValueIsStoreObjectFunction(FieldValue))
		local FieldValue2 = if IsReference then FieldValue else nil
		local Tbl = FieldValue1
		
		if FieldValue2 ~= nil and not List then
			List = if IsReferenceFunction(FieldValue2) then { FieldValue2.__ref } else { FieldValue2 }
		end
		local v1 = nil
		
		local function _(p3, p4)
			-- upvalues: Array (upval), Context (copy)
			return if Array.isArray(p3) then if typeof(p4) == "number" then p3[p4] else nil else Context.store:getFieldValue(p3, (tostring(p4)))
		end
		
		MergeTree.map:forEach(function(p3, Removed)
			-- upvalues: FieldValue2 (copy), Array (upval), Context (copy), Tbl (copy), List (ref), p2 (copy), v1 (ref), Map (upval), InvariantFunction (upval)
			local FieldValueEntry = if Array.isArray(FieldValue2) then if typeof(Removed) == "number" then FieldValue2[Removed] else nil else Context.store:getFieldValue(FieldValue2, (tostring(Removed)))
			local Entry = if Array.isArray(Tbl) then if typeof(Removed) == "number" then Tbl[Removed] else nil else Context.store:getFieldValue(Tbl, (tostring(Removed)))
			
			if Entry == nil then return end
			if List ~= nil then
				table.insert(List, Removed)
			end
			local ApplyMergesResult = p2:applyMerges(p3, FieldValueEntry, Entry, Context, List)
			
			if ApplyMergesResult ~= Entry then
				v1 = v1 or Map.new(nil)
				v1:set(Removed, ApplyMergesResult)
			end
			if List ~= nil then
				InvariantFunction(table.remove(List, #List) == Removed)
			end
		end)
		
		if v1 ~= nil then
			FieldValue1 = table.clone(Tbl)
			v1:forEach(function(p3, Key)
				-- upvalues: FieldValue1 (ref)
				FieldValue1[Key] = p3
			end)
		end
	end
	return if MergeTree.info then p2.cache.policies:runMergeFunction(FieldValue, FieldValue1, MergeTree.info, Context, Boolean.toJSBoolean(List) and Context.store:getStorage(table.unpack(List)) or nil) else FieldValue1
end

WriteToStore.StoreWriter = Module
local List = {}

Callback1 = function(MergeTree, StoreFieldName)
	-- upvalues: List (copy), Map (copy)
	local Map1 = MergeTree.map
	
	if not Map1:has(StoreFieldName) then
		Map1:set(StoreFieldName, table.remove(List, #List) or { map = Map.new(nil) })
	end
	return (Map1:get(StoreFieldName))
end

Callback3 = function(GetResult, GetResult1)
	-- upvalues: Callback4 (ref), Object (copy), Map (copy), Set (copy), Callback3 (ref)
	if GetResult == GetResult1 or GetResult1 == nil or Callback4(GetResult1) then
		return GetResult
	end
	if GetResult == nil or Callback4(GetResult) then
		return GetResult1
	end
	local Size = if GetResult.map.size > 0 then GetResult1.map.size else GetResult.map.size
	local config = {
		info = if GetResult.info and GetResult1.info then Object.assign(table.clone(GetResult.info), GetResult1.info) else GetResult.info or GetResult1.info,
		map = if Size > 0 then Map.new() elseif GetResult.map.size > 0 then GetResult.map else GetResult1.map
	}
	
	if Size > 0 then
		local NewSet = Set.new(GetResult1.map:keys())
		GetResult.map:forEach(function(p2, p3)
			-- upvalues: config (copy), Callback3 (upval), GetResult1 (copy), NewSet (copy)
			config.map:set(p3, Callback3(p2, GetResult1.map:get(p3)))
			NewSet:delete(p3)
		end)
		NewSet:forEach(function(p2)
			-- upvalues: config (copy), Callback3 (upval), GetResult1 (copy), GetResult (copy)
			config.map:set(p2, Callback3(GetResult1.map:get(p2), GetResult.map:get(p2)))
		end)
	end
	return config
end

Callback4 = function(GetResult): boolean
	return not GetResult or not (GetResult.info or GetResult.map.size > 0)
end

Callback2 = function(MergeTree, StoreFieldName)
	-- upvalues: Callback4 (ref), List (copy)
	local Map = MergeTree.map
	local GetResult = Map:get(StoreFieldName)
	
	if GetResult ~= nil and Callback4(GetResult) then
		table.insert(List, GetResult)
		Map:delete(StoreFieldName)
	end
end

local NewSet = Set.new()

Callback = function(p2, Fields, p3, Store)
	-- upvalues: IsReferenceFunction (copy), EqualModule (copy), Array (copy), Object (copy), Boolean (copy), FieldNameFromStoreNameFunction (copy), NewSet (copy), InvariantFunction (copy), HttpService (copy)
	local function _(p4)
		-- upvalues: Store (copy), p3 (copy)
		local FieldValue = Store:getFieldValue(p4, p3)
		
		return typeof(FieldValue) == "table" and FieldValue
	end
	
	local FieldValue = Store:getFieldValue(p2, p3)
	local FieldValue1 = typeof(FieldValue) == "table" and FieldValue
	
	if not FieldValue1 then return end
	local FieldValue2 = Store:getFieldValue(Fields, p3)
	local FieldValue21 = typeof(FieldValue2) == "table" and FieldValue2
	
	if not FieldValue21 then return end
	if IsReferenceFunction(FieldValue1) then return end
	if EqualModule(FieldValue1, FieldValue21) then return end
	if Array.every(Object.keys(FieldValue1), function(p4): boolean
		-- upvalues: Store (copy), FieldValue21 (copy)
		return Store:getFieldValue(FieldValue21, p4) ~= nil
	end) then return end
	local TypenameFieldValue = Store:getFieldValue(p2, "__typename")
	local TypenameFieldValue1 = Boolean.toJSBoolean(TypenameFieldValue) and TypenameFieldValue or Store:getFieldValue(Fields, "__typename")
	local FieldNameFromStoreNameResult = FieldNameFromStoreNameFunction(p3)
	local Text: string = ("%s.%s"):format(TypenameFieldValue1, FieldNameFromStoreNameResult)
	
	if NewSet:has(Text) then return end
	NewSet:add(Text)
	local List = {}
	
	if not Array.isArray(FieldValue1) and not Array.isArray(FieldValue21) then
		Array.forEach({ FieldValue1, FieldValue21 }, function(p4)
			-- upvalues: Store (copy), Array (upval), List (copy)
			local TypenameFieldValue = Store:getFieldValue(p4, "__typename")
			
			if typeof(TypenameFieldValue) == "string" and not Array.includes(List, TypenameFieldValue) then
				table.insert(List, TypenameFieldValue)
			end
		end)
	end
	InvariantFunction.warn(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(FieldNameFromStoreNameResult, TypenameFieldValue1, if Boolean.toJSBoolean(#List) then "either ensure all objects of type " .. Array.join(List, " and ") .. " have an ID or a custom merge function, or " else "", Text, string.sub(HttpService:JSONEncode(FieldValue1), 1, 1000), (string.sub(HttpService:JSONEncode(FieldValue21), 1, 1000))))
end

return WriteToStore