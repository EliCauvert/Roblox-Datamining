local diagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local getPlatformSuffixModule = require(script.Parent.getPlatformSuffix)
local _ = require(script.Parent.Parent.Types)

return function(p0)
	-- upvalues: getPlatformSuffixModule (ref), diagEventTypes (ref)
	return function(p1)
		-- upvalues: getPlatformSuffixModule (copy), diagEventTypes (copy), p0 (ref)
		local name = `{p1.name}{getPlatformSuffixModule(p1.platformSpecificity)}`
		
		if p1.type == diagEventTypes.Stats then
			p0:reportStats(name, p1.value)
			
			return p1
		end
		p0:reportCounter(name, p1.value)
		
		return p1
	end
end