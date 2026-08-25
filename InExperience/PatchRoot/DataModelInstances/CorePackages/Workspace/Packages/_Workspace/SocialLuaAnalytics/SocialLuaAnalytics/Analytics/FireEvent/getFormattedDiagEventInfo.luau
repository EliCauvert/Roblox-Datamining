local diagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local _ = require(script.Parent.Parent.Types)

local function _(p0, p1)
	return if type(p0) == "function" then p0(p1) else p0
end

return function()
	-- upvalues: diagEventTypes (ref)
	return function(p2, p3)
		-- upvalues: diagEventTypes (copy)
		local name = p2.name
		local var0 = if type(name) == "function" then name(p3) else name
		local type = p2.type or diagEventTypes.Counter
		local var2 = if type ~= diagEventTypes.Stats then p2.stats else nil
		local var3 = type ~= diagEventTypes.Stats and ((if type(var2) == "function" then var2(p3) else var2) or 0)
		return {
			type = type,
			name = var0,
			value = var3,
			platformSpecificity = p2.platformSpecificity
		}
	end
end