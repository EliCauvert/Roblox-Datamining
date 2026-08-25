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
local var3 = slot.new()
t.cacheSlot = var3
local var4 = weakMap.new()

local function getCacheInfo(p0)
	-- upvalues: var4 (ref), set (ref), dep (ref)
	local var6 = var4:get(p0)
	
	if not var6 then
		var6 = { vars = set.new(), dep = dep() }
		var4:set(p0, var6)
	end
	return var6
end

function t.forgetCache(p1)
	-- upvalues: getCacheInfo (ref)
	getCacheInfo(p1).vars:forEach(function(p2)
		-- upvalues: p1 (ref)
		return p2:forgetCache(p1)
	end)
end

function t.recallCache(p3)
	-- upvalues: getCacheInfo (ref)
	getCacheInfo(p3).vars:forEach(function(p4)
		-- upvalues: p3 (ref)
		return p4:attachCache(p3)
	end)
end

function t.makeVar(p5)
	-- upvalues: set (ref), getCacheInfo (ref), broadcast (write), array (ref), var3 (ref)
	local var7 = set.new()
	local var8 = set.new()
	local tbl = nil
	local var10 = nil
	tbl = setmetatable({}, {
		__call = function(_, ...)
			-- upvalues: p5 (write), var7 (ref), getCacheInfo (copy), tbl (write), broadcast (copy), array (copy), var8 (ref), var3 (copy), var10 (write)
			if select("#", ...) >= 1 then
				local var11 = ({ ... })[1]
				
				if p5 ~= var11 then
					p5 = var11
					var7:forEach(function(p6)
						-- upvalues: getCacheInfo (copy), tbl (copy), broadcast (copy)
						getCacheInfo(p6).dep:dirty(tbl)
						broadcast(p6)
					end)
					local var12 = array.from(var8)
					var8:clear()
					array.forEach(var12, function(p7)
						-- upvalues: p5 (copy)
						p7(p5)
					end)
				end
			else
				local value = var3:getValue()
				
				if value then
					var10(value)
					getCacheInfo(value).dep(tbl)
				end
			end
			return p5
		end
	})
	
	function tbl.onNextChange(_, p8)
		-- upvalues: var8 (ref)
		var8:add(p8)
		
		return function()
			-- upvalues: var8 (copy), p8 (ref)
			var8:delete(p8)
		end
	end
	
	var10 = function(p9)
		-- upvalues: var7 (ref), getCacheInfo (copy), tbl (write)
		var7:add(p9)
		getCacheInfo(p9).vars:add(tbl)
		
		return tbl
	end
	
	function tbl.attachCache(_, p10)
		-- upvalues: var10 (write)
		return var10(p10)
	end
	
	function tbl.forgetCache(_, p11)
		-- upvalues: var7 (ref)
		return var7:delete(p11)
	end
	
	return tbl
end

broadcast = function(p12)
	if p12.broadcastWatches ~= nil then
		p12:broadcastWatches()
	end
end

return t