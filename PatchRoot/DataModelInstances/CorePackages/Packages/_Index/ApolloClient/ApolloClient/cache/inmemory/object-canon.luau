-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:13 2026 Pacific Standard Time.

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
local var6 = nil
local var7 = nil

local function _(p0) --[[ line: 47 | named "shallowCopy" ]]
	return table.clone(p0)
end

local _ = function(p1) --[[ line: 53 | named "isArrayLike" ]]
	return #p1 == 0 and not next(p1) or #p1 > 1
end

local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 147 ]]
	-- upvalues: t_1 (ref), set (ref), trie (ref), canUseWeakMap (ref), weakMap (ref), map (ref)
	local tbl = setmetatable({}, t_1)
	tbl.known = set.new()
	tbl.pool = trie.new(canUseWeakMap)
	tbl.passes = weakMap.new()
	tbl.keysByJSON = map.new(nil)
	tbl.empty = tbl:admit({})
	
	return tbl
end

function t_1:isKnown(p2) --[[ line: 162 ]]
	-- upvalues: isNonNullObject (ref)
	return isNonNullObject(p2) and self.known:has(p2)
end

function t_1:pass(p3) --[[ line: 166 ]]
	-- upvalues: isNonNullObject (ref)
	if isNonNullObject(p3) then
		local cloned = table.clone(p3)
		self.passes:set(cloned, p3)
		
		return cloned
	end
	return p3
end

function t_1:admit(p4) --[[ line: 177 ]]
	-- upvalues: isNonNullObject (ref), objectModule (ref), array (ref)
	if isNonNullObject(p4) then
		local var11 = self.passes:get(p4)
		
		if var11 then
			return var11
		elseif objectModule.getPrototypeOf(p4) ~= nil then
			return p4
		end
		if #p4 == 0 and not next(p4) or #p4 <= 1 then
			if self.known:has(p4) then
				return p4
			end
			local var12 = array.map(p4, self.admit, self)
			local var13 = self.pool:lookupArray(var12)
			
			if not var13.array then
				var13.array = var12
				self.known:add(var13.array)
				
				if _G.__DEV__ then
					objectModule.freeze(var12)
				end
			end
			return var13.array
		elseif self.known:has(p4) then
			return p4
		end
		local prototypeOf = objectModule.getPrototypeOf(p4)
		local list = { prototypeOf }
		local var16 = self:sortedKeys(p4)
		table.insert(list, var16.json)
		local listCount = #list
		array.forEach(var16.sorted, function(p5) --[[ line: 226 ]]
			-- upvalues: list (ref), self (ref), p4 (ref)
			table.insert(list, self:admit(p4[p5]))
		end)
		local var18 = self.pool:lookupArray(list)
		
		if not var18.object then
			var18.object = objectModule.create(prototypeOf)
			local object = var18.object
			self.known:add(object)
			array.forEach(var16.sorted, function(p6, p7) --[[ line: 244 ]]
				-- upvalues: object (ref), list (ref), listCount (ref)
				object[p6] = list[listCount + p7]
			end)
			
			if _G.__DEV__ then
				objectModule.freeze(object)
			end
		end
		return var18.object
	end
end

function t_1:sortedKeys(p8) --[[ line: 267 ]]
	-- upvalues: objectModule (ref), array (ref), httpService (ref)
	local var19 = objectModule.keys(p8)
	local var20 = self.pool:lookupArray(var19)
	
	if not var20.keys then
		array.sort(var19)
		local var21 = httpService:JSONEncode(var19)
		var20.keys = self.keysByJSON:get(var21)
		
		if not var20.keys then
			var20.keys = { sorted = var19, json = var21 }
			self.keysByJSON:set(var21, var20.keys)
		end
	end
	return var20.keys
end

t.ObjectCanon = t_1
t.canonicalStringify = objectModule.assign(setmetatable({}, {
	__call = function(_, p9) --[[ line: 301 ]]
		-- upvalues: isNonNullObject (ref), var6 (write), resetCanonicalStringify (write), var7 (write), sortedEncode (ref), httpService (ref)
		if not isNonNullObject(p9) then
			return httpService:JSONEncode(p9)
		elseif var6 == nil then
			resetCanonicalStringify()
		end
		local var22 = var6:admit(p9)
		local var23 = var7:get(var22)
		
		if var23 == nil then
			var23 = sortedEncode(var22)
			var7:set(var22, var23)
		end
		return var23
	end
}), {
	reset = function(_) --[[ line: 323 ]]
		-- upvalues: resetCanonicalStringify (write)
		return resetCanonicalStringify()
	end
})

resetCanonicalStringify = function() --[[ line: 330 | named "resetCanonicalStringify" ]]
	-- upvalues: var6 (write), t_1 (ref), var7 (write), weakMap (ref)
	var6 = t_1.new()
	var7 = weakMap.new()
end

return t