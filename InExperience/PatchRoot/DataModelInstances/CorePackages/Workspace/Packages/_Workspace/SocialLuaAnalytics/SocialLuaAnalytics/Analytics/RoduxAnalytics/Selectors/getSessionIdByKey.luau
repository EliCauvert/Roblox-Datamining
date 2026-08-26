local _ = require(script.Parent.Parent.AnalyticsTypes)
local getDeepValueModule = require(script.Parent.Parent.Parent.Parent.Utils.getDeepValue)

return function(p1)
	-- upvalues: getDeepValueModule (ref)
	local keyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: getDeepValueModule (copy), keyPath (ref)
		return function(p3)
			-- upvalues: getDeepValueModule (copy), p2 (ref), keyPath (copy)
			return getDeepValueModule(p2, string.format("%s.bySessionKey.%s", keyPath, p3))
		end
	end
end