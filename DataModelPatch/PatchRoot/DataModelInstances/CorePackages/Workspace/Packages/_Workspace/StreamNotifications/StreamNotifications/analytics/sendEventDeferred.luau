local GetPlatformTargetFunction = require(script:FindFirstAncestor("StreamNotifications").Parent.Analytics).getPlatformTarget

return function(p1)
	-- upvalues: GetPlatformTargetFunction (copy)
	return function(EventContext, EventName, AdditionalArgs)
		-- upvalues: p1 (copy), GetPlatformTargetFunction (upval)
		p1:SendEventDeferred(GetPlatformTargetFunction(), EventContext, EventName, AdditionalArgs)
	end
end