local _ = require(script.Parent.Parent.AnalyticsTypes)
local GetDeepValueModule = require(script.Parent.Parent.Parent.Parent.Utils.getDeepValue)

return function(p1)
	-- upvalues: GetDeepValueModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2)
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy)
		return function(p3)
			-- upvalues: GetDeepValueModule (upval), p2 (copy), KeyPath (upval)
			return GetDeepValueModule(p2, string.format("%s.bySessionKey.%s", KeyPath, p3))
		end
	end
end