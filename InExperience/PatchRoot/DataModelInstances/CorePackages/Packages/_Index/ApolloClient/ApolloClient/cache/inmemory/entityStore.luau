local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local instanceof = luauPolyfillModule.instanceof
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local isCallableModule = require(parent.luaUtils.isCallable)
local objectKeysForEachModule = require(parent.luaUtils.objectKeysForEach)
local dep = require(parent.optimism).dep
local invariant = require(parent.jsutils.invariant).invariant
local equalModule = require(parent.jsutils.equal)
local trie = require(parent.wry.trie).Trie
local utilitiesModule = require(script.Parent.Parent.Parent.utilities)
local isReference = utilitiesModule.isReference
local makeReference = utilitiesModule.makeReference
local deepMerger = utilitiesModule.DeepMerger
local maybeDeepFreeze = utilitiesModule.maybeDeepFreeze
local canUseWeakMap = utilitiesModule.canUseWeakMap
local isNonNullObject = utilitiesModule.isNonNullObject
local _ = require(script.Parent.types)
local helpersModule = require(script.Parent.helpers)
local hasOwn = helpersModule.hasOwn
local fieldNameFromStoreName = helpersModule.fieldNameFromStoreName
local _ = require(script.Parent.policies)
local _ = require(script.Parent.Parent.core.types.Cache)
local _ = require(script.Parent.Parent.core.types.common)
local t_1 = {}
local _ = nil

local function delModifier()
	-- upvalues: t_1 (ref)
	return t_1
end

local t_2 = {}
local tbl = nil
local tbl_1 = nil
local makeDepKey = nil
local storeObjectReconciler = nil
local var1 = nil
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1, p2)
	-- upvalues: t_3 (ref), maybeDeepFreeze (ref), isReference (ref), makeReference (ref)
	local tbl = setmetatable({}, t_3)
	tbl.policies = p1
	tbl.group = p2
	tbl.data = {}
	tbl.rootIds = {}
	tbl.refs = {}
	
	function tbl.getFieldValue(_, p3, p4)
		-- upvalues: maybeDeepFreeze (copy), isReference (copy), tbl (ref)
		return maybeDeepFreeze(if isReference(p3) then tbl:get(p3.__ref, p4) else p3 and p3[p4])
	end
	
	function tbl.canRead(_, p3)
		-- upvalues: isReference (copy), tbl (ref)
		return if isReference(p3) then tbl:has(p3.__ref) else typeof(p3) == "table"
	end
	
	function tbl.toReference(_, p3, p4)
		-- upvalues: makeReference (copy), isReference (copy), tbl (ref)
		if type(p3) == "string" then
			return makeReference(p3)
		elseif isReference(p3) then
			return p3
		end
		local unpacked = table.unpack(tbl.policies:identify(p3), 1, 1)
		
		if not unpacked then return end
		local var2 = makeReference(unpacked)
		
		if p4 then
			tbl:merge(unpacked, p3)
		end
		return var2
	end
	
	return tbl
end

function t_3.addLayer(_, _, _)
	error("not implemented abstract method")
end

function t_3.removeLayer(_, _)
	error("not implemented abstract method")
end

function t_3:toObject()
	return table.clone(self.data)
end

function t_3:has(p1)
	return self:lookup(p1, true) ~= nil
end

function t_3:get(p1, p2)
	-- upvalues: hasOwn (ref), boolean (ref), instanceof (ref), tbl (write)
	self.group:depend(p1, p2)
	
	if hasOwn(self.data, p1) then
		local var2 = self.data[p1]
		
		return if boolean.toJSBoolean(var2) and hasOwn(var2, p2) then var2[p2] elseif p2 == "__typename" and hasOwn(self.policies.rootTypenamesById, p1) then self.policies.rootTypenamesById[p1] elseif instanceof(self, tbl) then self.parent:get(p1, p2) else nil
	end
end

function t_3:lookup(p1, p2)
	-- upvalues: hasOwn (ref), instanceof (ref), tbl (write)
	if p2 then
		self.group:depend(p1, "__exists")
	end
	return if hasOwn(self.data, p1) then self.data[p1] elseif instanceof(self, tbl) then self.parent:lookup(p1, p2) elseif self.policies.rootTypenamesById[p1] then {} else nil
end

function t_3:merge(p1, p2)
	-- upvalues: isReference (ref), invariant (ref), deepMerger (ref), storeObjectReconciler (write), objectKeysForEachModule (ref), fieldNameFromStoreName (ref), instanceof (ref), tbl (write)
	local var2 = nil
	
	if isReference(p1) then
		p1 = p1.__ref
	end
	if isReference(p2) then
		p2 = p2.__ref
	end
	local var3
	local _ = nil
	
	if type(p1) == "string" then
		var2 = p1
		var3 = self:lookup(var2)
	else
		var3 = p1
	end
	local var4
	local _ = nil
	
	if type(p2) == "string" then
		var2 = p2
		var4 = self:lookup(var2)
	else
		var4 = p2
	end
	if not var4 then return end
	invariant(typeof(var2) == "string", "store.merge expects a string ID")
	local var5 = deepMerger.new(storeObjectReconciler):merge(var3, var4)
	self.data[var2] = var5
	
	if var5 ~= var3 then
		self.refs[var2] = nil
		
		if self.group.caching then
			local t = {}
			
			if not var3 then
				t.__exists = 1
			end
			objectKeysForEachModule(var4, function(p3)
				-- upvalues: var3 (write), var5 (ref), t (ref), fieldNameFromStoreName (copy), self (ref), instanceof (copy), tbl (copy)
				if not var3 or var3[p3] ~= var5[p3] then
					t[p3] = 1
					local var6 = fieldNameFromStoreName(p3)
					
					if var6 ~= p3 and not self.policies:hasKeyArgs(var5.__typename, var6) then
						t[var6] = 1
					end
					if var5[p3] == nil and not instanceof(self, tbl) then
						var5[p3] = nil
					end
				end
			end)
			
			if t.__typename and (not var3 or not var3.__typename) and self.policies.rootTypenamesById[var2] == var5.__typename then
				t.__typename = nil
			end
			objectKeysForEachModule(t, function(p3)
				-- upvalues: self (ref), var2 (write)
				return self.group:dirty(var2, p3)
			end)
		end
	end
end

function t_3:modify(p1, p2)
	-- upvalues: t_1 (ref), t_2 (ref), isReference (ref), makeReference (ref), objectKeysForEachModule (ref), fieldNameFromStoreName (ref), isCallableModule (ref), delModifier (write), maybeDeepFreeze (ref), object (ref), deepMerger (ref), instanceof (ref), tbl (write)
	local var2 = self:lookup(p1)
	
	if var2 then
		local t = {}
		local var3 = false
		local var4 = true
		local t_3 = {
			DELETE = t_1,
			INVALIDATE = t_2,
			isReference = function(_, ...)
				-- upvalues: isReference (copy)
				return isReference(...)
			end,
			toReference = self.toReference,
			canRead = self.canRead,
			readField = function(_, p3, p4)
				-- upvalues: self (ref), makeReference (copy), p1 (ref)
				return self.policies:readField(typeof(p3) == "string" and ({ fieldName = p3, from = p4 or makeReference(p1) } or p3), { store = self })
			end
		}
		objectKeysForEachModule(var2, function(p3)
			-- upvalues: fieldNameFromStoreName (copy), var2 (ref), isCallableModule (copy), p2 (ref), delModifier (copy), t_1 (copy), maybeDeepFreeze (copy), object (copy), t_3 (ref), self (ref), p1 (ref), t_2 (copy), deepMerger (copy), t (ref), var3 (write), var4 (write)
			local var5 = fieldNameFromStoreName(p3)
			local var6 = var2[p3]
			
			if var6 == nil then return end
			local var7
			local _ = nil
			
			if isCallableModule(p2) then
				var7 = p2
			else
				local var8 = p2
				var7 = var8[p3] or var8[var5]
			end
			if var7 then
				local var9 = if var7 == delModifier then t_1 else var7(if not isCallableModule(p2) then p2 else nil, maybeDeepFreeze(var6), object.assign(table.clone(t_3), {
					fieldName = var5,
					storeFieldName = p3,
					storage = self:getStorage(p1, p3)
				}))
				
				if var9 == t_2 then
					self.group:dirty(p1, p3)
				elseif var9 == t_1 then
					var9 = deepMerger.None
				end
				if var9 ~= var6 then
					t[p3] = var9
					var3 = true
					var6 = var9
				end
			end
			if var6 ~= nil and var6 ~= deepMerger.None then
				var4 = false
			end
		end)
	end
	return false
end

function t_3:delete(p1, p2, p3)
	-- upvalues: delModifier (write)
	local var2 = self:lookup(p1)
	
	if not var2 then
		return false
	end
	local _ = nil
	local var3 = if p2 and p3 then self.policies:getStoreFieldName({
		typename = self:getFieldValue(var2, "__typename"),
		fieldName = p2,
		args = p3
	}) else p2
	
	return self:modify(p1, if var3 then { [var3] = delModifier } else delModifier)
end

function t_3:evict(p1)
	-- upvalues: hasOwn (ref), instanceof (ref), tbl (write)
	local var2 = false
	
	if p1.id then
		if hasOwn(self.data, p1.id) then
			var2 = self:delete(p1.id, p1.fieldName, p1.args)
		end
		if instanceof(self, tbl) then
			var2 = self.parent:evict(p1) or var2
		end
		if p1.fieldName or var2 then
			self.group:dirty(p1.id, p1.fieldName or "__exists")
		end
	end
	return var2
end

function t_3:clear()
	self:replace(nil)
end

function t_3:extract()
	-- upvalues: hasOwn (ref), array (ref)
	local var2 = self:toObject()
	local t = {}
	self:getRootIdSet():forEach(function(p1)
		-- upvalues: hasOwn (copy), self (ref), t (ref)
		if not hasOwn(self.policies.rootTypenamesById, p1) then
			table.insert(t, p1)
		end
	end)
	
	if #t > 0 then
		var2.__META = { extraRootIds = array.sort(t) }
	end
	return var2
end

function t_3:replace(p1)
	-- upvalues: objectKeysForEachModule (ref), hasOwn (ref), object (ref), array (ref)
	objectKeysForEachModule(self.data, function(p2)
		-- upvalues: p1 (ref), hasOwn (copy), self (ref)
		if not p1 or not hasOwn(p1, p2) then
			self:delete(p2)
		end
	end)
	
	if p1 ~= nil then
		local mETA = p1.__META
		local var2 = object.assign(table.clone(p1), { __META = object.None })
		objectKeysForEachModule(var2, function(p2)
			-- upvalues: self (ref), var2 (ref)
			self:merge(p2, var2[p2])
		end)
		
		if mETA ~= nil then
			array.forEach(mETA.extraRootIds, self.retain, self)
		end
	end
end

function t_3.getStorage(_, _, ...)
	error("not implemented abstract method")
end

function t_3:retain(p1)
	-- upvalues: boolean (ref)
	self.rootIds[p1] = (if boolean.toJSBoolean(self.rootIds[p1]) then self.rootIds[p1] else 0) + 1
	
	return self.rootIds[p1]
end

function t_3:release(p1)
	-- upvalues: boolean (ref)
	if self.rootIds[p1] <= 0 then
		return 0
	end
	self.rootIds[p1] -= 1
	local var2 = self.rootIds[p1]
	
	if not boolean.toJSBoolean(var2) then
		self.rootIds[p1] = nil
	end
	return var2
end

function t_3:getRootIdSet(p1)
	-- upvalues: set (ref), array (ref), object (ref), instanceof (ref), tbl (write)
	local var2 = if p1 == nil then set.new() else p1
	array.forEach(object.keys(self.rootIds), var2.add, var2)
	
	if instanceof(self, tbl) then
		self.parent:getRootIdSet(var2)
		
		return var2
	end
	array.forEach(object.keys(self.policies.rootTypenamesById), var2.add, var2)
	
	return var2
end

function t_3:gc()
	-- upvalues: hasOwn (ref), array (ref), object (ref), boolean (ref), instanceof (ref), tbl (write)
	local rootIdSet = self:getRootIdSet()
	local var2 = self:toObject()
	
	for i, v in rootIdSet do
		if hasOwn(var2, v) then
			array.forEach(object.keys(self:findChildRefIds(v)), rootIdSet.add, rootIdSet)
			var2[v] = nil
		end
	end
	local var3 = object.keys(var2)
	
	if boolean.toJSBoolean(#var3) then
		local var4 = self
		while instanceof(var4, tbl) do
			var4 = var4.parent
		end
		array.forEach(var3, function(p1)
			-- upvalues: var4 (write)
			return var4:delete(p1)
		end)
	end
	return var3
end

function t_3:findChildRefIds(p1)
	-- upvalues: hasOwn (ref), set (ref), isReference (ref), isNonNullObject (ref), objectKeysForEachModule (ref)
	if not hasOwn(self.refs, p1) then
		self.refs[p1] = {}
		local var5 = self.refs[p1]
		local var6 = self.data[p1]
		
		if not var6 then
			return var5
		end
		local var7 = set.new({ var6 })
		
		for i, v in var7 do
			if isReference(v) then
				var5[v.__ref] = true
			end
			if isNonNullObject(v) then
				objectKeysForEachModule(v, function(p2)
					-- upvalues: v (ref), isNonNullObject (copy), var7 (ref)
					local var8 = v[p2]
					
					if isNonNullObject(var8) then
						var7:add(var8)
					end
				end)
			end
		end
	end
	return self.refs[p1]
end

function t_3:makeCacheKey(...)
	return self.group.keyMaker:lookupArray({ ... })
end

t.EntityStore = t_3
local t_4 = {}
t_4.__index = t_4

function t_4.new(p2, p3)
	-- upvalues: t_4 (ref)
	local tbl = setmetatable({}, t_4)
	tbl.caching = p2
	tbl.parent = p3
	tbl.d = nil
	tbl:resetCaching()
	
	return tbl
end

function t_4:resetCaching()
	-- upvalues: dep (ref), trie (ref), canUseWeakMap (ref)
	self.d = if self.caching then dep() else nil
	self.keyMaker = trie.new(canUseWeakMap)
end

function t_4:depend(p2, p3)
	-- upvalues: makeDepKey (write), fieldNameFromStoreName (ref)
	if self.d then
		self.d(makeDepKey(p2, p3))
		local var8 = fieldNameFromStoreName(p3)
		
		if var8 ~= p3 then
			self.d(makeDepKey(p2, var8))
		end
		if self.parent then
			self.parent:depend(p2, p3)
		end
	end
end

function t_4:dirty(p2, p3)
	-- upvalues: makeDepKey (write)
	if self.d then
		self.d:dirty(makeDepKey(p2, p3), if p3 == "__exists" then "forget" else "setDirty")
	end
end

makeDepKey = function(p2, p3)
	return p3 .. "#" .. p41
end

function t.maybeDependOnExistenceOfEntity(p2, p3)
	-- upvalues: var1 (write)
	if var1(p2) then
		p2.group:depend(p3, "__exists")
	end
end

local tbl_2 = setmetatable({}, { __index = t_3 })
tbl_2.__index = tbl_2

function tbl_2.new(p2)
	-- upvalues: t_3 (ref), t_4 (ref), tbl_2 (ref), tbl_1 (write), trie (ref), canUseWeakMap (ref)
	local policies = p2.policies
	local resultCaching = p2.resultCaching
	local seed = p2.seed
	
	if p2.resultCaching == nil then
		resultCaching = true
	end
	local tbl = setmetatable(t_3.new(policies, t_4.new(resultCaching)), tbl_2)
	tbl.stump = tbl_1.new(tbl)
	tbl.storageTrie = trie.new(canUseWeakMap)
	
	if seed then
		tbl:replace(seed)
	end
	return tbl
end

function tbl_2:addLayer(p2, p3)
	return self.stump:addLayer(p2, p3)
end

function tbl_2.removeLayer(p2)
	return p2
end

function tbl_2:getStorage(...)
	return self.storageTrie:lookupArray({ ... })
end

t.EntityStore_Root = tbl_2
tbl = setmetatable({}, { __index = t_3 })
tbl.__index = tbl

function tbl.new(p2, p3, p4, p5)
	-- upvalues: t_3 (ref), tbl (write)
	local tbl_1 = setmetatable(t_3.new(p3.policies, p5), tbl)
	tbl_1.id = p2
	tbl_1.parent = p3
	tbl_1.replay = p4
	tbl_1.group = p5
	p4(tbl_1, tbl_1)
	
	return tbl_1
end

function tbl:addLayer(p2, p3)
	-- upvalues: tbl (write)
	return tbl.new(p2, self, p3, self.group)
end

function tbl:removeLayer(p2)
	-- upvalues: objectKeysForEachModule (ref), equalModule (ref)
	local var8 = self.parent:removeLayer(p2)
	
	if p2 == self.id then
		if self.group.caching then
			objectKeysForEachModule(self.data, function(p3)
				-- upvalues: self (ref), var8 (ref), objectKeysForEachModule (copy), equalModule (copy)
				local var9 = self.data[p3]
				local var10 = var8:lookup(p3)
				
				if not var10 then
					self:delete(p3)
					
					return
				elseif not var9 then
					self.group:dirty(p3, "__exists")
					objectKeysForEachModule(var10, function(p4)
						-- upvalues: self (copy), p3 (ref)
						self.group:dirty(p3, p4)
					end)
					
					return
				elseif var9 ~= var10 then
					objectKeysForEachModule(var9, function(p4)
						-- upvalues: equalModule (copy), var9 (ref), var10 (ref), self (copy), p3 (ref)
						if not equalModule(var9[p4], var10[p4]) then
							self.group:dirty(p3, p4)
						end
					end)
				end
			end)
		end
		return var8
	else
		return if var8 == self.parent then self else var8:addLayer(self.id, self.replay)
	end
end

function tbl:toObject()
	-- upvalues: object (ref)
	return object.assign({}, self.parent:toObject(), self.data)
end

function tbl:findChildRefIds(p2)
	-- upvalues: hasOwn (ref), object (ref)
	local var8 = self.parent:findChildRefIds(p2)
	
	return hasOwn(self.data, p2) and object.assign({}, var8, getmetatable(getmetatable(self)).__index.findChildRefIds(self, p2)) or var8
end

function tbl:getStorage(...)
	local parent = self.parent
	while parent.parent do
		parent = parent.parent
	end
	return parent:getStorage(...)
end

tbl_1 = setmetatable({}, { __index = tbl })
tbl_1.__index = tbl_1

function tbl_1.new(p2)
	-- upvalues: tbl (write), t_4 (ref), tbl_1 (write)
	return setmetatable(tbl.new("EntityStore.Stump", p2, function() end, t_4.new(p2.group.caching, p2.group)), tbl_1)
end

function tbl_1.removeLayer(p2)
	return p2
end

function tbl_1:merge(...)
	return self.parent:merge(...)
end

storeObjectReconciler = function(_, p2, p3, p4)
	-- upvalues: equalModule (ref)
	local var8 = p2[p4]
	local var9 = p3[p4]
	
	return if equalModule(var8, var9) then var8 else var9
end

function t.supportsResultCaching(p2)
	return type(p2) == "table" and (type(p2.group) == "table" and p2.group.caching == true)
end

return t