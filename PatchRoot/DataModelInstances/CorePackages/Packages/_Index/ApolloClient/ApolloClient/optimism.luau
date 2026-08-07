-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

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

local function _() --[[ line: 61 | named "makeDefaultMakeCacheKeyFunction" ]]
	-- upvalues: trie (ref)
	local var5 = trie.new(true)
	
	return function(_, ...) --[[ line: 64 ]]
		-- upvalues: var5 (ref)
		return var5:lookupArray({ ... })
	end
end

local var3 = trie.new(true)

function t.defaultMakeCacheKey(_, ...) --[[ line: 64 ]]
	-- upvalues: var3 (ref)
	return var3:lookupArray({ ... })
end

t.KeyTrie = trie
local _ = require(script.initTypes)
local var4 = set.new()

function t.wrap(p0, p1, p2) --[[ line: 104 ]]
	-- upvalues: cache (ref), boolean (ref), trie (ref), entry (ref), array (ref), var4 (ref), parentEntrySlot (ref), object (ref)
	local var6 = p1
	
	if var6 == nil then
		var6 = {}
	end
	local var7 = cache.new(if boolean.toJSBoolean(var6.max) then var6.max else 65536, function(p3) --[[ line: 115 ]]
		return p3:dispose()
	end)
	local keyArgs = var6.keyArgs
	
	if boolean.toJSBoolean(var6.makeCacheKey) then
		local makeCacheKey = var6.makeCacheKey
		
		if not makeCacheKey then
			local var8 = trie.new(true)
			
			local makeCacheKey = function(_, ...) --[[ line: 64 ]]
				-- upvalues: var8 (ref)
				return var8:lookupArray({ ... })
			end
		end
		if p2 ~= nil then
			local var9 = p0
			
			p0 = function(...) --[[ line: 126 ]]
				-- upvalues: var9 (ref), p2 (ref)
				return var9(p2, ...)
			end
		end
		local tbl = setmetatable({}, {
			__call = function(_, p4, ...) --[[ line: 134 ]]
				-- upvalues: p2 (ref), makeCacheKey (ref), keyArgs (ref), p0 (write), var7 (ref), entry (copy), var6 (write), array (copy), var4 (copy), parentEntrySlot (copy)
				local var18 = if p2 ~= nil then { p4, ... } else { ... }
				local var19 = makeCacheKey(nil, table.unpack((function() --[[ line: 147 ]]
					-- upvalues: keyArgs (copy), var18 (write)
					return if keyArgs then keyArgs(nil, table.unpack(var18)) else var18
				end)()))
				
				if var19 == nil then
					return p0(table.unpack(var18))
				end
				local var20 = var7:get(var19)
				
				if var20 == nil then
					var20 = entry.new(p0)
					var7:set(var19, var20)
					var20.subscribe = var6.subscribe
					
					function var20.forget() --[[ line: 167 ]]
						-- upvalues: var7 (copy), var19 (ref)
						return var7:delete(var19)
					end
				end
				local var21 = var20:recompute(array.slice(var18))
				var7:set(var19, var20)
				var4:add(var7)
				
				if not parentEntrySlot:hasValue() then
					var4:forEach(function(p5) --[[ line: 184 ]]
						return p5:clean()
					end)
					var4:clear()
				end
				return var21
			end,
			__index = function(p6, p7) --[[ line: 193 ]]
				-- upvalues: var7 (ref)
				return if p7 == "size" then var7.map.size else rawget(p6, p7)
			end,
			__newindex = function(p8, p9, p10) --[[ line: 199 ]]
				if p9 == "size" then
					error("attempt to update a read-only table", 2)
				end
				rawset(p8, p9, p10)
			end
		})
		
		local function _(p11) --[[ line: 213 | named "asMethod" ]]
			return function(_, ...) --[[ line: 214 ]]
				-- upvalues: p11 (ref)
				return p11(...)
			end
		end
		
		local function dirtyKey(p12) --[[ line: 219 ]]
			-- upvalues: var7 (ref), boolean (copy)
			local var22 = var7:get(p12)
			
			if boolean.toJSBoolean(var22) then
				var22:setDirty()
			end
		end
		
		function tbl.dirtyKey(_, ...) --[[ line: 214 ]]
			-- upvalues: dirtyKey (ref)
			return dirtyKey(...)
		end
		
		local var12 = function(...) --[[ line: 228 ]]
			-- upvalues: makeCacheKey (ref), var7 (ref), boolean (copy)
			local var23 = var7:get(makeCacheKey(nil, ...))
			
			if boolean.toJSBoolean(var23) then
				var23:setDirty()
			end
		end
		
		function tbl.dirty(_, ...) --[[ line: 214 ]]
			-- upvalues: var12 (ref)
			return var12(...)
		end
		
		local function peekKey(p13) --[[ line: 232 ]]
			-- upvalues: var7 (ref), boolean (copy)
			local var24 = var7:get(p13)
			
			if boolean.toJSBoolean(var24) then
				return var24:peek()
			end
		end
		
		function tbl.peekKey(_, ...) --[[ line: 214 ]]
			-- upvalues: peekKey (ref)
			return peekKey(...)
		end
		
		local var14 = function(...) --[[ line: 242 ]]
			-- upvalues: peekKey (ref), makeCacheKey (ref)
			return peekKey(makeCacheKey(nil, ...))
		end
		
		function tbl.peek(_, ...) --[[ line: 214 ]]
			-- upvalues: var14 (ref)
			return var14(...)
		end
		
		local function forgetKey(p14) --[[ line: 246 ]]
			-- upvalues: var7 (ref)
			return var7:delete(p14)
		end
		
		function tbl.forgetKey(_, ...) --[[ line: 214 ]]
			-- upvalues: forgetKey (ref)
			return forgetKey(...)
		end
		
		local var16 = function(...) --[[ line: 252 ]]
			-- upvalues: forgetKey (ref), makeCacheKey (ref)
			return forgetKey(makeCacheKey(nil, ...))
		end
		
		function tbl.forget(_, ...) --[[ line: 214 ]]
			-- upvalues: var16 (ref)
			return var16(...)
		end
		
		tbl.makeCacheKey = makeCacheKey
		
		if boolean.toJSBoolean(keyArgs) then
			local var17 = function(...) --[[ line: 260 ]]
				-- upvalues: makeCacheKey (ref), keyArgs (ref)
				return makeCacheKey(nil, table.unpack(keyArgs(...)))
			end
			
			function tbl.getKey(_, ...) --[[ line: 214 ]]
				-- upvalues: var17 (ref)
				return var17(...)
			end
		else
			tbl.getKey = makeCacheKey
		end
		return object.freeze(tbl)
	end
end

return t