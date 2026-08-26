local diagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local getPlatformSuffixModule = require(script.Parent.getPlatformSuffix)
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: getPlatformSuffixModule (ref), diagEventTypes (ref)
	return function(p2)
		-- upvalues: getPlatformSuffixModule (copy), diagEventTypes (copy), p1 (ref)
		local name = `{p2.name}{getPlatformSuffixModule(p2.platformSpecificity)}`
		
		if p2.type == diagEventTypes.Stats then
			p1:reportStats(name, p2.value)
			
			return p2
		end
		p1:reportCounter(name, p2.value)
		
		return p2
	end
end