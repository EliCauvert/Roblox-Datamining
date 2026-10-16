local Parent = script:FindFirstAncestor("ExpChat").Parent
local ExpChatPresetChatAutocompleteExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatAutocompleteExperimentation
local FFlagExpChatPresetChatSendEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatSendEnabled

return game:DefineFastFlag("ExpChatPresetChatAutocompleteEnabled3", false) and (ExpChatPresetChatAutocompleteExperimentation.isEnabled() and FFlagExpChatPresetChatSendEnabled)