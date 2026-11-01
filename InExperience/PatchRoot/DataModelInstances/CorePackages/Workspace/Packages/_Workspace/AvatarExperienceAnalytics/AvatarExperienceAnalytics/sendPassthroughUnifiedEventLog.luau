local MutedErrorFunction = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.Loggers).mutedError
local UnifiedEventTypesModule = require(script.Parent.Generated.UnifiedEventTypes)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)

local function _(p1)
	return p1
end

local _ = function(Text, p1)
	-- upvalues: UnifiedEventTypesModule (copy), MutedErrorFunction (copy)
	if not UnifiedEventTypesModule.PassthroughSurfaces[p1.surface] then
		MutedErrorFunction(Text .. ": surface is not on the passthrough route", { surface = tostring(p1.surface) })
	end
end

return {
	send = function(p1, p2, p3)
		-- upvalues: SendUnifiedEventLogModule (copy), UnifiedEventTypesModule (copy), MutedErrorFunction (copy)
		SendUnifiedEventLogModule(p1, p2, p3)
		
		if not UnifiedEventTypesModule.PassthroughSurfaces[p1.surface] then
			MutedErrorFunction("sendPassthroughUnifiedEventLog: surface is not on the passthrough route", { surface = tostring(p1.surface) })
		end
	end,
	sendForInstance = function(p1, p2, p3)
		-- upvalues: SendUnifiedEventLogForInstanceModule (copy), UnifiedEventTypesModule (copy), MutedErrorFunction (copy)
		SendUnifiedEventLogForInstanceModule(p1, p2, p3)
		
		if not UnifiedEventTypesModule.PassthroughSurfaces[p2.surface] then
			MutedErrorFunction("sendPassthroughUnifiedEventLogForInstance: surface is not on the passthrough route", { surface = tostring(p2.surface) })
		end
	end
}