local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local _ = require(socialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local formatEventStreamFieldsModule = require(socialLuaAnalytics.Telemetry.formatEventStreamFields)
local _ = require(socialLuaAnalytics.Analytics.Enums.Contexts)

return function(p1)
	-- upvalues: cryoModule (ref), formatEventStreamFieldsModule (ref)
	return {
		name = p1.name,
		description = p1.description,
		eventStreamCtx = p1.eventStreamCtx,
		lastUpdated = p1.lastUpdated,
		backendsList = cryoModule.List.map(p1.backendsList, function(p2)
			-- upvalues: formatEventStreamFieldsModule (copy), cryoModule (copy)
			return if p2.type == "EventIngest" then cryoModule.Dictionary.join(p2, {
				format = function(...)
					-- upvalues: p2 (ref), formatEventStreamFieldsModule (copy)
					return formatEventStreamFieldsModule(p2.format(...))
				end
			}) else p2
		end),
		throttlingThousandths = p1.throttlingThousandths
	}
end