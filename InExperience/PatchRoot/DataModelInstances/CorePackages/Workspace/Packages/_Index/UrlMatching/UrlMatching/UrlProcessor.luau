local parent = script.Parent.Parent
local urlMatcherModule = require(script.Parent.UrlMatcher)
local urlValidationModule = require(script.Parent.UrlValidation)
local _ = require(script.Parent.Types)
local cryoModule = require(parent.Cryo)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: cryoModule (ref), urlMatcherModule (ref), t (ref)
	local t_1 = {
		_urlMatcher = urlMatcherModule.new(cryoModule.Dictionary.union(p1 or {}, { pathPatterns = cryoModule.Dictionary.keys(p2) })),
		_urlMap = p2
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:process(p1)
	-- upvalues: cryoModule (ref), urlValidationModule (ref)
	return cryoModule.List.filterMap(self._urlMatcher:match(p1), function(p2)
		-- upvalues: urlValidationModule (copy), self (ref)
		local var1, var2 = urlValidationModule.validateUrlMatch(p2, self._urlMap)
		
		return if var1 then {
			startIndex = p2.startIndex,
			endIndex = p2.endIndex,
			result = var2
		} else nil
	end)
end

return t