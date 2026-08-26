local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local string = luauPolyfillModule.String
local number = luauPolyfillModule.Number
local regExpModule = require(parent_1.RegExp)

local function _(p1)
	return p1
end

local function encodeURIComponent(p1)
	-- upvalues: httpService (ref)
	return httpService:UrlEncode(p1)
end

local function strictUriEncode(p1)
	-- upvalues: httpService (ref)
	return httpService:UrlEncode(p1):gsub("[!'%(%)%*]", function(p2)
		return ("%%%x"):format(p2:byte()):upper()
	end)
end

local decodeURIComponentModule = require(parent.decodeURIComponent)
local splitOnFirstModule = require(parent.splitOnFirst)
local encode = nil
local decode = nil
local t = {}

local _ = function(p1)
	return tonumber(p1) or -9223372036854775808
end

local function encoderForArrayFormat(p1)
	-- upvalues: array (ref), encode (write)
	local arrayFormat = p1.arrayFormat
	
	return if arrayFormat == "index" then function(p2)
		-- upvalues: p1 (ref), array (copy), encode (copy)
		return function(p3, p4)
			-- upvalues: p1 (copy), array (copy), encode (copy), p2 (ref)
			local p16Count = #p3
			
			return if p1.skipNull and p4 == nil then p3 elseif p4 == nil then array.concat(p3, {
				table.concat({ encode(p2, p1), "[", p16Count, "]" }, "")
			}) else array.concat(p3, {
				table.concat({
					encode(p2, p1),
					"[",
					encode(p16Count, p1),
					"]=",
					encode(p4, p1)
				}, "")
			})
		end
	end elseif arrayFormat == "bracket" then function(p2)
		-- upvalues: p1 (ref), array (copy), encode (copy)
		return function(p3, p4)
			-- upvalues: p1 (copy), array (copy), encode (copy), p2 (ref)
			return if p1.skipNull and p4 == nil then p3 elseif p4 == nil then array.concat(p3, { table.concat({ encode(p2, p1), "[]" }, "") }) else array.concat(p3, {
				table.concat({ encode(p2, p1), "[]=", encode(p4, p1) }, "")
			})
		end
	end elseif arrayFormat == "comma" or arrayFormat == "separator" then function(p2)
		-- upvalues: encode (copy), p1 (ref)
		return function(p3, p4)
			-- upvalues: encode (copy), p2 (ref), p1 (copy)
			return if p4 == nil or #p4 == 0 then p3 elseif #p3 == 0 then {
				table.concat({ encode(p2, p1), "=", encode(p2, p1) }, "")
			} else {
				table.concat({ p3, encode(p2, p1) }, p1.arrayFormatSeparator)
			}
		end
	end else function(p2)
		-- upvalues: p1 (ref), array (copy), encode (copy)
		return function(p3, p4)
			-- upvalues: p1 (copy), array (copy), encode (copy), p2 (ref)
			return if p1.skipNull and p4 == nil then p3 elseif p4 == nil then array.concat(p3, { encode(p2, p1) }) else array.concat(p3, {
				table.concat({ encode(p2, p1), "=", encode(p4, p1) }, "")
			})
		end
	end
end

local function parserForArrayFormat(p1)
	-- upvalues: regExpModule (ref), array (ref), decode (write)
	local var1 = nil
	local arrayFormat = p1.arrayFormat
	
	return if arrayFormat == "index" then function(p2, p3, p4)
		-- upvalues: var1 (write), regExpModule (copy)
		var1 = regExpModule("\\[(\\d*)\\]$"):exec(p2)
		local var2 = p2:gsub("%[%d*%]$", "")
		
		if not var1 then
			p4[var2] = p3
			
			return
		elseif p4[var2] == nil then
			p4[var2] = {}
		end
		p4[var2][var1[2]] = p3
	end elseif arrayFormat == "bracket" then function(p2, p3, p4)
		-- upvalues: var1 (write), regExpModule (copy), array (copy)
		var1 = regExpModule("(\\[\\])$"):exec(p2)
		local var2 = p2:gsub("%[%]$", "")
		
		if not var1 then
			p4[var2] = p3
			
			return
		elseif p4[var2] == nil then
			p4[var2] = { p3 }
			
			return
		end
		p4[var2] = array.concat({}, p4[var2], p3)
	end elseif arrayFormat == "comma" or arrayFormat == "separator" then function(p2, p3, p4)
		-- upvalues: p1 (ref), array (copy), decode (copy)
		local var2 = nil
		
		if type(p3) == "string" and string.find(p3, p1.arrayFormatSeparator, 1, true) ~= nil then
			var2 = array.map(p3:split(p1.arrayFormatSeparator), function(p5)
				-- upvalues: decode (copy), p1 (copy)
				return decode(p5, p1)
			end)
		elseif p3 ~= nil then
			var2 = decode(p3, p1)
		end
		p4[p2] = var2
	end else function(p2, p3, p4)
		-- upvalues: array (copy)
		if p4[p2] == nil then
			p4[p2] = p3
			
			return
		end
		p4[p2] = array.concat({}, p4[p2], p3)
	end
end

local _ = function(p1)
	if type(p1) ~= "string" or #p1 ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
end

encode = function(p1, p2)
	-- upvalues: strictUriEncode (ref), encodeURIComponent (ref)
	return if p2.encode then if p2.strict then strictUriEncode(p1) else encodeURIComponent(p1) else p1
end

decode = function(p1, p2)
	-- upvalues: decodeURIComponentModule (ref)
	return if p2.decode then decodeURIComponentModule(p1) else p1
end

local function keysSorter(p1)
	-- upvalues: array (ref), keysSorter (ref), object (ref)
	return if array.isArray(p1) then array.sort(p1) elseif type(p1) == "table" then array.map(array.sort(keysSorter(object.keys(p1)), function(p2, p3)
		return (tonumber(p2) or -9223372036854775808) - (tonumber(p3) or -9223372036854775808)
	end), function(p2)
		-- upvalues: p1 (ref)
		return p1[p2]
	end) else p1
end

local _ = function(p1)
	local var1 = p1:find("#")
	
	if var1 ~= nil then
		p1 = p1:sub(1, var1 - 1)
	end
	return p1
end

local _ = function(p1)
	local var1 = ""
	local var2 = p1:find("#")
	
	if var2 ~= nil then
		var1 = p1:sub(var2)
	end
	return var1
end

local function extract(p1)
	local var1 = p1
	local var2 = var1:find("#")
	
	if var2 ~= nil then
		var1 = var1:sub(1, var2 - 1)
	end
	var1 = var1:find("?", 1, true)
	
	return if var1 == nil then "" else var1:sub(var1 + 1)
end

local function parseValue(p1, p2)
	-- upvalues: number (ref), string (ref)
	if p2.parseNumbers and not number.isNaN(tonumber(p1) or -9223372036854775808) and (type(p1) == "string" and string.trim(p1) ~= "") then
		p1 = tonumber(p1) or -9223372036854775808
		
		return p1
	elseif p2.parseBooleans and p1 ~= nil and (string.lower(p1) == "true" or string.lower(p1) == "false") then
		p1 = string.lower(p1) == "true"
	end
	return p1
end

local function parse(p1, p2)
	-- upvalues: object (ref), parserForArrayFormat (ref), string (ref), splitOnFirstModule (ref), decode (write), parseValue (ref), array (ref), boolean (ref), keysSorter (ref)
	local var1 = object.assign({
		decode = true,
		sort = true,
		arrayFormat = "none",
		arrayFormatSeparator = ",",
		parseNumbers = false,
		parseBooleans = false
	}, p2)
	var1 = var1.arrayFormatSeparator
	
	if type(var1) ~= "string" or #var1 ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
	var1 = parserForArrayFormat(var1)
	local t = {}
	
	if type(p1) ~= "string" then
		return t
	end
	local replaced = string.gsub(string.trim(p1), "^[%?#&]", "")
	
	if replaced == "" then
		return t
	end
	for i, v in replaced:split("&") do
		local var2 = splitOnFirstModule(if var1.decode then string.gsub(v, "%+", " ") else v, "=")
		local var3 = var2[1]
		local var4 = var2[2]
		
		if var4 ~= nil and var1.arrayFormat ~= "comma" then
			var4 = decode(var4, var1)
		end
		var1(decode(var3, var1), var4, t)
	end
	local var5
	for i_1 in t do
		var5 = t[i_1]
		
		if type(var5) ~= "table" then
			t[i_1] = parseValue(var5, var1)
			continue
		end
		for i_2 in var5 do
			var5[i_2] = parseValue(var5[i_2], var1)
		end
	end
	return if var1.sort == false then t else array.reduce(if var1.sort == true then array.sort(object.keys(t)) else array.sort(object.keys(t), var1.sort), function(p3, p4)
		-- upvalues: t (ref), boolean (copy), array (copy), keysSorter (copy)
		local var6 = t[p4]
		
		if boolean.toJSBoolean(var6) and type(var6) == "table" and not array.isArray(var6) then
			p3[p4] = keysSorter(var6)
			
			return p3
		end
		p3[p4] = var6
		
		return p3
	end, {})
end

t.extract = extract
t.parse = parse

function t.stringify(p3, p4)
	-- upvalues: object (ref), encoderForArrayFormat (ref), array (ref), encode (write)
	if not p3 then
		return ""
	end
	p4 = object.assign({
		encode = true,
		strict = true,
		arrayFormat = "none",
		arrayFormatSeparator = ","
	}, p4)
	local arrayFormatSeparator = p4.arrayFormatSeparator
	
	if type(arrayFormatSeparator) ~= "string" or #arrayFormatSeparator ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
	arrayFormatSeparator = encoderForArrayFormat(p4)
	local var6 = object.keys(table.clone(p3))
	
	if p4.sort ~= false then
		array.sort(var6, p4.sort)
	end
	return table.concat(array.filter(array.map(var6, function(p5)
		-- upvalues: p3 (ref), encode (copy), p4 (write), array (copy), arrayFormatSeparator (ref)
		local var7 = p3[p5]
		
		return if var7 == nil then encode(p5, p4) elseif array.isArray(var7) then table.concat(array.reduce(var7, arrayFormatSeparator(p5), {}), "&") else encode(p5, p4) + "=" + encode(var7, p4)
	end), function(p5)
		return p5.length > 0
	end), "&")
end

function t.parseUrl(p3, p4)
	-- upvalues: parse (ref)
	local t = {}
	local var6 = p3
	local var7 = var6:find("#")
	
	if var7 ~= nil then
		var6 = var6:sub(1, var7 - 1)
	end
	t.url = var6:split("?")[1] or ""
	local var8 = p3
	local var9 = var8:find("#")
	
	if var9 ~= nil then
		var8 = var8:sub(1, var9 - 1)
	end
	var8 = var8:find("?", 1, true)
	t.query = parse(if var8 == nil then "" else var8:sub(var8 + 1), p4)
	
	return t
end

function t.stringifyUrl(p3, p4)
	-- upvalues: t (ref), object (ref)
	local url = p3.url
	local var6 = url:find("#")
	
	if var6 ~= nil then
		url = url:sub(1, var6 - 1)
	end
	local var7 = url:split("?")[1] or ""
	local var8 = t.parse(t.extract(p3.url))
	local url_1 = p3.url
	local var9 = ""
	local var10 = url_1:find("#")
	
	if var10 ~= nil then
		var9 = url_1:sub(var10)
	end
	local var11 = t.stringify(object.assign(var8, p3.query), p4)
	
	return ("%s%s%s"):format(var7, var11 and ("?%s"):format(var11), var9)
end

return t