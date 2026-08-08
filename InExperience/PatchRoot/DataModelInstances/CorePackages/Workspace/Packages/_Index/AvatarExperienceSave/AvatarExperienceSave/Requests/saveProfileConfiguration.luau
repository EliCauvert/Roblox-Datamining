local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local buildProfileConfigurationApplyConfigModule = require(script.Parent.buildProfileConfigurationApplyConfig)
local reportAvatarEventCounterNoAnalyticsArgument = avatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local AVATAR_EDITOR_SERVICE_ERRORS = avatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS

return function(p0) --[[ line: 34 | named "saveProfileConfiguration" ]]
	-- upvalues: promiseModule (ref), avatarExperienceFlagsModule (ref), buildProfileConfigurationApplyConfigModule (ref), avatarEditorService (ref), reportAvatarEventCounterNoAnalyticsArgument (ref), AVATAR_EDITOR_SERVICE_ERRORS (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 37 ]]
		-- upvalues: avatarExperienceFlagsModule (copy), buildProfileConfigurationApplyConfigModule (copy), p0 (ref), avatarEditorService (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), AVATAR_EDITOR_SERVICE_ERRORS (copy)
		local var5 = if avatarExperienceFlagsModule.FFlagAXProfileConfigurationMultiFieldApply then buildProfileConfigurationApplyConfigModule(p0) else { BackgroundAssetId = p0 }
		local var6 = avatarEditorService:NoPromptApplyProfileConfiguration(var5)
		while not var6 do
			avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.NoPromptApplyProfileConfiguration)
			var6 = avatarEditorService:NoPromptApplyProfileConfiguration(var5)
		end
		local var7 = avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if var7 == Enum.AvatarPromptResult.Success then
			p1({ avatarPromptResult = var7 })
			
			return
		end
		reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.PromptApplyProfileConfigurationCompleted)
		p2({ avatarPromptResult = var7 })
	end)
end