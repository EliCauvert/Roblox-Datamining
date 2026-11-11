local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Parent = script.Parent.Parent.Parent
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local CryoModule = require(Parent.Cryo)

return function(p1)
	-- upvalues: RbxAnalyticsService (copy), CryoModule (copy), GetPlatformTargetFunction (copy)
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	
	return function(EventContext, EventName, p2)
		-- upvalues: CryoModule (upval), PlaySessionId (copy), p1 (copy), GetPlatformTargetFunction (upval)
		p1:SendEventDeferred(GetPlatformTargetFunction(), EventContext, EventName, (CryoModule.Dictionary.join(p2 or {}, { playSessionId = PlaySessionId })))
	end
end