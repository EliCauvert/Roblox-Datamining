local parent = script.Parent.Parent.Parent
local array = require(parent.LuauPolyfill).Array
local regExpModule = require(parent.RegExp)

local function stringMatch(p0, p1) --[[ line: 11 ]]
	local var9 = p1:exec(p0)
	local t = {}
	while var9 do
		local var11 = var9[1]
		table.insert(t, var11)
		var9 = p1:exec(var9.input:sub(var9.index + var11:len()))
	end
	return t
end

local function _(p2) --[[ line: 25 | named "TypeError" ]]
	return p2
end

local var2 = regExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeURIComponent(p3) --[[ line: 33 ]]
	-- upvalues: var2 (ref)
	local var12 = var2:exec(p3)
	local var13 = p3
	
	if var12 then
		local t = {}
		
		for i in var12[1]:gmatch("%%(%x%x)") do
			local var15 = tonumber(i, 16)
			
			if var15 >= 128 then
				error("malformed URI sequence")
			end
			table.insert(t, var15)
		end
		var13 = utf8.char(unpack(t))
	end
	return var13
end

local var4 = regExpModule("%[a-fA-F0-9]{2}", "i")
local var5 = regExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeComponents(p4, p5) --[[ line: 61 ]]
	-- upvalues: decodeURIComponent (ref), array (ref), decodeComponents (ref)
	local ok, status = pcall(decodeURIComponent, table.concat(p4, ""))
	
	if ok then
		return status
	elseif #p4 == 1 then
		return p4
	end
	p5 = p5 or 1
	
	return array.concat(decodeComponents(array.slice(p4, 1, p5 + 1)), decodeComponents(array.slice(p4, p5 + 1)))
end

local function decode(p6) --[[ line: 83 ]]
	-- upvalues: decodeURIComponent (ref), stringMatch (ref), var4 (ref), decodeComponents (ref)
	local ok, status = pcall(decodeURIComponent, p6)
	
	if ok then
		return status
	end
	local var16 = stringMatch(p6, var4)
	local var17 = 2
	while var16[var17] do
		p6 = table.concat(decodeComponents(var16, var17), "")
		var16 = stringMatch(p6, var4)
		var17 += 1
	end
	return p6
end

local _ = function(p7) --[[ line: 107 | named "escapePercent" ]]
	return p7:gsub("%%", "%%%%")
end

local function customDecodeURIComponent(p8) --[[ line: 112 ]]
	-- upvalues: var5 (ref), decodeURIComponent (ref), decode (ref)
	local char = utf8.char(65533)
	local t = { ["%FE%FF"] = char .. char, ["%FF%FE"] = char .. char }
	local list = { "%FE%FF", "%FF%FE" }
	local var21 = var5:exec(p8)
	while var21 do
		local var22 = var21[1]
		local ok, status = xpcall(decodeURIComponent, function(_) --[[ line: 130 ]]
			-- upvalues: decode (copy), var22 (ref), t (ref), list (ref)
			local var23 = decode(var22)
			
			if var23 ~= var22 then
				if t[var22] == nil then
					table.insert(list, var22)
				end
				t[var22] = var23
			end
		end, var22)
		
		if ok then
			if t[var22] == nil then
				table.insert(list, var22)
			end
			t[var22] = status
		end
		var21 = var5:exec(var21.input:sub(var21.index + var22:len()))
	end
	t["%C2"] = char
	table.insert(list, "%C2")
	
	for i, v in list do
		p8 = string.gsub(p8, v:gsub("%%", "%%%%"), t[v]:gsub("%%", "%%%%"))
	end
	return p8
end

return function(p9) --[[ line: 172 | named "decodeComponent" ]]
	-- upvalues: customDecodeURIComponent (ref)
	if type(p9) ~= "string" then
		error("Expected `encodedURI` to be of type `string`, got `" .. typeof(p9) .. "`")
	end
	return customDecodeURIComponent(p9:gsub("%+", " "))
end