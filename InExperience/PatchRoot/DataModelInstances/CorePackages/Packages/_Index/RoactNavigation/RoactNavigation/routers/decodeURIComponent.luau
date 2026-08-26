local parent = script.Parent.Parent.Parent
local array = require(parent.LuauPolyfill).Array
local regExpModule = require(parent.RegExp)

local function stringMatch(p1, p2)
	local var1 = p2:exec(p1)
	local t = {}
	while var1 do
		local var2 = var1[1]
		table.insert(t, var2)
		var1 = p2:exec(var1.input:sub(var1.index + var2:len()))
	end
	return t
end

local function _(p3)
	return p3
end

local var3 = regExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeURIComponent(p3)
	-- upvalues: var3 (ref)
	local var4 = var3:exec(p3)
	local var5 = p3
	
	if var4 then
		local t = {}
		
		for i in var4[1]:gmatch("%%(%x%x)") do
			local var6 = tonumber(i, 16)
			
			if var6 >= 128 then
				error("malformed URI sequence")
			end
			table.insert(t, var6)
		end
		var5 = utf8.char(unpack(t))
	end
	return var5
end

local var7 = regExpModule("%[a-fA-F0-9]{2}", "i")
local var8 = regExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeComponents(p4, p5)
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

local function decode(p4)
	-- upvalues: decodeURIComponent (ref), stringMatch (ref), var7 (ref), decodeComponents (ref)
	local ok, status = pcall(decodeURIComponent, p4)
	
	if ok then
		return status
	end
	local var9 = stringMatch(p4, var7)
	local var10 = 2
	while var9[var10] do
		p4 = table.concat(decodeComponents(var9, var10), "")
		var9 = stringMatch(p4, var7)
		var10 += 1
	end
	return p4
end

local _ = function(p5)
	return p5:gsub("%%", "%%%%")
end

local function customDecodeURIComponent(p5)
	-- upvalues: var8 (ref), decodeURIComponent (ref), decode (ref)
	local char = utf8.char(65533)
	local t = { ["%FE%FF"] = char .. char, ["%FF%FE"] = char .. char }
	local list = { "%FE%FF", "%FF%FE" }
	local var11 = var8:exec(p5)
	while var11 do
		local var12 = var11[1]
		local ok, status = xpcall(decodeURIComponent, function(_)
			-- upvalues: decode (copy), var12 (ref), t (ref), list (ref)
			local var13 = decode(var12)
			
			if var13 ~= var12 then
				if t[var12] == nil then
					table.insert(list, var12)
				end
				t[var12] = var13
			end
		end, var12)
		
		if ok then
			if t[var12] == nil then
				table.insert(list, var12)
			end
			t[var12] = status
		end
		var11 = var8:exec(var11.input:sub(var11.index + var12:len()))
	end
	t["%C2"] = char
	table.insert(list, "%C2")
	
	for i, v in list do
		p5 = string.gsub(p5, v:gsub("%%", "%%%%"), t[v]:gsub("%%", "%%%%"))
	end
	return p5
end

return function(p6)
	-- upvalues: customDecodeURIComponent (ref)
	if type(p6) ~= "string" then
		error("Expected `encodedURI` to be of type `string`, got `" .. typeof(p6) .. "`")
	end
	return customDecodeURIComponent(p6:gsub("%+", " "))
end