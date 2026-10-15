local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatPresetChatEmojiTabExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation
local expChatPresetChatEmojiEffectExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local fFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule = require(expChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabled)
local var1 = nil

return function()
	-- upvalues: var1 (write), fFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule (ref), expChatPresetChatEmojiTabExperimentation (ref), expChatPresetChatEmojiEffectExperimentation (ref)
	if var1 == nil then
		var1 = fFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule or (expChatPresetChatEmojiTabExperimentation.getIsEmphasizedRenderingEnabled() or expChatPresetChatEmojiEffectExperimentation.getHasChatWindowEnlargeEffect())
	end
	return var1
end