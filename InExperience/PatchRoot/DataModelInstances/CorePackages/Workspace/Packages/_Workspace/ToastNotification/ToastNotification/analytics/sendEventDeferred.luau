local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = script.Parent.Parent.Parent
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local cryoModule = require(parent.Cryo)

return function(p1)
	-- upvalues: rbxAnalyticsService (ref), cryoModule (ref), getPlatformTarget (ref)
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	return function(p2, p3, p4)
		-- upvalues: cryoModule (copy), playSessionId (ref), p1 (ref), getPlatformTarget (copy)
		p1:SendEventDeferred(getPlatformTarget(), p2, p3, cryoModule.Dictionary.join(p4 or {}, { playSessionId = playSessionId }))
	end
end