local EntityStore = {}
local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local InstanceofFunction = LuauPolyfillModule.instanceof
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local IsCallableModule = require(Parent.luaUtils.isCallable)
local ObjectKeysForEachModule = require(Parent.luaUtils.objectKeysForEach)
local DepFunction = require(Parent.optimism).dep
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local EqualModule = require(Parent.jsutils.equal)
local Trie = require(Parent.wry.trie).Trie
local UtilitiesModule = require(script.Parent.Parent.Parent.utilities)
local IsReferenceFunction = UtilitiesModule.isReference
local MakeReferenceFunction = UtilitiesModule.makeReference
local DeepMerger = UtilitiesModule.DeepMerger
local MaybeDeepFreezeFunction = UtilitiesModule.maybeDeepFreeze
local CanUseWeakMap = UtilitiesModule.canUseWeakMap
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local _ = require(script.Parent.types)
local HelpersModule = require(script.Parent.helpers)
local HasOwnFunction = HelpersModule.hasOwn
local FieldNameFromStoreNameFunction = HelpersModule.fieldNameFromStoreName
local _ = require(script.Parent.policies)
local _ = require(script.Parent.Parent.core.types.Cache)
local _ = require(script.Parent.Parent.core.types.common)
local None = {}
local delModifier = nil

delModifier = function() --[[ Line: 80 | Named "delModifier" ]]
	-- upvalues: None (copy)
	return None
end

local None1 = {}
local Module = nil
local Module1 = nil
local Callback = nil
local StoreObjectReconciler = nil
local Callback1 = nil
local Module2 = {}
Module2.__index = Module2

function Module2.new(Policies, Group) --[[ Line: 136 ]]
	-- upvalues: Module2 (copy), MaybeDeepFreezeFunction (copy), IsReferenceFunction (copy), MakeReferenceFunction (copy)
	local self = setmetatable({}, Module2)
	self.policies = Policies
	self.group = Group
	self.data = {}
	self.rootIds = {}
	self.refs = {}
	
	function self:getFieldValue(LookupResult, p1) --[[ Line: 152 ]]
		-- upvalues: MaybeDeepFreezeFunction (upval), IsReferenceFunction (upval), self (copy)
		return (MaybeDeepFreezeFunction(if IsReferenceFunction(LookupResult) then self:get(LookupResult.__ref, p1) else LookupResult and LookupResult[p1]))
	end
	
	function self:canRead(p1) --[[ Line: 169 ]]
		-- upvalues: IsReferenceFunction (upval), self (copy)
		return if IsReferenceFunction(p1) then self:has(p1.__ref) else typeof(p1) == "table"
	end
	
	function self:toReference(p1, p2) --[[ Line: 181 ]]
		-- upvalues: MakeReferenceFunction (upval), IsReferenceFunction (upval), self (copy)
		if type(p1) == "string" then
			return MakeReferenceFunction(p1)
		end
		if IsReferenceFunction(p1) then
			return p1
		end
		local Unpacked = table.unpack(self.policies:identify(p1), 1, 1)
		
		if not Unpacked then return end
		local Reference = MakeReferenceFunction(Unpacked)
		
		if p2 then
			self:merge(Unpacked, p1)
		end
		return Reference
	end
	
	return self
end

function Module2:addLayer(_, _) --[[ Line: 211 ]]
	error("not implemented abstract method")
end

function Module2:removeLayer(_) --[[ Line: 215 ]]
	error("not implemented abstract method")
end

function Module2:toObject() --[[ Line: 223 ]]
	return table.clone(self.data)
end

function Module2:has(Ref): boolean --[[ Line: 229 ]]
	return self:lookup(Ref, true) ~= nil
end

function Module2:get(Ref, p1) --[[ Line: 233 ]]
	-- upvalues: HasOwnFunction (copy), Boolean (copy), InstanceofFunction (copy), Module (ref)
	self.group:depend(Ref, p1)
	
	if HasOwnFunction(self.data, Ref) then
		local Entry = self.data[Ref]
		
		if Boolean.toJSBoolean(Entry) and HasOwnFunction(Entry, p1) then
			return Entry[p1]
		end
	end
	return if p1 == "__typename" and HasOwnFunction(self.policies.rootTypenamesById, Ref) then self.policies.rootTypenamesById[Ref] elseif InstanceofFunction(self, Module) then self.parent:get(Ref, p1) else nil
end

function Module2:lookup(p1, p2) --[[ Line: 252 ]]
	-- upvalues: HasOwnFunction (copy), InstanceofFunction (copy), Module (ref)
	if p2 then
		self.group:depend(p1, "__exists")
	end
	return if HasOwnFunction(self.data, p1) then self.data[p1] elseif InstanceofFunction(self, Module) then self.parent:lookup(p1, p2) elseif self.policies.rootTypenamesById[p1] then {} else nil
end

function Module2:merge(p1, p2) --[[ Line: 281 ]]
	-- upvalues: IsReferenceFunction (copy), InvariantFunction (copy), DeepMerger (copy), StoreObjectReconciler (ref), ObjectKeysForEachModule (copy), FieldNameFromStoreNameFunction (copy), InstanceofFunction (copy), Module (ref)
	local v1 = nil
	
	if IsReferenceFunction(p1) then
		p1 = p1.__ref
	end
	if IsReferenceFunction(p2) then
		p2 = p2.__ref
	end
	local LookupResult = nil
	
	if type(p1) == "string" then
		v1 = p1
		LookupResult = self:lookup(v1)
	else
		LookupResult = p1
	end
	local LookupResult1 = nil
	if type(p2) == "string" then
		v1 = p2
		LookupResult1 = self:lookup(v1)
	else
		LookupResult1 = p2
	end
	if not LookupResult1 then return end
	InvariantFunction(typeof(v1) == "string", "store.merge expects a string ID")
	local MergeResult = DeepMerger.new(StoreObjectReconciler):merge(LookupResult, LookupResult1)
	self.data[v1] = MergeResult
	
	if MergeResult ~= LookupResult then
		self.refs[v1] = nil
		
		if self.group.caching then
			local t = {}
			
			if not LookupResult then
				t.__exists = 1
			end
			ObjectKeysForEachModule(LookupResult1, function(Key) --[[ Line: 350 ]]
				-- upvalues: LookupResult (ref), MergeResult (copy), t (copy), FieldNameFromStoreNameFunction (upval), self (copy), InstanceofFunction (upval), Module (upval)
				if not LookupResult or LookupResult[Key] ~= MergeResult[Key] then
					t[Key] = 1
					local FieldNameFromStoreNameResult = FieldNameFromStoreNameFunction(Key)
					
					if FieldNameFromStoreNameResult ~= Key and not self.policies:hasKeyArgs(MergeResult.__typename, FieldNameFromStoreNameResult) then
						t[FieldNameFromStoreNameResult] = 1
					end
					if MergeResult[Key] == nil and not InstanceofFunction(self, Module) then
						MergeResult[Key] = nil
					end
				end
			end)
			
			if t.__typename and (not LookupResult or not LookupResult.__typename) and self.policies.rootTypenamesById[v1] == MergeResult.__typename then
				t.__typename = nil
			end
			ObjectKeysForEachModule(t, function(p3) --[[ Line: 397 ]]
				-- upvalues: self (copy), v1 (ref)
				return self.group:dirty(v1, p3)
			end)
		end
	end
end

function Module2:modify(p1, p2): boolean --[[ Line: 405 ]]
	-- upvalues: None (copy), None1 (copy), IsReferenceFunction (copy), MakeReferenceFunction (copy), ObjectKeysForEachModule (copy), FieldNameFromStoreNameFunction (copy), IsCallableModule (copy), delModifier (ref), MaybeDeepFreezeFunction (copy), Object (copy), DeepMerger (copy), InstanceofFunction (copy), Module (ref)
	local LookupResult = self:lookup(p1)
	
	if LookupResult then
		local Nones = {}
		local Flag = false
		local Flag1 = true
		local config = {
			DELETE = None,
			INVALIDATE = None1,
			isReference = function(_, ...) --[[ Line: 418 ]]
				-- upvalues: IsReferenceFunction (upval)
				return IsReferenceFunction(...)
			end,
			toReference = self.toReference,
			canRead = self.canRead,
			readField = function(_, FieldName, p3) --[[ Line: 423 ]]
				-- upvalues: self (copy), MakeReferenceFunction (upval), p1 (copy)
				return self.policies:readField(typeof(FieldName) == "string" and {
					fieldName = FieldName,
					from = p3 or MakeReferenceFunction(p1)
				} or FieldName, { store = self })
			end
		}
		ObjectKeysForEachModule(LookupResult, function(StoreFieldName) --[[ Line: 440 ]]
			-- upvalues: FieldNameFromStoreNameFunction (upval), LookupResult (copy), IsCallableModule (upval), p2 (copy), delModifier (upval), None (upval), MaybeDeepFreezeFunction (upval), Object (upval), config (copy), self (copy), p1 (copy), None1 (upval), DeepMerger (upval), Nones (copy), Flag (ref), Flag1 (ref)
			local FieldNameFromStoreNameResult = FieldNameFromStoreNameFunction(StoreFieldName)
			local LookupResultEntry = LookupResult[StoreFieldName]
			
			if LookupResultEntry == nil then return end
			local Callback = if IsCallableModule(p2) then p2 else p2[StoreFieldName] or p2[FieldNameFromStoreNameResult]
			
			if Callback then
				local None2 = if Callback == delModifier then None else Callback(if IsCallableModule(p2) then nil else p2 or nil, MaybeDeepFreezeFunction(LookupResultEntry), Object.assign(table.clone(config), {
					fieldName = FieldNameFromStoreNameResult,
					storeFieldName = StoreFieldName,
					storage = self:getStorage(p1, StoreFieldName)
				}))
				
				if None2 == None1 then
					self.group:dirty(p1, StoreFieldName)
				else
					if None2 == None then
						None2 = DeepMerger.None
					end
					if None2 ~= LookupResultEntry then
						Nones[StoreFieldName] = None2
						Flag = true
						LookupResultEntry = None2
					end
				end
			end
			if LookupResultEntry ~= nil and LookupResultEntry ~= DeepMerger.None then
				Flag1 = false
			end
		end)
		
		if Flag then
			self:merge(p1, Nones)
			
			if Flag1 then
				if InstanceofFunction(self, Module) then
					self.data[p1] = nil
				else
					self.data[p1] = nil
				end
				self.group:dirty(p1, "__exists")
			end
			return true
		end
	end
	return false
end

function Module2:delete(Id, FieldName, Args) --[[ Line: 520 ]]
	-- upvalues: delModifier (ref)
	local LookupResult = self:lookup(Id)
	
	if LookupResult then
		local TypenameFieldValue = self:getFieldValue(LookupResult, "__typename")
		local StoreFieldName = if FieldName and Args then self.policies:getStoreFieldName({
			typename = TypenameFieldValue,
			fieldName = FieldName,
			args = Args
		}) else FieldName
		
		return self:modify(Id, if StoreFieldName then { [StoreFieldName] = delModifier } else delModifier)
	else
		return false
	end
end

function Module2:evict(p1) --[[ Line: 547 ]]
	-- upvalues: HasOwnFunction (copy), InstanceofFunction (copy), Module (ref)
	local DeleteResult = false
	
	if p1.id then
		if HasOwnFunction(self.data, p1.id) then
			DeleteResult = self:delete(p1.id, p1.fieldName, p1.args)
		end
		if InstanceofFunction(self, Module) then
			DeleteResult = self.parent:evict(p1) or DeleteResult
		end
		if p1.fieldName or DeleteResult then
			self.group:dirty(p1.id, p1.fieldName or "__exists")
		end
	end
	return DeleteResult
end

function Module2:clear() --[[ Line: 575 ]]
	self:replace(nil)
end

function Module2:extract() --[[ Line: 579 ]]
	-- upvalues: HasOwnFunction (copy), Array (copy)
	local Object = self:toObject()
	local List = {}
	self:getRootIdSet():forEach(function(p1) --[[ Line: 582 ]]
		-- upvalues: HasOwnFunction (upval), self (copy), List (copy)
		if not HasOwnFunction(self.policies.rootTypenamesById, p1) then
			table.insert(List, p1)
		end
	end)
	
	if #List > 0 then
		Object.__META = { extraRootIds = Array.sort(List) }
	end
	return Object
end

function Module2:replace(Tbl) --[[ Line: 595 ]]
	-- upvalues: ObjectKeysForEachModule (copy), HasOwnFunction (copy), Object (copy), Array (copy)
	ObjectKeysForEachModule(self.data, function(p1) --[[ Line: 597 ]]
		-- upvalues: Tbl (copy), HasOwnFunction (upval), self (copy)
		if not Tbl or not HasOwnFunction(Tbl, p1) then
			self:delete(p1)
		end
	end)
	
	if Tbl ~= nil then
		local META = Tbl.__META
		local AssignResult = Object.assign(table.clone(Tbl), { __META = Object.None })
		ObjectKeysForEachModule(AssignResult, function(p1) --[[ Line: 613 ]]
			-- upvalues: self (copy), AssignResult (copy)
			self:merge(p1, AssignResult[p1])
		end)
		
		if META ~= nil then
			Array.forEach(META.extraRootIds, self.retain, self)
		end
	end
end

function Module2:getStorage(_, ...) --[[ Line: 626 ]]
	error("not implemented abstract method")
end

function Module2:retain(p1) --[[ Line: 630 ]]
	-- upvalues: Boolean (copy)
	self.rootIds[p1] = (if Boolean.toJSBoolean(self.rootIds[p1]) then self.rootIds[p1] else 0) + 1
	
	return self.rootIds[p1]
end

function Module2:release(Key) --[[ Line: 637 ]]
	-- upvalues: Boolean (copy)
	if self.rootIds[Key] <= 0 then
		return 0
	end
	local RootIds = self.rootIds
	RootIds[Key] -= 1
	local RootId = self.rootIds[Key]
	
	if not Boolean.toJSBoolean(RootId) then
		self.rootIds[Key] = nil
	end
	return RootId
end

function Module2:getRootIdSet(p1) --[[ Line: 654 ]]
	-- upvalues: Set (copy), Array (copy), Object (copy), InstanceofFunction (copy), Module (ref)
	local NewSet = if p1 == nil then Set.new() else p1
	Array.forEach(Object.keys(self.rootIds), NewSet.add, NewSet)
	
	if InstanceofFunction(self, Module) then
		self.parent:getRootIdSet(NewSet)
		
		return NewSet
	else
		Array.forEach(Object.keys(self.policies.rootTypenamesById), NewSet.add, NewSet)
		
		return NewSet
	end
end

function Module2:gc() --[[ Line: 675 ]]
	-- upvalues: HasOwnFunction (copy), Array (copy), Object (copy), Boolean (copy), InstanceofFunction (copy), Module (ref)
	local RootIdSet = self:getRootIdSet()
	local Object1 = self:toObject()
	
	for _, value in RootIdSet do
		if HasOwnFunction(Object1, value) then
			Array.forEach(Object.keys(self:findChildRefIds(value)), RootIdSet.add, RootIdSet)
			Object1[value] = nil
		end
	end
	local KeysResult = Object.keys(Object1)
	
	if Boolean.toJSBoolean(#KeysResult) then
		local Parent1 = self
		while InstanceofFunction(Parent1, Module) do
			Parent1 = Parent1.parent
		end
		Array.forEach(KeysResult, function(p1) --[[ Line: 700 ]]
			-- upvalues: Parent1 (ref)
			return Parent1:delete(p1)
		end)
	end
	return KeysResult
end

function Module2:findChildRefIds(p1) --[[ Line: 707 ]]
	-- upvalues: HasOwnFunction (copy), Set (copy), IsReferenceFunction (copy), IsNonNullObjectFunction (copy), ObjectKeysForEachModule (copy)
	if not HasOwnFunction(self.refs, p1) then
		self.refs[p1] = {}
		local Ref = self.refs[p1]
		local Entry = self.data[p1]
		
		if not Entry then
			return Ref
		end
		local NewSet = Set.new({ Entry })
		
		for _, value in NewSet do
			if IsReferenceFunction(value) then
				Ref[value.__ref] = true
			end
			if IsNonNullObjectFunction(value) then
				ObjectKeysForEachModule(value, function(p2) --[[ Line: 736 ]]
					-- upvalues: value (copy), IsNonNullObjectFunction (upval), NewSet (copy)
					local Entry = value[p2]
					
					if IsNonNullObjectFunction(Entry) then
						NewSet:add(Entry)
					end
				end)
			end
		end
	end
	return self.refs[p1]
end

function Module2:makeCacheKey(...) --[[ Line: 753 ]]
	return self.group.keyMaker:lookupArray({ ... })
end

EntityStore.EntityStore = Module2
local Module3 = {}
Module3.__index = Module3

function Module3.new(Caching, Parent) --[[ Line: 784 ]]
	-- upvalues: Module3 (copy)
	local self = setmetatable({}, Module3)
	self.caching = Caching
	self.parent = Parent
	self.d = nil
	self:resetCaching()
	
	return self
end

function Module3:resetCaching() --[[ Line: 793 ]]
	-- upvalues: DepFunction (copy), Trie (copy), CanUseWeakMap (copy)
	self.d = if self.caching then DepFunction() else nil
	self.keyMaker = Trie.new(CanUseWeakMap)
end

function Module3:depend(p2, p3) --[[ Line: 800 ]]
	-- upvalues: Callback (ref), FieldNameFromStoreNameFunction (copy)
	if self.d then
		self.d(Callback(p2, p3))
		local FieldNameFromStoreNameResult = FieldNameFromStoreNameFunction(p3)
		
		if FieldNameFromStoreNameResult ~= p3 then
			self.d(Callback(p2, FieldNameFromStoreNameResult))
		end
		if self.parent then
			self.parent:depend(p2, p3)
		end
	end
end

function Module3:dirty(p2, p3) --[[ Line: 822 ]]
	-- upvalues: Callback (ref)
	if self.d then
		self.d:dirty(Callback(p2, p3), if p3 == "__exists" then "forget" else "setDirty")
	end
end

Callback = function(Text, Text1): string --[[ Line: 840 | Named "makeDepKey" ]]
	return Text1 .. "#" .. Text
end

function EntityStore.maybeDependOnExistenceOfEntity(p2, p3) --[[ Line: 847 ]]
	-- upvalues: Callback1 (ref)
	if Callback1(p2) then
		p2.group:depend(p3, "__exists")
	end
end

local self = setmetatable({}, { __index = Module2 })
self.__index = self

function self.new(p2) --[[ Line: 872 ]]
	-- upvalues: Module2 (copy), Module3 (copy), self (copy), Module1 (ref), Trie (copy), CanUseWeakMap (copy)
	local Policies = p2.policies
	local ResultCaching = p2.resultCaching
	local Seed = p2.seed
	
	if p2.resultCaching == nil then
		ResultCaching = true
	end
	local self1 = setmetatable(Module2.new(Policies, Module3.new(ResultCaching)), self)
	self1.stump = Module1.new(self1)
	self1.storageTrie = Trie.new(CanUseWeakMap)
	
	if Seed then
		self1:replace(Seed)
	end
	return self1
end

function self:addLayer(p2, p3) --[[ Line: 896 ]]
	return self.stump:addLayer(p2, p3)
end

function self.removeLayer(p2) --[[ Line: 903 ]]
	return p2
end

function self:getStorage(...) --[[ Line: 908 ]]
	return self.storageTrie:lookupArray({ ... })
end

EntityStore.EntityStore_Root = self
Module = setmetatable({}, { __index = Module2 })
Module.__index = Module

function Module.new(Id, Parent, Callback: (any, any) -> (), Group) --[[ Line: 930 ]]
	-- upvalues: Module2 (copy), Module (ref)
	local self = setmetatable(Module2.new(Parent.policies, Group), Module)
	self.id = Id
	self.parent = Parent
	self.replay = Callback
	self.group = Group
	Callback(self, self)
	
	return self
end

function Module:addLayer(Id, Replay) --[[ Line: 945 ]]
	-- upvalues: Module (ref)
	return Module.new(Id, self, Replay, self.group)
end

function Module:removeLayer(Id) --[[ Line: 949 ]]
	-- upvalues: ObjectKeysForEachModule (copy), EqualModule (copy)
	local RemoveLayerResult = self.parent:removeLayer(Id)
	
	if Id ~= self.id then
		return if RemoveLayerResult == self.parent then self else RemoveLayerResult:addLayer(self.id, self.replay)
	end
	if self.group.caching then
		ObjectKeysForEachModule(self.data, function(p2) --[[ Line: 960 ]]
			-- upvalues: self (copy), RemoveLayerResult (copy), ObjectKeysForEachModule (upval), EqualModule (upval)
			local Entry = self.data[p2]
			local LookupResult = RemoveLayerResult.lookup(RemoveLayerResult, p2)
			
			if not LookupResult then
				self:delete(p2)
				
				return
			end
			if not Entry then
				self.group:dirty(p2, "__exists")
				ObjectKeysForEachModule(LookupResult, function(p3) --[[ Line: 982 ]]
					-- upvalues: self (upval), p2 (copy)
					self.group:dirty(p2, p3)
				end)
				
				return
			end
			if Entry ~= LookupResult then
				ObjectKeysForEachModule(Entry, function(p3) --[[ Line: 991 ]]
					-- upvalues: EqualModule (upval), Entry (copy), LookupResult (copy), self (upval), p2 (copy)
					if not EqualModule(Entry[p3], LookupResult[p3]) then
						self.group:dirty(p2, p3)
					end
				end)
			end
		end)
	end
	return RemoveLayerResult
end

function Module:toObject() --[[ Line: 1012 ]]
	-- upvalues: Object (copy)
	return Object.assign({}, self.parent:toObject(), self.data)
end

function Module:findChildRefIds(p2) --[[ Line: 1016 ]]
	-- upvalues: HasOwnFunction (copy), Object (copy)
	local ChildRefIds = self.parent:findChildRefIds(p2)
	local Index = getmetatable((getmetatable(self))).__index
	
	return HasOwnFunction(self.data, p2) and Object.assign({}, ChildRefIds, Index.findChildRefIds(self, p2)) or ChildRefIds
end

function Module:getStorage(...) --[[ Line: 1025 ]]
	local Parent = self.parent
	while Parent.parent do
		Parent = Parent.parent
	end
	return Parent:getStorage(...)
end

Module1 = setmetatable({}, { __index = Module })
Module1.__index = Module1

function Module1.new(Parent) --[[ Line: 1041 ]]
	-- upvalues: Module (ref), Module3 (copy), Module1 (ref)
	return (setmetatable(Module.new("EntityStore.Stump", Parent, function() --[[ Line: 1042 ]] end, Module3.new(Parent.group.caching, Parent.group)), Module1))
end

function Module1.removeLayer(p2) --[[ Line: 1047 ]]
	return p2
end

function Module1:merge(...) --[[ Line: 1052 ]]
	return self.parent:merge(...)
end

StoreObjectReconciler = function(_, p2, p3, p4) --[[ Line: 1061 | Named "storeObjectReconciler" ]]
	-- upvalues: EqualModule (copy)
	local v1 = p2[p4]
	local v2 = p3[p4]
	
	return if EqualModule(v1, v2) then v1 else v2
end

Callback1 = function(p2): boolean --[[ Line: 1081 | Named "supportsResultCaching" ]]
	return type(p2) == "table" and type(p2.group) == "table" and p2.group.caching == true
end

EntityStore.supportsResultCaching = Callback1

return EntityStore