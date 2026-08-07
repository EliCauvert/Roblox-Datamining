local t = {
	version = "0.9.0",
	options = { separator = "&" },
	services = {
		acap = 674,
		cap = 1026,
		dict = 2628,
		ftp = 21,
		gopher = 70,
		http = 80,
		https = 443,
		iax = 4569,
		icap = 1344,
		imap = 143,
		ipp = 631,
		ldap = 389,
		mtqp = 1038,
		mupdate = 3905,
		news = 2009,
		nfs = 2049,
		nntp = 119,
		rtsp = 554,
		sip = 5060,
		snmp = 161,
		telnet = 23,
		tftp = 69,
		vemmi = 575,
		afs = 1483,
		jms = 5673,
		rsync = 873,
		prospero = 191,
		videotex = 516
	}
}
local t_1 = {
	["-"] = true,
	_ = true,
	["."] = true,
	["!"] = true,
	["~"] = true,
	["*"] = true,
	["'"] = true,
	["("] = true,
	[")"] = true,
	[":"] = true,
	["@"] = true,
	["&"] = true,
	["="] = true,
	["+"] = true,
	["$"] = true,
	[","] = true,
	[";"] = true
}

local function _(p0, p1) --[[ line: 60 | named "decode" ]]
	local var5 = p0
	
	if not p1 then
		var5 = var5:gsub("+", " ")
	end
	return var5:gsub("%%(%x%x)", function(p2) --[[ line: 65 ]]
		return string.char(tonumber(p2, 16))
	end)
end

local _ = function(p3) --[[ line: 70 | named "encode" ]]
	return p3:gsub("([^A-Za-z0-9%_%.%-%~])", function(p4) --[[ line: 71 ]]
		return string.upper(string.format("%%%02x", string.byte(p4)))
	end)
end

local _ = function(p5) --[[ line: 77 | named "encodeValue" ]]
	return p5:gsub("([^A-Za-z0-9%_%.%-%~])", function(p6) --[[ line: 71 ]]
		return string.upper(string.format("%%%02x", string.byte(p6)))
	end):gsub("%%20", "+")
end

local function encodeSegment(p7) --[[ line: 82 ]]
	-- upvalues: t_1 (ref)
	return p7:gsub("([^a-zA-Z0-9])", function(p8) --[[ line: 83 ]]
		-- upvalues: t_1 (copy)
		return if t_1[p8] then p8 else p8:gsub("([^A-Za-z0-9%_%.%-%~])", function(p9) --[[ line: 71 ]]
			return string.upper(string.format("%%%02x", string.byte(p9)))
		end)
	end)
end

local function concat(p10, p11) --[[ line: 92 ]]
	return p10 .. p11:build()
end

function t.build(p12) --[[ line: 98 ]]
	-- upvalues: encodeSegment (ref), t (ref)
	local var6 = ""
	
	if p12.path then
		local path = p12.path
		path:gsub("([^/]+)", function(p13) --[[ line: 102 ]]
			-- upvalues: encodeSegment (copy)
			return encodeSegment(p13)
		end)
		var6 ..= tostring(path)
	end
	if p12.query then
		local var7 = tostring(p12.query)
		
		if var7 ~= "" then
			var6 ..= "?" .. var7
		end
	end
	if p12.host then
		local host = p12.host
		
		if p12.port and p12.scheme and t.services[p12.scheme] ~= p12.port then
			host ..= ":" .. p12.port
		end
		local text = nil
		
		if p12.user and p12.user ~= "" then
			text = p12.user
			
			if p12.password then
				text ..= ":" .. p12.password
			end
		end
		if text and text ~= "" then
			host = text .. "@" .. host
		end
		if host then
			var6 = if var6 ~= "" then "//" .. host else "//" .. host .. "/" .. var6:gsub("^/+", "")
		end
	end
	if p12.scheme then
		var6 = p12.scheme .. ":" .. var6
	end
	if p12.fragment then
		var6 ..= "#" .. p12.fragment
	end
	return var6
end

function t.buildQuery(_, _, _) --[[ line: 148 ]]
	-- upvalues: t (ref)
-- FATAL: Failed to generate AST for `buildQuery` function:
runtime : [KeyError] :11990: 60
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.parseQuery(_, _) --[[ line: 185 ]]
	-- upvalues: t (ref)
-- FATAL: Failed to generate AST for `parseQuery` function:
runtime : [KeyError] :11990: 86
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.setQuery(value, p14) --[[ line: 241 ]]
	-- upvalues: t (ref)
	local var9 = p14
	
	if type(var9) == "table" then
		var9 = t.buildQuery(var9)
	end
	value.query = t.parseQuery(var9)
	
	return var9
end

function t.setAuthority(value, p15) --[[ line: 254 ]]
	value.authority = p15
	value.port = nil
	value.host = nil
	value.userinfo = nil
	value.user = nil
	value.password = nil
	local var10 = p15:gsub("^([^@]*)@", function(p18) --[[ line: 262 ]]
		-- upvalues: value (ref)
		value.userinfo = p18
		
		return ""
	end):gsub("^%[[^%]]+%]", function(p17) --[[ line: 266 ]]
		-- upvalues: value (ref)
		value.host = p17
		
		return ""
	end):gsub(":([^:]*)$", function(p16) --[[ line: 271 ]]
		-- upvalues: value (ref)
		value.port = tonumber(p16)
		
		return ""
	end)
	
	if var10 ~= "" and not value.host then
		value.host = var10:lower()
	end
	if value.userinfo then
		value.user = value.userinfo:gsub(":([^:]*)$", function(p19) --[[ line: 280 ]]
			-- upvalues: value (ref)
			value.password = p19
			
			return ""
		end)
	end
	return var10
end

function t.parse(p20) --[[ line: 295 ]]
	-- upvalues: t (ref), concat (ref)
	local t_1 = {}
	t.setAuthority(t_1, "")
	t.setQuery(t_1, "")
	t_1.path = tostring(p20 or ""):gsub("#(.*)$", function(p25) --[[ line: 301 ]]
		-- upvalues: t_1 (ref)
		t_1.fragment = p25
		
		return ""
	end):gsub("^([%w][%w%+%-%.]*)%:", function(p24) --[[ line: 305 ]]
		-- upvalues: t_1 (ref)
		t_1.scheme = p24:lower()
		
		return ""
	end):gsub("%?(.*)", function(p23) --[[ line: 309 ]]
		-- upvalues: t (copy), t_1 (ref)
		t.setQuery(t_1, p23)
		
		return ""
	end):gsub("^//([^/]*)", function(p22) --[[ line: 313 ]]
		-- upvalues: t (copy), t_1 (ref)
		t.setAuthority(t_1, p22)
		
		return ""
	end):gsub("%%(%x%x)", function(p21) --[[ line: 65 ]]
		return string.char(tonumber(p21, 16))
	end)
	setmetatable(t_1, { __index = t, __concat = concat, __tostring = t.build })
	
	return t_1
end

function t.removeDotSegments(vectorA) --[[ line: 331 ]]
	local t = {}
	
	if string.len(vectorA) == 0 then
		return ""
	end
	local var13 = false
	local var14 = false
	
	if string.sub(vectorA, 1, 1) == "/" then
		var13 = true
	end
	if (string.len(vectorA) > 1 or var13 == false) and string.sub(vectorA, -1) == "/" then
		var14 = true
	end
	vectorA:gsub("[^/]+", function(p26) --[[ line: 345 ]]
		-- upvalues: t (ref)
		table.insert(t, p26)
	end)
	local t_1 = {}
	local var16 = 0
	
	for i, v in ipairs(t) do
		if v == ".." then
			if var16 > 0 then
				var16 -= 1
			end
		elseif v ~= "." then
			var16 += 1
			t_1[var16] = v
		end
	end
	local _ = ""
	local var17 = if #t_1 > 0 and var16 > 0 then table.concat(t_1, "/", 1, var16) else ""
	
	if var13 then
		var17 = "/" .. var17
	end
	if var14 then
		var17 ..= "/"
	end
	return var17
end

local function absolutePath(value, p27) --[[ line: 375 ]]
	if string.sub(p27, 1, 1) == "/" then
		return "/" .. string.gsub(p27, "^[%./]+", "")
	end
	local var18 = value
	
	if p27 ~= "" then
		var18 = "/" .. var18:gsub("[^/]*$", "")
	end
	var18 = string.gsub((var18 .. p27):gsub("([^/]*%./)", function(p28) --[[ line: 384 ]]
		return if p28 == "./" then "" else p28
	end), "/%.$", "/")
	local var19 = nil
	while var19 ~= var18 do
		var19 = var18
		var18 = string.gsub(var19, "([^/]*/%.%./)", function(p29) --[[ line: 391 ]]
			return if p29 == "../../" then p29 else ""
		end)
	end
	var18 = string.gsub(var18, "([^/]*/%.%.?)$", function(p30) --[[ line: 395 ]]
		return if p30 == "../.." then p30 else ""
	end)
	local var20 = nil
	while var20 ~= var18 do
		var20 = var18
		var18 = string.gsub(var20, "^/?%.%./", "")
	end
	return "/" .. var18
end

function t.resolve(p31, p32) --[[ line: 409 ]]
	-- upvalues: t (ref), absolutePath (ref)
	if type(p31) == "string" then
		p31 = t.parse(p31)
	end
	if type(p32) == "string" then
		p32 = t.parse(p32)
	end
	if p32.scheme then
		return p32
	end
	p32.scheme = p31.scheme
	
	if not p32.authority or p32.authority == "" then
		p32:setAuthority(p31.authority)
		
		if p32.path and p32.path ~= "" then
			p32.path = absolutePath(p31.path, p32.path)
		else
			p32.path = p31.path
			local query = p32.query
			
			if query and next(query) then
				return p32
			else
				p32.query = p31.query
				
				return p32
			end
		end
	end
end

function t.normalize(p33) --[[ line: 439 ]]
	-- upvalues: t (ref), absolutePath (ref)
	if type(p33) == "string" then
		p33 = t.parse(p33)
	end
	if p33.path then
		p33.path = string.gsub(absolutePath(p33.path, ""), "//+", "/")
	end
	return p33
end

return t