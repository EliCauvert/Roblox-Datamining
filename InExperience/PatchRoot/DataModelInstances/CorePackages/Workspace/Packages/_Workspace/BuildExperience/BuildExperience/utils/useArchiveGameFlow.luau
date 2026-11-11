local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local ConfigurationActionTelemetryModule = require(BuildExperience.Telemetry.ConfigurationActionTelemetry)
local FFlagBuildExperienceActionOutcomeTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceActionOutcomeTelemetry)
local Action = ConfigurationActionTelemetryModule.Action
local FailureReason = ConfigurationActionTelemetryModule.FailureReason

return function(p1)
	-- upvalues: ReactModule (copy), FFlagBuildExperienceActionOutcomeTelemetryModule (copy), ConfigurationActionTelemetryModule (copy), Action (copy), GameConfigurationActionsModule (copy), FailureReason (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Context = if FFlagBuildExperienceActionOutcomeTelemetryModule then p1.context else nil
	
	return {
		isOpen = UseStateResult ~= nil,
		requestArchive = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2)
		end, {}),
		confirm = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), FFlagBuildExperienceActionOutcomeTelemetryModule (upval), ConfigurationActionTelemetryModule (upval), Action (upval), Context (copy), GameConfigurationActionsModule (upval), FailureReason (upval), UseStateResult2 (copy)
			if UseStateResult ~= nil then
				local Config = if FFlagBuildExperienceActionOutcomeTelemetryModule then { universeId = UseStateResult } else nil
				
				if FFlagBuildExperienceActionOutcomeTelemetryModule then
					ConfigurationActionTelemetryModule.sendClick(Action.ArchiveGame, Config, Context)
				end
				local ArchiveGameResult = GameConfigurationActionsModule.archiveGame(UseStateResult)
				
				if FFlagBuildExperienceActionOutcomeTelemetryModule then
					ArchiveGameResult:andThen(function()
						-- upvalues: ConfigurationActionTelemetryModule (upval), Action (upval), Config (copy), Context (upval)
						ConfigurationActionTelemetryModule.sendSuccess(Action.ArchiveGame, Config, Context)
					end):catch(function(Err)
						-- upvalues: ConfigurationActionTelemetryModule (upval), Action (upval), Config (copy), FailureReason (upval), Context (upval)
						ConfigurationActionTelemetryModule.sendFailure(Action.ArchiveGame, Config, { reason = FailureReason.RequestFailed, error = Err }, Context)
					end)
				end
			end
			UseStateResult2(nil)
		end, { UseStateResult, Context }),
		cancel = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {})
	}
end