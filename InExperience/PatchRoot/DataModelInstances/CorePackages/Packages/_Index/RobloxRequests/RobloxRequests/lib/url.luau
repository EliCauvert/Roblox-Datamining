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

local function _(p1, p2)
	local var1 = p1
	
	if not p2 then
		var1 = var1:gsub("+", " ")
	end
	return var1:gsub("%%(%x%x)", function(p3)
		return string.char(tonumber(p3, 16))
	end)
end

local _ = function(p1)
	return p1:gsub("([^A-Za-z0-9%_%.%-%~])", function(p2)
		return string.upper(string.format("%%%02x", string.byte(p2)))
	end)
end

local _ = function(p1)
	return p1:gsub("([^A-Za-z0-9%_%.%-%~])", function(p2)
		return string.upper(string.format("%%%02x", string.byte(p2)))
	end):gsub("%%20", "+")
end

local function encodeSegment(p1)
	-- upvalues: t_1 (ref)
	return p1:gsub("([^a-zA-Z0-9])", function(p2)
		-- upvalues: t_1 (copy)
		return if t_1[p2] then p2 else p2:gsub("([^A-Za-z0-9%_%.%-%~])", function(p3)
			return string.upper(string.format("%%%02x", string.byte(p3)))
		end)
	end)
end

local function concat(p1, p2)
	return p1 .. p11:build()
end

function t.build(p1)
	-- upvalues: encodeSegment (ref), t (ref)
	local var1 = ""
	
	if p1.path then
		local path = p1.path
		path:gsub("([^/]+)", function(p2)
			-- upvalues: encodeSegment (copy)
			return encodeSegment(p2)
		end)
		var1 ..= tostring(path)
	end
	if p1.query then
		local var2 = tostring(p1.query)
		
		if var2 ~= "" then
			var1 ..= "?" .. var7
		end
	end
	if p1.host then
		local host = p1.host
		
		if p1.port and p1.scheme and t.services[p1.scheme] ~= p1.port then
			host ..= ":" .. p12.port
		end
		local text = nil
		
		if p1.user and p1.user ~= "" then
			text = p1.user
			
			if p1.password then
				text ..= ":" .. p12.password
			end
		end
		if text and text ~= "" then
			host = text .. "@" .. host
		end
		if host then
			var1 = if var1 ~= "" then "//" .. host else "//" .. host .. "/" .. var6:gsub("^/+", "")
		end
	end
	if p1.scheme then
		var1 = p1.scheme .. ":" .. var6
	end
	if p1.fragment then
		var1 ..= "#" .. p12.fragment
	end
	return var1
end

function t.buildQuery(_, _, _)
	-- upvalues: t (ref)
-- FATAL: Failed to generate AST for `buildQuery` function:
runtime : [KeyError] :11990: 60
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.parseQuery(_, _)
	-- upvalues: t (ref)
-- FATAL: Failed to generate AST for `parseQuery` function:
runtime : [KeyError] :11990: 86
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

function t.setQuery(value, p1)
	-- upvalues: t (ref)
	local var1 = p1
	
	if type(var1) == "table" then
		var1 = t.buildQuery(var1)
	end
	value.query = t.parseQuery(var1)
	
	return var1
end

function t.setAuthority(value, p1)
	value.authority = p1
	value.port = nil
	value.host = nil
	value.userinfo = nil
	value.user = nil
	value.password = nil
	local var1 = p1:gsub("^([^@]*)@", function(p2)
		-- upvalues: value (ref)
		value.userinfo = p2
		
		return ""
	end):gsub("^%[[^%]]+%]", function(p2)
		-- upvalues: value (ref)
		value.host = p2
		
		return ""
	end):gsub(":([^:]*)$", function(p2)
		-- upvalues: value (ref)
		value.port = tonumber(p2)
		
		return ""
	end)
	
	if var1 ~= "" and not value.host then
		value.host = var1:lower()
	end
	if value.userinfo then
		value.user = value.userinfo:gsub(":([^:]*)$", function(p2)
			-- upvalues: value (ref)
			value.password = p2
			
			return ""
		end)
	end
	return var1
end

function t.parse(p1)
	-- upvalues: t (ref), concat (ref)
	local t_1 = {}
	t.setAuthority(t_1, "")
	t.setQuery(t_1, "")
	t_1.path = tostring(p1 or ""):gsub("#(.*)$", function(p2)
		-- upvalues: t_1 (ref)
		t_1.fragment = p2
		
		return ""
	end):gsub("^([%w][%w%+%-%.]*)%:", function(p2)
		-- upvalues: t_1 (ref)
		t_1.scheme = p2:lower()
		
		return ""
	end):gsub("%?(.*)", function(p2)
		-- upvalues: t (copy), t_1 (ref)
		t.setQuery(t_1, p2)
		
		return ""
	end):gsub("^//([^/]*)", function(p2)
		-- upvalues: t (copy), t_1 (ref)
		t.setAuthority(t_1, p2)
		
		return ""
	end):gsub("%%(%x%x)", function(p2)
		return string.char(tonumber(p2, 16))
	end)
	setmetatable(t_1, { __index = t, __concat = concat, __tostring = t.build })
	
	return t_1
end

function t.removeDotSegments(vectorA)
	local t = {}
	
	if string.len(vectorA) == 0 then
		return ""
	end
	local var1 = false
	local var2 = false
	
	if string.sub(vectorA, 1, 1) == "/" then
		var1 = true
	end
	if (string.len(vectorA) > 1 or var1 == false) and string.sub(vectorA, -1) == "/" then
		var2 = true
	end
	vectorA:gsub("[^/]+", function(p1)
		-- upvalues: t (ref)
		table.insert(t, p1)
	end)
	local t_1 = {}
	local var3 = 0
	
	for i, v in ipairs(t) do
		if v == ".." then
			if var3 > 0 then
				var3 -= 1
			end
		elseif v ~= "." then
			var3 += 1
			t_1[var3] = v
		end
	end
	local _ = ""
	local var4 = if #t_1 > 0 and var3 > 0 then table.concat(t_1, "/", 1, var3) else ""
	
	if var1 then
		var4 = "/" .. var17
	end
	if var2 then
		var4 ..= "/"
	end
	return var4
end

local function absolutePath(value, p1)
	if string.sub(p1, 1, 1) == "/" then
		return "/" .. string.gsub(p1, "^[%./]+", "")
	end
	local var5 = value
	
	if p1 ~= "" then
		var5 = "/" .. var18:gsub("[^/]*$", "")
	end
	var5 = string.gsub((var5 .. p27):gsub("([^/]*%./)", function(p2)
		return if p2 == "./" then "" else p2
	end), "/%.$", "/")
	local var6 = nil
	while var6 ~= var5 do
		var6 = var5
		var5 = string.gsub(var6, "([^/]*/%.%./)", function(p2)
			return if p2 == "../../" then p2 else ""
		end)
	end
	var5 = string.gsub(var5, "([^/]*/%.%.?)$", function(p2)
		return if p2 == "../.." then p2 else ""
	end)
	local var7 = nil
	while var7 ~= var5 do
		var7 = var5
		var5 = string.gsub(var7, "^/?%.%./", "")
	end
	return "/" .. var18
end

function t.resolve(p2, p3)
	-- upvalues: t (ref), absolutePath (ref)
	if type(p2) == "string" then
		p2 = t.parse(p2)
	end
	if type(p3) == "string" then
		p3 = t.parse(p3)
	end
	if p3.scheme then
		return p3
	end
	p3.scheme = p2.scheme
	
	if not p3.authority or p3.authority == "" then
		p3:setAuthority(p2.authority)
		
		if p3.path and p3.path ~= "" then
			p3.path = absolutePath(p2.path, p3.path)
		else
			p3.path = p2.path
			local query = p3.query
			
			if query and next(query) then
				return p3
			else
				p3.query = p2.query
				
				return p3
			end
		end
	end
end

function t.normalize(p2)
	-- upvalues: t (ref), absolutePath (ref)
	if type(p2) == "string" then
		p2 = t.parse(p2)
	end
	if p2.path then
		p2.path = string.gsub(absolutePath(p2.path, ""), "//+", "/")
	end
	return p2
end

return t