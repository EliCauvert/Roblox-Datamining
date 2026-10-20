local Parent = script.Parent.Parent
local CryoModule = require(Parent.Cryo)
local RegexModule = require(script.Parent.Regex)
local RegExpModule = require(Parent.RegExp)
local StringUtilitiesModule = require(Parent.StringUtilities)
local StringSplitFunction = StringUtilitiesModule.StringSplit
local StringTrimFunction = StringUtilitiesModule.StringTrim
local ParseQueryFunction = StringUtilitiesModule.ParseQuery
local _ = require(script.Parent.Types)

local function filterParams(p1, p2)
	-- upvalues: CryoModule (copy)
	return CryoModule.List.filter(p1, function(p3): boolean
		-- upvalues: p2 (copy)
		return p3.optional == p2 or not p2 and p3.optional == nil
	end)
end

local function _(p1)
	-- upvalues: filterParams (copy)
	return filterParams(p1, false)
end

local _ = function(p1)
	-- upvalues: filterParams (copy)
	return filterParams(p1, true)
end

local _ = function(p1)
	-- upvalues: RegexModule (copy), RegExpModule (copy)
	return function(p2)
		-- upvalues: RegexModule (upval), p1 (copy), RegExpModule (upval)
		local MatchWholeResult = RegexModule.matchWhole(RegexModule.oneOrMore(p2.pattern))
		local v1 = p1[p2.name]
		
		return if v1 == nil or not RegExpModule(MatchWholeResult):exec(v1) then nil else p2.name
	end
end

local function validateParams(MapResult, QueryParams)
	-- upvalues: CryoModule (copy), RegexModule (copy), RegExpModule (copy)
	local MapResult1 = MapResult or {}
	local v1 = false
	local FilterResult = CryoModule.List.filter(QueryParams, function(p1): boolean
		-- upvalues: v1 (copy)
		return p1.optional == v1 or not v1 and p1.optional == nil
	end)
	
	local function v18(p1)
		-- upvalues: RegexModule (upval), MapResult1 (copy), RegExpModule (upval)
		local MatchWholeResult = RegexModule.matchWhole(RegexModule.oneOrMore(p1.pattern))
		local v2 = MapResult1[p1.name]
		
		return if v2 == nil or not RegExpModule(MatchWholeResult):exec(v2) then nil else p1.name
	end
	
	local FilterMapResult = CryoModule.List.filterMap(FilterResult, v18)
	
	if #FilterMapResult == #FilterResult then
		local v2 = true
		local Set = CryoModule.List.toSet((CryoModule.List.join(FilterMapResult, (CryoModule.List.filterMap(CryoModule.List.filter(QueryParams, function(p1): boolean
			-- upvalues: v2 (copy)
			return p1.optional == v2 or not v2 and p1.optional == nil
		end), v18)))))
		
		return true, (CryoModule.Dictionary.filter(MapResult1, function(_, p1): boolean
			-- upvalues: Set (copy)
			return Set[p1] ~= nil
		end))
	else
		return false, {}
	end
end

local function validatePathParams(p1, PathParams)
	-- upvalues: CryoModule (copy), validateParams (copy)
	local Optional = false
	
	if #p1 < #CryoModule.List.filter(PathParams, function(p2): boolean
		-- upvalues: Optional (copy)
		return p2.optional == Optional or not Optional and p2.optional == nil
	end) then
		return false, {}
	else
		return validateParams(CryoModule.Dictionary.map(PathParams, function(p2, p3)
			-- upvalues: p1 (copy)
			return p1[p3], p2.name
		end), PathParams)
	end
end

local function validateUrlParams(Url, p1)
	-- upvalues: StringTrimFunction (copy), StringSplitFunction (copy), ParseQueryFunction (copy), CryoModule (copy), validatePathParams (copy), validateParams (copy)
	local StringTrimResult = if Url.path then StringTrimFunction(Url.path, "/") else ""
	local MapResult = CryoModule.Dictionary.map(ParseQueryFunction(Url.query), function(Entry)
		return if #Entry == 1 then Entry[1] else Entry
	end)
	local ValidatePathParamsResult, ValidatePathParamsResult2 = validatePathParams(if StringTrimResult == "" then {} else StringSplitFunction(StringTrimResult, "/"), p1.pathParams or {})
	
	if not ValidatePathParamsResult then
		return false, {}
	end
	local ValidateParamsResult, ValidateParamsResult2 = validateParams(MapResult, p1.queryParams or {})
	
	if ValidateParamsResult then
		return true, CryoModule.Dictionary.union(ValidatePathParamsResult2, ValidateParamsResult2)
	else
		return false, {}
	end
end

return {
	validateUrlMatch = function(p1, List)
		-- upvalues: RegExpModule (copy), validateUrlParams (copy)
		local ValidateUrlParamsResult = nil
		local ValidateUrlParamsResult2 = nil
		for i, value in List do
			if RegExpModule(i, "i"):test(p1.matchedPath) then
				ValidateUrlParamsResult, ValidateUrlParamsResult2 = validateUrlParams(p1.url, value)
				
				if ValidateUrlParamsResult then
					return ValidateUrlParamsResult, value.paramCallback(ValidateUrlParamsResult2)
				end
			end
		end
		return false, nil
	end,
	validateUrlParams = validateUrlParams
}