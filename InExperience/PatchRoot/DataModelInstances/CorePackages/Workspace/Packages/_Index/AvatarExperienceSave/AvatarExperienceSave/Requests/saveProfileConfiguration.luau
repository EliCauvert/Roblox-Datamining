local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local reportAvatarEventCounterNoAnalyticsArgument = avatarExperienceAnalyticsModule.reportAvatarEventCounterNoAnalyticsArgument
local AVATAR_EDITOR_SERVICE_ERRORS = avatarExperienceAnalyticsModule.Constants.AVATAR_EDITOR_SERVICE_ERRORS

return function(p0) --[[ line: 29 | named "saveProfileConfiguration" ]]
	-- upvalues: promiseModule (ref), avatarEditorService (ref), reportAvatarEventCounterNoAnalyticsArgument (ref), AVATAR_EDITOR_SERVICE_ERRORS (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 30 ]]
		-- upvalues: p0 (ref), avatarEditorService (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), AVATAR_EDITOR_SERVICE_ERRORS (copy)
		local t = { BackgroundAssetId = p0 }
		local var4 = avatarEditorService:NoPromptApplyProfileConfiguration(t)
		while not var4 do
			avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
			reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.NoPromptApplyProfileConfiguration)
			var4 = avatarEditorService:NoPromptApplyProfileConfiguration(t)
		end
		local var5 = avatarEditorService.PromptApplyProfileConfigurationCompleted:Wait()
		
		if var5 == Enum.AvatarPromptResult.Success then
			p1({ avatarPromptResult = var5 })
			
			return
		end
		reportAvatarEventCounterNoAnalyticsArgument(AVATAR_EDITOR_SERVICE_ERRORS.PromptApplyProfileConfigurationCompleted)
		p2({ avatarPromptResult = var5 })
	end)
end