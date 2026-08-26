local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local buildProfileConfigurationApplyConfigModule = require(script.Parent.buildProfileConfigurationApplyConfig)
local reportAvatarEventCounterNoAnalyticsArgument = avatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local AVATAR_EDITOR_SERVICE_ERRORS = avatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS

return function(p1)
	-- upvalues: promiseModule (ref), avatarExperienceFlagsModule (ref), buildProfileConfigurationApplyConfigModule (ref), avatarEditorService (ref), reportAvatarEventCounterNoAnalyticsArgument (ref), AVATAR_EDITOR_SERVICE_ERRORS (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: avatarExperienceFlagsModule (copy), buildProfileConfigurationApplyConfigModule (copy), p1 (ref), avatarEditorService (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), AVATAR_EDITOR_SERVICE_ERRORS (copy)
		local var1 = if avatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then buildProfileConfigurationApplyConfigModule(p1) else { BackgroundAssetId = p1 }
		local var2 = avatarEditorService:NoPromptApplyProfileConfiguration(var1)
		while not var2 do
			avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.NoPromptApplyProfileConfiguration)
			var2 = avatarEditorService:NoPromptApplyProfileConfiguration(var1)
		end
		local var3 = avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if var3 == Enum.AvatarPromptResult.Success then
			p2({ avatarPromptResult = var3 })
			
			return
		end
		reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.PromptApplyProfileConfigurationCompleted)
		p3({ avatarPromptResult = var3 })
	end)
end