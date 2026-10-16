local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local StringUtilitiesModule = require(Parent.StringUtilities)
local StringTrimFunction = StringUtilitiesModule.StringTrim
local StringSplitFunction = StringUtilitiesModule.StringSplit
local EncodeURIComponentModule = require(script.Parent.encodeURIComponent)
local UrlBaseModule = require(script.Parent.UrlBase)
local GameUrlPatternsModule = require(script.Parent.UrlPatterns.GameUrlPatterns)
local UserUrlPatternsModule = require(script.Parent.UrlPatterns.UserUrlPatterns)
local StaticUrlPatternsModule = require(script.Parent.UrlPatterns.StaticUrlPatterns)
local CatalogUrlPatternsModule = require(script.Parent.UrlPatterns.CatalogUrlPatterns)
local EconomyUrlPatternsModule = require(script.Parent.UrlPatterns.EconomyUrlPatterns)
local ShareLinksUrlPatternsModule = require(script.Parent.UrlPatterns.ShareLinksUrlPatterns)
local UserModerationPatternsModule = require(script.Parent.UrlPatterns.UserModerationPatterns)
local AccountInformationPatternsModule = require(script.Parent.UrlPatterns.AccountInformationPatterns)
local VirtualEventsUrlPatternsModule = require(script.Parent.UrlPatterns.VirtualEventsUrlPatterns)
local PlatformAuthPatternsModule = require(script.Parent.UrlPatterns.PlatformAuthPatterns)

local function splitAndTrim(Hash, p1, p2) --[[ Line: 28 ]]
	-- upvalues: StringSplitFunction (copy), CryoModule (copy), StringTrimFunction (copy)
	return (CryoModule.List.filter(CryoModule.List.map(StringSplitFunction(Hash, p1, p2), function(p3) --[[ Line: 30 ]]
		-- upvalues: StringTrimFunction (upval)
		return StringTrimFunction(p3)
	end), function(p3): boolean --[[ Line: 33 ]]
		return #p3 > 0
	end))
end

local function validateValueType(Default): boolean --[[ Line: 44 ]]
	local ValueType = type(Default)
	
	if ValueType == "string" then
		return true
	end
	if ValueType == "number" then
		return true
	end
	if ValueType ~= "table" then
		return false
	end
	for _, value in ipairs(Default) do
		local ValueType1 = type(value)
		
		if ValueType1 ~= "string" and ValueType1 ~= "number" then
			return false
		end
	end
	return true
end

local function _(Text: string) --[[ Line: 64 | Named "assertPlaceholder" ]]
	if string.sub(Text, 1, 1) == "{" then
		assert(string.sub(Text, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
	end
end

local function assertElementIsValid(p1, p2) --[[ Line: 71 ]]
	-- upvalues: validateValueType (copy)
	assert(type(p1) == "table", "invalid pattern: elements should all be tables")
	
	if p2 then
		assert(type(p1.name) == "string", "invalid pattern: element name should be a string")
		assert(#p1.name > 0, "invalid pattern: element name should not be empty")
	end
	assert(type(p1.value) == "string" or type(p1.value) == "number", "invalid pattern: element value should be a string or number")
	
	if type(p1.value) == "string" then
		local Value: string = p1.value
		
		if string.sub(Value, 1, 1) == "{" then
			assert(string.sub(Value, -1, -1) == "}", "invalid pattern: placeholder items should end with `}`")
		end
	end
	if p1.optional ~= nil then
		assert(type(p1.optional) == "boolean", "invalid pattern: element optional should be a boolean")
	end
	if p1.default ~= nil then
		assert(validateValueType(p1.default), "invalid pattern: element default should be a string, number, or a table of strings and numbers only")
	end
	if p1.collect ~= nil then
		assert(p1.collect == "multi" or p1.collect == "csv", "invalid pattern: element optional should be one of `multi`, `csv`")
	end
end

local function assertPatternIsValid(p1) --[[ Line: 102 ]]
	-- upvalues: assertElementIsValid (copy)
	assert(type(p1.base) == "string", "invalid pattern: base should be a string")
	assert(#p1.base > 0, "invalid pattern: base should not be empty")
	assert(type(p1.path) == "table", "invalid pattern: path should be a table")
	
	for _, value in ipairs(p1.path) do
		assertElementIsValid(value, false)
	end
	if p1.query ~= nil then
		assert(type(p1.query) == "table", "invalid pattern: query should be a table")
	end
	if type(p1.query) == "table" then
		for _, value1 in ipairs(p1.query) do
			assertElementIsValid(value1, true)
		end
	end
	if p1.hash ~= nil then
		assert(type(p1.hash) == "table", "invalid pattern: hash should be a table")
	end
end

local _ = function(p2, p3) --[[ Line: 127 | Named "buildElementsFromString" ]]
	-- upvalues: splitAndTrim (copy), CryoModule (copy), StringTrimFunction (copy), StringSplitFunction (copy)
	return (CryoModule.List.map(splitAndTrim(p2, if p3 then "&" else "/"), function(p4) --[[ Line: 130 ]]
		-- upvalues: StringTrimFunction (upval), p3 (copy), StringSplitFunction (upval)
		local Text = nil
		local Text1 = StringTrimFunction(p4)
		local Optional: boolean? = nil
		local Default = nil
		local Collect: string? = nil
		
		if p3 then
			local v1 = StringSplitFunction(Text1, "=", 2)
			Text = StringTrimFunction(v1[1])
			Text1 = v1[2]
			
			if string.sub(Text, 1, 1) == "{" then
				local v2 = StringSplitFunction(StringTrimFunction(Text, "{}"), "|", 2)[1]
				
				if Text1 == nil then
					Text1 = v1[1]
				end
				Text = StringTrimFunction(v2)
			end
			Collect = "multi"
		end
		if Text1 ~= nil and string.find(Text1, "^{.*}$") then
			local v3 = StringSplitFunction(StringTrimFunction(Text1, "{}"), "|", 2)
			local v4 = StringTrimFunction(v3[1])
			
			if #v3 > 1 then
				Optional = true
				
				if #v3[2] > 1 then
					Default = v3[2]
				end
			end
			Text1 = "{" .. v4 .. "}"
		end
		return {
			name = Text,
			value = Text1,
			optional = Optional,
			default = Default,
			collect = Collect
		}
	end))
end

local function buildQueryStringFromTable(Query): string --[[ Line: 173 ]]
	local List = {}
	
	for i, value in pairs(Query) do
		table.insert(List, i .. "=" .. value)
	end
	return table.concat(List, "&")
end

local function simplifyPattern(p2) --[[ Line: 182 ]]
	-- upvalues: UrlBaseModule (copy), splitAndTrim (copy), CryoModule (copy), StringTrimFunction (copy), StringSplitFunction (copy), buildQueryStringFromTable (copy)
	local Base = p2.base
	local Path = p2.path
	local Query = p2.query
	local Hash = p2.hash
	
	if Base ~= nil and UrlBaseModule[string.upper(Base)] ~= nil then
		Base = UrlBaseModule[string.upper(Base)]
	end
	if type(Path) == "string" then
		local v1 = false
		Path = CryoModule.List.map(splitAndTrim(Path, "/"), function(p3) --[[ Line: 130 ]]
			-- upvalues: StringTrimFunction (upval), v1 (copy), StringSplitFunction (upval)
			local Text = nil
			local Text1 = StringTrimFunction(p3)
			local Optional: boolean? = nil
			local Default = nil
			local Collect: string? = nil
			
			if v1 then
				local v2 = StringSplitFunction(Text1, "=", 2)
				Text = StringTrimFunction(v2[1])
				Text1 = v2[2]
				
				if string.sub(Text, 1, 1) == "{" then
					local v3 = StringSplitFunction(StringTrimFunction(Text, "{}"), "|", 2)[1]
					
					if Text1 == nil then
						Text1 = v2[1]
					end
					Text = StringTrimFunction(v3)
				end
				Collect = "multi"
			end
			if Text1 ~= nil and string.find(Text1, "^{.*}$") then
				local v4 = StringSplitFunction(StringTrimFunction(Text1, "{}"), "|", 2)
				local v5 = StringTrimFunction(v4[1])
				
				if #v4 > 1 then
					Optional = true
					
					if #v4[2] > 1 then
						Default = v4[2]
					end
				end
				Text1 = "{" .. v5 .. "}"
			end
			return {
				name = Text,
				value = Text1,
				optional = Optional,
				default = Default,
				collect = Collect
			}
		end)
	end
	if type(Query) == "table" and Query[1] == nil then
		Query = buildQueryStringFromTable(Query)
	end
	if type(Query) == "string" then
		local v2 = true
		Query = CryoModule.List.map(splitAndTrim(Query, "&"), function(p3) --[[ Line: 130 ]]
			-- upvalues: StringTrimFunction (upval), v2 (copy), StringSplitFunction (upval)
			local Text = nil
			local Text1 = StringTrimFunction(p3)
			local Optional: boolean? = nil
			local Default = nil
			local Collect: string? = nil
			
			if v2 then
				local v3 = StringSplitFunction(Text1, "=", 2)
				Text = StringTrimFunction(v3[1])
				Text1 = v3[2]
				
				if string.sub(Text, 1, 1) == "{" then
					local v4 = StringSplitFunction(StringTrimFunction(Text, "{}"), "|", 2)[1]
					
					if Text1 == nil then
						Text1 = v3[1]
					end
					Text = StringTrimFunction(v4)
				end
				Collect = "multi"
			end
			if Text1 ~= nil and string.find(Text1, "^{.*}$") then
				local v5 = StringSplitFunction(StringTrimFunction(Text1, "{}"), "|", 2)
				local v6 = StringTrimFunction(v5[1])
				
				if #v5 > 1 then
					Optional = true
					
					if #v5[2] > 1 then
						Default = v5[2]
					end
				end
				Text1 = "{" .. v6 .. "}"
			end
			return {
				name = Text,
				value = Text1,
				optional = Optional,
				default = Default,
				collect = Collect
			}
		end)
	end
	if type(Hash) == "string" then
		local v3 = false
		Hash = CryoModule.List.map(splitAndTrim(Hash, "/"), function(p3) --[[ Line: 130 ]]
			-- upvalues: StringTrimFunction (upval), v3 (copy), StringSplitFunction (upval)
			local Text = nil
			local Text1 = StringTrimFunction(p3)
			local Optional: boolean? = nil
			local Default = nil
			local Collect: string? = nil
			
			if v3 then
				local v4 = StringSplitFunction(Text1, "=", 2)
				Text = StringTrimFunction(v4[1])
				Text1 = v4[2]
				
				if string.sub(Text, 1, 1) == "{" then
					local v5 = StringSplitFunction(StringTrimFunction(Text, "{}"), "|", 2)[1]
					
					if Text1 == nil then
						Text1 = v4[1]
					end
					Text = StringTrimFunction(v5)
				end
				Collect = "multi"
			end
			if Text1 ~= nil and string.find(Text1, "^{.*}$") then
				local v6 = StringSplitFunction(StringTrimFunction(Text1, "{}"), "|", 2)
				local v7 = StringTrimFunction(v6[1])
				
				if #v6 > 1 then
					Optional = true
					
					if #v6[2] > 1 then
						Default = v6[2]
					end
				end
				Text1 = "{" .. v7 .. "}"
			end
			return {
				name = Text,
				value = Text1,
				optional = Optional,
				default = Default,
				collect = Collect
			}
		end)
	end
	return { base = Base, path = Path, query = Query, hash = Hash }
end

local function concatValues(MapResult, p2): string --[[ Line: 214 ]]
	-- upvalues: CryoModule (copy), splitAndTrim (copy)
	return table.concat(CryoModule.List.filter(MapResult, function(p3): boolean --[[ Line: 216 ]]
		-- upvalues: p2 (copy), splitAndTrim (upval)
		return if p2 then #splitAndTrim(p3, "=") > 1 else #p3 > 0
	end), if p2 then "&" else "/")
end

local function resolveElement(p2, p3, p4) --[[ Line: 227 ]]
	-- upvalues: validateValueType (copy), CryoModule (copy), EncodeURIComponentModule (copy), concatValues (copy)
	if p3 == nil then
		p3 = {}
	end
	local Value = nil
	if type(p2.value) == "string" and string.sub(p2.value, 1, 1) == "{" then
		Value = p3[string.sub(p2.value, 2, -2)]
		
		if Value == nil then
			Value = p2.default
		end
		if not p2.optional then
			assert(Value ~= nil, "UrlBuilder: missing parameter: `" .. p2.value .. "`")
		end
		if Value == nil then
			Value = {}
		end
		assert(validateValueType(Value), "UrlBuilder: invalid parameter: `" .. p2.value .. "`, " .. "should be a string, number, or a table of strings and numbers only")
	else
		Value = p2.value
	end
	if type(Value) ~= "table" then
		Value = { Value }
	end
	local MapResult = CryoModule.List.map(Value, function(p5) --[[ Line: 257 ]]
		-- upvalues: EncodeURIComponentModule (upval)
		return EncodeURIComponentModule((tostring(p5)))
	end)
	
	if p4 then
		if p2.collect == "csv" then
			MapResult = { table.concat(MapResult, "%2C") }
		end
		MapResult = CryoModule.List.map(MapResult, function(Text): string --[[ Line: 265 ]]
			-- upvalues: EncodeURIComponentModule (upval), p2 (copy)
			return EncodeURIComponentModule(p2.name) .. "=" .. Text
		end)
	end
	return concatValues(MapResult, p4)
end

local function resolveElementList(Hash, p2, p3) --[[ Line: 272 ]]
	-- upvalues: CryoModule (copy), resolveElement (copy), concatValues (copy)
	return concatValues(CryoModule.List.map(Hash or {}, function(p4) --[[ Line: 273 ]]
		-- upvalues: resolveElement (upval), p2 (copy), p3 (copy)
		return resolveElement(p4, p2, p3)
	end), p3)
end

local UrlBuilderModule = {
	new = function(p2) --[[ Line: 308 ]]
		-- upvalues: simplifyPattern (copy), assertPatternIsValid (copy), StringTrimFunction (copy), resolveElementList (copy)
		local SimplifyPatternResult = simplifyPattern(p2)
		assertPatternIsValid(SimplifyPatternResult)
		
		return function(p3, Text) --[[ Line: 311 ]]
			-- upvalues: StringTrimFunction (upval), SimplifyPatternResult (ref), resolveElementList (upval)
			local StringTrimResult = StringTrimFunction(SimplifyPatternResult.base, "/", { right = true })
			local ResolveElementListResult = resolveElementList(SimplifyPatternResult.path, p3, false)
			
			if #ResolveElementListResult > 0 then
				StringTrimResult ..= "/" .. ResolveElementListResult
			end
			if string.match(StringTrimResult, "[^/]/[^/]") == nil then
				StringTrimResult ..= "/"
			end
			local ResolveElementListResult1 = resolveElementList(SimplifyPatternResult.query, p3, true)
			
			if #ResolveElementListResult1 > 0 then
				StringTrimResult ..= "?" .. ResolveElementListResult1
			end
			local ResolveElementListResult2 = resolveElementList(SimplifyPatternResult.hash, p3, false)
			
			if #ResolveElementListResult2 > 0 then
				StringTrimResult ..= "#" .. ResolveElementListResult2
			end
			if not Text then
				return StringTrimResult
			end
			if StringTrimResult ~= Text then
				warn("UrlBuilder: unexpected output for pattern:")
				warn("UrlBuilder: expected `" .. Text .. "`")
				warn("UrlBuilder: actual `" .. StringTrimResult .. "`")
			end
			return Text
		end
	end
}

function UrlBuilderModule.fromString(p2) --[[ Line: 347 ]]
	-- upvalues: StringSplitFunction (copy), UrlBuilderModule (copy), StringTrimFunction (copy)
	local v1 = StringSplitFunction(p2, ":", 2)
	
	if #v1 < 2 then
		v1 = { "", v1[1] }
	end
	local Text1 = v1[1]
	local v2 = StringSplitFunction(v1[2], "%#", 2)
	local v3 = v2[2] or ""
	local v4 = StringSplitFunction(v2[1], "%?", 2)
	local Text = v4[1] or ""
	local v5 = v4[2] or ""
	
	if string.sub(Text, 1, 2) == "//" then
		local StringSplitResult = StringSplitFunction(string.sub(Text, 3), "/", 2)
		Text1 ..= "://" .. StringSplitResult[1]
		Text = StringSplitResult[2] or "/"
	end
	return UrlBuilderModule.new({
		base = StringTrimFunction(Text1),
		path = StringTrimFunction(Text),
		query = StringTrimFunction(v5),
		hash = StringTrimFunction(v3)
	})
end

function UrlBuilderModule.addQueryString(p2, p3) --[[ Line: 376 ]]
	-- upvalues: StringTrimFunction (copy), CryoModule (copy), UrlBuilderModule (copy)
	local StringTrimResult = StringTrimFunction(p2)
	local FoundAt: number? = string.find(StringTrimResult, "%?")
	
	if FoundAt == nil then
		StringTrimResult ..= "?"
	elseif FoundAt < #StringTrimResult then
		StringTrimResult ..= "&"
	end
	return UrlBuilderModule.fromString(StringTrimResult .. table.concat(CryoModule.List.map(CryoModule.Dictionary.keys(p3), function(Text): string --[[ Line: 385 ]]
		return "{" .. Text .. "}"
	end), "&"))(p3)
end

UrlBuilderModule.game = GameUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.user = UserUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.catalog = CatalogUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.static = StaticUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.usermoderation = UserModerationPatternsModule(UrlBuilderModule)
UrlBuilderModule.accountinformation = AccountInformationPatternsModule(UrlBuilderModule)
UrlBuilderModule.sharelinks = ShareLinksUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.economy = EconomyUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.virtualevents = VirtualEventsUrlPatternsModule(UrlBuilderModule)
UrlBuilderModule.PlatformAuth = PlatformAuthPatternsModule(UrlBuilderModule)

return UrlBuilderModule