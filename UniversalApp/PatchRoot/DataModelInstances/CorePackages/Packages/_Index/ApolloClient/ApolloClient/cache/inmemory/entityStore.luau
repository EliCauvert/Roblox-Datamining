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

local function delModifier() --[[ line: 80 ]]
	-- upvalues: t_1 (ref)
	return t_1
end

local t_2 = {}
local tbl = nil
local tbl_1 = nil
local makeDepKey = nil
local storeObjectReconciler = nil
local var14 = nil
local t_3 = {}
t_3.__index = t_3

function t_3.new(p0, p1) --[[ line: 136 ]]
	-- upvalues: t_3 (ref), maybeDeepFreeze (ref), isReference (ref), makeReference (ref)
	local tbl = setmetatable({}, t_3)
	tbl.policies = p0
	tbl.group = p1
	tbl.data = {}
	tbl.rootIds = {}
	tbl.refs = {}
	
	function tbl.getFieldValue(_, p2, p3) --[[ line: 152 ]]
		-- upvalues: maybeDeepFreeze (copy), isReference (copy), tbl (ref)
		return maybeDeepFreeze(if isReference(p2) then tbl:get(p2.__ref, p3) else p2 and p2[p3])
	end
	
	function tbl.canRead(_, p4) --[[ line: 169 ]]
		-- upvalues: isReference (copy), tbl (ref)
		return if isReference(p4) then tbl:has(p4.__ref) else typeof(p4) == "table"
	end
	
	function tbl.toReference(_, p5, p6) --[[ line: 181 ]]
		-- upvalues: makeReference (copy), isReference (copy), tbl (ref)
		if type(p5) == "string" then
			return makeReference(p5)
		elseif isReference(p5) then
			return p5
		end
		local unpacked = table.unpack(tbl.policies:identify(p5), 1, 1)
		
		if not unpacked then return end
		local var20 = makeReference(unpacked)
		
		if p6 then
			tbl:merge(unpacked, p5)
		end
		return var20
	end
	
	return tbl
end

function t_3.addLayer(_, _, _) --[[ line: 211 ]]
	error("not implemented abstract method")
end

function t_3.removeLayer(_, _) --[[ line: 215 ]]
	error("not implemented abstract method")
end

function t_3:toObject() --[[ line: 223 ]]
	return table.clone(self.data)
end

function t_3:has(p7) --[[ line: 229 ]]
	return self:lookup(p7, true) ~= nil
end

function t_3:get(p8, p9) --[[ line: 233 ]]
	-- upvalues: hasOwn (ref), boolean (ref), instanceof (ref), tbl (write)
	self.group:depend(p8, p9)
	
	if hasOwn(self.data, p8) then
		local var21 = self.data[p8]
		
		return if boolean.toJSBoolean(var21) and hasOwn(var21, p9) then var21[p9] elseif p9 == "__typename" and hasOwn(self.policies.rootTypenamesById, p8) then self.policies.rootTypenamesById[p8] elseif instanceof(self, tbl) then self.parent:get(p8, p9) else nil
	end
end

function t_3:lookup(p10, p11) --[[ line: 252 ]]
	-- upvalues: hasOwn (ref), instanceof (ref), tbl (write)
	if p11 then
		self.group:depend(p10, "__exists")
	end
	return if hasOwn(self.data, p10) then self.data[p10] elseif instanceof(self, tbl) then self.parent:lookup(p10, p11) elseif self.policies.rootTypenamesById[p10] then {} else nil
end

function t_3:merge(p12, p13) --[[ line: 281 ]]
	-- upvalues: isReference (ref), invariant (ref), deepMerger (ref), storeObjectReconciler (write), objectKeysForEachModule (ref), fieldNameFromStoreName (ref), instanceof (ref), tbl (write)
	local var22 = nil
	
	if isReference(p12) then
		p12 = p12.__ref
	end
	if isReference(p13) then
		p13 = p13.__ref
	end
	local var23
	local _ = nil
	
	if type(p12) == "string" then
		var22 = p12
		var23 = self:lookup(var22)
	else
		var23 = p12
	end
	local var24
	local _ = nil
	
	if type(p13) == "string" then
		var22 = p13
		var24 = self:lookup(var22)
	else
		var24 = p13
	end
	if not var24 then return end
	invariant(typeof(var22) == "string", "store.merge expects a string ID")
	local var25 = deepMerger.new(storeObjectReconciler):merge(var23, var24)
	self.data[var22] = var25
	
	if var25 ~= var23 then
		self.refs[var22] = nil
		
		if self.group.caching then
			local t = {}
			
			if not var23 then
				t.__exists = 1
			end
			objectKeysForEachModule(var24, function(p14) --[[ line: 350 ]]
				-- upvalues: var23 (write), var25 (ref), t (ref), fieldNameFromStoreName (copy), self (ref), instanceof (copy), tbl (copy)
				if not var23 or var23[p14] ~= var25[p14] then
					t[p14] = 1
					local var27 = fieldNameFromStoreName(p14)
					
					if var27 ~= p14 and not self.policies:hasKeyArgs(var25.__typename, var27) then
						t[var27] = 1
					end
					if var25[p14] == nil and not instanceof(self, tbl) then
						var25[p14] = nil
					end
				end
			end)
			
			if t.__typename and (not var23 or not var23.__typename) and self.policies.rootTypenamesById[var22] == var25.__typename then
				t.__typename = nil
			end
			objectKeysForEachModule(t, function(p15) --[[ line: 397 ]]
				-- upvalues: self (ref), var22 (write)
				return self.group:dirty(var22, p15)
			end)
		end
	end
end

function t_3:modify(p16, p17) --[[ line: 405 ]]
	-- upvalues: t_1 (ref), t_2 (ref), isReference (ref), makeReference (ref), objectKeysForEachModule (ref), fieldNameFromStoreName (ref), isCallableModule (ref), delModifier (write), maybeDeepFreeze (ref), object (ref), deepMerger (ref), instanceof (ref), tbl (write)
	local var28 = self:lookup(p16)
	
	if var28 then
		local t = {}
		local var30 = false
		local var31 = true
		local t_3 = {
			DELETE = t_1,
			INVALIDATE = t_2,
			isReference = function(_, ...) --[[ line: 418 ]]
				-- upvalues: isReference (copy)
				return isReference(...)
			end,
			toReference = self.toReference,
			canRead = self.canRead,
			readField = function(_, p18, p19) --[[ line: 423 ]]
				-- upvalues: self (ref), makeReference (copy), p16 (ref)
				return self.policies:readField(typeof(p18) == "string" and ({ fieldName = p18, from = p19 or makeReference(p16) } or p18), { store = self })
			end
		}
		objectKeysForEachModule(var28, function(p20) --[[ line: 440 ]]
			-- upvalues: fieldNameFromStoreName (copy), var28 (ref), isCallableModule (copy), p17 (ref), delModifier (copy), t_1 (copy), maybeDeepFreeze (copy), object (copy), t_3 (ref), self (ref), p16 (ref), t_2 (copy), deepMerger (copy), t (ref), var30 (write), var31 (write)
			local var33 = fieldNameFromStoreName(p20)
			local var34 = var28[p20]
			
			if var34 == nil then return end
			local var35
			local _ = nil
			
			if isCallableModule(p17) then
				var35 = p17
			else
				local var36 = p17
				var35 = var36[p20] or var36[var33]
			end
			if var35 then
				local var37 = if var35 == delModifier then t_1 else var35(if not isCallableModule(p17) then p17 else nil, maybeDeepFreeze(var34), object.assign(table.clone(t_3), {
					fieldName = var33,
					storeFieldName = p20,
					storage = self:getStorage(p16, p20)
				}))
				
				if var37 == t_2 then
					self.group:dirty(p16, p20)
				elseif var37 == t_1 then
					var37 = deepMerger.None
				end
				if var37 ~= var34 then
					t[p20] = var37
					var30 = true
					var34 = var37
				end
			end
			if var34 ~= nil and var34 ~= deepMerger.None then
				var31 = false
			end
		end)
	end
	return false
end

function t_3:delete(p21, p22, p23) --[[ line: 520 ]]
	-- upvalues: delModifier (write)
	local var38 = self:lookup(p21)
	
	if not var38 then
		return false
	end
	local _ = nil
	local var39 = if p22 and p23 then self.policies:getStoreFieldName({
		typename = self:getFieldValue(var38, "__typename"),
		fieldName = p22,
		args = p23
	}) else p22
	
	return self:modify(p21, if var39 then { [var39] = delModifier } else delModifier)
end

function t_3:evict(p24) --[[ line: 547 ]]
	-- upvalues: hasOwn (ref), instanceof (ref), tbl (write)
	local var40 = false
	
	if p24.id then
		if hasOwn(self.data, p24.id) then
			var40 = self:delete(p24.id, p24.fieldName, p24.args)
		end
		if instanceof(self, tbl) then
			var40 = self.parent:evict(p24) or var40
		end
		if p24.fieldName or var40 then
			self.group:dirty(p24.id, p24.fieldName or "__exists")
		end
	end
	return var40
end

function t_3:clear() --[[ line: 575 ]]
	self:replace(nil)
end

function t_3:extract() --[[ line: 579 ]]
	-- upvalues: hasOwn (ref), array (ref)
	local var41 = self:toObject()
	local t = {}
	self:getRootIdSet():forEach(function(p25) --[[ line: 582 ]]
		-- upvalues: hasOwn (copy), self (ref), t (ref)
		if not hasOwn(self.policies.rootTypenamesById, p25) then
			table.insert(t, p25)
		end
	end)
	
	if #t > 0 then
		var41.__META = { extraRootIds = array.sort(t) }
	end
	return var41
end

function t_3:replace(p26) --[[ line: 595 ]]
	-- upvalues: objectKeysForEachModule (ref), hasOwn (ref), object (ref), array (ref)
	objectKeysForEachModule(self.data, function(p27) --[[ line: 597 ]]
		-- upvalues: p26 (ref), hasOwn (copy), self (ref)
		if not p26 or not hasOwn(p26, p27) then
			self:delete(p27)
		end
	end)
	
	if p26 ~= nil then
		local mETA = p26.__META
		local var43 = object.assign(table.clone(p26), { __META = object.None })
		objectKeysForEachModule(var43, function(p28) --[[ line: 613 ]]
			-- upvalues: self (ref), var43 (ref)
			self:merge(p28, var43[p28])
		end)
		
		if mETA ~= nil then
			array.forEach(mETA.extraRootIds, self.retain, self)
		end
	end
end

function t_3.getStorage(_, _, ...) --[[ line: 626 ]]
	error("not implemented abstract method")
end

function t_3:retain(p29) --[[ line: 630 ]]
	-- upvalues: boolean (ref)
	self.rootIds[p29] = (if boolean.toJSBoolean(self.rootIds[p29]) then self.rootIds[p29] else 0) + 1
	
	return self.rootIds[p29]
end

function t_3:release(p30) --[[ line: 637 ]]
	-- upvalues: boolean (ref)
	if self.rootIds[p30] <= 0 then
		return 0
	end
	self.rootIds[p30] -= 1
	local var44 = self.rootIds[p30]
	
	if not boolean.toJSBoolean(var44) then
		self.rootIds[p30] = nil
	end
	return var44
end

function t_3:getRootIdSet(p31) --[[ line: 654 ]]
	-- upvalues: set (ref), array (ref), object (ref), instanceof (ref), tbl (write)
	local var45 = if p31 == nil then set.new() else p31
	array.forEach(object.keys(self.rootIds), var45.add, var45)
	
	if instanceof(self, tbl) then
		self.parent:getRootIdSet(var45)
		
		return var45
	end
	array.forEach(object.keys(self.policies.rootTypenamesById), var45.add, var45)
	
	return var45
end

function t_3:gc() --[[ line: 675 ]]
	-- upvalues: hasOwn (ref), array (ref), object (ref), boolean (ref), instanceof (ref), tbl (write)
	local rootIdSet = self:getRootIdSet()
	local var47 = self:toObject()
	
	for i, v in rootIdSet do
		if hasOwn(var47, v) then
			array.forEach(object.keys(self:findChildRefIds(v)), rootIdSet.add, rootIdSet)
			var47[v] = nil
		end
	end
	local var48 = object.keys(var47)
	
	if boolean.toJSBoolean(#var48) then
		local var49 = self
		while instanceof(var49, tbl) do
			var49 = var49.parent
		end
		array.forEach(var48, function(p32) --[[ line: 700 ]]
			-- upvalues: var49 (write)
			return var49:delete(p32)
		end)
	end
	return var48
end

function t_3:findChildRefIds(p33) --[[ line: 707 ]]
	-- upvalues: hasOwn (ref), set (ref), isReference (ref), isNonNullObject (ref), objectKeysForEachModule (ref)
	if not hasOwn(self.refs, p33) then
		self.refs[p33] = {}
		local var50 = self.refs[p33]
		local var51 = self.data[p33]
		
		if not var51 then
			return var50
		end
		local var52 = set.new({ var51 })
		
		for i, v in var52 do
			if isReference(v) then
				var50[v.__ref] = true
			end
			if isNonNullObject(v) then
				objectKeysForEachModule(v, function(p34) --[[ line: 736 ]]
					-- upvalues: v (ref), isNonNullObject (copy), var52 (ref)
					local var53 = v[p34]
					
					if isNonNullObject(var53) then
						var52:add(var53)
					end
				end)
			end
		end
	end
	return self.refs[p33]
end

function t_3:makeCacheKey(...) --[[ line: 753 ]]
	return self.group.keyMaker:lookupArray({ ... })
end

t.EntityStore = t_3
local t_4 = {}
t_4.__index = t_4

function t_4.new(p35, p36) --[[ line: 784 ]]
	-- upvalues: t_4 (ref)
	local tbl = setmetatable({}, t_4)
	tbl.caching = p35
	tbl.parent = p36
	tbl.d = nil
	tbl:resetCaching()
	
	return tbl
end

function t_4:resetCaching() --[[ line: 793 ]]
	-- upvalues: dep (ref), trie (ref), canUseWeakMap (ref)
	self.d = if self.caching then dep() else nil
	self.keyMaker = trie.new(canUseWeakMap)
end

function t_4:depend(p37, p38) --[[ line: 800 ]]
	-- upvalues: makeDepKey (write), fieldNameFromStoreName (ref)
	if self.d then
		self.d(makeDepKey(p37, p38))
		local var55 = fieldNameFromStoreName(p38)
		
		if var55 ~= p38 then
			self.d(makeDepKey(p37, var55))
		end
		if self.parent then
			self.parent:depend(p37, p38)
		end
	end
end

function t_4:dirty(p39, p40) --[[ line: 822 ]]
	-- upvalues: makeDepKey (write)
	if self.d then
		self.d:dirty(makeDepKey(p39, p40), if p40 == "__exists" then "forget" else "setDirty")
	end
end

makeDepKey = function(p41, p42) --[[ line: 840 | named "makeDepKey" ]]
	return p42 .. "#" .. p41
end

function t.maybeDependOnExistenceOfEntity(p43, p44) --[[ line: 847 ]]
	-- upvalues: var14 (write)
	if var14(p43) then
		p43.group:depend(p44, "__exists")
	end
end

local tbl_2 = setmetatable({}, { __index = t_3 })
tbl_2.__index = tbl_2

function tbl_2.new(p45) --[[ line: 872 ]]
	-- upvalues: t_3 (ref), t_4 (ref), tbl_2 (ref), tbl_1 (write), trie (ref), canUseWeakMap (ref)
	local policies = p45.policies
	local resultCaching = p45.resultCaching
	local seed = p45.seed
	
	if p45.resultCaching == nil then
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

function tbl_2:addLayer(p46, p47) --[[ line: 896 ]]
	return self.stump:addLayer(p46, p47)
end

function tbl_2.removeLayer(p48) --[[ line: 903 ]]
	return p48
end

function tbl_2:getStorage(...) --[[ line: 908 ]]
	return self.storageTrie:lookupArray({ ... })
end

t.EntityStore_Root = tbl_2
tbl = setmetatable({}, { __index = t_3 })
tbl.__index = tbl

function tbl.new(p49, p50, p51, p52) --[[ line: 930 ]]
	-- upvalues: t_3 (ref), tbl (write)
	local tbl_1 = setmetatable(t_3.new(p50.policies, p52), tbl)
	tbl_1.id = p49
	tbl_1.parent = p50
	tbl_1.replay = p51
	tbl_1.group = p52
	p51(tbl_1, tbl_1)
	
	return tbl_1
end

function tbl:addLayer(p53, p54) --[[ line: 945 ]]
	-- upvalues: tbl (write)
	return tbl.new(p53, self, p54, self.group)
end

function tbl:removeLayer(p55) --[[ line: 949 ]]
	-- upvalues: objectKeysForEachModule (ref), equalModule (ref)
	local var58 = self.parent:removeLayer(p55)
	
	if p55 == self.id then
		if self.group.caching then
			objectKeysForEachModule(self.data, function(p56) --[[ line: 960 ]]
				-- upvalues: self (ref), var58 (ref), objectKeysForEachModule (copy), equalModule (copy)
				local var59 = self.data[p56]
				local var60 = var58:lookup(p56)
				
				if not var60 then
					self:delete(p56)
					
					return
				elseif not var59 then
					self.group:dirty(p56, "__exists")
					objectKeysForEachModule(var60, function(p57) --[[ line: 982 ]]
						-- upvalues: self (copy), p56 (ref)
						self.group:dirty(p56, p57)
					end)
					
					return
				elseif var59 ~= var60 then
					objectKeysForEachModule(var59, function(p58) --[[ line: 991 ]]
						-- upvalues: equalModule (copy), var59 (ref), var60 (ref), self (copy), p56 (ref)
						if not equalModule(var59[p58], var60[p58]) then
							self.group:dirty(p56, p58)
						end
					end)
				end
			end)
		end
		return var58
	else
		return if var58 == self.parent then self else var58:addLayer(self.id, self.replay)
	end
end

function tbl:toObject() --[[ line: 1012 ]]
	-- upvalues: object (ref)
	return object.assign({}, self.parent:toObject(), self.data)
end

function tbl:findChildRefIds(p59) --[[ line: 1016 ]]
	-- upvalues: hasOwn (ref), object (ref)
	local var61 = self.parent:findChildRefIds(p59)
	
	return hasOwn(self.data, p59) and object.assign({}, var61, getmetatable(getmetatable(self)).__index.findChildRefIds(self, p59)) or var61
end

function tbl:getStorage(...) --[[ line: 1025 ]]
	local parent = self.parent
	while parent.parent do
		parent = parent.parent
	end
	return parent:getStorage(...)
end

tbl_1 = setmetatable({}, { __index = tbl })
tbl_1.__index = tbl_1

function tbl_1.new(p60) --[[ line: 1041 ]]
	-- upvalues: tbl (write), t_4 (ref), tbl_1 (write)
	return setmetatable(tbl.new("EntityStore.Stump", p60, function() --[[ line: 1042 ]] end, t_4.new(p60.group.caching, p60.group)), tbl_1)
end

function tbl_1.removeLayer(p61) --[[ line: 1047 ]]
	return p61
end

function tbl_1:merge(...) --[[ line: 1052 ]]
	return self.parent:merge(...)
end

storeObjectReconciler = function(_, p62, p63, p64) --[[ line: 1061 | named "storeObjectReconciler" ]]
	-- upvalues: equalModule (ref)
	local var62 = p62[p64]
	local var63 = p63[p64]
	
	return if equalModule(var62, var63) then var62 else var63
end

function t.supportsResultCaching(p65) --[[ line: 1081 ]]
	return type(p65) == "table" and (type(p65.group) == "table" and p65.group.caching == true)
end

return t