local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatPresetChatEmojiTabExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation
local ExpChatPresetChatEmojiEffectExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local FFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule = require(ExpChat.Flags.FFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabled)
local v1 = nil

return function() --[[ Line: 26 | Named "isBorderlessBubbleChatEnabled" ]]
	-- upvalues: v1 (ref), FFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule (copy), ExpChatPresetChatEmojiTabExperimentation (copy), ExpChatPresetChatEmojiEffectExperimentation (copy)
	if v1 == nil then
		v1 = FFlagExpChatMessageEffectBorderlessBubbleChatRolloutEnabledModule or (ExpChatPresetChatEmojiTabExperimentation.getIsEmphasizedRenderingEnabled() or ExpChatPresetChatEmojiEffectExperimentation.getHasBorderlessBubbleChatEffect())
	end
	return v1
end