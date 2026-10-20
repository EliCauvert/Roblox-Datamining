local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatPresetChatEmojiTabExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation
local ExpChatPresetChatEmojiEffectExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiEffectExperimentation
local FFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule = require(ExpChat.Flags.FFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabled)
local v1 = nil

return function()
	-- upvalues: v1 (ref), FFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule (copy), ExpChatPresetChatEmojiTabExperimentation (copy), ExpChatPresetChatEmojiEffectExperimentation (copy)
	if v1 == nil then
		v1 = FFlagExpChatMessageEffectChatWindowEnlargeRolloutEnabledModule or (ExpChatPresetChatEmojiTabExperimentation.getIsEmphasizedRenderingEnabled() or ExpChatPresetChatEmojiEffectExperimentation.getHasChatWindowEnlargeEffect())
	end
	return v1
end