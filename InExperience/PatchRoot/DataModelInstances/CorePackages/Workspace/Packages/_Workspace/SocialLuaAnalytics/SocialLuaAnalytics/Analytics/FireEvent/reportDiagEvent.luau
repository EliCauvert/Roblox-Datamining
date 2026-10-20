local DiagEventTypes = require(script:FindFirstAncestor("SocialLuaAnalytics").Analytics.Enums).DiagEventTypes
local GetPlatformSuffixModule = require(script.Parent.getPlatformSuffix)
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: GetPlatformSuffixModule (copy), DiagEventTypes (copy)
	return function(p2)
		-- upvalues: GetPlatformSuffixModule (upval), DiagEventTypes (upval), p1 (copy)
		local Text: string = `{p2.name}{GetPlatformSuffixModule(p2.platformSpecificity)}`
		
		if p2.type == DiagEventTypes.Stats then
			p1:reportStats(Text, p2.value)
			
			return p2
		else
			p1:reportCounter(Text, p2.value)
			
			return p2
		end
	end
end