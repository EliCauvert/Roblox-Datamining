local Parent = script.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Trie = require(Parent.wry.trie).Trie
local Cache = require(script.cache).Cache
local Entry = require(script.entry).Entry
local ParentEntrySlot = require(script.context).parentEntrySlot
local ContextModule = require(script.context)

local function _() --[[ Line: 61 | Named "makeDefaultMakeCacheKeyFunction" ]]
	-- upvalues: Trie (copy)
	local NewTrie = Trie.new(true)
	
	return function(_, ...) --[[ Line: 64 ]]
		-- upvalues: NewTrie (copy)
		return NewTrie:lookupArray({ ... })
	end
end

local NewTrie = Trie.new(true)

local function DefaultMakeCacheKey(_, ...) --[[ Line: 64 ]]
	-- upvalues: NewTrie (copy)
	return NewTrie:lookupArray({ ... })
end

local _ = require(script.initTypes)
local NewResult = LuauPolyfillModule.Set.new()

return {
	bindContext = ContextModule.bindContext,
	noContext = ContextModule.noContext,
	setTimeout = ContextModule.setTimeout,
	dep = require(script.dep).dep,
	defaultMakeCacheKey = DefaultMakeCacheKey,
	KeyTrie = Trie,
	wrap = function(Callback1, p1, p2) --[[ Line: 104 ]]
		-- upvalues: Cache (copy), Boolean (copy), Trie (copy), Entry (copy), Array (copy), NewResult (copy), ParentEntrySlot (copy), Object (copy)
		local v1 = p1
		
		if v1 == nil then
			v1 = {}
		end
		local NewCache = Cache.new(Boolean.toJSBoolean(v1.max) and v1.max or 65536, function(p3) --[[ Line: 115 ]]
			return p3:dispose()
		end)
		local KeyArgsFunction = v1.keyArgs
		repeat
			repeat
				if Boolean.toJSBoolean(v1.makeCacheKey) then
					local MakeCacheKeyFunction = v1.makeCacheKey
					
					if MakeCacheKeyFunction then break end
				end
				local NewTrie = Trie.new(true)
				
				local function MakeCacheKeyFunction(_, ...) --[[ Line: 64 ]]
					-- upvalues: NewTrie (copy)
					return NewTrie:lookupArray({ ... })
				end
			until true
			if p2 == nil then break end
			local Callback = Callback1
			
			Callback1 = function(...) --[[ Line: 126 ]]
				-- upvalues: Callback (copy), p2 (copy)
				return Callback(p2, ...)
			end
		until true
		local self = setmetatable({}, {
			__call = function(_, p3, ...) --[[ Line: 134 ]]
				-- upvalues: p2 (copy), MakeCacheKeyFunction (copy), KeyArgsFunction (copy), Callback1 (ref), NewCache (copy), Entry (upval), v1 (ref), Array (upval), NewResult (upval), ParentEntrySlot (upval)
				local List = nil
				List = if p2 == nil then { p3, ... } else { ... }
				local CacheKey = MakeCacheKeyFunction(nil, table.unpack((function() --[[ Line: 147 ]]
					-- upvalues: KeyArgsFunction (upval), List (ref)
					return if KeyArgsFunction then KeyArgsFunction(nil, table.unpack(List)) else List
				end)()))
				
				if CacheKey == nil then
					return Callback1(table.unpack(List))
				end
				local GetResult = NewCache:get(CacheKey)
				
				if GetResult == nil then
					GetResult = Entry.new(Callback1)
					NewCache:set(CacheKey, GetResult)
					GetResult.subscribe = v1.subscribe
					
					function GetResult.forget() --[[ Line: 167 ]]
						-- upvalues: NewCache (upval), CacheKey (copy)
						return NewCache:delete(CacheKey)
					end
				end
				local RecomputeResult = GetResult:recompute((Array.slice(List)))
				NewCache:set(CacheKey, GetResult)
				NewResult:add(NewCache)
				
				if not ParentEntrySlot:hasValue() then
					NewResult:forEach(function(p4) --[[ Line: 184 ]]
						return p4:clean()
					end)
					NewResult:clear()
				end
				return RecomputeResult
			end,
			__index = function(p3, p4) --[[ Line: 193 ]]
				-- upvalues: NewCache (copy)
				return if p4 == "size" then NewCache.map.size else rawget(p3, p4)
			end,
			__newindex = function(p3, p4, p5) --[[ Line: 199 ]]
				if p4 == "size" then
					error("attempt to update a read-only table", 2)
				end
				rawset(p3, p4, p5)
			end
		})
		
		local function _(Callback) --[[ Line: 213 | Named "asMethod" ]]
			return function(_, ...) --[[ Line: 214 ]]
				-- upvalues: Callback (copy)
				return Callback(...)
			end
		end
		
		local function dirtyKey(p3) --[[ Line: 219 ]]
			-- upvalues: NewCache (copy), Boolean (upval)
			local GetResult = NewCache:get(p3)
			
			if Boolean.toJSBoolean(GetResult) then
				GetResult:setDirty()
			end
		end
		
		function self:dirtyKey(...) --[[ Line: 214 ]]
			-- upvalues: dirtyKey (copy)
			return dirtyKey(...)
		end
		
		local function v22(...) --[[ Line: 228 ]]
			-- upvalues: MakeCacheKeyFunction (copy), NewCache (copy), Boolean (upval)
			local GetResult = NewCache:get((MakeCacheKeyFunction(nil, ...)))
			
			if Boolean.toJSBoolean(GetResult) then
				GetResult:setDirty()
			end
		end
		
		function self:dirty(...) --[[ Line: 214 ]]
			-- upvalues: v22 (copy)
			return v22(...)
		end
		
		local function peekKey(p3) --[[ Line: 232 ]]
			-- upvalues: NewCache (copy), Boolean (upval)
			local GetResult = NewCache:get(p3)
			
			if not Boolean.toJSBoolean(GetResult) then return end
			return GetResult:peek()
		end
		
		function self:peekKey(...) --[[ Line: 214 ]]
			-- upvalues: peekKey (copy)
			return peekKey(...)
		end
		
		local function v24(...) --[[ Line: 242 ]]
			-- upvalues: peekKey (copy), MakeCacheKeyFunction (copy)
			return peekKey(MakeCacheKeyFunction(nil, ...))
		end
		
		function self:peek(...) --[[ Line: 214 ]]
			-- upvalues: v24 (copy)
			return v24(...)
		end
		
		local function forgetKey(p3) --[[ Line: 246 ]]
			-- upvalues: NewCache (copy)
			return NewCache:delete(p3)
		end
		
		function self:forgetKey(...) --[[ Line: 214 ]]
			-- upvalues: forgetKey (copy)
			return forgetKey(...)
		end
		
		local function v26(...) --[[ Line: 252 ]]
			-- upvalues: forgetKey (copy), MakeCacheKeyFunction (copy)
			return forgetKey(MakeCacheKeyFunction(nil, ...))
		end
		
		function self:forget(...) --[[ Line: 214 ]]
			-- upvalues: v26 (copy)
			return v26(...)
		end
		
		self.makeCacheKey = MakeCacheKeyFunction
		
		if Boolean.toJSBoolean(KeyArgsFunction) then
			local function v27(...) --[[ Line: 260 ]]
				-- upvalues: MakeCacheKeyFunction (copy), KeyArgsFunction (copy)
				return MakeCacheKeyFunction(nil, table.unpack(KeyArgsFunction(...)))
			end
			
			function self:getKey(...) --[[ Line: 214 ]]
				-- upvalues: v27 (copy)
				return v27(...)
			end
		else
			self.getKey = MakeCacheKeyFunction
		end
		return Object.freeze(self)
	end
}