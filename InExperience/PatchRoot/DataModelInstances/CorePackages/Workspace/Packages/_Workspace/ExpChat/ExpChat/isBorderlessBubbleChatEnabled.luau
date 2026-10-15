local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatPresetChatEmojiTabExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation
local expChatPresetChatEmojiEffectExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local fFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule = require(expChat.Flags.FFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabled)
local var1 = nil

return function()
	-- upvalues: var1 (write), fFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule (ref), expChatPresetChatEmojiTabExperimentation (ref), expChatPresetChatEmojiEffectExperimentation (ref)
	if var1 == nil then
		var1 = fFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule or (expChatPresetChatEmojiTabExperimentation.getIsEmphasizedRenderingEnabled() or expChatPresetChatEmojiEffectExperimentation.getHasBorderlessBubbleChatEffect())
	end
	return var1
end