local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

return function(p1, p2)
	-- upvalues: PerformFetch (copy), ConstantsModule (copy), PromiseModule (copy), UtilsModule (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), ConstantsModule1 (copy), Logging (copy)
	local AvatarEditorService = p2.avatarEditorService
	
	return PerformFetch.Single(ConstantsModule.GetAvatarRulesKey, function(_)
		-- upvalues: PromiseModule (upval), AvatarEditorService (copy), UtilsModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
		return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
			-- upvalues: AvatarEditorService (upval), UtilsModule (upval), GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), ConstantsModule1 (upval), Logging (upval)
			local Success, Result = pcall(function()
				-- upvalues: AvatarEditorService (upval)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetAvatarRulesAsync() else AvatarEditorService:GetAvatarRules()
			end)
			
			if Success then
				Callback((UtilsModule.tableToCamelCaseKeys(Result)))
				
				return
			end
			if GetFFlagEnableAvatarEditorServiceAPIErrorLoggingModule() then
				ReportAvatarEventCounterNoAnalyticsArgumentFunction(ConstantsModule1.Counter.AvatarEditorServiceErrors.GetAvatarRules)
			end
			Logging.warn("WebApi failure in GetAvatarRules")
			Callback1({ HttpError = Enum.HttpError.OK })
		end)
	end)(p1)
end