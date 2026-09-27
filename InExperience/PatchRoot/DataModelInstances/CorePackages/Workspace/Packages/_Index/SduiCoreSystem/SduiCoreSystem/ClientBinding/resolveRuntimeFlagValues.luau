local sduiRuntimeFlagNames = game:DefineFastString("SduiRuntimeFlagNames", "")
local var1 = nil
local var2 = 0

local function getNames()
	-- upvalues: var1 (write), var2 (write), sduiRuntimeFlagNames (ref)
	if var1 ~= nil then
		return var1, var2
	end
	local t = {}
	local t_1 = {}
	
	for i, v in string.split(sduiRuntimeFlagNames, ",") do
		local var3 = string.match(v, "^%s*(.-)%s*$") or ""
		
		if var3 ~= "" and not t_1[var3] then
			if #t >= 16 or #var3 > 128 or string.match(var3, "^[A-Za-z0-9_]+$") == nil then
				var2 += 1
			else
				t_1[var3] = true
				table.insert(t, var3)
			end
		end
	end
	table.sort(t)
	var1 = t
	
	return t, var2
end

return function(p1)
	-- upvalues: getNames (ref)
	local var4, var5 = getNames()
	local t = {}
	local var6 = 0
	
	for i, v in var4 do
		local var7, var8 = p1(v)
		
		if var7 and type(var8) == "boolean" then
			t[v] = var8
		else
			var6 += 1
		end
	end
	return t, var5, var6
end