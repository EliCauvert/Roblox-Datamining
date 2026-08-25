local function splitStringWithMarks(p0, p1)
	if type(p0) ~= "string" or type(p1) ~= "table" then
		return p0, ""
	end
	for i, v in ipairs(p1) do
		local var1, var2 = p0:find(v, nil, true)
		
		if var1 ~= nil then
			return p0:sub(1, var1 - 1), p0:sub(var2 + 1)
		end
	end
	return p0, ""
end

local function _(p2)
	return if type(p2) == "string" then string.match(p2, "([^.]*)$") else ""
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
		local var6, var7 = splitStringWithMarks(i, { ", line ", ", Line ", ":" })
		local var8 = var6
		var9, var7 = splitStringWithMarks(var7, { " - " })
		local var10 = var9
		local var11 = var7
		
		if var11 == "" and var10 ~= "" then
			local match, match_1 = string.match(var10, "^(%d+)%s*(.*)")
			
			if match then
				var10 = match
				
				if match_1 ~= "" then
					var11 = match_1
				end
			end
		end
		if var10 ~= "" and var8 ~= "" then
			local _, _, matchIndex = string.find(var8, "Script '(.*)'")
			
			if matchIndex ~= nil then
				var8 = matchIndex
			end
			local var15 = t_1[var8]
			
			if var15 == nil then
				p4 += 1
				var15 = p4
				t_1[var8] = var15
			end
			if var11 == "" then
				local var16 = var8
				var11 = if type(var16) ~= "string" then string.match(var16, "([^.]*)$") else ""
			end
			table.insert(t, {
				line = var10,
				funcName = var11,
				sourceCode = tostring(var15)
			})
		end
	end
	local t_2 = {}
	
	for i_1, v in pairs(t_1) do
		t_2[tostring(v)] = { path = i_1 }
	end
	return t, t_2, p4
end