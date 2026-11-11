local CorePackages = game:GetService("CorePackages")
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local SduiOmniFeedItem = ServerDrivenUiModule.SduiOmniFeedItem
local SduiV2OmniFeedItem = ServerDrivenUiModule.SduiV2OmniFeedItem
local OmniFeedTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local GameCarouselFeedItem = Modules.Personalization.OmniFeed.FeedItems.GameCarouselFeedItem
local SongCarouselFeedItem = Modules.Personalization.OmniFeed.FeedItems.SongCarouselFeedItem
local HomeGameGridFlexFeedItem = Modules.Personalization.OmniFeed.FeedItems.HomeGameGridFlexFeedItem
local SearchGameGridFeedItem = Modules.Personalization.OmniFeed.FeedItems.SearchGameGridFeedItem
local SearchTextFeedItem = Modules.Personalization.OmniFeed.FeedItems.SearchTextFeedItem
local GameFiltersFeedItem = Modules.Personalization.OmniFeed.FeedItems.GameFiltersFeedItem
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local UserInfoFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.UserInfoFeedItem)
local FriendCarouselFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.FriendCarouselFeedItem.FriendCarouselFeedItem)
local JoinYourFriendsFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.JoinYourFriendsFeedItem)
local FriendRecommendationCarouselFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.FriendRecommendationCarouselFeedItem)
local UserSearchGridFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.UserSearchGridFeedItem)
local UpsellCardFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.UpsellCardFeedItem)
local SearchPillCarouselFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.SearchPillCarouselFeedItem)
local PromptsFeedItemModule = require(Modules1.Personalization.OmniFeed.FeedItems.PromptsFeedItem)
local FFlagSearchOmniAutocompletePage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagEnableTopSongsSort = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableTopSongsSort
local FFlagHomePagePromptsHandlerEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHomePagePromptsHandlerEnabled
local FFlagEnableSduiV2HomeInterleave = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSduiV2HomeInterleave
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild

local function GetComponent(AvatarCarousel)
	-- upvalues: OmniFeedTypes (copy), GameCarouselFeedItem (copy), FFlagEnableTopSongsSort (copy), SongCarouselFeedItem (copy), IsSubjectToDesktopPoliciesFunction (copy), IsVRAppBuildFunction (copy), UserInfoFeedItemModule (copy), JoinYourFriendsFeedItemModule (copy), FriendCarouselFeedItemModule (copy), SduiOmniFeedItem (copy), FFlagEnableSduiV2HomeInterleave (copy), SduiV2OmniFeedItem (copy), FriendRecommendationCarouselFeedItemModule (copy), HomeGameGridFlexFeedItem (copy), SearchGameGridFeedItem (copy), SearchTextFeedItem (copy), UpsellCardFeedItemModule (copy), FFlagHomePagePromptsHandlerEnabled (copy), PromptsFeedItemModule (copy), UserSearchGridFeedItemModule (copy), GameFiltersFeedItem (copy), FFlagSearchOmniAutocompletePage (copy), SearchPillCarouselFeedItemModule (copy)
	if AvatarCarousel == OmniFeedTypes.Carousel then
		return GameCarouselFeedItem
	elseif FFlagEnableTopSongsSort and AvatarCarousel == OmniFeedTypes.SongCarousel then
		return SongCarouselFeedItem
	elseif AvatarCarousel == OmniFeedTypes.UserInfo then
		return if (IsSubjectToDesktopPoliciesFunction() or IsVRAppBuildFunction()) and not _G.__TESTEZ_RUNNING_TEST__ then nil else UserInfoFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.JoinYourFriendsCarousel then
		return JoinYourFriendsFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.FriendCarousel then
		return FriendCarouselFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.AvatarCarousel then
		warn("AvatarCarousel is not currently supported on the client")
		
		return nil
	elseif AvatarCarousel == OmniFeedTypes.ServerDrivenUi then
		return SduiOmniFeedItem
	elseif FFlagEnableSduiV2HomeInterleave and AvatarCarousel == OmniFeedTypes.ServerDrivenUiV2 then
		return SduiV2OmniFeedItem
	elseif AvatarCarousel == OmniFeedTypes.FriendRecommendationCarousel then
		return FriendRecommendationCarouselFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.HomeGameGrid then
		return HomeGameGridFlexFeedItem
	elseif AvatarCarousel == OmniFeedTypes.GenreExplorer then
		warn("GenreExplorer is not currently supported on the client")
		
		return nil
	elseif AvatarCarousel == OmniFeedTypes.SearchGameGrid then
		return SearchGameGridFeedItem
	elseif AvatarCarousel == OmniFeedTypes.SearchText then
		return SearchTextFeedItem
	elseif AvatarCarousel == OmniFeedTypes.UpsellCard then
		return UpsellCardFeedItemModule
	elseif FFlagHomePagePromptsHandlerEnabled and AvatarCarousel == OmniFeedTypes.Prompts then
		return PromptsFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.UserSearchGrid then
		return UserSearchGridFeedItemModule
	elseif AvatarCarousel == OmniFeedTypes.Pills then
		return GameFiltersFeedItem
	elseif FFlagSearchOmniAutocompletePage and AvatarCarousel == OmniFeedTypes.SearchPillCarousel then
		return SearchPillCarouselFeedItemModule
	else
		warn("Unmapped omni feed item type: " .. tostring(AvatarCarousel))
		
		return nil
	end
end

return {
	getComponent = GetComponent,
	hasComponent = function(p1): boolean
		-- upvalues: GetComponent (copy)
		return GetComponent(p1) ~= nil
	end
}