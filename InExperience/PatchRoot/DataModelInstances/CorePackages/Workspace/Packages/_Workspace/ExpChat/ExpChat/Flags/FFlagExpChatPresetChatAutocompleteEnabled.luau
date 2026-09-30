local parent = script:FindFirstAncestor("ExpChat").Parent

return game:DefineFastFlag("ExpChatPresetChatAutocompleteEnabled3", false) and (require(parent.SocialExperiments).ExpChatPresetChatAutocompleteExperimentation.isEnabled() and require(parent.ExpChatShared).Flags.FFlagExpChatPresetChatSendEnabled)