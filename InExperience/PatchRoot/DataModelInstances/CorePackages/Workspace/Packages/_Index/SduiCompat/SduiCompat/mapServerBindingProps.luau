local t = {}

local function _(p1)
	-- upvalues: t (ref)
	if t[p1] then
		return true
	elseif typeof(p1) ~= "string" then
		return false
	end
	local var1 = p1:sub(1, 1)
	local var2 = var1 == var1:upper()
	
	if var2 then
		t[p1] = true
	end
	return var2
end

return function(p1, p2)
	-- upvalues: t (ref)
	local var1
	local var2 = nil
	local var3 = nil
	
	for i, v in p1 do
		local var4
		var1 = p2[i]
		
		if var1 ~= nil then
			var2 = var2 or {}
			var2[var1] = v
			continue
		end
		if t[i] then
			var4 = true
		elseif typeof(i) == "string" then
			local var5 = i:sub(1, 1)
			local var6 = var5 == var5:upper()
			
			if var6 then
				t[i] = true
			end
			var4 = var6
		else
			var4 = false
		end
		if var4 then
			var3 = var3 or {}
			table.insert(var3, i)
		end
	end
	return var2, var3
end