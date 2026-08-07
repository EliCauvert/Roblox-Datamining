local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {
	get = function(p0, p1) --[[ line: 31 ]]
		for i, v in p0.routes do
			if v.key == p1 then
				return v
			end
		end
		return nil
	end,
	indexOf = function(p2, p3) --[[ line: 42 ]]
		for i, v in p2.routes do
			if v.key == p3 then
				return i
			end
		end
		return nil
	end,
	has = function(p4, p5) --[[ line: 54 ]]
		for i, v in p4.routes do
			if v.key == p5 then
				return true
			end
		end
		return false
	end
}

function t.push(p6, p7) --[[ line: 65 ]]
	-- upvalues: t (ref), array (ref), object (ref)
	assert(t.indexOf(p6, p7.key) == nil, ("should not push route with duplicated key %s"):format(p7.key))
	local var2 = array.concat(p6.routes, { p7 })
	
	return object.assign(table.clone(p6), { index = #var2, routes = var2 })
end

function t.pop(p8) --[[ line: 80 ]]
	-- upvalues: object (ref)
	if p8.index <= 1 then
		return p8
	end
	local cloned = table.clone(p8.routes)
	table.remove(cloned, #cloned)
	
	return object.assign(table.clone(p8), { index = #cloned, routes = cloned })
end

function t.jumpToIndex(p9, p10) --[[ line: 95 ]]
	-- upvalues: object (ref)
	if p10 == p9.index then
		return p9
	end
	assert(p9.routes[p10] ~= nil, ("invalid index %d to jump to"):format(p10))
	
	return object.assign(table.clone(p9), { index = p10 })
end

function t.jumpTo(p11, p12) --[[ line: 108 ]]
	-- upvalues: t (ref)
	local var4 = t.indexOf(p11, p12)
	assert(var4 ~= nil, ("attempt to jump to unknown key \"%s\""):format(p12))
	
	return t.jumpToIndex(p11, var4)
end

function t.back(p13) --[[ line: 116 ]]
	-- upvalues: t (ref)
	local var5 = p13.index - 1
	
	return if p13.routes[var5] then t.jumpToIndex(p13, var5) else p13
end

function t.forward(p14) --[[ line: 126 ]]
	-- upvalues: t (ref)
	local var6 = p14.index + 1
	
	return if p14.routes[var6] then t.jumpToIndex(p14, var6) else p14
end

function t.replaceAndPrune(p15, p16, p17) --[[ line: 137 ]]
	-- upvalues: t (ref), object (ref)
	local var7 = t.indexOf(p15, p16)
	local var8 = t.replaceAtIndex(p15, var7, p17)
	
	return object.assign(table.clone(var8), { routes = { unpack(var8.routes, 1, var7) } })
end

function t.replaceAt(p18, p19, p20, p21) --[[ line: 149 ]]
	-- upvalues: t (ref)
	local var9 = t.indexOf(p18, p19)
	local var10 = t.replaceAtIndex(p18, var9, p20)
	var10.index = if p21 then p18.index else var9
	
	return var10
end

function t.replaceAtIndex(p22, p23, p24) --[[ line: 159 ]]
	-- upvalues: object (ref)
	assert(p22.routes[p23] ~= nil, ("invalid index %d for replacing route %s"):format(p23, p24.key))
	
	if p22.routes[p23] == p24 and p23 == p22.index then
		return p22
	end
	local cloned = table.clone(p22.routes)
	cloned[p23] = p24
	
	return object.assign(table.clone(p22), { index = p23, routes = cloned })
end

function t.reset(value, p25, p26) --[[ line: 178 ]]
	-- upvalues: object (ref)
	assert(type(p25) == "table" and #p25 > 0, "invalid routes to replace")
	local var12 = p26 or #p25
	
	if #value.routes == #p25 and value.index == var12 then
		local var13 = true
		
		for i = 1, #p25 do
			if value.routes[i] == p25[i] then
				continue
			end
			var13 = false
			break
		end
		if var13 then
			return value
		end
	end
	assert(p25[var12] ~= nil, ("invalid index %d to reset"):format(var12))
	
	return object.assign(table.clone(value), { index = var12, routes = p25 })
end

return t