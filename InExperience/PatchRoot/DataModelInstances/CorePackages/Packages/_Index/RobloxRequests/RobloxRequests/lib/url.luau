local UrlModule = {
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
local config = {
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

local function _(p1, p2) --[[ Line: 60 | Named "decode" ]]
	local Text = p1
	
	if not p2 then
		Text = Text:gsub("+", " ")
	end
	return (Text:gsub("%%(%x%x)", function(p3): string --[[ Line: 65 ]]
		return (string.char((tonumber(p3, 16))))
	end))
end

local _ = function(Text: string): string --[[ Line: 70 | Named "encode" ]]
	return (Text:gsub("([^A-Za-z0-9%_%.%-%~])", function(Text: string): string --[[ Line: 71 ]]
		return string.upper(string.format("%%%02x", string.byte(Text)))
	end))
end

local _ = function(Text: string) --[[ Line: 77 | Named "encodeValue" ]]
	return Text:gsub("([^A-Za-z0-9%_%.%-%~])", function(Text: string): string --[[ Line: 71 ]]
		return string.upper(string.format("%%%02x", string.byte(Text)))
	end):gsub("%%20", "+")
end

local function encodeSegment(Text: string): string --[[ Line: 82 ]]
	-- upvalues: config (copy)
	return Text:gsub("([^a-zA-Z0-9])", function(Text: string): string --[[ Line: 83 ]]
		-- upvalues: config (upval)
		return if config[Text] then Text else Text:gsub("([^A-Za-z0-9%_%.%-%~])", function(Text: string): string --[[ Line: 71 ]]
			return string.upper(string.format("%%%02x", string.byte(Text)))
		end)
	end)
end

local function concat(Text, p1): string --[[ Line: 92 ]]
	return Text .. p1:build()
end

function UrlModule.build(p1): string --[[ Line: 98 ]]
	-- upvalues: encodeSegment (copy), UrlModule (copy)
	local Text = ""
	
	if p1.path then
		local Path: string = p1.path
		Path:gsub("([^/]+)", function(p2) --[[ Line: 102 ]]
			-- upvalues: encodeSegment (upval)
			return encodeSegment(p2)
		end)
		Text ..= tostring(Path)
	end
	if p1.query then
		local Text1 = tostring(p1.query)
		
		if Text1 ~= "" then
			Text ..= "?" .. Text1
		end
	end
	if p1.host then
		local Host = p1.host
		
		if p1.port and p1.scheme and UrlModule.services[p1.scheme] ~= p1.port then
			Host ..= ":" .. p1.port
		end
		local User = nil
		
		if p1.user and p1.user ~= "" then
			User = p1.user
			
			if p1.password then
				User ..= ":" .. p1.password
			end
		end
		if User and User ~= "" then
			Host = User .. "@" .. Host
		end
		if Host then
			if Text == "" then
				Text = "//" .. Host
			else
				Text = "//" .. Host .. "/" .. Text:gsub("^/+", "")
			end
		end
	end
	if p1.scheme then
		Text = p1.scheme .. ":" .. Text
	end
	if p1.fragment then
		Text ..= "#" .. p1.fragment
	end
	return Text
end

function UrlModule.buildQuery(Query, Separator, AZaZ): string --[[ Line: 148 ]]
	-- upvalues: UrlModule (copy)
	local AZaZes = {}
	
	if not Separator then
		Separator = UrlModule.options.separator or "&"
	end
	local List = {}
	
	for i in pairs(Query) do
		List[#List + 1] = i
	end
	table.sort(List)
	
	for _, value in ipairs(List) do
		local QueryEntry = Query[value]
		local AZaZ09 = tostring(value):gsub("([^A-Za-z0-9%_%.%-%~])", function(Text: string): string --[[ Line: 71 ]]
			return string.upper(string.format("%%%02x", string.byte(Text)))
		end)
		
		if AZaZ then
			AZaZ09 = string.format("%s[%s]", tostring(AZaZ), (tostring(AZaZ09)))
		end
		if type(QueryEntry) == "table" then
			AZaZes[#AZaZes + 1] = UrlModule.buildQuery(QueryEntry, Separator, AZaZ09)
		else
			local _20 = tostring(QueryEntry):gsub("([^A-Za-z0-9%_%.%-%~])", function(Text: string): string --[[ Line: 71 ]]
				return string.upper(string.format("%%%02x", string.byte(Text)))
			end):gsub("%%20", "+")
			
			if _20 == "" then
				AZaZes[#AZaZes + 1] = AZaZ09
			else
				AZaZes[#AZaZes + 1] = string.format("%s=%s", AZaZ09, _20)
			end
		end
	end
	return table.concat(AZaZes, Separator)
end

function UrlModule.parseQuery(Text: string, p1) --[[ Line: 185 ]]
	-- upvalues: UrlModule (copy)
	if not p1 then
		p1 = UrlModule.options.separator or "&"
	end
	local XXes = {}
	
	for Text2, Text3 in Text:gmatch(string.format("([^%q=]+)(=*[^%q=]*)", p1, p1)) do
		local List = {}
		local S = Text2:gsub("+", " "):gsub("%%(%x%x)", function(p2): string --[[ Line: 65 ]]
			return (string.char((tonumber(p2, 16))))
		end):gsub("%[([^%]]*)%]", function(Text: string): string --[[ Line: 194 ]]
			-- upvalues: List (copy)
			table.insert(List, if string.find(Text, "^-?%d+$") then tonumber(Text) else Text:gsub("+", " "):gsub("%%(%x%x)", function(p2): string --[[ Line: 65 ]]
				return (string.char((tonumber(p2, 16))))
			end))
			
			return "="
		end):gsub("=+.*$", ""):gsub("%s", "_")
		local Text1: string = Text3:gsub("^=+", "")
		
		if not XXes[S] then
			XXes[S] = {}
		end
		if #List > 0 and type(XXes[S]) ~= "table" then
			XXes[S] = {}
		elseif #List == 0 and type(XXes[S]) == "table" then
			XXes[S] = Text1:gsub("+", " "):gsub("%%(%x%x)", function(p2): string --[[ Line: 65 ]]
				return (string.char((tonumber(p2, 16))))
			end)
		end
		local XX = XXes[S]
		
		for i, value in ipairs(List) do
			if type(XX) ~= "table" then
				XX = {}
			end
			if value == "" then
				value = #XX + 1
			end
			if not XX[value] then
				XX[value] = {}
			end
			if i == #List then
				XX[value] = Text1:gsub("+", " "):gsub("%%(%x%x)", function(p2): string --[[ Line: 65 ]]
					return (string.char((tonumber(p2, 16))))
				end)
			end
			XX = XX[value]
		end
	end
	setmetatable(XXes, { __tostring = UrlModule.buildQuery })
	
	return XXes
end

function UrlModule.setQuery(p2, Query) --[[ Line: 241 ]]
	-- upvalues: UrlModule (copy)
	local Query1 = Query
	
	if type(Query1) == "table" then
		Query1 = UrlModule.buildQuery(Query1)
	end
	p2.query = UrlModule.parseQuery(Query1)
	
	return Query1
end

function UrlModule.setAuthority(p2, Authority: string): string --[[ Line: 254 ]]
	p2.authority = Authority
	p2.port = nil
	p2.host = nil
	p2.userinfo = nil
	p2.user = nil
	p2.password = nil
	local Text: string = Authority:gsub("^([^@]*)@", function(Userinfo): string --[[ Line: 262 ]]
		-- upvalues: p2 (copy)
		p2.userinfo = Userinfo
		
		return ""
	end):gsub("^%[[^%]]+%]", function(Host): string --[[ Line: 266 ]]
		-- upvalues: p2 (copy)
		p2.host = Host
		
		return ""
	end):gsub(":([^:]*)$", function(p3): string --[[ Line: 271 ]]
		-- upvalues: p2 (copy)
		p2.port = tonumber(p3)
		
		return ""
	end)
	
	if Text ~= "" and not p2.host then
		p2.host = Text:lower()
	end
	if p2.userinfo then
		p2.user = p2.userinfo:gsub(":([^:]*)$", function(Password): string --[[ Line: 280 ]]
			-- upvalues: p2 (copy)
			p2.password = Password
			
			return ""
		end)
	end
	return Text
end

function UrlModule.parse(ParseResult) --[[ Line: 295 ]]
	-- upvalues: UrlModule (copy), concat (copy)
	local t = {}
	UrlModule.setAuthority(t, "")
	UrlModule.setQuery(t, "")
	t.path = tostring(ParseResult or ""):gsub("#(.*)$", function(Fragment): string --[[ Line: 301 ]]
		-- upvalues: t (copy)
		t.fragment = Fragment
		
		return ""
	end):gsub("^([%w][%w%+%-%.]*)%:", function(Text: string): string --[[ Line: 305 ]]
		-- upvalues: t (copy)
		t.scheme = Text:lower()
		
		return ""
	end):gsub("%?(.*)", function(p2): string --[[ Line: 309 ]]
		-- upvalues: UrlModule (upval), t (copy)
		UrlModule.setQuery(t, p2)
		
		return ""
	end):gsub("^//([^/]*)", function(p2): string --[[ Line: 313 ]]
		-- upvalues: UrlModule (upval), t (copy)
		UrlModule.setAuthority(t, p2)
		
		return ""
	end):gsub("%%(%x%x)", function(p2): string --[[ Line: 65 ]]
		return (string.char((tonumber(p2, 16))))
	end)
	setmetatable(t, {
		__index = UrlModule,
		__concat = concat,
		__tostring = UrlModule.build
	})
	
	return t
end

function UrlModule.removeDotSegments(Text: string): string --[[ Line: 331 ]]
	local List = {}
	
	if string.len(Text) == 0 then
		return ""
	end
	local Enabled = false
	local Flag = false
	
	if string.sub(Text, 1, 1) == "/" then
		Enabled = true
	end
	if (string.len(Text) > 1 or Enabled == false) and string.sub(Text, -1) == "/" then
		Flag = true
	end
	Text:gsub("[^/]+", function(p2) --[[ Line: 345 ]]
		-- upvalues: List (copy)
		table.insert(List, p2)
	end)
	local List1 = {}
	local Count = 0
	
	for _, value in ipairs(List) do
		if value == ".." then
			if Count > 0 then
				Count -= 1
			end
		elseif value ~= "." then
			Count += 1
			List1[Count] = value
		end
	end
	local Joined: string = if #List1 > 0 and Count > 0 then table.concat(List1, "/", 1, Count) else ""
	
	if Enabled then
		Joined = "/" .. Joined
	end
	if Flag then
		Joined ..= "/"
	end
	return Joined
end

local function absolutePath(Path, Text: string): string --[[ Line: 375 ]]
	if string.sub(Text, 1, 1) == "/" then
		return "/" .. string.gsub(Text, "^[%./]+", "")
	end
	local Text3: string = Path
	
	if Text ~= "" then
		Text3 = "/" .. Text3:gsub("[^/]*$", "")
	end
	local Replaced = string.gsub((Text3 .. Text):gsub("([^/]*%./)", function(p2) --[[ Line: 384 ]]
		return if p2 == "./" then "" else p2
	end), "/%.$", "/")
	local Text1: string? = nil
	while Text1 ~= Replaced do
		Text1 = Replaced
		Replaced = string.gsub(Text1, "([^/]*/%.%./)", function(Match) --[[ Line: 391 ]]
			return if Match == "../../" then Match else ""
		end)
	end
	local Replaced1 = string.gsub(Replaced, "([^/]*/%.%.?)$", function(Match) --[[ Line: 395 ]]
		return if Match == "../.." then Match else ""
	end)
	local Text2: string? = nil
	while Text2 ~= Replaced1 do
		Text2 = Replaced1
		Replaced1 = string.gsub(Text2, "^/?%.%./", "")
	end
	return "/" .. Replaced1
end

function UrlModule.resolve(p2, p3) --[[ Line: 409 ]]
	-- upvalues: UrlModule (copy), absolutePath (copy)
	if type(p2) == "string" then
		p2 = UrlModule.parse(p2)
	end
	if type(p3) == "string" then
		p3 = UrlModule.parse(p3)
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
			local Query = p3.query
			
			if not Query or not next(Query) then
				p3.query = p2.query
				
				return p3
			end
		end
	end
	return p3
end

function UrlModule.normalize(p2) --[[ Line: 439 ]]
	-- upvalues: UrlModule (copy), absolutePath (copy)
	if type(p2) == "string" then
		p2 = UrlModule.parse(p2)
	end
	if p2.path then
		p2.path = string.gsub(absolutePath(p2.path, ""), "//+", "/")
	end
	return p2
end

return UrlModule