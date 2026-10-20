local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local ApplyProfileConfigurationFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ApplyProfileConfiguration
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.LuaApp.Types.RoduxTypes)

return function(p1, p2)
	-- upvalues: Players (copy), PerformFetch (copy), PromiseModule (copy), ApplyProfileConfigurationFunction (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule (copy), Logging (copy)
	local Players1 = p2.players or Players
	
	return PerformFetch.Single("avatareditor.getprofileconfiguration", function(p3)
		-- upvalues: PromiseModule (upval), Players1 (copy), ApplyProfileConfigurationFunction (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
		return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
			-- upvalues: Players1 (upval), p3 (copy), ApplyProfileConfigurationFunction (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule (upval), Logging (upval)
			local UserId = Players1.LocalPlayer and Players1.LocalPlayer.UserId
			local Success, Result = pcall(function()
				-- upvalues: Players1 (upval), UserId (copy)
				return Players1:GetProfileConfigurationFromUserIdAsync(UserId)
			end)
			
			if Success and Result then
				p3:dispatch(ApplyProfileConfigurationFunction({ BackgroundAssetId = Result.BackgroundAssetId }))
				Callback(Result)
				
				return
			end
			if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
				ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule.Counter.AvatarEditorServiceErrors.GetProfileConfiguration)
			end
			Logging.warn("WebApi failure in GetProfileConfiguration")
			Callback1({ HttpError = Enum.HttpError.OK })
		end)
	end)(p1)
end