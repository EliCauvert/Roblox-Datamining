local function splitStringWithMarks(p1, p2)
	if type(p1) ~= "string" or type(p2) ~= "table" then
		return p1, ""
	end
	for i, v in ipairs(p2) do
		local var1, var2 = p1:find(v, nil, true)
		
		if var1 ~= nil then
			return p1:sub(1, var1 - 1), p1:sub(var2 + 1)
		end
	end
	return p1, ""
end

local function _(p3)
	return if type(p3) == "string" then string.match(p3, "([^.]*)$") else ""
end

return function(p3, p4)
	-- upvalues: splitStringWithMarks (ref)
	local t = {}
	local t_1 = {}
	
	if not p4 then
		p4 = 0
	end
	if type(p3) ~= "string" then
		return t, t_1
	end
	for i in p3:gmatch("[^\r\n]+") do
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local var3, var4 = splitStringWithMarks(i, { ", line ", ", Line ", ":" })
		local var5 = var3
		var9, var7 = splitStringWithMarks(var4, { " - " })
		local var6 = var9
		local var7 = var4
		
		if var7 == "" and var6 ~= "" then
			local match, match_1 = string.match(var6, "^(%d+)%s*(.*)")
			
			if match then
				var6 = match
				
				if match_1 ~= "" then
					var7 = match_1
				end
			end
		end
		if var6 ~= "" and var5 ~= "" then
			local _, _, matchIndex = string.find(var5, "Script '(.*)'")
			
			if matchIndex ~= nil then
				var5 = matchIndex
			end
			local var8 = t_1[var5]
			
			if var8 == nil then
				p4 += 1
				var8 = p4
				t_1[var5] = var8
			end
			if var7 == "" then
				local var9 = var5
				var7 = if type(var9) ~= "string" then string.match(var9, "([^.]*)$") else ""
			end
			table.insert(t, {
				line = var6,
				funcName = var7,
				sourceCode = tostring(var8)
			})
		end
	end
	local t_2 = {}
	
	for i_1, v in pairs(t_1) do
		t_2[tostring(v)] = { path = i_1 }
	end
	return t, t_2, p4
end