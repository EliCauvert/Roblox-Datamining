local parent = script.Parent.Parent
local urlMatcherModule = require(script.Parent.UrlMatcher)
local urlValidationModule = require(script.Parent.UrlValidation)
local _ = require(script.Parent.Types)
local cryoModule = require(parent.Cryo)
local t = {}
t.__index = t

function t.new(p0, p1)
	-- upvalues: cryoModule (ref), urlMatcherModule (ref), t (ref)
	local t_1 = {
		_urlMatcher = urlMatcherModule.new(cryoModule.Dictionary.union(p0 or {}, { pathPatterns = cryoModule.Dictionary.keys(p1) })),
		_urlMap = p1
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:process(p2)
	-- upvalues: cryoModule (ref), urlValidationModule (ref)
	return cryoModule.List.filterMap(self._urlMatcher:match(p2), function(p3)
		-- upvalues: urlValidationModule (copy), self (ref)
		local var5, var6 = urlValidationModule.validateUrlMatch(p3, self._urlMap)
		
		return if var5 then {
			startIndex = p3.startIndex,
			endIndex = p3.endIndex,
			result = var6
		} else nil
	end)
end

return t