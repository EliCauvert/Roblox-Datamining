local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiPolicyFieldKeyModule = require(sduiCoreSystem.ClientBinding.SduiPolicyFieldKey)
local _ = require(sduiCoreSystem.Parent.UniversalAppPolicy)

return function(p1, p2)
	-- upvalues: sduiPolicyFieldKeyModule (ref)
	if p2 == sduiPolicyFieldKeyModule.SearchBar then
		return true, p1.getSearchBar()
	elseif p2 == sduiPolicyFieldKeyModule.GameDetailsMorePage then
		return true, p1.getGameDetailsMorePage()
	elseif p2 == sduiPolicyFieldKeyModule.GameDetailsSubtitle then
		return true, p1.getGameDetailsSubtitle()
	elseif p2 == sduiPolicyFieldKeyModule.GameDetailsPlayWithFriends then
		return true, p1.getGameDetailsPlayWithFriends()
	elseif p2 == sduiPolicyFieldKeyModule.ShowGlobalCounters then
		return true, p1.getShowGlobalCounters()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoList then
		return true, p1.getGameInfoList()
	elseif p2 == sduiPolicyFieldKeyModule.GamePlaysAndRatings then
		return true, p1.getGamePlaysAndRatings()
	elseif p2 == sduiPolicyFieldKeyModule.GameReportingDisabled then
		return true, p1.getGameReportingDisabled()
	elseif p2 == sduiPolicyFieldKeyModule.RecommendedGames then
		return true, p1.getRecommendedGames()
	elseif p2 == sduiPolicyFieldKeyModule.SocialLinks then
		return true, p1.getSocialLinks()
	elseif p2 == sduiPolicyFieldKeyModule.SocialGroupLinks then
		return true, p1.getSocialGroupLinks()
	elseif p2 == sduiPolicyFieldKeyModule.CommunityLinksEnabled then
		return true, p1.getCommunityLinksEnabled()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowBadges then
		return true, p1.getGameInfoShowBadges()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowCreated then
		return true, p1.getGameInfoShowCreated()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowGamepasses then
		return true, p1.getGameInfoShowGamepasses()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowGenre then
		return true, p1.getGameInfoShowGenre()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowSubgenre then
		return true, p1.getGameInfoShowSubgenre()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowMaxPlayers then
		return true, p1.getGameInfoShowMaxPlayers()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowServers then
		return true, p1.getGameInfoShowServers()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowUpdated then
		return true, p1.getGameInfoShowUpdated()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowAgeRecommendation then
		return true, p1.getGameInfoShowAgeRecommendation()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowVoiceAndChatFeatures then
		return true, p1.getGameInfoShowVoiceAndChatFeatures()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoShowChatFeatures then
		return true, p1.getGameInfoShowChatFeatures()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoListDeveloper then
		return true, p1.getGameInfoListDeveloper()
	elseif p2 == sduiPolicyFieldKeyModule.GameInfoListShowRNVDeveloper then
		return true, p1.getGameInfoListShowRNVDeveloper()
	elseif p2 == sduiPolicyFieldKeyModule.ShowPassesOnExperienceDetails then
		return true, p1.getShowPassesOnExperienceDetails()
	elseif p2 == sduiPolicyFieldKeyModule.EnableAggregateLikesFavoritesCount then
		return true, p1.getEnableAggregateLikesFavoritesCount()
	elseif p2 == sduiPolicyFieldKeyModule.ExperienceDetailsNoticeType then
		return true, p1.getExperienceDetailsNoticeType()
	elseif p2 == sduiPolicyFieldKeyModule.NotificationsCanReceiveExperience then
		return true, p1.getNotificationsCanReceiveExperience()
	elseif p2 == sduiPolicyFieldKeyModule.InviteFriendsDisabled then
		return true, p1.getInviteFriendsDisabled()
	elseif p2 == sduiPolicyFieldKeyModule.WebViewSupport then
		return true, p1.getWebViewSupport()
	elseif p2 == sduiPolicyFieldKeyModule.UseRoundedCorners then
		return true, p1.getUseRoundedCorners()
	elseif p2 == sduiPolicyFieldKeyModule.RenameFriendsToConnections then
		return true, p1.getRenameFriendsToConnections()
	elseif p2 == sduiPolicyFieldKeyModule.UseLuafiedReportFlow then
		return true, p1.getUseLuafiedReportFlow()
	elseif p2 == sduiPolicyFieldKeyModule.ExperienceInviteShareLinkEnabled then
		return true, p1.getExperienceInviteShareLinkEnabled()
	elseif p2 == sduiPolicyFieldKeyModule.ExperienceChatAvailability then
		return true, p1.getExperienceChatAvailability()
	elseif p2 == sduiPolicyFieldKeyModule.DisableIAPEntryPoint then
		return true, p1.getDisableIAPEntryPoint()
	elseif p2 == sduiPolicyFieldKeyModule.PurchasePromptIncludingWarning then
		return true, p1.getPurchasePromptIncludingWarning()
	elseif p2 == sduiPolicyFieldKeyModule.DisableResellingCollectiblesForCompliance then
		return true, p1.getDisableResellingCollectiblesForCompliance()
	elseif p2 == sduiPolicyFieldKeyModule.CatalogPremiumCategory then
		return true, p1.getCatalogPremiumCategory()
	elseif p2 == sduiPolicyFieldKeyModule.CatalogPremiumContent then
		return true, p1.getShowCatalogPremiumContent()
	elseif p2 == sduiPolicyFieldKeyModule.ShowVNGTosForRobuxUpsell then
		return true, p1.getShowVNGTosForRobuxUpsell()
	elseif p2 == sduiPolicyFieldKeyModule.ShouldUseDMCCALegalDisclosureInApp then
		return true, p1.getShouldUseDMCCALegalDisclosureInApp()
	elseif p2 == sduiPolicyFieldKeyModule.RedirectBuyRobuxToVNG then
		return true, p1.getRedirectBuyRobuxToVNG()
	elseif p2 == sduiPolicyFieldKeyModule.RobuxUpsellFlowMobile then
		return true, p1.getRobuxUpsellFlowMobile()
	elseif p2 == sduiPolicyFieldKeyModule.EnablePremiumUserFeatures then
		return true, p1.getEnablePremiumUserFeatures()
	elseif p2 == sduiPolicyFieldKeyModule.DisablePremiumEntrypoint then
		return true, p1.getDisablePremiumEntrypoint()
	end
	return false, nil
end