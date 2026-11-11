local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiPolicyFieldKeyModule = require(SduiCoreSystem.ClientBinding.SduiPolicyFieldKey)
local _ = require(SduiCoreSystem.Parent.UniversalAppPolicy)

return function(p1, CatalogPremiumCategory)
	-- upvalues: SduiPolicyFieldKeyModule (copy)
	if CatalogPremiumCategory == SduiPolicyFieldKeyModule.SearchBar then
		return true, p1.getSearchBar()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameDetailsMorePage then
		return true, p1.getGameDetailsMorePage()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameDetailsSubtitle then
		return true, p1.getGameDetailsSubtitle()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameDetailsPlayWithFriends then
		return true, p1.getGameDetailsPlayWithFriends()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ShowGlobalCounters then
		return true, p1.getShowGlobalCounters()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoList then
		return true, p1.getGameInfoList()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GamePlaysAndRatings then
		return true, p1.getGamePlaysAndRatings()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameReportingDisabled then
		return true, p1.getGameReportingDisabled()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.RecommendedGames then
		return true, p1.getRecommendedGames()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.SocialLinks then
		return true, p1.getSocialLinks()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.SocialGroupLinks then
		return true, p1.getSocialGroupLinks()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.CommunityLinksEnabled then
		return true, p1.getCommunityLinksEnabled()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowBadges then
		return true, p1.getGameInfoShowBadges()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowCreated then
		return true, p1.getGameInfoShowCreated()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowGamepasses then
		return true, p1.getGameInfoShowGamepasses()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowGenre then
		return true, p1.getGameInfoShowGenre()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowSubgenre then
		return true, p1.getGameInfoShowSubgenre()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowMaxPlayers then
		return true, p1.getGameInfoShowMaxPlayers()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowServers then
		return true, p1.getGameInfoShowServers()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowUpdated then
		return true, p1.getGameInfoShowUpdated()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowAgeRecommendation then
		return true, p1.getGameInfoShowAgeRecommendation()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowVoiceAndChatFeatures then
		return true, p1.getGameInfoShowVoiceAndChatFeatures()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoShowChatFeatures then
		return true, p1.getGameInfoShowChatFeatures()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoListDeveloper then
		return true, p1.getGameInfoListDeveloper()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.GameInfoListShowRNVDeveloper then
		return true, p1.getGameInfoListShowRNVDeveloper()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ShowPassesOnExperienceDetails then
		return true, p1.getShowPassesOnExperienceDetails()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.EnableAggregateLikesFavoritesCount then
		return true, p1.getEnableAggregateLikesFavoritesCount()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ExperienceDetailsNoticeType then
		return true, p1.getExperienceDetailsNoticeType()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.NotificationsCanReceiveExperience then
		return true, p1.getNotificationsCanReceiveExperience()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.InviteFriendsDisabled then
		return true, p1.getInviteFriendsDisabled()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.WebViewSupport then
		return true, p1.getWebViewSupport()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.UseRoundedCorners then
		return true, p1.getUseRoundedCorners()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.RenameFriendsToConnections then
		return true, p1.getRenameFriendsToConnections()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.UseLuafiedReportFlow then
		return true, p1.getUseLuafiedReportFlow()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ExperienceInviteShareLinkEnabled then
		return true, p1.getExperienceInviteShareLinkEnabled()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ExperienceChatAvailability then
		return true, p1.getExperienceChatAvailability()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.DisableIAPEntryPoint then
		return true, p1.getDisableIAPEntryPoint()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.PurchasePromptIncludingWarning then
		return true, p1.getPurchasePromptIncludingWarning()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.DisableResellingCollectiblesForCompliance then
		return true, p1.getDisableResellingCollectiblesForCompliance()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.CatalogPremiumCategory then
		return true, p1.getCatalogPremiumCategory()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.CatalogPremiumContent then
		return true, p1.getShowCatalogPremiumContent()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ShowVNGTosForRobuxUpsell then
		return true, p1.getShowVNGTosForRobuxUpsell()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.ShouldUseDMCCALegalDisclosureInApp then
		return true, p1.getShouldUseDMCCALegalDisclosureInApp()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.RedirectBuyRobuxToVNG then
		return true, p1.getRedirectBuyRobuxToVNG()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.RobuxUpsellFlowMobile then
		return true, p1.getRobuxUpsellFlowMobile()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.EnablePremiumUserFeatures then
		return true, p1.getEnablePremiumUserFeatures()
	elseif CatalogPremiumCategory == SduiPolicyFieldKeyModule.DisablePremiumEntrypoint then
		return true, p1.getDisablePremiumEntrypoint()
	else
		return false, nil
	end
end