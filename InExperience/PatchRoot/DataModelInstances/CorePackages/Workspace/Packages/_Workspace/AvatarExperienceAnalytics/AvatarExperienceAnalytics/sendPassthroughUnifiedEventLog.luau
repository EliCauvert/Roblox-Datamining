local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local FFlagAXInExperienceNotificationsPassthroughModule = require(script.Parent.FFlagAXInExperienceNotificationsPassthrough)
local UnifiedEventTypesModule = require(script.Parent.Generated.UnifiedEventTypes)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)

local function _(p1)
	return p1
end

local function reportIfNotPassthrough(Text, p1)
	-- upvalues: UnifiedLoggingSurface (copy), FFlagAXInExperienceNotificationsPassthroughModule (copy), UnifiedEventTypesModule (copy), MutedErrorFunction (copy)
	if p1.surface == UnifiedLoggingSurface.IN_EXPERIENCE_NOTIFICATIONS and not FFlagAXInExperienceNotificationsPassthroughModule or not UnifiedEventTypesModule.PassthroughSurfaces[p1.surface] then
		MutedErrorFunction(Text .. ": surface is not on the passthrough route", { surface = tostring(p1.surface) })
	end
end

return {
	send = function(p1, p2, p3)
		-- upvalues: SendUnifiedEventLogModule (copy), reportIfNotPassthrough (copy)
		SendUnifiedEventLogModule(p1, p2, p3)
		reportIfNotPassthrough("sendPassthroughUnifiedEventLog", p1)
	end,
	sendForInstance = function(p1, p2, p3)
		-- upvalues: SendUnifiedEventLogForInstanceModule (copy), reportIfNotPassthrough (copy)
		SendUnifiedEventLogForInstanceModule(p1, p2, p3)
		reportIfNotPassthrough("sendPassthroughUnifiedEventLogForInstance", p2)
	end
}