local t = {}

local function _(p0) --[[ line: 7 | named "isPascalCase" ]]
	-- upvalues: t (ref)
	if t[p0] then
		return true
	elseif typeof(p0) ~= "string" then
		return false
	end
	local var1 = p0:sub(1, 1)
	local var2 = var1 == var1:upper()
	
	if var2 then
		t[p0] = true
	end
	return var2
end

return function(p1, p2) --[[ line: 34 | named "mapServerBindingProps" ]]
	-- upvalues: t (ref)
	local var5
	local var3 = nil
	local var4 = nil
	
	for i, v in p1 do
		local var6
		var5 = p2[i]
		
		if var5 ~= nil then
			var3 = var3 or {}
			var3[var5] = v
			continue
		end
		if t[i] then
			var6 = true
		elseif typeof(i) == "string" then
			local var7 = i:sub(1, 1)
			local var8 = var7 == var7:upper()
			
			if var8 then
				t[i] = true
			end
			var6 = var8
		else
			var6 = false
		end
		if var6 then
			var4 = var4 or {}
			table.insert(var4, i)
		end
	end
	return var3, var4
end