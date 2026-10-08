local function getKey(p1)
	return p1.stable_key
end

local function valuesEqual(p1, p2, p3)
	-- upvalues: valuesEqual (ref)
	if p1 == p2 then
		return true
	elseif type(p1) ~= "table" or type(p2) ~= "table" then
		return false
	end
	p3 = p3 or {}
	
	if p3[p1] == p2 then
		return true
	end
	p3[p1] = p2
	
	for i, v in p1 do
		if not valuesEqual(v, p2[i], p3) then
			return false
		end
	end
	for i in p2 do
		if p1[i] == nil then
			return false
		end
	end
	return true
end

local function itemContentsEqual(p4, p5)
	-- upvalues: valuesEqual (ref)
	for i, v in p4 do
		if i ~= "position" and not valuesEqual(v, p5[i]) then
			return false
		end
	end
	for i in p5 do
		if i ~= "position" and p4[i] == nil then
			return false
		end
	end
	return true
end

return {
	build = function(p6, p7)
		-- upvalues: itemContentsEqual (ref)
		local var1 = if p7 ~= nil then {} else p7.items
		local var2 = if p7 ~= nil then {} else p7.byKey
		local list = table.create(#p6)
		local t = {}
		local var3 = false
		
		for i = #p6, 1, -1 do
			local var4 = p6[i]
			local stableKey = var4.stable_key
			
			if t[stableKey] ~= nil then
				continue
			end
			local var5 = var2[stableKey]
			
			if var5 ~= nil and itemContentsEqual(var5, var4) then
				var4 = var5
			end
			table.insert(list, var4)
			t[stableKey] = var4
			var3 = var3 or var1[#list] ~= var4
		end
		return if p7 == nil or var3 or #list ~= #var1 then { items = list, byKey = t } else p7
	end,
	getKey = getKey
}