local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local CryoModule = require(SocialLuaAnalytics.Parent.Cryo)
local _ = require(SocialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local FormatEventStreamFieldsModule = require(SocialLuaAnalytics.Telemetry.formatEventStreamFields)
local _ = require(SocialLuaAnalytics.Analytics.Enums.Contexts)

return function(p1) --[[ Line: 32 | Named "telemetryConfig" ]]
	-- upvalues: CryoModule (copy), FormatEventStreamFieldsModule (copy)
	return {
		name = p1.name,
		description = p1.description,
		eventStreamCtx = p1.eventStreamCtx,
		lastUpdated = p1.lastUpdated,
		backendsList = CryoModule.List.map(p1.backendsList, function(p2) --[[ Line: 38 ]]
			-- upvalues: FormatEventStreamFieldsModule (upval), CryoModule (upval)
			return if p2.type == "EventIngest" then CryoModule.Dictionary.join(p2, {
				format = function(...) --[[ Line: 41 ]]
					-- upvalues: p2 (copy), FormatEventStreamFieldsModule (upval)
					return FormatEventStreamFieldsModule((p2.format(...)))
				end
			}) else p2
		end),
		throttlingThousandths = p1.throttlingThousandths
	}
end