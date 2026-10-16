local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Set = LuauPolyfillModule.Set
local WeakMap = LuauPolyfillModule.WeakMap
local Map = LuauPolyfillModule.Map
local ObjectModule = require(Parent.luaUtils.Object)
local HttpService = game:GetService("HttpService")
local Trie = require(Parent.wry.trie).Trie
local UtilitiesModule = require(script.Parent.Parent.Parent.utilities)
local CanUseWeakMap = UtilitiesModule.canUseWeakMap
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local SortedEncodeFunction = require(Parent.luaUtils.sortedEncode).sortedEncode
local Callback = nil
local NewResult = nil
local NewResult1 = nil

local function _(Tbl) --[[ Line: 47 | Named "shallowCopy" ]]
	return (table.clone(Tbl))
end

local _ = function(p1): boolean --[[ Line: 53 | Named "isArrayLike" ]]
	return #p1 == 0 and not next(p1) or #p1 > 1
end

local Module1 = {}
Module1.__index = Module1

function Module1.new() --[[ Line: 147 ]]
	-- upvalues: Module1 (copy), Set (copy), Trie (copy), CanUseWeakMap (copy), WeakMap (copy), Map (copy)
	local self = setmetatable({}, Module1)
	self.known = Set.new()
	self.pool = Trie.new(CanUseWeakMap)
	self.passes = WeakMap.new()
	self.keysByJSON = Map.new(nil)
	self.empty = self:admit({})
	
	return self
end

function Module1:isKnown(p1) --[[ Line: 162 ]]
	-- upvalues: IsNonNullObjectFunction (copy)
	return IsNonNullObjectFunction(p1) and self.known:has(p1)
end

function Module1:pass(Tbl) --[[ Line: 166 ]]
	-- upvalues: IsNonNullObjectFunction (copy)
	if IsNonNullObjectFunction(Tbl) then
		local Copy = table.clone(Tbl)
		self.passes:set(Copy, Tbl)
		
		return Copy
	else
		return Tbl
	end
end

function Module1:admit(Input) --[[ Line: 177 ]]
	-- upvalues: IsNonNullObjectFunction (copy), ObjectModule (copy), Array (copy)
	if IsNonNullObjectFunction(Input) then
		local GetResult = self.passes:get(Input)
		
		if GetResult then
			return GetResult
		end
		if ObjectModule.getPrototypeOf(Input) == nil then
			if #Input == 0 and not next(Input) or #Input > 1 then
				if self.known:has(Input) then
					return Input
				end
				local MapResult = Array.map(Input, self.admit, self)
				local LookupArrayResult = self.pool:lookupArray(MapResult)
				
				if not LookupArrayResult.array then
					LookupArrayResult.array = MapResult
					self.known:add(LookupArrayResult.array)
					
					if _G.__DEV__ then
						ObjectModule.freeze(MapResult)
					end
				end
				return LookupArrayResult.array
			else
				if self.known:has(Input) then
					return Input
				end
				local PrototypeOf = ObjectModule.getPrototypeOf(Input)
				local List = { PrototypeOf }
				local SortedKeysResult = self:sortedKeys(Input)
				table.insert(List, SortedKeysResult.json)
				local CountList = #List
				Array.forEach(SortedKeysResult.sorted, function(p1) --[[ Line: 226 ]]
					-- upvalues: List (copy), self (copy), Input (copy)
					table.insert(List, self:admit(Input[p1]))
				end)
				local LookupArrayResult = self.pool:lookupArray(List)
				
				if not LookupArrayResult.object then
					LookupArrayResult.object = ObjectModule.create(PrototypeOf)
					local Object = LookupArrayResult.object
					self.known:add(Object)
					Array.forEach(SortedKeysResult.sorted, function(Key, p1) --[[ Line: 244 ]]
						-- upvalues: Object (copy), List (copy), CountList (copy)
						Object[Key] = List[CountList + p1]
					end)
					
					if _G.__DEV__ then
						ObjectModule.freeze(Object)
					end
				end
				return LookupArrayResult.object
			end
		end
	end
	return Input
end

function Module1:sortedKeys(p1) --[[ Line: 267 ]]
	-- upvalues: ObjectModule (copy), Array (copy), HttpService (copy)
	local KeysResult = ObjectModule.keys(p1)
	local LookupArrayResult = self.pool:lookupArray(KeysResult)
	
	if not LookupArrayResult.keys then
		Array.sort(KeysResult)
		local Json = HttpService:JSONEncode(KeysResult)
		LookupArrayResult.keys = self.keysByJSON:get(Json)
		
		if not LookupArrayResult.keys then
			LookupArrayResult.keys = { sorted = KeysResult, json = Json }
			self.keysByJSON:set(Json, LookupArrayResult.keys)
		end
	end
	return LookupArrayResult.keys
end

local Module = {
	ObjectCanon = Module1,
	canonicalStringify = ObjectModule.assign(setmetatable({}, {
		__call = function(_, Input) --[[ Line: 301 ]]
			-- upvalues: IsNonNullObjectFunction (copy), NewResult (ref), Callback (ref), NewResult1 (ref), SortedEncodeFunction (copy), HttpService (copy)
			if not IsNonNullObjectFunction(Input) then
				return HttpService:JSONEncode(Input)
			end
			if NewResult == nil then
				Callback()
			end
			local AdmitResult = NewResult:admit(Input)
			local GetResult = NewResult1:get(AdmitResult)
			
			if GetResult == nil then
				local NewResult2 = NewResult1
				GetResult = SortedEncodeFunction(AdmitResult)
				NewResult2:set(AdmitResult, GetResult)
			end
			return GetResult
		end
	}), {
		reset = function(_) --[[ Line: 323 ]]
			-- upvalues: Callback (ref)
			return Callback()
		end
	})
}

Callback = function() --[[ Line: 330 | Named "resetCanonicalStringify" ]]
	-- upvalues: NewResult (ref), Module1 (copy), NewResult1 (ref), WeakMap (copy)
	NewResult = Module1.new()
	NewResult1 = WeakMap.new()
end

return Module