local UrlMatcherModule = require(script.Parent.UrlMatcher)
local UrlValidationModule = require(script.Parent.UrlValidation)
local _ = require(script.Parent.Types)
local CryoModule = require(script.Parent.Parent.Cryo)
local UrlProcessorModule = {}
UrlProcessorModule.__index = UrlProcessorModule

function UrlProcessorModule.new(UnionResult, _urlMap) --[[ Line: 32 ]]
	-- upvalues: CryoModule (copy), UrlMatcherModule (copy), UrlProcessorModule (copy)
	local config = {
		_urlMatcher = UrlMatcherModule.new((CryoModule.Dictionary.union(UnionResult or {}, { pathPatterns = CryoModule.Dictionary.keys(_urlMap) }))),
		_urlMap = _urlMap
	}
	setmetatable(config, UrlProcessorModule)
	
	return config
end

function UrlProcessorModule:process(p1) --[[ Line: 48 ]]
	-- upvalues: CryoModule (copy), UrlValidationModule (copy)
	return CryoModule.List.filterMap(self._urlMatcher:match(p1), function(p2) --[[ Line: 50 ]]
		-- upvalues: UrlValidationModule (upval), self (copy)
		local ValidateUrlMatchResult, ValidateUrlMatchResult2 = UrlValidationModule.validateUrlMatch(p2, self._urlMap)
		
		return if ValidateUrlMatchResult then {
			startIndex = p2.startIndex,
			endIndex = p2.endIndex,
			result = ValidateUrlMatchResult2
		} else nil
	end)
end

return UrlProcessorModule