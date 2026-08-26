local parent = script.Parent.Parent
local cryoModule = require(parent.Cryo)
local stringUtilitiesModule = require(parent.StringUtilities)
local stringTrim = stringUtilitiesModule.StringTrim
local stringSplit = stringUtilitiesModule.StringSplit
local encodeURIComponentModule = require(script.Parent.encodeURIComponent)
local urlBaseModule = require(script.Parent.UrlBase)
local gameUrlPatternsModule = require(script.Parent.UrlPatterns.GameUrlPatterns)
local userUrlPatternsModule = require(script.Parent.UrlPatterns.UserUrlPatterns)
local staticUrlPatternsModule = require(script.Parent.UrlPatterns.StaticUrlPatterns)
local catalogUrlPatternsModule = require(script.Parent.UrlPatterns.CatalogUrlPatterns)
local economyUrlPatternsModule = require(script.Parent.UrlPatterns.EconomyUrlPatterns)
local shareLinksUrlPatternsModule = require(script.Parent.UrlPatterns.ShareLinksUrlPatterns)
local userModerationPatternsModule = require(script.Parent.UrlPatterns.UserModerationPatterns)
local accountInformationPatternsModule = require(script.Parent.UrlPatterns.AccountInformationPatterns)
local virtualEventsUrlPatternsModule = require(script.Parent.UrlPatterns.VirtualEventsUrlPatterns)
local platformAuthPatternsModule = require(script.Parent.UrlPatterns.PlatformAuthPatterns)
local t = {}

local function splitAndTrim(p1, p2, p3)
	-- upvalues: stringSplit (ref), cryoModule (ref), stringTrim (ref)
	return cryoModule.List.filter(cryoModule.List.map(stringSplit(p1, p2, p3), function(p4)
		-- upvalues: stringTrim (copy)
		return stringTrim(p4)
	end), function(p4)
		return #p4 > 0
	end)
end

local function validateValueType(p1)
	local var1 = type(p1)
	
	if var1 == "string" then
		return true
	elseif var1 == "number" then
		return true
	elseif var1 ~= "table" then
		return false
	end
	for i, v in ipairs(p1) do
		local var2 = type(v)
		
		if var2 ~= "string" and var2 ~= "number" then
			return false
		end
	end
	return true
end

local function _(p2)
	if string.sub(p2, 1, 1) == "{" then
		assert(string.sub(p2, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
	end
end

local function assertElementIsValid(p2, p3)
	-- upvalues: validateValueType (ref)
	assert(type(p2) == "table", "invalid pattern: elements should all be tables")
	
	if p3 then
		assert(type(p2.name) == "string", "invalid pattern: element name should be a string")
		assert(#p2.name > 0, "invalid pattern: element name should not be empty")
	end
	assert(if type(p2.value) ~= "string" then type(p2.value) == "number" else true, "invalid pattern: element value should be a string or number")
	
	if type(p2.value) == "string" then
		local value = p2.value
		
		if string.sub(value, 1, 1) == "{" then
			assert(string.sub(value, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
		end
	end
	if p2.optional ~= nil then
		assert(type(p2.optional) == "boolean", "invalid pattern: element optional should be a boolean")
	end
	if p2.default ~= nil then
		assert(validateValueType(p2.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only")
	end
	if p2.collect ~= nil then
		assert(if p2.collect ~= "multi" then p2.collect == "csv" else true, "invalid pattern: element optional should be one of `multi`, `csv`")
	end
end

local function assertPatternIsValid(p2)
	-- upvalues: assertElementIsValid (ref)
	assert(type(p2.base) == "string", "invalid pattern: base should be a string")
	assert(#p2.base > 0, "invalid pattern: base should not be empty")
	assert(type(p2.path) == "table", "invalid pattern: path should be a table")
	
	for i, v in ipairs(p2.path) do
		assertElementIsValid(v, false)
	end
	if p2.query ~= nil then
		assert(type(p2.query) == "table", "invalid pattern: query should be a table")
	end
	if type(p2.query) == "table" then
		for i, v_1 in ipairs(p2.query) do
			assertElementIsValid(v_1, true)
		end
	end
	if p2.hash ~= nil then
		assert(type(p2.hash) == "table", "invalid pattern: hash should be a table")
	end
end

local _ = function(p3, p4)
	-- upvalues: splitAndTrim (ref), cryoModule (ref), stringTrim (ref), stringSplit (ref)
	return cryoModule.List.map(splitAndTrim(p3, if p4 then "&" else "/"), function(p5)
		-- upvalues: stringTrim (copy), p4 (ref), stringSplit (copy)
		local var3 = nil
		local var4 = stringTrim(p5)
		local var5 = nil
		local var6 = nil
		local var7 = nil
		
		if p4 then
			local var8 = stringSplit(var4, "=", 2)
			var3 = stringTrim(var8[1])
			var4 = var8[2]
			
			if string.sub(var3, 1, 1) == "{" then
				var3 = stringSplit(stringTrim(var3, "{}"), "|", 2)[1]
				
				if var4 == nil then
					var4 = var8[1]
				end
				var3 = stringTrim(var3)
			end
			var7 = "multi"
		end
		if var4 ~= nil and string.find(var4, "^{.*}$") then
			local var9 = stringSplit(stringTrim(var4, "{}"), "|", 2)
			local var10 = stringTrim(var9[1])
			
			if #var9 > 1 then
				var5 = true
				
				if #var9[2] > 1 then
					var6 = var9[2]
				end
			end
			var4 = "{" .. var33 .. "}"
		end
		return {
			name = var3,
			value = var4,
			optional = var5,
			default = var6,
			collect = var7
		}
	end)
end

local function buildQueryStringFromTable(p3)
	local t = {}
	
	for i, v in pairs(p3) do
		table.insert(t, i .. "=" .. v)
	end
	return table.concat(t, "&")
end

local function simplifyPattern(p4)
	-- upvalues: urlBaseModule (ref), splitAndTrim (ref), cryoModule (ref), stringTrim (ref), stringSplit (ref), buildQueryStringFromTable (ref)
	local base = p4.base
	local path = p4.path
	local query = p4.query
	local hash = p4.hash
	
	if base ~= nil and urlBaseModule[string.upper(base)] ~= nil then
		base = urlBaseModule[string.upper(base)]
	end
	if type(path) == "string" then
		local var3 = false
		path = cryoModule.List.map(splitAndTrim(path, "/"), function(p5)
			-- upvalues: stringTrim (copy), var3 (ref), stringSplit (copy)
			local var4 = nil
			local var5 = stringTrim(p5)
			local var6 = nil
			local var7 = nil
			local var8 = nil
			
			if var3 then
				local var9 = stringSplit(var5, "=", 2)
				var4 = stringTrim(var9[1])
				var5 = var9[2]
				
				if string.sub(var4, 1, 1) == "{" then
					var4 = stringSplit(stringTrim(var4, "{}"), "|", 2)[1]
					
					if var5 == nil then
						var5 = var9[1]
					end
					var4 = stringTrim(var4)
				end
				var8 = "multi"
			end
			if var5 ~= nil and string.find(var5, "^{.*}$") then
				local var10 = stringSplit(stringTrim(var5, "{}"), "|", 2)
				local var11 = stringTrim(var10[1])
				
				if #var10 > 1 then
					var6 = true
					
					if #var10[2] > 1 then
						var7 = var10[2]
					end
				end
				var5 = "{" .. var33 .. "}"
			end
			return {
				name = var4,
				value = var5,
				optional = var6,
				default = var7,
				collect = var8
			}
		end)
	end
	if type(query) == "table" and query[1] == nil then
		query = buildQueryStringFromTable(query)
	end
	if type(query) == "string" then
		local var4 = true
		query = cryoModule.List.map(splitAndTrim(query, "&"), function(p5)
			-- upvalues: stringTrim (copy), var4 (ref), stringSplit (copy)
			local var5 = nil
			local var6 = stringTrim(p5)
			local var7 = nil
			local var8 = nil
			local var9 = nil
			
			if var4 then
				local var10 = stringSplit(var6, "=", 2)
				var5 = stringTrim(var10[1])
				var6 = var10[2]
				
				if string.sub(var5, 1, 1) == "{" then
					var5 = stringSplit(stringTrim(var5, "{}"), "|", 2)[1]
					
					if var6 == nil then
						var6 = var10[1]
					end
					var5 = stringTrim(var5)
				end
				var9 = "multi"
			end
			if var6 ~= nil and string.find(var6, "^{.*}$") then
				local var11 = stringSplit(stringTrim(var6, "{}"), "|", 2)
				local var12 = stringTrim(var11[1])
				
				if #var11 > 1 then
					var7 = true
					
					if #var11[2] > 1 then
						var8 = var11[2]
					end
				end
				var6 = "{" .. var33 .. "}"
			end
			return {
				name = var5,
				value = var6,
				optional = var7,
				default = var8,
				collect = var9
			}
		end)
	end
	if type(hash) == "string" then
		local var5 = false
		hash = cryoModule.List.map(splitAndTrim(hash, "/"), function(p5)
			-- upvalues: stringTrim (copy), var5 (ref), stringSplit (copy)
			local var6 = nil
			local var7 = stringTrim(p5)
			local var8 = nil
			local var9 = nil
			local var10 = nil
			
			if var5 then
				local var11 = stringSplit(var7, "=", 2)
				var6 = stringTrim(var11[1])
				var7 = var11[2]
				
				if string.sub(var6, 1, 1) == "{" then
					var6 = stringSplit(stringTrim(var6, "{}"), "|", 2)[1]
					
					if var7 == nil then
						var7 = var11[1]
					end
					var6 = stringTrim(var6)
				end
				var10 = "multi"
			end
			if var7 ~= nil and string.find(var7, "^{.*}$") then
				local var12 = stringSplit(stringTrim(var7, "{}"), "|", 2)
				local var13 = stringTrim(var12[1])
				
				if #var12 > 1 then
					var8 = true
					
					if #var12[2] > 1 then
						var9 = var12[2]
					end
				end
				var7 = "{" .. var33 .. "}"
			end
			return {
				name = var6,
				value = var7,
				optional = var8,
				default = var9,
				collect = var10
			}
		end)
	end
	return { base = base, path = path, query = query, hash = hash }
end

local function concatValues(_, p4)
	-- upvalues: cryoModule (ref), splitAndTrim (ref)
	return table.concat(u987, if p4 then "&" else "/")
end

local function resolveElement(p4, p5, p6)
	-- upvalues: validateValueType (ref), cryoModule (ref), encodeURIComponentModule (ref), concatValues (ref)
	if p5 == nil then
		p5 = {}
	end
	local value
	local _ = nil
	
	if type(p4.value) == "string" and string.sub(p4.value, 1, 1) == "{" then
		value = p5[string.sub(p4.value, 2, -2)]
		
		if value == nil then
			value = p4.default
		end
		if not p4.optional then
			assert(value ~= nil, "UrlBuilder: missing parameter: `" .. p19.value .. "`")
		end
		if value == nil then
			value = {}
		end
		assert(validateValueType(value), "UrlBuilder: invalid parameter: `" .. p19.value .. "`, " .. "should be a string, number, or a table of strings and numbers only")
	else
		value = p4.value
	end
	if type(value) ~= "table" then
		value = { value }
	end
	value = cryoModule.List.map(value, function(p7)
		-- upvalues: encodeURIComponentModule (copy)
		return encodeURIComponentModule(tostring(p7))
	end)
	
	if p6 then
		if p4.collect == "csv" then
			value = { table.concat(value, "%2C") }
		end
		value = cryoModule.List.map(value, function(p7)
			-- upvalues: encodeURIComponentModule (copy), p4 (ref)
			return encodeURIComponentModule(p4.name) .. "=" .. p23
		end)
	end
	return concatValues(value, p6)
end

local function resolveElementList(p4, p5, p6)
	-- upvalues: cryoModule (ref), resolveElement (ref), concatValues (ref)
	return concatValues(cryoModule.List.map(p4 or {}, function(p7)
		-- upvalues: resolveElement (copy), p5 (ref), p6 (ref)
		return resolveElement(p7, p5, p6)
	end), p6)
end

function t.new(p4)
	-- upvalues: simplifyPattern (ref), assertPatternIsValid (ref), stringTrim (ref), resolveElementList (ref)
	p4 = simplifyPattern(p4)
	assertPatternIsValid(p4)
	
	return function(p5, p6)
		-- upvalues: stringTrim (copy), p4 (write), resolveElementList (copy)
		local var3 = stringTrim(p4.base, "/", { right = true })
		local var4 = resolveElementList(p4.path, p5, false)
		
		if #var4 > 0 then
			var3 ..= "/" .. var39
		end
		if string.match(var3, "[^/]/[^/]") == nil then
			var3 ..= "/"
		end
		local var5 = resolveElementList(p4.query, p5, true)
		
		if #var5 > 0 then
			var3 ..= "?" .. var40
		end
		local var6 = resolveElementList(p4.hash, p5, false)
		
		if #var6 > 0 then
			var3 ..= "#" .. var41
		end
		if not p6 then
			return var3
		elseif var3 ~= p6 then
			warn("UrlBuilder: unexpected output for pattern:")
			warn("UrlBuilder: expected `" .. p30 .. "`")
			warn("UrlBuilder: actual `" .. var38 .. "`")
		end
		return p6
	end
end

function t.fromString(p4)
	-- upvalues: stringSplit (ref), t (ref), stringTrim (ref)
	local var3 = stringSplit(p4, ":", 2)
	
	if #var3 < 2 then
		var3 = { "", var3[1] }
	end
	local var4 = var3[1]
	local var5 = stringSplit(var3[2], "%#", 2)
	var5 = var5[2] or ""
	local var6 = stringSplit(var5[1], "%?", 2)
	local var7 = var6[1] or ""
	local var8 = var6[2] or ""
	
	if string.sub(var7, 1, 2) == "//" then
		local var9 = stringSplit(string.sub(var7, 3), "/", 2)
		var4 ..= "://" .. var48[1]
		var7 = var9[2] or "/"
	end
	return t.new({
		base = stringTrim(var4),
		path = stringTrim(var7),
		query = stringTrim(var8),
		hash = stringTrim(var5)
	})
end

function t.addQueryString(p4, p5)
	-- upvalues: stringTrim (ref), cryoModule (ref), t (ref)
	local var3 = stringTrim(p4)
	local matchIndex = string.find(var3, "%?")
	
	if matchIndex == nil then
		var3 ..= "?"
	elseif matchIndex < #var3 then
		var3 ..= "&"
	end
	return t.fromString(var3 .. table.concat(cryoModule.List.map(cryoModule.Dictionary.keys(p5), function(p6)
		return "{" .. p34 .. "}"
	end), "&"))(p5)
end

t.game = gameUrlPatternsModule(t)
t.user = userUrlPatternsModule(t)
t.catalog = catalogUrlPatternsModule(t)
t.static = staticUrlPatternsModule(t)
t.usermoderation = userModerationPatternsModule(t)
t.accountinformation = accountInformationPatternsModule(t)
t.sharelinks = shareLinksUrlPatternsModule(t)
t.economy = economyUrlPatternsModule(t)
t.virtualevents = virtualEventsUrlPatternsModule(t)
t.PlatformAuth = platformAuthPatternsModule(t)

return t