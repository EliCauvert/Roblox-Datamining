local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local Map = LuauPolyfillModule.Map
local IsCallableModule = require(Parent.luaUtils.isCallable)
local ObjectKeysForEachModule = require(Parent.luaUtils.objectKeysForEach)
local LuauRegExpModule = require(Parent1.LuauRegExp)
local PoliciesModule = {}
local Callback2 = nil
local Callback3 = nil
local Callback = nil
local Callback1 = nil
local Callback5 = nil
local Callback4 = nil
local _ = require(Parent1.GraphQL)
local Trie = require(Parent.wry.trie).Trie
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local UtilitiesModule = require(script.Parent.Parent.Parent.utilities)
local GetFragmentFromSelectionFunction = UtilitiesModule.getFragmentFromSelection
local IsFieldFunction = UtilitiesModule.isField
local GetTypenameFromResultFunction = UtilitiesModule.getTypenameFromResult
local StoreKeyNameFromFieldFunction = UtilitiesModule.storeKeyNameFromField
local ArgumentsObjectFromFieldFunction = UtilitiesModule.argumentsObjectFromField
local IsReferenceFunction = UtilitiesModule.isReference
local GetStoreKeyNameFunction = UtilitiesModule.getStoreKeyName
local CanUseWeakMap = UtilitiesModule.canUseWeakMap
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local StringifyForDisplayFunction = UtilitiesModule.stringifyForDisplay
local HelpersModule = require(script.Parent.helpers)
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local FieldNameFromStoreNameFunction = HelpersModule.fieldNameFromStoreName
local StoreValueIsStoreObjectFunction = HelpersModule.storeValueIsStoreObject
local SelectionSetMatchesResultFunction = HelpersModule.selectionSetMatchesResult
local TypeOrFieldNameRegExp = HelpersModule.TypeOrFieldNameRegExp
local CacheSlot = require(script.Parent.reactiveVars).cacheSlot
local _ = require(script.Parent.Parent.core.types.common)
local _ = require(script.Parent.writeToStore_types)
GetStoreKeyNameFunction:setStringify(require(script.Parent["object-canon"]).canonicalStringify)
local _ = require(script.Parent.policies_types)

local function _(FieldFunctionOptions) --[[ Line: 145 | Named "argsFromFieldSpecifier" ]]
	-- upvalues: ArgumentsObjectFromFieldFunction (copy)
	return if FieldFunctionOptions.args == nil then if FieldFunctionOptions.field then ArgumentsObjectFromFieldFunction(FieldFunctionOptions.field, FieldFunctionOptions.variables) else nil else FieldFunctionOptions.args
end

local function defaultDataIdFromObject(_, p1, p2): string? --[[ Line: 159 ]]
	-- upvalues: HttpService (copy)
	local Typename = p1.__typename
	local Id = p1.id
	local Id1 = p1._id
	
	if type(Typename) == "string" then
		if p2 then
			if Id == nil then
				if Id1 == nil then
					p2.keyObject = nil
				else
					p2.keyObject = { _id = Id1 }
				end
			else
				p2.keyObject = { id = Id }
			end
		end
		if Id == nil then
			Id = Id1
		end
		if Id ~= nil then
			local ValueType = type(Id)
			
			return string.format("%s:%s", Typename, if ValueType == "number" or ValueType == "string" then Id else HttpService:JSONEncode(Id))
		end
	end
	return nil
end

PoliciesModule.defaultDataIdFromObject = defaultDataIdFromObject

local function nullKeyFieldsFn(_) --[[ Line: 191 ]]
	return nil
end

local function simpleKeyArgsFn(_, p1) --[[ Line: 194 ]]
	return p1.fieldName
end

local mergeTrueFn = nil

mergeTrueFn = function(_, p1, p2, p3) --[[ Line: 201 | Named "mergeTrueFn" ]]
	return p3:mergeObjects(p1, p2)
end

local mergeFalseFn = nil

mergeFalseFn = function(_, _, p1) --[[ Line: 205 | Named "mergeFalseFn" ]]
	return p1
end

local Module = {}
Module.__index = Module

function Module.new(Config) --[[ Line: 312 ]]
	-- upvalues: Module (copy), Map (copy), Object (copy), defaultDataIdFromObject (copy)
	local self = setmetatable({}, Module)
	self.typePolicies = {}
	self.toBeAdded = {}
	self.supertypeMap = Map.new(nil)
	self.fuzzySubtypes = Map.new(nil)
	self.cache = nil
	self.rootIdsByTypename = {}
	self.rootTypenamesById = {}
	self.usingPossibleTypes = false
	self.config = Config
	self.config = Object.assign({ dataIdFromObject = defaultDataIdFromObject }, Config)
	self.cache = self.config.cache
	self:setRootTypename("Query")
	self:setRootTypename("Mutation")
	self:setRootTypename("Subscription")
	
	if Config.possibleTypes then
		self:addPossibleTypes(Config.possibleTypes)
	end
	if Config.typePolicies then
		self:addTypePolicies(Config.typePolicies)
	end
	return self
end

function Module:identify(p1, SelectionSet, FragmentMap) --[[ Line: 353 ]]
	-- upvalues: GetTypenameFromResultFunction (copy), Callback1 (ref)
	local TypenameFromResult = if SelectionSet and FragmentMap then GetTypenameFromResultFunction(p1, SelectionSet, FragmentMap) else p1.__typename
	
	if TypenameFromResult == self.rootTypenamesById.ROOT_QUERY then
		return { "ROOT_QUERY" }
	end
	local config = {
		typename = TypenameFromResult,
		selectionSet = SelectionSet,
		fragmentMap = FragmentMap
	}
	local v1 = nil
	local TypePolicy = if TypenameFromResult then self:getTypePolicy(TypenameFromResult) else TypenameFromResult
	local KeyFn = if TypePolicy and TypePolicy.keyFn then TypePolicy.keyFn else self.config.dataIdFromObject
	local KeyFnResult = nil
	while KeyFn do
		KeyFnResult = KeyFn(TypePolicy, p1, config)
		
		if type(KeyFnResult) == "table" then
			KeyFn = Callback1(KeyFnResult)
			continue
		end
		v1 = KeyFnResult
		break
	end
	local Text = if v1 then tostring(v1) else nil
	
	return if config.keyObject then { Text, config.keyObject } else { Text }
end

function Module.addTypePolicies(p2, TypePolicies) --[[ Line: 425 ]]
	-- upvalues: ObjectKeysForEachModule (copy), Object (copy), HasOwnPropertyModule (copy)
	ObjectKeysForEachModule(TypePolicies, function(p3) --[[ Line: 427 ]]
		-- upvalues: TypePolicies (copy), Object (upval), p2 (copy), HasOwnPropertyModule (upval)
		local TypePolicy = TypePolicies[p3]
		local MutationType = TypePolicy.mutationType
		local SubscriptionType = TypePolicy.subscriptionType
		local AssignResult = Object.assign({}, TypePolicy, {
			queryType = Object.None,
			mutationType = Object.None,
			subscriptionType = Object.None
		})
		
		if TypePolicy.queryType then
			p2:setRootTypename("Query", p3)
		end
		if MutationType then
			p2:setRootTypename("Mutation", p3)
		end
		if SubscriptionType then
			p2:setRootTypename("Subscription", p3)
		end
		if HasOwnPropertyModule(p2.toBeAdded, p3) then
			table.insert(p2.toBeAdded[p3], AssignResult)
			
			return
		else
			p2.toBeAdded[p3] = { AssignResult }
		end
	end)
end

function Module:updateTypePolicy(p2, p3) --[[ Line: 471 ]]
	-- upvalues: IsCallableModule (copy), mergeTrueFn (ref), mergeFalseFn (ref), nullKeyFieldsFn (copy), Callback1 (ref), ObjectKeysForEachModule (copy), simpleKeyArgsFn (copy), Callback (ref)
	local TypePolicy = self:getTypePolicy(p2)
	local KeyFields = p3.keyFields
	local Fields = p3.fields
	
	local function _(p4, Enabled) --[[ Line: 475 | Named "setMerge" ]]
		-- upvalues: IsCallableModule (upval), mergeTrueFn (upval), mergeFalseFn (upval)
		if IsCallableModule(Enabled) then
			p4.merge = Enabled
			
			return
		end
		if Enabled == true then
			p4.merge = mergeTrueFn
			
			return
		end
		if Enabled == false then
			p4.merge = mergeFalseFn
			
			return
		else
			p4.merge = p4.merge
		end
	end
	
	local Merge = p3.merge
	
	if IsCallableModule(Merge) then
		TypePolicy.merge = Merge
	elseif Merge == true then
		TypePolicy.merge = mergeTrueFn
	elseif Merge == false then
		TypePolicy.merge = mergeFalseFn
	else
		TypePolicy.merge = TypePolicy.merge
	end
	if KeyFields == false then
		TypePolicy.keyFn = nullKeyFieldsFn
	else
		local ValueType = type(KeyFields)
		
		if ValueType == "table" then
			TypePolicy.keyFn = Callback1(KeyFields)
		elseif ValueType == "function" then
			TypePolicy.keyFn = KeyFields
		else
			TypePolicy.keyFn = TypePolicy.keyFn
		end
	end
	if Fields then
		ObjectKeysForEachModule(Fields, function(p4) --[[ Line: 530 ]]
			-- upvalues: self (copy), p2 (copy), Fields (copy), simpleKeyArgsFn (upval), Callback (upval), IsCallableModule (upval), mergeTrueFn (upval), mergeFalseFn (upval)
			local FieldPolicy = self:getFieldPolicy(p2, p4, true)
			local Field = Fields[p4]
			
			if type(Field) == "function" then
				FieldPolicy.read = Field
			else
				local KeyArgs = Field.keyArgs
				local ReadFunction = Field.read
				local Merge = Field.merge
				
				if KeyArgs == false then
					FieldPolicy.keyFn = simpleKeyArgsFn
				else
					local ValueType = type(KeyArgs)
					
					if ValueType == "table" then
						FieldPolicy.keyFn = Callback(KeyArgs)
					elseif ValueType == "function" then
						FieldPolicy.keyFn = KeyArgs
					else
						FieldPolicy.keyFn = FieldPolicy.keyFn
					end
				end
				if type(ReadFunction) == "function" then
					FieldPolicy.read = ReadFunction
				end
				if IsCallableModule(Merge) then
					FieldPolicy.merge = Merge
				elseif Merge == true then
					FieldPolicy.merge = mergeTrueFn
				elseif Merge == false then
					FieldPolicy.merge = mergeFalseFn
				else
					FieldPolicy.merge = FieldPolicy.merge
				end
			end
			if FieldPolicy.read and FieldPolicy.merge then
				FieldPolicy.keyFn = FieldPolicy.keyFn or simpleKeyArgsFn
			end
		end)
	end
end

function Module:setRootTypename(Text: string, p2) --[[ Line: 588 ]]
	-- upvalues: InvariantFunction (copy)
	local RootTypenamesByIdEntry: string = p2
	
	if RootTypenamesByIdEntry == nil then
		RootTypenamesByIdEntry = Text
	end
	local Text1 = "ROOT_" .. string.upper(Text)
	local RootTypenamesByIdEntry1 = self.rootTypenamesById[Text1]
	
	if RootTypenamesByIdEntry ~= RootTypenamesByIdEntry1 then
		local NoRootTypenamesByIdEntry1: boolean = not RootTypenamesByIdEntry1 or RootTypenamesByIdEntry1 == Text
		
		if not NoRootTypenamesByIdEntry1 then
			InvariantFunction(NoRootTypenamesByIdEntry1, ("Cannot change root %s __typename more than once"):format(Text))
		end
		if RootTypenamesByIdEntry1 then
			self.rootIdsByTypename[RootTypenamesByIdEntry1] = nil
		end
		self.rootIdsByTypename[RootTypenamesByIdEntry] = Text1
		self.rootTypenamesById[Text1] = RootTypenamesByIdEntry
	end
end

function Module:addPossibleTypes(PossibleTypes) --[[ Line: 617 ]]
	-- upvalues: ObjectKeysForEachModule (copy), Array (copy), TypeOrFieldNameRegExp (copy), LuauRegExpModule (copy)
	self.usingPossibleTypes = true
	ObjectKeysForEachModule(PossibleTypes, function(p2) --[[ Line: 620 ]]
		-- upvalues: self (copy), Array (upval), PossibleTypes (copy), TypeOrFieldNameRegExp (upval), LuauRegExpModule (upval)
		self:getSupertypeSet(p2, true)
		Array.forEach(PossibleTypes[p2], function(p3) --[[ Line: 627 ]]
			-- upvalues: self (upval), p2 (copy), TypeOrFieldNameRegExp (upval), LuauRegExpModule (upval)
			self:getSupertypeSet(p3, true):add(p2)
			local ExecResult = TypeOrFieldNameRegExp:exec(p3)
			
			if not ExecResult or ExecResult[1] ~= p3 then
				self.fuzzySubtypes:set(p3, LuauRegExpModule.new(p3))
			end
		end)
	end)
end

function Module:getTypePolicy(Typename) --[[ Line: 639 ]]
	-- upvalues: HasOwnPropertyModule (copy), Object (copy), Array (copy)
	if not HasOwnPropertyModule(self.typePolicies, Typename) then
		self.typePolicies[Typename] = {}
		local TypePolicy = self.typePolicies[Typename]
		TypePolicy.fields = {}
		local GetResult = self.supertypeMap:get(Typename)
		
		if GetResult and GetResult.size > 0 then
			GetResult:forEach(function(p2) --[[ Line: 673 ]]
				-- upvalues: self (copy), Object (upval), TypePolicy (copy)
				local TypePolicy1 = self:getTypePolicy(p2)
				local Fields = TypePolicy1.fields
				Object.assign(TypePolicy, (Object.assign(table.clone(TypePolicy1), { fields = Object.None })))
				Object.assign(TypePolicy.fields, Fields)
			end)
		end
	end
	local ToBeAddedEntry = self.toBeAdded[Typename]
	
	if ToBeAddedEntry and #ToBeAddedEntry > 0 then
		Array.forEach(Array.splice(ToBeAddedEntry, 1), function(p2) --[[ Line: 690 ]]
			-- upvalues: self (copy), Typename (copy)
			self:updateTypePolicy(Typename, p2)
		end)
	end
	return self.typePolicies[Typename]
end

function Module:getFieldPolicy(Typename, FieldName, p2) --[[ Line: 698 ]]
	if not Typename then
		return nil
	end
	local Fields = self:getTypePolicy(Typename).fields
	
	if Fields[FieldName] then
		return Fields[FieldName]
	elseif p2 then
		Fields[FieldName] = {}
		
		return Fields[FieldName]
	else
		return nil
	end
end

function Module:getSupertypeSet(p2, p3) --[[ Line: 725 ]]
	-- upvalues: Set (copy)
	local GetResult = self.supertypeMap:get(p2)
	
	if not GetResult and p3 then
		GetResult = Set.new()
		self.supertypeMap:set(p2, GetResult)
	end
	return GetResult
end

function Module:fragmentMatches(p2, p3, p4, p5): boolean --[[ Line: 736 ]]
	-- upvalues: Array (copy), InvariantFunction (copy), SelectionSetMatchesResultFunction (copy)
	if not p2.typeCondition then
		return true
	end
	if not p3 then
		return false
	end
	local Value = p2.typeCondition.name.value
	
	if p3 == Value then
		return true
	end
	if self.usingPossibleTypes and self.supertypeMap:has(Value) then
		local SupertypeSet = self:getSupertypeSet(p3, true)
		local List = { SupertypeSet }
		
		local function maybeEnqueue(p6) --[[ Line: 767 ]]
			-- upvalues: self (copy), Array (upval), List (copy)
			local SupertypeSet = self:getSupertypeSet(p6, false)
			
			if SupertypeSet and SupertypeSet.size > 0 and Array.indexOf(List, SupertypeSet) < 1 then
				table.insert(List, SupertypeSet)
			end
		end
		
		local IsSizeAbove: boolean = p4 ~= nil and self.fuzzySubtypes.size > 0
		local Flag = false
		
		for i, _ in List do
			local Entry = List[i]
			
			if Entry:has(Value) then
				if not SupertypeSet:has(Value) then
					if Flag then
						InvariantFunction.warn(("Inferring subtype %s of supertype %s"):format(p3, Value))
					end
					SupertypeSet:add(Value)
				end
				return true
			else
				Entry:forEach(maybeEnqueue)
				
				if IsSizeAbove and i == #List and SelectionSetMatchesResultFunction(p2.selectionSet, p4, p5) then
					IsSizeAbove = false
					Flag = true
					Array.forEach(self.fuzzySubtypes:entries(), function(Entry): number --[[ Line: 834 ]]
						-- upvalues: p3 (copy), self (copy), Array (upval), List (copy)
						local Entry1 = Entry[1]
						local ExecResult = Entry[2]:exec(p3)
						
						if ExecResult and ExecResult[1] == p3 then
							local SupertypeSet = self:getSupertypeSet(Entry1, false)
							
							if SupertypeSet and SupertypeSet.size > 0 and Array.indexOf(List, SupertypeSet) < 1 then
								table.insert(List, SupertypeSet)
							end
						end
						return 1
					end)
					continue
				end
			end
		end
	end
	return false
end

function Module:hasKeyArgs(p6, p7): boolean --[[ Line: 852 ]]
	local FieldPolicy = self:getFieldPolicy(p6, p7, false)
	
	return FieldPolicy ~= nil and FieldPolicy.keyFn ~= nil
end

function Module:getStoreFieldName(FieldFunctionOptions) --[[ Line: 859 ]]
	-- upvalues: ArgumentsObjectFromFieldFunction (copy), Callback (ref), StoreKeyNameFromFieldFunction (copy), GetStoreKeyNameFunction (copy), FieldNameFromStoreNameFunction (copy)
	local Typename = FieldFunctionOptions.typename
	local FieldName = FieldFunctionOptions.fieldName
	local FieldPolicy = self:getFieldPolicy(Typename, FieldName, false)
	local Enabled = nil
	local KeyFn = if FieldPolicy then FieldPolicy.keyFn else nil
	
	if KeyFn and Typename then
		local config = {
			typename = Typename,
			fieldName = FieldName,
			field = FieldFunctionOptions.field or nil,
			variables = FieldFunctionOptions.variables
		}
		local ArgumentsObjectFromFieldResult = if FieldFunctionOptions.args == nil then if FieldFunctionOptions.field then ArgumentsObjectFromFieldFunction(FieldFunctionOptions.field, FieldFunctionOptions.variables) else nil else FieldFunctionOptions.args
		local KeyFnResult = nil
		while KeyFn do
			KeyFnResult = KeyFn(ArgumentsObjectFromFieldResult, config)
			
			if type(KeyFnResult) == "table" then
				KeyFn = Callback(KeyFnResult)
				continue
			end
			Enabled = KeyFnResult or FieldName
			break
		end
	end
	if Enabled == nil then
		Enabled = if FieldFunctionOptions.field then StoreKeyNameFromFieldFunction(FieldFunctionOptions.field, FieldFunctionOptions.variables) else GetStoreKeyNameFunction(FieldName, if FieldFunctionOptions.args == nil then if FieldFunctionOptions.field then ArgumentsObjectFromFieldFunction(FieldFunctionOptions.field, FieldFunctionOptions.variables) else nil else FieldFunctionOptions.args)
	end
	return if Enabled == false then FieldName elseif FieldName == FieldNameFromStoreNameFunction(Enabled) then Enabled else FieldName .. ":" .. Enabled
end

function Module:readField(FieldFunctionOptions, p6) --[[ Line: 930 ]]
	-- upvalues: FieldNameFromStoreNameFunction (copy), Callback2 (ref), CacheSlot (copy)
	local From = FieldFunctionOptions.from
	
	if not From then return end
	if not FieldFunctionOptions.field and not FieldFunctionOptions.fieldName then return end
	if FieldFunctionOptions.typename == nil then
		local TypenameFieldValue = p6.store:getFieldValue(From, "__typename")
		
		if TypenameFieldValue then
			FieldFunctionOptions.typename = TypenameFieldValue
		end
	end
	local StoreFieldName = self:getStoreFieldName(FieldFunctionOptions)
	local FieldValue = p6.store:getFieldValue(From, StoreFieldName)
	local FieldPolicy = self:getFieldPolicy(FieldFunctionOptions.typename, FieldNameFromStoreNameFunction(StoreFieldName), false)
	local Read = if FieldPolicy then FieldPolicy.read else nil
	
	return if Read then CacheSlot:withValue(self.cache, Read, {
		FieldValue,
		(Callback2(self, From, FieldFunctionOptions, p6, p6.store:getStorage(if From.__ref then From.__ref else From, StoreFieldName)))
	}) else FieldValue
end

function Module:getMergeFunction(p6, p7, p8) --[[ Line: 990 ]]
	local FieldPolicy = self:getFieldPolicy(p6, p7, false)
	local Merge = if FieldPolicy then FieldPolicy.merge else FieldPolicy
	
	if not Merge and p8 then
		local TypePolicy = self:getTypePolicy(p8)
		
		if TypePolicy then
			return TypePolicy.merge
		end
		Merge = TypePolicy
	end
	return Merge
end

function Module.runMergeFunction(p6, p7, p8, p9, p10, p11) --[[ Line: 1021 ]]
	-- upvalues: mergeTrueFn (ref), Callback3 (ref), mergeFalseFn (ref), Callback2 (ref)
	local Field = p9.field
	local Typename = p9.typename
	local MergeFunction = p9.merge
	
	if MergeFunction == mergeTrueFn then
		return Callback3(p10.store)(p9, p7, p8)
	end
	if MergeFunction == mergeFalseFn then
		return p8
	end
	if p10.overwrite then
		p7 = nil
	end
	return MergeFunction(p9, p7, p8, Callback2(p6, nil, {
		typename = Typename,
		fieldName = Field.name.value,
		field = Field,
		variables = p10.variables
	}, p10, p11 or {}))
end

PoliciesModule.Policies = Module

Callback2 = function(p6, From, FieldFunctionOptions, p7, Storage) --[[ Line: 1081 | Named "makeFieldFunctionOptions" ]]
	-- upvalues: FieldNameFromStoreNameFunction (copy), ArgumentsObjectFromFieldFunction (copy), IsReferenceFunction (copy), Object (copy), HasOwnPropertyModule (copy), InvariantFunction (copy), StringifyForDisplayFunction (copy), Array (copy), Callback3 (ref)
	local StoreFieldName = p6:getStoreFieldName(FieldFunctionOptions)
	local Variables = FieldFunctionOptions.variables or p7.variables
	
	return {
		args = if FieldFunctionOptions.args == nil then if FieldFunctionOptions.field then ArgumentsObjectFromFieldFunction(FieldFunctionOptions.field, FieldFunctionOptions.variables) else nil else FieldFunctionOptions.args,
		field = FieldFunctionOptions.field or nil,
		fieldName = FieldNameFromStoreNameFunction(StoreFieldName),
		storeFieldName = StoreFieldName,
		variables = Variables,
		isReference = function(_, ...) --[[ Line: 1101 ]]
			-- upvalues: IsReferenceFunction (upval)
			return IsReferenceFunction(...)
		end,
		toReference = p7.store.toReference,
		storage = Storage,
		cache = p6.cache,
		canRead = p7.store.canRead,
		readField = function(_, Tbl, ...) --[[ Line: 1108 ]]
			-- upvalues: Object (upval), From (copy), HasOwnPropertyModule (upval), InvariantFunction (upval), StringifyForDisplayFunction (upval), Array (upval), Variables (copy), p6 (copy), p7 (copy)
			local ValueType = type(Tbl)
			local list = {
				if ValueType == "table" then Object.assign(table.clone(Tbl), if Tbl.from == Object.None then { from = "<Object.None>" } else nil) else Tbl,
				if select("#", ...) >= 1 then "<nil>" else nil
			}
			local AssignResult = nil
			
			if ValueType == "string" then
				AssignResult = {
					fieldName = Tbl,
					from = if select("#", ...) >= 1 then (...) else From
				}
			else
				if ValueType ~= "table" then
					InvariantFunction.warn(("Unexpected readField arguments: %s"):format(StringifyForDisplayFunction(Array.from(list))))
					
					return
				end
				AssignResult = Object.assign({}, Tbl)
				
				if not HasOwnPropertyModule(Tbl, "from") then
					AssignResult.from = From
				end
			end
			if _G.__DEV__ and AssignResult.from == nil then
				InvariantFunction.warn(("Undefined 'from' passed to readField with arguments %s"):format(StringifyForDisplayFunction(Array.from(list))))
			end
			if AssignResult.variables == nil then
				AssignResult.variables = Variables
			end
			return p6:readField(AssignResult, p7)
		end,
		mergeObjects = Callback3(p7.store)
	}
end

Callback3 = function(Store) --[[ Line: 1175 | Named "makeMergeObjectsFunction" ]]
	-- upvalues: Array (copy), InvariantError (copy), IsNonNullObjectFunction (copy), IsReferenceFunction (copy), StoreValueIsStoreObjectFunction (copy), Object (copy)
	return function(_, p8, p9) --[[ Line: 1176 ]]
		-- upvalues: Array (upval), InvariantError (upval), IsNonNullObjectFunction (upval), Store (copy), IsReferenceFunction (upval), StoreValueIsStoreObjectFunction (upval), Object (upval)
		if Array.isArray(p8) or Array.isArray(p9) then
			error(InvariantError.new("Cannot automatically merge arrays"))
		end
		if IsNonNullObjectFunction(p8) and IsNonNullObjectFunction(p9) then
			local TypenameFieldValue = Store:getFieldValue(p8, "__typename")
			local TypenameFieldValue1 = Store:getFieldValue(p9, "__typename")
			
			if TypenameFieldValue ~= nil and (TypenameFieldValue1 ~= nil and TypenameFieldValue ~= TypenameFieldValue1) then
				return p9
			elseif IsReferenceFunction(p8) and StoreValueIsStoreObjectFunction(p9) then
				Store:merge(p8.__ref, p9)
				
				return p8
			elseif StoreValueIsStoreObjectFunction(p8) and IsReferenceFunction(p9) then
				Store:merge(p8, p9.__ref)
				
				return p9
			elseif StoreValueIsStoreObjectFunction(p8) and StoreValueIsStoreObjectFunction(p9) then
				return Object.assign({}, p8, p9)
			end
		end
		return p9
	end
end

local function keyObjEncode(KeyObject, p8): string --[[ Line: 1226 ]]
	-- upvalues: Array (copy), keyObjEncode (copy), HttpService (copy)
	assert(typeof(p8) == "table", "specifier must be an array")
	
	return if next(p8) then "{" .. Array.join(Array.filter(Array.map(p8, function(Input, p9: number): string --[[ Line: 1236 ]]
		-- upvalues: Array (upval), KeyObject (copy), p8 (copy), keyObjEncode (upval), HttpService (upval)
		return if Array.isArray(Input) then "" elseif KeyObject[Input] then if p9 < #p8 then HttpService:JSONEncode(Input) .. ":" .. (if Array.isArray(p8[p9 + 1]) then keyObjEncode(KeyObject[Input], p8[p9 + 1]) else HttpService:JSONEncode(KeyObject[Input])) else HttpService:JSONEncode(Input) .. ":" .. HttpService:JSONEncode(KeyObject[Input]) else ""
	end), function(p9): boolean --[[ Line: 1259 ]]
		return p9 ~= ""
	end), ",") .. "}" else "[]"
end

Callback = function(KeyArgs) --[[ Line: 1268 | Named "keyArgsFnFromSpecifier" ]]
	-- upvalues: keyObjEncode (copy), Callback4 (ref)
	return function(p8, p9) --[[ Line: 1269 ]]
		-- upvalues: keyObjEncode (upval), Callback4 (upval), KeyArgs (copy)
		return if p8 then ("%s:%s"):format(p9.fieldName, (keyObjEncode(Callback4(p8, KeyArgs, false), KeyArgs))) else p9.fieldName
	end
end

Callback1 = function(KeyFields) --[[ Line: 1281 | Named "keyFieldsFnFromSpecifier" ]]
	-- upvalues: Trie (copy), CanUseWeakMap (copy), Callback5 (ref), Callback4 (ref), keyObjEncode (copy)
	local NewTrie = Trie.new(CanUseWeakMap)
	
	return function(_, p8, p9): string --[[ Line: 1283 ]]
		-- upvalues: NewTrie (copy), Callback5 (upval), Callback4 (upval), KeyFields (copy), keyObjEncode (upval)
		local AliasMap = nil
		
		if p9.selectionSet and p9.fragmentMap then
			local LookupArrayResult = NewTrie:lookupArray({ p9.selectionSet, p9.fragmentMap })
			
			if LookupArrayResult.aliasMap then
				AliasMap = LookupArrayResult.aliasMap
			else
				LookupArrayResult.aliasMap = Callback5(p9.selectionSet, p9.fragmentMap)
				AliasMap = LookupArrayResult.aliasMap
			end
		end
		p9.keyObject = Callback4(p8, KeyFields, true, AliasMap)
		
		return ("%s:%s"):format(p9.typename or "null", (keyObjEncode(p9.keyObject, KeyFields)))
	end
end

Callback5 = function(SelectionSet, FragmentMap) --[[ Line: 1311 | Named "makeAliasMap" ]]
	-- upvalues: Set (copy), Array (copy), IsFieldFunction (copy), Callback5 (ref), GetFragmentFromSelectionFunction (copy)
	local t = {}
	local NewSet = Set.new({ SelectionSet })
	
	for _, value in NewSet do
		Array.forEach(value.selections, function(p8) --[[ Line: 1316 ]]
			-- upvalues: IsFieldFunction (upval), t (copy), Callback5 (upval), FragmentMap (copy), GetFragmentFromSelectionFunction (upval), NewSet (copy)
			if IsFieldFunction(p8) then
				if p8.alias then
					local Value = p8.alias.value
					local Value1 = p8.name.value
					
					if Value1 ~= Value then
						local Aliases = nil
						if t.aliases then
							Aliases = t.aliases
						else
							t.aliases = {}
							Aliases = t.aliases
						end
						Aliases[Value1] = Value
					end
				end
				if p8.selectionSet then
					local Subsets = nil
					if t.subsets then
						Subsets = t.subsets
					else
						t.subsets = {}
						Subsets = t.subsets
					end
					Subsets[p8.name.value] = Callback5(p8.selectionSet, FragmentMap)
					
					return
				end
			else
				local FragmentFromSelection = GetFragmentFromSelectionFunction(p8, FragmentMap)
				
				if FragmentFromSelection then
					NewSet:add(FragmentFromSelection.selectionSet)
				end
			end
		end)
	end
	return t
end

Callback4 = function(p8, List, p9, AliasMap) --[[ Line: 1361 | Named "computeKeyObject" ]]
	-- upvalues: Callback4 (ref), HasOwnPropertyModule (copy), InvariantFunction (copy)
	local t = {}
	local v2 = nil
	
	for _, value in List do
		if type(value) ~= "table" then
			local Aliases = if AliasMap then AliasMap.aliases else AliasMap
			local Alias = if Aliases and Aliases[value] then Aliases[value] else value
			
			if HasOwnPropertyModule(p8, Alias) then
				v2 = value
				t[v2] = p8[Alias]
			else
				InvariantFunction(not p9, ("Missing field '%s' while computing key fields"):format(Alias))
				v2 = nil
			end
		elseif type(v2) == "string" then
			local Subsets = if AliasMap then AliasMap.subsets else AliasMap
			t[v2] = Callback4(p8[v2], value, p9, if Subsets then Subsets[v2] else Subsets)
		end
	end
	return t
end

PoliciesModule.None = Object.None

return PoliciesModule