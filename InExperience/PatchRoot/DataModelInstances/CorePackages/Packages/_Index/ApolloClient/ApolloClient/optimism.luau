local parent = script.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local trie = require(parent.wry.trie).Trie
local cache = require(script.cache).Cache
local entry = require(script.entry).Entry
local parentEntrySlot = require(script.context).parentEntrySlot
local contextModule = require(script.context)
t.bindContext = contextModule.bindContext
t.noContext = contextModule.noContext
t.setTimeout = contextModule.setTimeout
t.dep = require(script.dep).dep

local function _()
	-- upvalues: trie (ref)
	local var1 = trie.new(true)
	
	return function(_, ...)
		-- upvalues: var1 (ref)
		return var1:lookupArray({ ... })
	end
end

local var1 = trie.new(true)

function t.defaultMakeCacheKey(_, ...)
	-- upvalues: var1 (ref)
	return var1:lookupArray({ ... })
end

t.KeyTrie = trie
local _ = require(script.initTypes)
local var2 = set.new()

function t.wrap(p1, p2, p3)
	-- upvalues: cache (ref), boolean (ref), trie (ref), entry (ref), array (ref), var2 (ref), parentEntrySlot (ref), object (ref)
	local var3 = p2
	
	if var3 == nil then
		var3 = {}
	end
	local var4 = cache.new(if boolean.toJSBoolean(var3.max) then var3.max else 65536, function(p4)
		return p4:dispose()
	end)
	local keyArgs = var3.keyArgs
	
	if boolean.toJSBoolean(var3.makeCacheKey) then
		local makeCacheKey = var3.makeCacheKey
		
		if not makeCacheKey then
			local var5 = trie.new(true)
			
			local makeCacheKey = function(_, ...)
				-- upvalues: var5 (ref)
				return var5:lookupArray({ ... })
			end
		end
		if p3 ~= nil then
			local var6 = p1
			
			p1 = function(...)
				-- upvalues: var6 (ref), p3 (ref)
				return var6(p3, ...)
			end
		end
		local tbl = setmetatable({}, {
			__call = function(_, p4, ...)
				-- upvalues: p3 (ref), makeCacheKey (ref), keyArgs (ref), p1 (write), var4 (ref), entry (copy), var3 (write), array (copy), var2 (copy), parentEntrySlot (copy)
				local var7 = if p3 ~= nil then { p4, ... } else { ... }
				local var8 = makeCacheKey(nil, table.unpack((function()
					-- upvalues: keyArgs (copy), var7 (write)
					return if keyArgs then keyArgs(nil, table.unpack(var7)) else var7
				end)()))
				
				if var8 == nil then
					return p1(table.unpack(var7))
				end
				local var9 = var4:get(var8)
				
				if var9 == nil then
					var9 = entry.new(p1)
					var4:set(var8, var9)
					var9.subscribe = var3.subscribe
					
					function var20.forget()
						-- upvalues: var4 (copy), var8 (ref)
						return var4:delete(var8)
					end
				end
				local var10 = var9:recompute(array.slice(var7))
				var4:set(var8, var9)
				var2:add(var4)
				
				if not parentEntrySlot:hasValue() then
					var2:forEach(function(p5)
						return p5:clean()
					end)
					var2:clear()
				end
				return var10
			end,
			__index = function(p4, p5)
				-- upvalues: var4 (ref)
				return if p5 == "size" then var4.map.size else rawget(p4, p5)
			end,
			__newindex = function(p4, p5, p6)
				if p5 == "size" then
					error("attempt to update a read-only table", 2)
				end
				rawset(p4, p5, p6)
			end
		})
		
		local function _(p4)
			return function(_, ...)
				-- upvalues: p4 (ref)
				return p4(...)
			end
		end
		
		local function dirtyKey(p4)
			-- upvalues: var4 (ref), boolean (copy)
			local var7 = var4:get(p4)
			
			if boolean.toJSBoolean(var7) then
				var7:setDirty()
			end
		end
		
		function tbl.dirtyKey(_, ...)
			-- upvalues: dirtyKey (ref)
			return dirtyKey(...)
		end
		
		local var7 = function(...)
			-- upvalues: makeCacheKey (ref), var4 (ref), boolean (copy)
			local var8 = var4:get(makeCacheKey(nil, ...))
			
			if boolean.toJSBoolean(var8) then
				var8:setDirty()
			end
		end
		
		function tbl.dirty(_, ...)
			-- upvalues: var7 (ref)
			return var7(...)
		end
		
		local function peekKey(p4)
			-- upvalues: var4 (ref), boolean (copy)
			local var8 = var4:get(p4)
			
			if boolean.toJSBoolean(var8) then
				return var8:peek()
			end
		end
		
		function tbl.peekKey(_, ...)
			-- upvalues: peekKey (ref)
			return peekKey(...)
		end
		
		local var8 = function(...)
			-- upvalues: peekKey (ref), makeCacheKey (ref)
			return peekKey(makeCacheKey(nil, ...))
		end
		
		function tbl.peek(_, ...)
			-- upvalues: var8 (ref)
			return var8(...)
		end
		
		local function forgetKey(p4)
			-- upvalues: var4 (ref)
			return var4:delete(p4)
		end
		
		function tbl.forgetKey(_, ...)
			-- upvalues: forgetKey (ref)
			return forgetKey(...)
		end
		
		local var9 = function(...)
			-- upvalues: forgetKey (ref), makeCacheKey (ref)
			return forgetKey(makeCacheKey(nil, ...))
		end
		
		function tbl.forget(_, ...)
			-- upvalues: var9 (ref)
			return var9(...)
		end
		
		tbl.makeCacheKey = makeCacheKey
		
		if boolean.toJSBoolean(keyArgs) then
			local var10 = function(...)
				-- upvalues: makeCacheKey (ref), keyArgs (ref)
				return makeCacheKey(nil, table.unpack(keyArgs(...)))
			end
			
			function tbl.getKey(_, ...)
				-- upvalues: var10 (ref)
				return var10(...)
			end
		else
			tbl.getKey = makeCacheKey
		end
		return object.freeze(tbl)
	end
end

return t