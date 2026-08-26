local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local objectModule = require(parent.luaUtils.Object)
local instanceof = luauPolyfillModule.instanceof
local NULL = require(script.Parent.Parent.globals.null).NULL
local cloneDeepHelper = nil

function t.cloneDeep(p1)
	-- upvalues: cloneDeepHelper (write)
	return cloneDeepHelper(p1)
end

local list = {
	luauPolyfillModule.Error,
	luauPolyfillModule.Map,
	luauPolyfillModule.WeakMap,
	luauPolyfillModule.Set
}

cloneDeepHelper = function(p1, p2)
	-- upvalues: array (ref), map (ref), cloneDeepHelper (write), NULL (ref), list (ref), instanceof (ref), objectModule (ref)
	if array.isArray(p1) then
		p2 = p2 or map.new(nil)
		
		if p2:has(p1) then
			return p2:get(p1)
		end
		local var1 = array.slice(p1, 1)
		p2:set(p1, var1)
		array.forEach(var1, function(p3, p4)
			-- upvalues: var1 (ref), cloneDeepHelper (copy), p2 (write)
			var1[p4] = cloneDeepHelper(p3, p2)
		end)
		
		return var1
	elseif typeof(p1) ~= "table" or p1 == NULL or not array.every(list, function(p3)
		-- upvalues: instanceof (copy), p1 (ref)
		return not instanceof(p1, p3)
	end) then
		return p1
	end
	p2 = p2 or map.new(nil)
	
	if p2:has(p1) then
		return p2:get(p1)
	end
	local var2 = objectModule.create(objectModule.getPrototypeOf(p1))
	p2:set(p1, var2)
	array.forEach(objectModule.keys(p1), function(p3)
		-- upvalues: var2 (ref), cloneDeepHelper (copy), p1 (ref), p2 (write)
		var2[p3] = cloneDeepHelper(p1[p3], p2)
	end)
	
	return var2
end

return t