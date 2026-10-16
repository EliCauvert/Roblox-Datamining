local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local BuildProfileConfigurationApplyConfigModule = require(script.Parent.buildProfileConfigurationApplyConfig)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local AVATAREDITORSERVICEERRORS = AvatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS

return function(BackgroundAssetId) --[[ Line: 34 | Named "saveProfileConfiguration" ]]
	-- upvalues: PromiseModule (copy), AvatarExperienceFlagsModule (copy), BuildProfileConfigurationApplyConfigModule (copy), AvatarEditorService (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), AVATAREDITORSERVICEERRORS (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 37 ]]
		-- upvalues: AvatarExperienceFlagsModule (upval), BuildProfileConfigurationApplyConfigModule (upval), BackgroundAssetId (copy), AvatarEditorService (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), AVATAREDITORSERVICEERRORS (upval)
		local ProfileConfigurationApplyConfigModule = if AvatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then BuildProfileConfigurationApplyConfigModule(BackgroundAssetId) else { BackgroundAssetId = BackgroundAssetId }
		local NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfigurationApplyConfigModule)
		while not NoPromptApplyProfileConfigurationResult do
			AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(AVATAREDITORSERVICEERRORS.NoPromptApplyProfileConfiguration)
			NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(ProfileConfigurationApplyConfigModule)
		end
		local Result = AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if Result == Enum.AvatarPromptResult.Success then
			Callback({ avatarPromptResult = Result })
			
			return
		else
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(AVATAREDITORSERVICEERRORS.PromptApplyProfileConfigurationCompleted)
			Callback1({ avatarPromptResult = Result })
		end
	end)
end