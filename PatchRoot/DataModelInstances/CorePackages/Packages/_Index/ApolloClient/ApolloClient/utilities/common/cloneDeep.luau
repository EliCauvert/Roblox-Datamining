-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local objectModule = require(parent.luaUtils.Object)
local instanceof = luauPolyfillModule.instanceof
local NULL = require(script.Parent.Parent.globals.null).NULL
local cloneDeepHelper = nil

function t.cloneDeep(p0) --[[ line: 36 ]]
	-- upvalues: cloneDeepHelper (write)
	return cloneDeepHelper(p0)
end

local list = {
	luauPolyfillModule.Error,
	luauPolyfillModule.Map,
	luauPolyfillModule.WeakMap,
	luauPolyfillModule.Set
}

cloneDeepHelper = function(p1, p2) --[[ line: 48 | named "cloneDeepHelper" ]]
	-- upvalues: array (ref), map (ref), cloneDeepHelper (write), NULL (ref), list (ref), instanceof (ref), objectModule (ref)
	if array.isArray(p1) then
		p2 = p2 or map.new(nil)
		
		if p2:has(p1) then
			return p2:get(p1)
		end
		local var5 = array.slice(p1, 1)
		p2:set(p1, var5)
		array.forEach(var5, function(p3, p4) --[[ line: 56 ]]
			-- upvalues: var5 (ref), cloneDeepHelper (copy), p2 (write)
			var5[p4] = cloneDeepHelper(p3, p2)
		end)
		
		return var5
	elseif typeof(p1) ~= "table" or p1 == NULL or not array.every(list, function(p5) --[[ line: 63 ]]
		-- upvalues: instanceof (copy), p1 (ref)
		return not instanceof(p1, p5)
	end) then
		return p1
	end
	p2 = p2 or map.new(nil)
	
	if p2:has(p1) then
		return p2:get(p1)
	end
	local var6 = objectModule.create(objectModule.getPrototypeOf(p1))
	p2:set(p1, var6)
	array.forEach(objectModule.keys(p1), function(p6) --[[ line: 76 ]]
		-- upvalues: var6 (ref), cloneDeepHelper (copy), p1 (ref), p2 (write)
		var6[p6] = cloneDeepHelper(p1[p6], p2)
	end)
	
	return var6
end

return t