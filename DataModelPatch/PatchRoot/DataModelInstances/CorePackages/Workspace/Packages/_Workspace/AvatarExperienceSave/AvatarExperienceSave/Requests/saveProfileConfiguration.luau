local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local ReportAvatarEventCounterNoAnalyticsArgumentFunction = AvatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local AVATAREDITORSERVICEERRORS = AvatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS

return function(BackgroundAssetId)
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy), ReportAvatarEventCounterNoAnalyticsArgumentFunction (copy), AVATAREDITORSERVICEERRORS (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: BackgroundAssetId (copy), AvatarEditorService (upval), ReportAvatarEventCounterNoAnalyticsArgumentFunction (upval), AVATAREDITORSERVICEERRORS (upval)
		local config = { BackgroundAssetId = BackgroundAssetId }
		local NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(config)
		while not NoPromptApplyProfileConfigurationResult do
			AvatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			ReportAvatarEventCounterNoAnalyticsArgumentFunction(AVATAREDITORSERVICEERRORS.NoPromptApplyProfileConfiguration)
			NoPromptApplyProfileConfigurationResult = AvatarEditorService:NoPromptApplyProfileConfiguration(config)
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