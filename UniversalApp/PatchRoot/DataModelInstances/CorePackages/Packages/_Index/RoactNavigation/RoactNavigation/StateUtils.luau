local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {
	get = function(p1, p2)
		for i, v in p1.routes do
			if v.key == p2 then
				return v
			end
		end
		return nil
	end,
	indexOf = function(p3, p4)
		for i, v in p3.routes do
			if v.key == p4 then
				return i
			end
		end
		return nil
	end,
	has = function(p5, p6)
		for i, v in p5.routes do
			if v.key == p6 then
				return true
			end
		end
		return false
	end
}

function t.push(p7, p8)
	-- upvalues: t (ref), array (ref), object (ref)
	assert(t.indexOf(p7, p8.key) == nil, ("should not push route with duplicated key %s"):format(p8.key))
	local var1 = array.concat(p7.routes, { p8 })
	
	return object.assign(table.clone(p7), { index = #var1, routes = var1 })
end

function t.pop(p7)
	-- upvalues: object (ref)
	if p7.index <= 1 then
		return p7
	end
	local cloned = table.clone(p7.routes)
	table.remove(cloned, #cloned)
	
	return object.assign(table.clone(p7), { index = #cloned, routes = cloned })
end

function t.jumpToIndex(p7, p8)
	-- upvalues: object (ref)
	if p8 == p7.index then
		return p7
	end
	assert(p7.routes[p8] ~= nil, ("invalid index %d to jump to"):format(p8))
	
	return object.assign(table.clone(p7), { index = p8 })
end

function t.jumpTo(p7, p8)
	-- upvalues: t (ref)
	local var1 = t.indexOf(p7, p8)
	assert(var1 ~= nil, ("attempt to jump to unknown key \"%s\""):format(p8))
	
	return t.jumpToIndex(p7, var1)
end

function t.back(p7)
	-- upvalues: t (ref)
	local var1 = p7.index - 1
	
	return if p7.routes[var1] then t.jumpToIndex(p7, var1) else p7
end

function t.forward(p7)
	-- upvalues: t (ref)
	local var1 = p7.index + 1
	
	return if p7.routes[var1] then t.jumpToIndex(p7, var1) else p7
end

function t.replaceAndPrune(p7, p8, p9)
	-- upvalues: t (ref), object (ref)
	local var1 = t.indexOf(p7, p8)
	local var2 = t.replaceAtIndex(p7, var1, p9)
	
	return object.assign(table.clone(var2), { routes = { unpack(var2.routes, 1, var1) } })
end

function t.replaceAt(p7, p8, p9, p10)
	-- upvalues: t (ref)
	local var1 = t.indexOf(p7, p8)
	local var2 = t.replaceAtIndex(p7, var1, p9)
	var2.index = if p10 then p7.index else var1
	
	return var2
end

function t.replaceAtIndex(p7, p8, p9)
	-- upvalues: object (ref)
	assert(p7.routes[p8] ~= nil, ("invalid index %d for replacing route %s"):format(p8, p9.key))
	
	if p7.routes[p8] == p9 and p8 == p7.index then
		return p7
	end
	local cloned = table.clone(p7.routes)
	cloned[p8] = p9
	
	return object.assign(table.clone(p7), { index = p8, routes = cloned })
end

function t.reset(value, p7, p8)
	-- upvalues: object (ref)
	assert(type(p7) == "table" and #p7 > 0, "invalid routes to replace")
	local var1 = p8 or #p7
	
	if #value.routes == #p7 and value.index == var1 then
		local var2 = true
		
		for i = 1, #p7 do
			if value.routes[i] == p7[i] then
				continue
			end
			var2 = false
			break
		end
		if var2 then
			return value
		end
	end
	assert(p7[var1] ~= nil, ("invalid index %d to reset"):format(var1))
	
	return object.assign(table.clone(value), { index = var1, routes = p7 })
end

return t