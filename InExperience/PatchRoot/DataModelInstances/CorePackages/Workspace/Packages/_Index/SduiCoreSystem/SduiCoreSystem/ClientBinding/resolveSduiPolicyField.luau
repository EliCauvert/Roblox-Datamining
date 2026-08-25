local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiPolicyFieldKeyModule = require(sduiCoreSystem.ClientBinding.SduiPolicyFieldKey)
local _ = require(sduiCoreSystem.Parent.UniversalAppPolicy)

return function(p0, p1)
	-- upvalues: sduiPolicyFieldKeyModule (ref)
	if p1 == sduiPolicyFieldKeyModule.SearchBar then
		return true, p0.getSearchBar()
	elseif p1 == sduiPolicyFieldKeyModule.GameDetailsMorePage then
		return true, p0.getGameDetailsMorePage()
	elseif p1 == sduiPolicyFieldKeyModule.GameDetailsSubtitle then
		return true, p0.getGameDetailsSubtitle()
	elseif p1 == sduiPolicyFieldKeyModule.GameDetailsPlayWithFriends then
		return true, p0.getGameDetailsPlayWithFriends()
	elseif p1 == sduiPolicyFieldKeyModule.ShowGlobalCounters then
		return true, p0.getShowGlobalCounters()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoList then
		return true, p0.getGameInfoList()
	elseif p1 == sduiPolicyFieldKeyModule.GamePlaysAndRatings then
		return true, p0.getGamePlaysAndRatings()
	elseif p1 == sduiPolicyFieldKeyModule.GameReportingDisabled then
		return true, p0.getGameReportingDisabled()
	elseif p1 == sduiPolicyFieldKeyModule.RecommendedGames then
		return true, p0.getRecommendedGames()
	elseif p1 == sduiPolicyFieldKeyModule.SocialLinks then
		return true, p0.getSocialLinks()
	elseif p1 == sduiPolicyFieldKeyModule.SocialGroupLinks then
		return true, p0.getSocialGroupLinks()
	elseif p1 == sduiPolicyFieldKeyModule.CommunityLinksEnabled then
		return true, p0.getCommunityLinksEnabled()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowBadges then
		return true, p0.getGameInfoShowBadges()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowCreated then
		return true, p0.getGameInfoShowCreated()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowGamepasses then
		return true, p0.getGameInfoShowGamepasses()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowGenre then
		return true, p0.getGameInfoShowGenre()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowSubgenre then
		return true, p0.getGameInfoShowSubgenre()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowMaxPlayers then
		return true, p0.getGameInfoShowMaxPlayers()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowServers then
		return true, p0.getGameInfoShowServers()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowUpdated then
		return true, p0.getGameInfoShowUpdated()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowAgeRecommendation then
		return true, p0.getGameInfoShowAgeRecommendation()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowVoiceAndChatFeatures then
		return true, p0.getGameInfoShowVoiceAndChatFeatures()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoShowChatFeatures then
		return true, p0.getGameInfoShowChatFeatures()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoListDeveloper then
		return true, p0.getGameInfoListDeveloper()
	elseif p1 == sduiPolicyFieldKeyModule.GameInfoListShowRNVDeveloper then
		return true, p0.getGameInfoListShowRNVDeveloper()
	elseif p1 == sduiPolicyFieldKeyModule.ShowPassesOnExperienceDetails then
		return true, p0.getShowPassesOnExperienceDetails()
	elseif p1 == sduiPolicyFieldKeyModule.EnableAggregateLikesFavoritesCount then
		return true, p0.getEnableAggregateLikesFavoritesCount()
	elseif p1 == sduiPolicyFieldKeyModule.ExperienceDetailsNoticeType then
		return true, p0.getExperienceDetailsNoticeType()
	elseif p1 == sduiPolicyFieldKeyModule.NotificationsCanReceiveExperience then
		return true, p0.getNotificationsCanReceiveExperience()
	elseif p1 == sduiPolicyFieldKeyModule.InviteFriendsDisabled then
		return true, p0.getInviteFriendsDisabled()
	elseif p1 == sduiPolicyFieldKeyModule.WebViewSupport then
		return true, p0.getWebViewSupport()
	elseif p1 == sduiPolicyFieldKeyModule.UseRoundedCorners then
		return true, p0.getUseRoundedCorners()
	elseif p1 == sduiPolicyFieldKeyModule.RenameFriendsToConnections then
		return true, p0.getRenameFriendsToConnections()
	elseif p1 == sduiPolicyFieldKeyModule.UseLuafiedReportFlow then
		return true, p0.getUseLuafiedReportFlow()
	elseif p1 == sduiPolicyFieldKeyModule.ExperienceInviteShareLinkEnabled then
		return true, p0.getExperienceInviteShareLinkEnabled()
	elseif p1 == sduiPolicyFieldKeyModule.ExperienceChatAvailability then
		return true, p0.getExperienceChatAvailability()
	elseif p1 == sduiPolicyFieldKeyModule.DisableIAPEntryPoint then
		return true, p0.getDisableIAPEntryPoint()
	elseif p1 == sduiPolicyFieldKeyModule.PurchasePromptIncludingWarning then
		return true, p0.getPurchasePromptIncludingWarning()
	elseif p1 == sduiPolicyFieldKeyModule.DisableResellingCollectiblesForCompliance then
		return true, p0.getDisableResellingCollectiblesForCompliance()
	elseif p1 == sduiPolicyFieldKeyModule.CatalogPremiumCategory then
		return true, p0.getCatalogPremiumCategory()
	elseif p1 == sduiPolicyFieldKeyModule.CatalogPremiumContent then
		return true, p0.getShowCatalogPremiumContent()
	elseif p1 == sduiPolicyFieldKeyModule.ShowVNGTosForRobuxUpsell then
		return true, p0.getShowVNGTosForRobuxUpsell()
	elseif p1 == sduiPolicyFieldKeyModule.ShouldUseDMCCALegalDisclosureInApp then
		return true, p0.getShouldUseDMCCALegalDisclosureInApp()
	elseif p1 == sduiPolicyFieldKeyModule.RedirectBuyRobuxToVNG then
		return true, p0.getRedirectBuyRobuxToVNG()
	elseif p1 == sduiPolicyFieldKeyModule.RobuxUpsellFlowMobile then
		return true, p0.getRobuxUpsellFlowMobile()
	elseif p1 == sduiPolicyFieldKeyModule.EnablePremiumUserFeatures then
		return true, p0.getEnablePremiumUserFeatures()
	elseif p1 == sduiPolicyFieldKeyModule.DisablePremiumEntrypoint then
		return true, p0.getDisablePremiumEntrypoint()
	end
	return false, nil
end