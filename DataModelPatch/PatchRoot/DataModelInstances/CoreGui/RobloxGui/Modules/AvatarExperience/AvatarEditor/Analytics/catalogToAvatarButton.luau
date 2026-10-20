local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy)
	p1:sendTelemetryEvent(p2, "catalogToAvatarButton", { feature = ConstantsModule.AnalyticsTag })
end