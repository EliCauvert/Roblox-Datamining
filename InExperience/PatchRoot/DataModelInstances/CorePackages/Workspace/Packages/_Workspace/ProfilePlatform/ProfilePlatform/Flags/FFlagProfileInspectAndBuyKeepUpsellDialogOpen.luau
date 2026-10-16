local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return game:DefineFastFlag("ProfileInspectAndBuyKeepUpsellDialogOpen", false) and require(ProfilePlatform.Flags.FFlagProfileInspectAndBuyRefreshBalanceAfterPurchase)