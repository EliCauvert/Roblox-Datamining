-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:06 2026 Pacific Standard Time.

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

local function splitAndTrim(p0, p1, p2) --[[ line: 28 ]]
	-- upvalues: stringSplit (ref), cryoModule (ref), stringTrim (ref)
	return cryoModule.List.filter(cryoModule.List.map(stringSplit(p0, p1, p2), function(p3) --[[ line: 30 ]]
		-- upvalues: stringTrim (copy)
		return stringTrim(p3)
	end), function(p4) --[[ line: 33 ]]
		return #p4 > 0
	end)
end

local function validateValueType(p5) --[[ line: 44 ]]
	local var24 = type(p5)
	
	if var24 == "string" then
		return true
	elseif var24 == "number" then
		return true
	elseif var24 ~= "table" then
		return false
	end
	for i, v in ipairs(p5) do
		local var25 = type(v)
		
		if var25 ~= "string" and var25 ~= "number" then
			return false
		end
	end
	return true
end

local function _(p6) --[[ line: 64 | named "assertPlaceholder" ]]
	if string.sub(p6, 1, 1) == "{" then
		assert(string.sub(p6, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
	end
end

local function assertElementIsValid(p7, p8) --[[ line: 71 ]]
	-- upvalues: validateValueType (ref)
	assert(type(p7) == "table", "invalid pattern: elements should all be tables")
	
	if p8 then
		assert(type(p7.name) == "string", "invalid pattern: element name should be a string")
		assert(#p7.name > 0, "invalid pattern: element name should not be empty")
	end
	assert(if type(p7.value) ~= "string" then type(p7.value) == "number" else true, "invalid pattern: element value should be a string or number")
	
	if type(p7.value) == "string" then
		local value = p7.value
		
		if string.sub(value, 1, 1) == "{" then
			assert(string.sub(value, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
		end
	end
	if p7.optional ~= nil then
		assert(type(p7.optional) == "boolean", "invalid pattern: element optional should be a boolean")
	end
	if p7.default ~= nil then
		assert(validateValueType(p7.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only")
	end
	if p7.collect ~= nil then
		assert(if p7.collect ~= "multi" then p7.collect == "csv" else true, "invalid pattern: element optional should be one of `multi`, `csv`")
	end
end

local function assertPatternIsValid(p9) --[[ line: 102 ]]
	-- upvalues: assertElementIsValid (ref)
	assert(type(p9.base) == "string", "invalid pattern: base should be a string")
	assert(#p9.base > 0, "invalid pattern: base should not be empty")
	assert(type(p9.path) == "table", "invalid pattern: path should be a table")
	
	for i, v in ipairs(p9.path) do
		assertElementIsValid(v, false)
	end
	if p9.query ~= nil then
		assert(type(p9.query) == "table", "invalid pattern: query should be a table")
	end
	if type(p9.query) == "table" then
		for i, v_1 in ipairs(p9.query) do
			assertElementIsValid(v_1, true)
		end
	end
	if p9.hash ~= nil then
		assert(type(p9.hash) == "table", "invalid pattern: hash should be a table")
	end
end

local _ = function(p10, p11) --[[ line: 127 | named "buildElementsFromString" ]]
	-- upvalues: splitAndTrim (ref), cryoModule (ref), stringTrim (ref), stringSplit (ref)
	return cryoModule.List.map(splitAndTrim(p10, if p11 then "&" else "/"), function(p12) --[[ line: 130 ]]
		-- upvalues: stringTrim (copy), p11 (ref), stringSplit (copy)
		local var26 = nil
		local var27 = stringTrim(p12)
		local var28 = nil
		local var29 = nil
		local var30 = nil
		
		if p11 then
			local var31 = stringSplit(var27, "=", 2)
			var26 = stringTrim(var31[1])
			var27 = var31[2]
			
			if string.sub(var26, 1, 1) == "{" then
				var26 = stringSplit(stringTrim(var26, "{}"), "|", 2)[1]
				
				if var27 == nil then
					var27 = var31[1]
				end
				var26 = stringTrim(var26)
			end
			var30 = "multi"
		end
		if var27 ~= nil and string.find(var27, "^{.*}$") then
			local var32 = stringSplit(stringTrim(var27, "{}"), "|", 2)
			local var33 = stringTrim(var32[1])
			
			if #var32 > 1 then
				var28 = true
				
				if #var32[2] > 1 then
					var29 = var32[2]
				end
			end
			var27 = "{" .. var33 .. "}"
		end
		return {
			name = var26,
			value = var27,
			optional = var28,
			default = var29,
			collect = var30
		}
	end)
end

local function buildQueryStringFromTable(p13) --[[ line: 173 ]]
	local t = {}
	
	for i, v in pairs(p13) do
		table.insert(t, i .. "=" .. v)
	end
	return table.concat(t, "&")
end

local function simplifyPattern(p14) --[[ line: 182 ]]
	-- upvalues: urlBaseModule (ref), splitAndTrim (ref), cryoModule (ref), stringTrim (ref), stringSplit (ref), buildQueryStringFromTable (ref)
	local base = p14.base
	local path = p14.path
	local query = p14.query
	local hash = p14.hash
	
	if base ~= nil and urlBaseModule[string.upper(base)] ~= nil then
		base = urlBaseModule[string.upper(base)]
	end
	if type(path) == "string" then
		local var35 = false
		path = cryoModule.List.map(splitAndTrim(path, "/"), function(p15) --[[ line: 130 ]]
			-- upvalues: stringTrim (copy), var35 (ref), stringSplit (copy)
			local var26 = nil
			local var27 = stringTrim(p15)
			local var28 = nil
			local var29 = nil
			local var30 = nil
			
			if var35 then
				local var31 = stringSplit(var27, "=", 2)
				var26 = stringTrim(var31[1])
				var27 = var31[2]
				
				if string.sub(var26, 1, 1) == "{" then
					var26 = stringSplit(stringTrim(var26, "{}"), "|", 2)[1]
					
					if var27 == nil then
						var27 = var31[1]
					end
					var26 = stringTrim(var26)
				end
				var30 = "multi"
			end
			if var27 ~= nil and string.find(var27, "^{.*}$") then
				local var32 = stringSplit(stringTrim(var27, "{}"), "|", 2)
				local var33 = stringTrim(var32[1])
				
				if #var32 > 1 then
					var28 = true
					
					if #var32[2] > 1 then
						var29 = var32[2]
					end
				end
				var27 = "{" .. var33 .. "}"
			end
			return {
				name = var26,
				value = var27,
				optional = var28,
				default = var29,
				collect = var30
			}
		end)
	end
	if type(query) == "table" and query[1] == nil then
		query = buildQueryStringFromTable(query)
	end
	if type(query) == "string" then
		local var36 = true
		query = cryoModule.List.map(splitAndTrim(query, "&"), function(p16) --[[ line: 130 ]]
			-- upvalues: stringTrim (copy), var36 (ref), stringSplit (copy)
			local var26 = nil
			local var27 = stringTrim(p16)
			local var28 = nil
			local var29 = nil
			local var30 = nil
			
			if var36 then
				local var31 = stringSplit(var27, "=", 2)
				var26 = stringTrim(var31[1])
				var27 = var31[2]
				
				if string.sub(var26, 1, 1) == "{" then
					var26 = stringSplit(stringTrim(var26, "{}"), "|", 2)[1]
					
					if var27 == nil then
						var27 = var31[1]
					end
					var26 = stringTrim(var26)
				end
				var30 = "multi"
			end
			if var27 ~= nil and string.find(var27, "^{.*}$") then
				local var32 = stringSplit(stringTrim(var27, "{}"), "|", 2)
				local var33 = stringTrim(var32[1])
				
				if #var32 > 1 then
					var28 = true
					
					if #var32[2] > 1 then
						var29 = var32[2]
					end
				end
				var27 = "{" .. var33 .. "}"
			end
			return {
				name = var26,
				value = var27,
				optional = var28,
				default = var29,
				collect = var30
			}
		end)
	end
	if type(hash) == "string" then
		local var37 = false
		hash = cryoModule.List.map(splitAndTrim(hash, "/"), function(p17) --[[ line: 130 ]]
			-- upvalues: stringTrim (copy), var37 (ref), stringSplit (copy)
			local var26 = nil
			local var27 = stringTrim(p17)
			local var28 = nil
			local var29 = nil
			local var30 = nil
			
			if var37 then
				local var31 = stringSplit(var27, "=", 2)
				var26 = stringTrim(var31[1])
				var27 = var31[2]
				
				if string.sub(var26, 1, 1) == "{" then
					var26 = stringSplit(stringTrim(var26, "{}"), "|", 2)[1]
					
					if var27 == nil then
						var27 = var31[1]
					end
					var26 = stringTrim(var26)
				end
				var30 = "multi"
			end
			if var27 ~= nil and string.find(var27, "^{.*}$") then
				local var32 = stringSplit(stringTrim(var27, "{}"), "|", 2)
				local var33 = stringTrim(var32[1])
				
				if #var32 > 1 then
					var28 = true
					
					if #var32[2] > 1 then
						var29 = var32[2]
					end
				end
				var27 = "{" .. var33 .. "}"
			end
			return {
				name = var26,
				value = var27,
				optional = var28,
				default = var29,
				collect = var30
			}
		end)
	end
	return { base = base, path = path, query = query, hash = hash }
end

local function concatValues(_, p18) --[[ line: 214 ]]
	-- upvalues: cryoModule (ref), splitAndTrim (ref)
	return table.concat(u987, if p18 then "&" else "/")
end

local function resolveElement(p19, p20, p21) --[[ line: 227 ]]
	-- upvalues: validateValueType (ref), cryoModule (ref), encodeURIComponentModule (ref), concatValues (ref)
	if p20 == nil then
		p20 = {}
	end
	local value
	local _ = nil
	
	if type(p19.value) == "string" and string.sub(p19.value, 1, 1) == "{" then
		value = p20[string.sub(p19.value, 2, -2)]
		
		if value == nil then
			value = p19.default
		end
		if not p19.optional then
			assert(value ~= nil, "UrlBuilder: missing parameter: `" .. p19.value .. "`")
		end
		if value == nil then
			value = {}
		end
		assert(validateValueType(value), "UrlBuilder: invalid parameter: `" .. p19.value .. "`, " .. "should be a string, number, or a table of strings and numbers only")
	else
		value = p19.value
	end
	if type(value) ~= "table" then
		value = { value }
	end
	value = cryoModule.List.map(value, function(p22) --[[ line: 257 ]]
		-- upvalues: encodeURIComponentModule (copy)
		return encodeURIComponentModule(tostring(p22))
	end)
	
	if p21 then
		if p19.collect == "csv" then
			value = { table.concat(value, "%2C") }
		end
		value = cryoModule.List.map(value, function(p23) --[[ line: 265 ]]
			-- upvalues: encodeURIComponentModule (copy), p19 (ref)
			return encodeURIComponentModule(p19.name) .. "=" .. p23
		end)
	end
	return concatValues(value, p21)
end

local function resolveElementList(p24, p25, p26) --[[ line: 272 ]]
	-- upvalues: cryoModule (ref), resolveElement (ref), concatValues (ref)
	return concatValues(cryoModule.List.map(p24 or {}, function(p27) --[[ line: 273 ]]
		-- upvalues: resolveElement (copy), p25 (ref), p26 (ref)
		return resolveElement(p27, p25, p26)
	end), p26)
end

function t.new(p28) --[[ line: 308 ]]
	-- upvalues: simplifyPattern (ref), assertPatternIsValid (ref), stringTrim (ref), resolveElementList (ref)
	p28 = simplifyPattern(p28)
	assertPatternIsValid(p28)
	
	return function(p29, p30) --[[ line: 311 ]]
		-- upvalues: stringTrim (copy), p28 (write), resolveElementList (copy)
		local var38 = stringTrim(p28.base, "/", { right = true })
		local var39 = resolveElementList(p28.path, p29, false)
		
		if #var39 > 0 then
			var38 ..= "/" .. var39
		end
		if string.match(var38, "[^/]/[^/]") == nil then
			var38 ..= "/"
		end
		local var40 = resolveElementList(p28.query, p29, true)
		
		if #var40 > 0 then
			var38 ..= "?" .. var40
		end
		local var41 = resolveElementList(p28.hash, p29, false)
		
		if #var41 > 0 then
			var38 ..= "#" .. var41
		end
		if not p30 then
			return var38
		elseif var38 ~= p30 then
			warn("UrlBuilder: unexpected output for pattern:")
			warn("UrlBuilder: expected `" .. p30 .. "`")
			warn("UrlBuilder: actual `" .. var38 .. "`")
		end
		return p30
	end
end

function t.fromString(p31) --[[ line: 347 ]]
	-- upvalues: stringSplit (ref), t (ref), stringTrim (ref)
	local var42 = stringSplit(p31, ":", 2)
	
	if #var42 < 2 then
		var42 = { "", var42[1] }
	end
	local var43 = var42[1]
	local var44 = stringSplit(var42[2], "%#", 2)
	var44 = var44[2] or ""
	local var45 = stringSplit(var44[1], "%?", 2)
	local var46 = var45[1] or ""
	local var47 = var45[2] or ""
	
	if string.sub(var46, 1, 2) == "//" then
		local var48 = stringSplit(string.sub(var46, 3), "/", 2)
		var43 ..= "://" .. var48[1]
		var46 = var48[2] or "/"
	end
	return t.new({
		base = stringTrim(var43),
		path = stringTrim(var46),
		query = stringTrim(var47),
		hash = stringTrim(var44)
	})
end

function t.addQueryString(p32, p33) --[[ line: 376 ]]
	-- upvalues: stringTrim (ref), cryoModule (ref), t (ref)
	local var49 = stringTrim(p32)
	local matchIndex = string.find(var49, "%?")
	
	if matchIndex == nil then
		var49 ..= "?"
	elseif matchIndex < #var49 then
		var49 ..= "&"
	end
	return t.fromString(var49 .. table.concat(cryoModule.List.map(cryoModule.Dictionary.keys(p33), function(p34) --[[ line: 385 ]]
		return "{" .. p34 .. "}"
	end), "&"))(p33)
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