local parent = script:FindFirstAncestor("ExpChat").Parent

return game:DefineFastFlag("ExpChatPresetChatAutocompleteEnabled2", false) and (require(parent.SocialExperiments).ExpChatPresetChatAutocompleteExperimentation.isEnabled() and require(parent.ExpChatShared).Flags.FFlagExpChatPresetChatSendEnabled)