local TelemetryService = game:GetService("TelemetryService")
local IosAuthServiceSignupPasswordSaveModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Analytics.RobloxTelemetryConfigs.IosAuthServiceSignupPasswordSave)

return {
	reportAttempted = function(Username)
		-- upvalues: TelemetryService (copy), IosAuthServiceSignupPasswordSaveModule (copy)
		TelemetryService:LogEvent(IosAuthServiceSignupPasswordSaveModule.Attempted, {
			customFields = { is_luafied = true, username = Username }
		})
	end,
	reportSuccess = function(Username)
		-- upvalues: TelemetryService (copy), IosAuthServiceSignupPasswordSaveModule (copy)
		TelemetryService:LogEvent(IosAuthServiceSignupPasswordSaveModule.Success, {
			customFields = { is_luafied = true, username = Username }
		})
	end,
	reportFailure = function(Username, p1)
		-- upvalues: TelemetryService (copy), IosAuthServiceSignupPasswordSaveModule (copy)
		TelemetryService:LogEvent(IosAuthServiceSignupPasswordSaveModule.Failure, {
			customFields = {
				is_luafied = true,
				username = Username,
				error_message = p1 or "unknown"
			}
		})
	end,
	reportSkipped = function(Skip_reason)
		-- upvalues: TelemetryService (copy), IosAuthServiceSignupPasswordSaveModule (copy)
		TelemetryService:LogEvent(IosAuthServiceSignupPasswordSaveModule.Skipped, {
			customFields = { is_luafied = true, skip_reason = Skip_reason }
		})
	end
}