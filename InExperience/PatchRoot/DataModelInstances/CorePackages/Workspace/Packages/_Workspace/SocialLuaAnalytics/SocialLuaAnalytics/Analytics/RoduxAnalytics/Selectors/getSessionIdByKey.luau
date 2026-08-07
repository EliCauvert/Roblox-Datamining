local _ = require(script.Parent.Parent.AnalyticsTypes)
local getDeepValueModule = require(script.Parent.Parent.Parent.Parent.Utils.getDeepValue)

return function(p0) --[[ line: 7 ]]
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p0.keyPath
	
	return function(p1) --[[ line: 9 ]]
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return function(p2) --[[ line: 10 ]]
			-- upvalues: getDeepValueModule (copy), p1 (ref), keyPath (copy)
			return getDeepValueModule(p1, string.format("%s.bySessionKey.%s", keyPath, p2))
		end
	end
end