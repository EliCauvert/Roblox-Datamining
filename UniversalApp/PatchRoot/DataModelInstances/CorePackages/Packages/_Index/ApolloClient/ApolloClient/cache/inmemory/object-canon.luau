local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local weakMap = luauPolyfillModule.WeakMap
local map = luauPolyfillModule.Map
local objectModule = require(parent.luaUtils.Object)
local httpService = game:GetService("HttpService")
local t = {}
local trie = require(parent.wry.trie).Trie
local utilitiesModule = require(script.Parent.Parent.Parent.utilities)
local canUseWeakMap = utilitiesModule.canUseWeakMap
local isNonNullObject = utilitiesModule.isNonNullObject
local sortedEncode = require(parent.luaUtils.sortedEncode).sortedEncode
local resetCanonicalStringify = nil
local var1 = nil
local var2 = nil

local function _(p1)
	return table.clone(p1)
end

local _ = function(p1)
	return #p1 == 0 and not next(p1) or #p1 > 1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), set (ref), trie (ref), canUseWeakMap (ref), weakMap (ref), map (ref)
	local tbl = setmetatable({}, t_1)
	tbl.known = set.new()
	tbl.pool = trie.new(canUseWeakMap)
	tbl.passes = weakMap.new()
	tbl.keysByJSON = map.new(nil)
	tbl.empty = tbl:admit({})
	
	return tbl
end

function t_1:isKnown(p1)
	-- upvalues: isNonNullObject (ref)
	return isNonNullObject(p1) and self.known:has(p1)
end

function t_1:pass(p1)
	-- upvalues: isNonNullObject (ref)
	if isNonNullObject(p1) then
		local cloned = table.clone(p1)
		self.passes:set(cloned, p1)
		
		return cloned
	end
	return p1
end

function t_1:admit(p1)
	-- upvalues: isNonNullObject (ref), objectModule (ref), array (ref)
	if isNonNullObject(p1) then
		local var3 = self.passes:get(p1)
		
		if var3 then
			return var3
		elseif objectModule.getPrototypeOf(p1) ~= nil then
			return p1
		end
		if #p1 == 0 and not next(p1) or #p1 <= 1 then
			if self.known:has(p1) then
				return p1
			end
			local var4 = array.map(p1, self.admit, self)
			local var5 = self.pool:lookupArray(var4)
			
			if not var5.array then
				var5.array = var4
				self.known:add(var5.array)
				
				if _G.__DEV__ then
					objectModule.freeze(var4)
				end
			end
			return var5.array
		elseif self.known:has(p1) then
			return p1
		end
		local prototypeOf = objectModule.getPrototypeOf(p1)
		local list = { prototypeOf }
		local var6 = self:sortedKeys(p1)
		table.insert(list, var6.json)
		local listCount = #list
		array.forEach(var6.sorted, function(p2)
			-- upvalues: list (ref), self (ref), p1 (ref)
			table.insert(list, self:admit(p1[p2]))
		end)
		local var7 = self.pool:lookupArray(list)
		
		if not var7.object then
			var7.object = objectModule.create(prototypeOf)
			local object = var7.object
			self.known:add(object)
			array.forEach(var6.sorted, function(p2, p3)
				-- upvalues: object (ref), list (ref), listCount (ref)
				object[p2] = list[listCount + p3]
			end)
			
			if _G.__DEV__ then
				objectModule.freeze(object)
			end
		end
		return var7.object
	end
end

function t_1:sortedKeys(p1)
	-- upvalues: objectModule (ref), array (ref), httpService (ref)
	local var3 = objectModule.keys(p1)
	local var4 = self.pool:lookupArray(var3)
	
	if not var4.keys then
		array.sort(var3)
		local var5 = httpService:JSONEncode(var3)
		var4.keys = self.keysByJSON:get(var5)
		
		if not var4.keys then
			var4.keys = { sorted = var3, json = var5 }
			self.keysByJSON:set(var5, var4.keys)
		end
	end
	return var4.keys
end

t.ObjectCanon = t_1
t.canonicalStringify = objectModule.assign(setmetatable({}, {
	__call = function(_, p1)
		-- upvalues: isNonNullObject (ref), var1 (write), resetCanonicalStringify (write), var2 (write), sortedEncode (ref), httpService (ref)
		if not isNonNullObject(p1) then
			return httpService:JSONEncode(p1)
		elseif var1 == nil then
			resetCanonicalStringify()
		end
		local var3 = var1:admit(p1)
		local var4 = var2:get(var3)
		
		if var4 == nil then
			var4 = sortedEncode(var3)
			var2:set(var3, var4)
		end
		return var4
	end
}), {
	reset = function(_)
		-- upvalues: resetCanonicalStringify (write)
		return resetCanonicalStringify()
	end
})

resetCanonicalStringify = function()
	-- upvalues: var1 (write), t_1 (ref), var2 (write), weakMap (ref)
	var1 = t_1.new()
	var2 = weakMap.new()
end

return t