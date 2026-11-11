local Default = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).default
local AXPointsEventHundredthsPercent = game:DefineFastInt("AXPointsEventHundredthsPercent", 0)

local function _(Text)
	-- upvalues: Default (copy), AXPointsEventHundredthsPercent (copy)
	return {
		eventName = "AvatarExperience" .. Text,
		backends = { Default.TelemetryBackends.Points },
		throttlingPercentage = AXPointsEventHundredthsPercent
	}
end

return {
	sendTelemetryEvent = function(Text, p1)
		-- upvalues: Default (copy), AXPointsEventHundredthsPercent (copy)
		Default:logRobloxTelemetryEvent({
			eventName = "AvatarExperience" .. Text,
			backends = { Default.TelemetryBackends.Points },
			throttlingPercentage = AXPointsEventHundredthsPercent
		}, nil, p1)
	end
}