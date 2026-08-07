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

local function _(p0) --[[ line: 28 | named "TypeError" ]]
	return p0
end

local function encodeURIComponent(p1) --[[ line: 32 ]]
	-- upvalues: httpService (ref)
	return httpService:UrlEncode(p1)
end

local function strictUriEncode(p2) --[[ line: 36 ]]
	-- upvalues: httpService (ref)
	return httpService:UrlEncode(p2):gsub("[!'%(%)%*]", function(p3) --[[ line: 37 ]]
		return ("%%%x"):format(p3:byte()):upper()
	end)
end

local decodeURIComponentModule = require(parent.decodeURIComponent)
local splitOnFirstModule = require(parent.splitOnFirst)
local encode = nil
local decode = nil
local t = {}

local _ = function(p4) --[[ line: 51 | named "newNumber" ]]
	return tonumber(p4) or -9223372036854775808
end

local function encoderForArrayFormat(p5) --[[ line: 55 ]]
	-- upvalues: array (ref), encode (write)
	local arrayFormat = p5.arrayFormat
	
	return if arrayFormat == "index" then function(p15) --[[ line: 58 ]]
		-- upvalues: p5 (ref), array (copy), encode (copy)
		return function(p16, p17) --[[ line: 59 ]]
			-- upvalues: p5 (copy), array (copy), encode (copy), p15 (ref)
			local p16Count = #p16
			
			return if p5.skipNull and p17 == nil then p16 elseif p17 == nil then array.concat(p16, {
				table.concat({ encode(p15, p5), "[", p16Count, "]" }, "")
			}) else array.concat(p16, {
				table.concat({
					encode(p15, p5),
					"[",
					encode(p16Count, p5),
					"]=",
					encode(p17, p5)
				}, "")
			})
		end
	end elseif arrayFormat == "bracket" then function(p12) --[[ line: 88 ]]
		-- upvalues: p5 (ref), array (copy), encode (copy)
		return function(p13, p14) --[[ line: 89 ]]
			-- upvalues: p5 (copy), array (copy), encode (copy), p12 (ref)
			return if p5.skipNull and p14 == nil then p13 elseif p14 == nil then array.concat(p13, { table.concat({ encode(p12, p5), "[]" }, "") }) else array.concat(p13, {
				table.concat({ encode(p12, p5), "[]=", encode(p14, p5) }, "")
			})
		end
	end elseif arrayFormat == "comma" or arrayFormat == "separator" then function(p9) --[[ line: 106 ]]
		-- upvalues: encode (copy), p5 (ref)
		return function(p10, p11) --[[ line: 107 ]]
			-- upvalues: encode (copy), p9 (ref), p5 (copy)
			return if p11 == nil or #p11 == 0 then p10 elseif #p10 == 0 then {
				table.concat({ encode(p9, p5), "=", encode(p9, p5) }, "")
			} else {
				table.concat({ p10, encode(p9, p5) }, p5.arrayFormatSeparator)
			}
		end
	end else function(p6) --[[ line: 124 ]]
		-- upvalues: p5 (ref), array (copy), encode (copy)
		return function(p7, p8) --[[ line: 125 ]]
			-- upvalues: p5 (copy), array (copy), encode (copy), p6 (ref)
			return if p5.skipNull and p8 == nil then p7 elseif p8 == nil then array.concat(p7, { encode(p6, p5) }) else array.concat(p7, {
				table.concat({ encode(p6, p5), "=", encode(p8, p5) }, "")
			})
		end
	end
end

local function parserForArrayFormat(p18) --[[ line: 142 ]]
	-- upvalues: regExpModule (ref), array (ref), decode (write)
	local var17 = nil
	local arrayFormat = p18.arrayFormat
	
	return if arrayFormat == "index" then function(p29, p30, p31) --[[ line: 146 ]]
		-- upvalues: var17 (write), regExpModule (copy)
		var17 = regExpModule("\\[(\\d*)\\]$"):exec(p29)
		local var20 = p29:gsub("%[%d*%]$", "")
		
		if not var17 then
			p31[var20] = p30
			
			return
		elseif p31[var20] == nil then
			p31[var20] = {}
		end
		p31[var20][var17[2]] = p30
	end elseif arrayFormat == "bracket" then function(p26, p27, p28) --[[ line: 163 ]]
		-- upvalues: var17 (write), regExpModule (copy), array (copy)
		var17 = regExpModule("(\\[\\])$"):exec(p26)
		local var19 = p26:gsub("%[%]$", "")
		
		if not var17 then
			p28[var19] = p27
			
			return
		elseif p28[var19] == nil then
			p28[var19] = { p27 }
			
			return
		end
		p28[var19] = array.concat({}, p28[var19], p27)
	end elseif arrayFormat == "comma" or arrayFormat == "separator" then function(p22, p23, p24) --[[ line: 180 ]]
		-- upvalues: p18 (ref), array (copy), decode (copy)
		local var18 = nil
		
		if type(p23) == "string" and string.find(p23, p18.arrayFormatSeparator, 1, true) ~= nil then
			var18 = array.map(p23:split(p18.arrayFormatSeparator), function(p25) --[[ line: 185 ]]
				-- upvalues: decode (copy), p18 (copy)
				return decode(p25, p18)
			end)
		elseif p23 ~= nil then
			var18 = decode(p23, p18)
		end
		p24[p22] = var18
	end else function(p19, p20, p21) --[[ line: 196 ]]
		-- upvalues: array (copy)
		if p21[p19] == nil then
			p21[p19] = p20
			
			return
		end
		p21[p19] = array.concat({}, p21[p19], p20)
	end
end

local _ = function(p32) --[[ line: 207 | named "validateArrayFormatSeparator" ]]
	if type(p32) ~= "string" or #p32 ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
end

encode = function(p33, p34) --[[ line: 213 | named "encode" ]]
	-- upvalues: strictUriEncode (ref), encodeURIComponent (ref)
	return if p34.encode then if p34.strict then strictUriEncode(p33) else encodeURIComponent(p33) else p33
end

decode = function(p35, p36) --[[ line: 225 | named "decode" ]]
	-- upvalues: decodeURIComponentModule (ref)
	return if p36.decode then decodeURIComponentModule(p35) else p35
end

local function keysSorter(p37) --[[ line: 233 ]]
	-- upvalues: array (ref), keysSorter (ref), object (ref)
	return if array.isArray(p37) then array.sort(p37) elseif type(p37) == "table" then array.map(array.sort(keysSorter(object.keys(p37)), function(p38, p39) --[[ line: 239 ]]
		return (tonumber(p38) or -9223372036854775808) - (tonumber(p39) or -9223372036854775808)
	end), function(p40) --[[ line: 242 ]]
		-- upvalues: p37 (ref)
		return p37[p40]
	end) else p37
end

local _ = function(p41) --[[ line: 251 | named "removeHash" ]]
	local var21 = p41:find("#")
	
	if var21 ~= nil then
		p41 = p41:sub(1, var21 - 1)
	end
	return p41
end

local _ = function(p42) --[[ line: 260 | named "getHash" ]]
	local var22 = ""
	local var23 = p42:find("#")
	
	if var23 ~= nil then
		var22 = p42:sub(var23)
	end
	return var22
end

local function extract(p43) --[[ line: 270 ]]
	local var24 = p43
	local var25 = var24:find("#")
	
	if var25 ~= nil then
		var24 = var24:sub(1, var25 - 1)
	end
	var24 = var24:find("?", 1, true)
	
	return if var24 == nil then "" else var24:sub(var24 + 1)
end

local function parseValue(p44, p45) --[[ line: 280 ]]
	-- upvalues: number (ref), string (ref)
	if p45.parseNumbers and not number.isNaN(tonumber(p44) or -9223372036854775808) and (type(p44) == "string" and string.trim(p44) ~= "") then
		p44 = tonumber(p44) or -9223372036854775808
		
		return p44
	elseif p45.parseBooleans and p44 ~= nil and (string.lower(p44) == "true" or string.lower(p44) == "false") then
		p44 = string.lower(p44) == "true"
	end
	return p44
end

local function parse(p46, p47) --[[ line: 299 ]]
	-- upvalues: object (ref), parserForArrayFormat (ref), string (ref), splitOnFirstModule (ref), decode (write), parseValue (ref), array (ref), boolean (ref), keysSorter (ref)
	local var26 = object.assign({
		decode = true,
		sort = true,
		arrayFormat = "none",
		arrayFormatSeparator = ",",
		parseNumbers = false,
		parseBooleans = false
	}, p47)
	var26 = var26.arrayFormatSeparator
	
	if type(var26) ~= "string" or #var26 ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
	var26 = parserForArrayFormat(var26)
	local t = {}
	
	if type(p46) ~= "string" then
		return t
	end
	local replaced = string.gsub(string.trim(p46), "^[%?#&]", "")
	
	if replaced == "" then
		return t
	end
	for i, v in replaced:split("&") do
		local var30 = splitOnFirstModule(if var26.decode then string.gsub(v, "%+", " ") else v, "=")
		local var31 = var30[1]
		local var32 = var30[2]
		
		if var32 ~= nil and var26.arrayFormat ~= "comma" then
			var32 = decode(var32, var26)
		end
		var26(decode(var31, var26), var32, t)
	end
	local var29
	for i_1 in t do
		var29 = t[i_1]
		
		if type(var29) ~= "table" then
			t[i_1] = parseValue(var29, var26)
			continue
		end
		for i_2 in var29 do
			var29[i_2] = parseValue(var29[i_2], var26)
		end
	end
	return if var26.sort == false then t else array.reduce(if var26.sort == true then array.sort(object.keys(t)) else array.sort(object.keys(t), var26.sort), function(p48, p49) --[[ line: 363 ]]
		-- upvalues: t (ref), boolean (copy), array (copy), keysSorter (copy)
		local var33 = t[p49]
		
		if boolean.toJSBoolean(var33) and type(var33) == "table" and not array.isArray(var33) then
			p48[p49] = keysSorter(var33)
			
			return p48
		end
		p48[p49] = var33
		
		return p48
	end, {})
end

t.extract = extract
t.parse = parse

function t.stringify(p50, p51) --[[ line: 380 ]]
	-- upvalues: object (ref), encoderForArrayFormat (ref), array (ref), encode (write)
	if not p50 then
		return ""
	end
	p51 = object.assign({
		encode = true,
		strict = true,
		arrayFormat = "none",
		arrayFormatSeparator = ","
	}, p51)
	local arrayFormatSeparator = p51.arrayFormatSeparator
	
	if type(arrayFormatSeparator) ~= "string" or #arrayFormatSeparator ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
	arrayFormatSeparator = encoderForArrayFormat(p51)
	local var34 = object.keys(table.clone(p50))
	
	if p51.sort ~= false then
		array.sort(var34, p51.sort)
	end
	return table.concat(array.filter(array.map(var34, function(p52) --[[ line: 414 ]]
		-- upvalues: p50 (ref), encode (copy), p51 (write), array (copy), arrayFormatSeparator (ref)
		local var35 = p50[p52]
		
		return if var35 == nil then encode(p52, p51) elseif array.isArray(var35) then table.concat(array.reduce(var35, arrayFormatSeparator(p52), {}), "&") else encode(p52, p51) + "=" + encode(var35, p51)
	end), function(p53) --[[ line: 430 ]]
		return p53.length > 0
	end), "&")
end

function t.parseUrl(p54, p55) --[[ line: 438 ]]
	-- upvalues: parse (ref)
	local t = {}
	local var37 = p54
	local var38 = var37:find("#")
	
	if var38 ~= nil then
		var37 = var37:sub(1, var38 - 1)
	end
	t.url = var37:split("?")[1] or ""
	local var39 = p54
	local var40 = var39:find("#")
	
	if var40 ~= nil then
		var39 = var39:sub(1, var40 - 1)
	end
	var39 = var39:find("?", 1, true)
	t.query = parse(if var39 == nil then "" else var39:sub(var39 + 1), p55)
	
	return t
end

function t.stringifyUrl(p56, p57) --[[ line: 445 ]]
	-- upvalues: t (ref), object (ref)
	local url = p56.url
	local var41 = url:find("#")
	
	if var41 ~= nil then
		url = url:sub(1, var41 - 1)
	end
	local var42 = url:split("?")[1] or ""
	local var43 = t.parse(t.extract(p56.url))
	local url_1 = p56.url
	local var44 = ""
	local var45 = url_1:find("#")
	
	if var45 ~= nil then
		var44 = url_1:sub(var45)
	end
	local var46 = t.stringify(object.assign(var43, p56.query), p57)
	
	return ("%s%s%s"):format(var42, var46 and ("?%s"):format(var46), var44)
end

return t