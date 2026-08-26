local diagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local _ = require(script.Parent.Parent.Types)

local function _(p1, p2)
	return if type(p1) == "function" then p1(p2) else p1
end

return function()
	-- upvalues: diagEventTypes (ref)
	return function(p1, p2)
		-- upvalues: diagEventTypes (copy)
		local name = p1.name
		local var1 = if type(name) == "function" then name(p2) else name
		local type = p1.type or diagEventTypes.Counter
		local var2 = if type ~= diagEventTypes.Stats then p1.stats else nil
		local var3 = type ~= diagEventTypes.Stats and ((if type(var2) == "function" then var2(p2) else var2) or 0)
		return {
			type = type,
			name = var1,
			value = var3,
			platformSpecificity = p1.platformSpecificity
		}
	end
end