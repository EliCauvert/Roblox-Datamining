local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local _ = require(socialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local formatEventStreamFieldsModule = require(socialLuaAnalytics.Telemetry.formatEventStreamFields)
local _ = require(socialLuaAnalytics.Analytics.Enums.Contexts)

return function(p0)
	-- upvalues: cryoModule (ref), formatEventStreamFieldsModule (ref)
	return {
		name = p0.name,
		description = p0.description,
		eventStreamCtx = p0.eventStreamCtx,
		lastUpdated = p0.lastUpdated,
		backendsList = cryoModule.List.map(p0.backendsList, function(p1)
			-- upvalues: formatEventStreamFieldsModule (copy), cryoModule (copy)
			return if p1.type == "EventIngest" then cryoModule.Dictionary.join(p1, {
				format = function(...)
					-- upvalues: p1 (ref), formatEventStreamFieldsModule (copy)
					return formatEventStreamFieldsModule(p1.format(...))
				end
			}) else p1
		end),
		throttlingThousandths = p0.throttlingThousandths
	}
end