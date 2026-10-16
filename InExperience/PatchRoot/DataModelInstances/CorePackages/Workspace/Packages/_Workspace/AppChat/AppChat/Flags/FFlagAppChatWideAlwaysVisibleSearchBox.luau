local AppChat = script:FindFirstAncestor("AppChat")

return game:DefineFastFlag("AppChatWideAlwaysVisibleSearchBoxV1", false) and require(AppChat.Flags.FFlagAppChatFoundationSearchInput)