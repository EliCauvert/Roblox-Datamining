local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = script.Parent.Parent.Parent
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local cryoModule = require(parent.Cryo)

return function(p0) --[[ line: 8 ]]
	-- upvalues: rbxAnalyticsService (ref), cryoModule (ref), getPlatformTarget (ref)
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	return function(p1, p2, p3) --[[ line: 11 ]]
		-- upvalues: cryoModule (copy), playSessionId (ref), p0 (ref), getPlatformTarget (copy)
		p0:SendEventDeferred(getPlatformTarget(), p1, p2, cryoModule.Dictionary.join(p3 or {}, { playSessionId = playSessionId }))
	end
end