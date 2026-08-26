local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local t = {}
local dep = require(parent.optimism).dep
local slot = require(parent.wry.context).Slot
local _ = require(script.Parent.Parent.core.cache)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local set = luauPolyfillModule.Set
local weakMap = luauPolyfillModule.WeakMap
local broadcast = nil
local var1 = slot.new()
t.cacheSlot = var1
local var2 = weakMap.new()

local function getCacheInfo(p1)
	-- upvalues: var2 (ref), set (ref), dep (ref)
	local var3 = var2:get(p1)
	
	if not var3 then
		var3 = { vars = set.new(), dep = dep() }
		var2:set(p1, var3)
	end
	return var3
end

function t.forgetCache(p1)
	-- upvalues: getCacheInfo (ref)
	getCacheInfo(p1).vars:forEach(function(p2)
		-- upvalues: p1 (ref)
		return p2:forgetCache(p1)
	end)
end

function t.recallCache(p1)
	-- upvalues: getCacheInfo (ref)
	getCacheInfo(p1).vars:forEach(function(p2)
		-- upvalues: p1 (ref)
		return p2:attachCache(p1)
	end)
end

function t.makeVar(p1)
	-- upvalues: set (ref), getCacheInfo (ref), broadcast (write), array (ref), var1 (ref)
	local var3 = set.new()
	local var4 = set.new()
	local tbl = nil
	local var5 = nil
	tbl = setmetatable({}, {
		__call = function(_, ...)
			-- upvalues: p1 (write), var3 (ref), getCacheInfo (copy), tbl (write), broadcast (copy), array (copy), var4 (ref), var1 (copy), var5 (write)
			if select("#", ...) >= 1 then
				local var6 = ({ ... })[1]
				
				if p1 ~= var6 then
					p1 = var6
					var3:forEach(function(p2)
						-- upvalues: getCacheInfo (copy), tbl (copy), broadcast (copy)
						getCacheInfo(p2).dep:dirty(tbl)
						broadcast(p2)
					end)
					local var7 = array.from(var4)
					var4:clear()
					array.forEach(var7, function(p2)
						-- upvalues: p1 (copy)
						p2(p1)
					end)
				end
			else
				local value = var1:getValue()
				
				if value then
					var5(value)
					getCacheInfo(value).dep(tbl)
				end
			end
			return p1
		end
	})
	
	function tbl.onNextChange(_, p2)
		-- upvalues: var4 (ref)
		var4:add(p2)
		
		return function()
			-- upvalues: var4 (copy), p2 (ref)
			var4:delete(p2)
		end
	end
	
	var5 = function(p2)
		-- upvalues: var3 (ref), getCacheInfo (copy), tbl (write)
		var3:add(p2)
		getCacheInfo(p2).vars:add(tbl)
		
		return tbl
	end
	
	function tbl.attachCache(_, p2)
		-- upvalues: var5 (write)
		return var5(p2)
	end
	
	function tbl.forgetCache(_, p2)
		-- upvalues: var3 (ref)
		return var3:delete(p2)
	end
	
	return tbl
end

broadcast = function(p1)
	if p1.broadcastWatches ~= nil then
		p1:broadcastWatches()
	end
end

return t