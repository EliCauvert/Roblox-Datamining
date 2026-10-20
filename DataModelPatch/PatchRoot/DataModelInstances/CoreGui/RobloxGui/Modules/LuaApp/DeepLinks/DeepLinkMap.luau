local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ExperienceService = require(CorePackages.Workspace.Packages.ExperienceService).ExperienceService
local GamesMultigetPlaceDetailsFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GamesByPlaceId.GamesMultigetPlaceDetails
local Default = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local AppPageModule = require(Modules.LuaApp.AppPage)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CreateConversationFunction = require(CorePackages.Workspace.Packages.AppChatNetworking).http.CreateConversation
local LogGameDetailsDeepLinkEventModule = require(script.Parent.logGameDetailsDeepLinkEvent)
local LogWidgetClickedModule = require(script.Parent.logWidgetClicked)
local LogLockScreenWidgetClickedModule = require(script.Parent.logLockScreenWidgetClicked)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local ShareLinkTypesModule = require(Modules.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local UrlBaseModule = require(Modules.LuaApp.Http.UrlBase)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local UseGameDetailsPeekViewFunction = require(CorePackages.Workspace.Packages.GameDetail).PeekView.UseGameDetailsPeekView
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local Constants = require(CorePackages.Workspace.Packages.ContactImporter).Constants
local UpsellEntrySurfaceType = require(CorePackages.Workspace.Packages.SocialUpsell).Analytics.Enum.UpsellEntrySurfaceType
local ContactImporterModalInfo = require(CorePackages.Workspace.Packages.ContactImporter).Utils.contactImporterModalInfo
local ExternalWebUrlNavigationHelperModule = require(Modules.LuaApp.DeepLinks.Utils.ExternalWebUrlNavigationHelper)
local SortIdMapperModule = require(Modules.LuaApp.DeepLinks.Utils.SortIdMapper)
local HardwareSafeAreaInsets = require(CorePackages.Workspace.Packages.Responsive).HardwareSafeAreaInsets
local StreamNotificationStore = require(CorePackages.Workspace.Packages.StreamNotifications).StreamNotificationStore
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local HandleShareLinkRootModule = require(script.Parent.ShareLinks.handleShareLinkRoot)
local HandleStaticShareLinkModule = require(script.Parent.ShareLinks.StaticLinks.handleStaticShareLink)
local HandleJoinLinkModule = require(script.Parent.ShareLinks.handleJoinLink)
local LocalPlayer = game:GetService("Players").LocalPlayer
local EnablePrivacySettingsDeeplinks = game:DefineFastFlag("EnablePrivacySettingsDeeplinks", false)
local EnableParentalControlsDeeplinks = game:DefineFastFlag("EnableParentalControlsDeeplinks", false)
local EnableAccountInfoDeeplinks = game:DefineFastFlag("EnableAccountInfoDeeplinks", false)
game:SetFlagVersion("EnableDevicePreferencesDeeplink", 2)
local EnableDevicePreferencesDeeplink = game:DefineFastFlag("EnableDevicePreferencesDeeplink", false)
local EnableSettingSubpageDeeplinks = game:DefineFastFlag("EnableSettingSubpageDeeplinks", false)
local EnableNotificationSettingsTypeDeeplink = game:DefineFastFlag("EnableNotificationSettingsTypeDeeplink", false)
local GetFFlagEnableSecurityAlertDeeplinkFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSecurityAlertDeeplink
local GetFFlagGenerateLinkWithChannelFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGenerateLinkWithChannel
local FFlagQRCodeItemRedemptionEnabledModule = require(Modules.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableGiftCardsDeepLinkModule = require(Modules.LuaApp.Flags.GetFFlagEnableGiftCardsDeepLink)
local EnableBuyRobuxDeepLink = game:DefineFastFlag("EnableBuyRobuxDeepLink", false)
local FFlagEnableCurrencyTransferDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCurrencyTransferDeepLink
local FFlagCurrencyTransferDeepLinkValidateSender = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCurrencyTransferDeepLinkValidateSender
local FFlagEnablePlusUpsellDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlusUpsellDeepLink
local GetFFlagEnableMessagesDeepLinkModule = require(Modules.LuaApp.Flags.GetFFlagEnableMessagesDeepLink)
local FFlagLuaAppForumsDeeplinkFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppForumsDeeplinkFix
local EnableBundleItemDetailHttpLink = game:DefineFastFlag("EnableBundleItemDetailHttpLink", false)
local EnableEmptyContainerWidgetDeepLink = game:DefineFastFlag("EnableEmptyContainerWidgetDeepLink", false)
local FFlagEnableLookDetailsDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableLookDetailsDeepLink)
local FFlagEnableCatalogSearchDeepLinksModule = require(Modules.LuaApp.Flags.FFlagEnableCatalogSearchDeepLinks)
local FFlagEnableSearchDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableSearchDeepLink)
local FFlagEnableProfilePictureEditorDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink)
local FFlagEnableShareLinksInGameDetailEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent
local GetFFlagLuaAppFixStudioNotchSupportModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport)
local GetFFlagUseCommunitiesTranslationFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseCommunitiesTranslation
local GetFFlagEnableSupportCenterFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableSupportCenter
local FFlagAXEnableCatalogCreatorHttpLinkModule = require(Modules.LuaApp.Flags.FFlagAXEnableCatalogCreatorHttpLink)
local FFlagEnableSquadDeeplinkWithChatId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSquadDeeplinkWithChatId
local FFlagLuaAppSortDeeplinkFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix
local FFlagEnableAmpWizardDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLink
local FFlagEnableAccountUnlockDeepLink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAccountUnlockDeepLink
local FFlagAccountUnlockAllowMissingUserId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAccountUnlockAllowMissingUserId
local FFlagEnableAmpWizardDeepLinkValidateUserId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLinkValidateUserId
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagCiDeprecateFindFriendsModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal
local FFlagEnableNotificationsDeeplink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNotificationsDeeplink
local FFlagStreamNotificationDropdownSingleOwner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagStreamNotificationDropdownSingleOwner
local FFlagTCParentChildAutoUpgrade = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCParentChildAutoUpgrade
local FFlagLuaAppSduiLandingPageEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiLandingPageEnabled
local FFlagAppNavMyStatsTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppNavMyStatsTab
local FFlagLuaEnableGenreLandingDeeplink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableGenreLandingDeeplink
local FFlagLuaEnableGenreDeeplinkSortId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableGenreDeeplinkSortId
local FFlagEnableSchoolEntry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSchoolEntry
game:DefineFastString("SearchDeepLinkPattern", "roblox.*://navigation/search.*")
game:DefineFastString("GamesPageDeepLinkPattern", "roblox.*://navigation/games")
game:DefineFastString("HomePageDeepLinkPattern", "roblox.*://navigation/home")
game:DefineFastString("BuildPageDeepLinkPattern", "roblox.*://navigation/build.*")
game:DefineFastString("AvatarClothingSortingView", "roblox.*://navigation/avatar_clothing_sort")
game:DefineFastString("AvatarProfilePictureEditor", "roblox.*://navigation/avatar_profile_picture_editor")
game:DefineFastString("AvatarDeepLinkPattern", "roblox.*://navigation/avatar.*")
game:DefineFastString("AvatarHttpPattern", "/my/avatar")
game:DefineFastString("MorePageDeepLinkPattern", "roblox.*://navigation/more")
game:DefineFastString("NotificationsDeepLinkPattern", "roblox.*://navigation/notifications")
game:DefineFastString("NotificationSettingsDeepLinkPattern", "roblox.*://navigation/notification_settings.*")
game:DefineFastString("RoactChatDeepLinkPattern", "roblox.*://navigation/chat.*")
game:DefineFastString("GameDetailsDeepLinkPattern", "roblox.*://navigation/game_details.*")
game:DefineFastString("GameDetailsHttpPattern", "/games/(%d+)/?[%w_-]*%??r?e?f?P?a?g?e?I?d?=?[%w%-]*")
game:DefineFastString("GameDetailsReferralHttpPattern", "/games/refer.*")
game:DefineFastString("ProfileCardDeepLinkPattern", "roblox.*://navigation/profile_card.*")
game:DefineFastString("ProfileTrustedFriendsDeepLinkPattern", "roblox.*://navigation/profile_trustedfriends.*")
game:DefineFastString("ProfileDeepLinkPattern", "roblox.*://navigation/profile.*")
game:DefineFastString("CatalogSearchDeepLinkPattern", "roblox.*://navigation/catalog?.+")
game:DefineFastString("CatalogEquipDeepLinkPattern", "roblox.*://navigation/catalog/equip?.+")
game:DefineFastString("CatalogDeepLinkPattern", "roblox.*://navigation/catalog")
game:DefineFastString("CatalogHttpPattern", "/catalog[^/]*")
game:DefineFastString("ItemDetailsDeepLinkPattern", "roblox.*://navigation/item_details.*")
game:DefineFastString("ItemDetailsHttpPattern", "/catalog/(%d+)/.*")
game:DefineFastString("BundleItemDetailsHttpPattern", "/bundles/(%d+)/.*")
game:DefineFastString("LookItemDetailsHttpPattern", "/looks/(%d+)/.*")
game:DefineFastString("ItemRedemptionDeepLinkPattern", "roblox.*://navigation/qr_code_redemption.*")

if EnableSettingSubpageDeeplinks then
	game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends$")
else
	game:DefineFastString("FriendsPageDeepLinkPattern", "roblox.*://navigation/friends")
end
game:DefineFastString("GiftCardsPageDeepLinkPattern", "roblox.*://navigation/gift_cards")
game:DefineFastString("BuyRobuxDeepLinkPattern", "roblox.*://navigation/buy_robux")
game:DefineFastString("PlusUpsellDeepLinkPattern", "roblox.*://navigation/plus_upsell")
game:DefineFastString("CurrencyTransferDeepLinkPattern", "roblox.*://navigation/currency_transfer.*")
game:DefineFastString("GroupsDeepLinkPattern", "roblox.*://navigation/group.*")
game:DefineFastString("CrossDeviceLoginDeepLinkPattern", "roblox.*://navigation/crossdevice.*")
game:DefineFastString("EventDetailsPageDeepLinkPattern", "roblox.*://navigation/event_details.*")
game:DefineFastString("ShareLinkDeepLinkPattern", "roblox.*://navigation/share_links.*")
game:DefineFastString("StaticShareLinkDeepLinkPattern", "roblox.*://navigation/share_links/(%w)/([%w%-]+).*")
game:DefineFastString("JoinLinkHttpPattern", "/join/([%w]+).*")
game:DefineFastString("ShareLinkHttpPattern", "/share.*")
game:DefineFastString("StaticShareLinkHttpPattern", "/share/(%w)/([%w%-]+).*")
game:DefineFastString("ShortShareLinkHttpPattern", "/shortlink.*")
game:DefineFastString("ContentPostDeepLinkPattern", "roblox.*://navigation/content_post.*")
game:DefineFastString("AddSchoolDeepLinkPattern", "roblox.*://navigation/add_school")
game:DefineFastString("ContactsDeepLinkPattern", "roblox.*://navigation/contacts.*")
game:DefineFastString("AppealsPortalDeepLinkPattern", "roblox.*://navigation/appeals.*")
game:DefineFastString("SupportCenterDeepLinkPattern", "roblox.*://navigation/support_center.*")
game:DefineFastString("PrivacySettingsDeepLinkPattern", "roblox.*://navigation/privacy_settings")
game:DefineFastString("AppPermissionsSettingsDeepLinkPattern", "roblox.*://navigation/app_permissions_settings")
game:DefineFastString("ScreentimeSettingsDeepLinkPattern", "roblox.*://navigation/screentime_subsettings")
game:DefineFastString("CommunicationSettingsDeepLinkPattern", "roblox.*://navigation/communication_subsettings")
game:DefineFastString("BlockedUsersSettingsDeepLinkPattern", "roblox.*://navigation/blocked_users_subsettings")
game:DefineFastString("BlockedExpSettingsDeepLinkPattern", "roblox.*://navigation/blocked_experiences_subsettings")
game:DefineFastString("ExperienceChatSettingsDeepLinkPattern", "roblox.*://navigation/experience_chat_subsettings")
game:DefineFastString("PartySettingsDeepLinkPattern", "roblox.*://navigation/party_subsettings")
game:DefineFastString("VoiceSettingsDeepLinkPattern", "roblox.*://navigation/voice_subsettings")
game:DefineFastString("TradingInventorySettingsDeepLinkPattern", "roblox.*://navigation/trading_inventory_subsettings")
game:DefineFastString("PrivateServerSettingsDeepLinkPattern", "roblox.*://navigation/private_server_subsettings")
game:DefineFastString("FriendsContactsSettingsDeepLinkPattern", "roblox.*://navigation/friends_contacts_subsettings")
game:DefineFastString("VisibilitySettingsDeepLinkPattern", "roblox.*://navigation/visibility_subsettings")
game:DefineFastString("ParentalControlsDeepLinkPattern", "roblox.*://navigation/parental_controls")
game:DefineFastString("AccountInfoDeepLinkPattern", "roblox.*://navigation/account_info")
game:DefineFastString("SpendingSettingsDeepLinkPattern", "roblox.*://navigation/spending_settings")
game:DefineFastString("ExternalWebUrlDeepLinkPattern", "roblox.*://navigation/external_web_link.*")
game:DefineFastString("SecurityAlertDeepLinkPattern", "roblox.*://navigation/security_alert.*")
game:DefineFastString("ExperienceSortDeepLinkPattern", "roblox.*://navigation/experience_sort.*")
game:DefineFastString("SquadLobbyDeepLinkPattern", "roblox.*://navigation/party.*")
game:DefineFastString("EnterAppFromWidget", "roblox.*://open/widget.*")
game:DefineFastString("EnterAppFromLockScreenWidget", "roblox.*://open/lock_screen_widget")
game:DefineFastString("DevicePreferencesDeepLinkPattern", "roblox.*://navigation/device_preferences")
game:DefineFastString("FAEDeepLinkPattern", "roblox.*://navigation/fae.*")
game:DefineFastString("FAEUpsellOverlayDeepLinkPattern", "roblox.*://navigation/fae_upsell_overlay.*")
game:DefineFastString("AmpWizardDeepLinkPattern", "roblox.*://navigation/amp_wizard.*")
game:DefineFastString("AccountUnlockDeepLinkPattern", "roblox.*://navigation/account_unlock.*")
game:DefineFastString("SystemMessageDeepLinkPattern", "roblox.*://navigation/messages.*")
game:DefineFastString("LuaExtraHttpLinkBases", "")
game:DefineFastFlag("EnableExternalWebDeeplink", false)
game:DefineFastFlag("EnableJoinLinkWebDeepLink", false)
local Parts = string.split(game:GetFastString("LuaExtraHttpLinkBases"), ",")
local List = {}
local config1 = {
	notifstream = UpsellEntrySurfaceType.NotifStream,
	notifpush = UpsellEntrySurfaceType.NotifPush
}

local function _(Text: string, p1)
	-- upvalues: List (copy), Default (copy)
	table.insert(List, { Text, p1 })
	Default:registerURL((Text:gsub("%%", "\\")))
end

local function addHttpMapping(Text, p1)
	-- upvalues: UrlBaseModule (copy), List (copy), Default (copy), Parts (copy)
	for _, value in pairs({ "www", "web", "" }) do
		local NewUrlBase = UrlBaseModule.new(value, { secure = false })
		local Text1 = UrlBaseModule.new(value) .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. Text
		table.insert(List, { Text1, p1 })
		Default:registerURL((Text1:gsub("%%", "\\")))
		local Text2 = NewUrlBase .. "(/[A-Za-z][A-Za-z](%-[A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]?)?)?" .. Text
		table.insert(List, { Text2, p1 })
		Default:registerURL((Text2:gsub("%%", "\\")))
	end
	for _, part in ipairs(Parts) do
		local Text3 = part .. Text
		table.insert(List, { Text3, p1 })
		Default:registerURL((Text3:gsub("%%", "\\")))
	end
end

local function buildHistoryFromRoute(p2)
	local List = {}
	
	for i = 1, #p2 do
		local List1 = {}
		
		for i1 = 1, i do
			table.insert(List1, p2[i1])
		end
		table.insert(List, List1)
	end
	return List
end

if FFlagEnableSearchDeepLinkModule then
	local config = {
		games = SearchTypes.Games,
		players = SearchTypes.Players,
		topresults = SearchTypes.TopResults
	}
	local SearchDeepLinkPatternFastString: string = game:GetFastString("SearchDeepLinkPattern")
	table.insert(List, {
		SearchDeepLinkPatternFastString,
		function(p3)
			-- upvalues: SearchUuidModule (copy), config (copy), SearchTypes (copy), AppPageModule (copy)
			local Keyword = p3.keyword or ""
			
			return {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.SearchPage,
						detail = SearchUuidModule(),
						extraProps = {
							searchKeyword = Keyword,
							searchType = config[string.lower(p3.type or "")] or SearchTypes.Games,
							omniSearchInfo = {
								omniSearchUuid = SearchUuidModule(),
								searchKeyword = Keyword
							}
						}
					}
				}
			}
		end
	})
	Default:registerURL((SearchDeepLinkPatternFastString:gsub("%%", "\\")))
end
local GamesPageDeepLinkPatternFastString: string = game:GetFastString("GamesPageDeepLinkPattern")
table.insert(List, {
	GamesPageDeepLinkPatternFastString,
	function()
		-- upvalues: AppPageModule (copy)
		return { { { name = AppPageModule.Games } } }
	end
})
Default:registerURL((GamesPageDeepLinkPatternFastString:gsub("%%", "\\")))
local HomePageDeepLinkPatternFastString: string = game:GetFastString("HomePageDeepLinkPattern")
table.insert(List, {
	HomePageDeepLinkPatternFastString,
	function()
		-- upvalues: AppPageModule (copy)
		return { { { name = AppPageModule.Home } } }
	end
})
Default:registerURL((HomePageDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagAppNavMyStatsTab then
	local BuildPageDeepLinkPatternFastString: string = game:GetFastString("BuildPageDeepLinkPattern")
	table.insert(List, {
		BuildPageDeepLinkPatternFastString,
		function(p3)
			-- upvalues: HttpService (copy), AppPageModule (copy)
			local Number: number? = tonumber(p3.universeid)
			local Sessionid = if p3.sessionid == "" then nil else p3.sessionid
			
			return {
				{
					{
						name = AppPageModule.MyStats,
						extraProps = if Number == nil and Sessionid == nil then nil else {
							universeId = Number,
							sessionId = Sessionid,
							resumeRequestId = HttpService:GenerateGUID(false)
						}
					}
				}
			}
		end
	})
	Default:registerURL((BuildPageDeepLinkPatternFastString:gsub("%%", "\\")))
end
if FFlagLuaAppSduiLandingPageEnabled then
	game:DefineFastString("SduiLandingPageDeepLinkPattern", "roblox.*://navigation/landing.*")
	local SduiLandingPageDeepLinkPatternFastString: string = game:GetFastString("SduiLandingPageDeepLinkPattern")
	table.insert(List, {
		SduiLandingPageDeepLinkPatternFastString,
		function(p3)
			-- upvalues: AppPageModule (copy)
			local Page = p3.page
			
			if Page == nil or Page == "" then return end
			return {
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.SduiLandingPage,
						detail = Page,
						extraProps = { pageIdentifier = Page }
					}
				}
			}
		end
	})
	Default:registerURL((SduiLandingPageDeepLinkPatternFastString:gsub("%%", "\\")))
end
if FFlagLuaAppSduiLandingPageEnabled and FFlagLuaEnableGenreLandingDeeplink then
	game:DefineFastString("GenreLandingDeepLinkPattern", "roblox.*://navigation/genre.*")
	local GenreLandingDeepLinkPatternFastString: string = game:GetFastString("GenreLandingDeepLinkPattern")
	table.insert(List, {
		GenreLandingDeepLinkPatternFastString,
		function(p3)
			-- upvalues: FFlagLuaEnableGenreDeeplinkSortId (copy), SortIdMapperModule (copy), AppPageModule (copy), FFlagLuaAppSortDeeplinkFix (copy)
			if FFlagLuaEnableGenreDeeplinkSortId and p3.sortid then
				local SortIdMapperModuleResult, SortIdMapperModuleResult2 = SortIdMapperModule(p3.sortid)
				
				return {
					{
						{ name = AppPageModule.Home },
						{
							name = if FFlagLuaAppSortDeeplinkFix then AppPageModule.DeeplinkGamesList else AppPageModule.GamesList,
							detail = SortIdMapperModuleResult,
							extraProps = {
								sortName = SortIdMapperModuleResult,
								pageContext = if FFlagLuaAppSortDeeplinkFix then nil else "Deeplink",
								isOmni = SortIdMapperModuleResult2,
								sortIndex = if FFlagLuaAppSortDeeplinkFix or not SortIdMapperModuleResult2 then nil else 1
							}
						}
					}
				}
			else
				local Page = p3.page
				
				return if Page == nil or Page == "" then { { { name = AppPageModule.Home } } } else {
					{
						{ name = AppPageModule.Home },
						{
							name = AppPageModule.SduiLandingPage,
							detail = Page,
							extraProps = { pageIdentifier = Page, genre = p3.genre }
						}
					}
				}
			end
		end
	})
	Default:registerURL((GenreLandingDeepLinkPatternFastString:gsub("%%", "\\")))
end
local AvatarClothingSortingViewFastString: string = game:GetFastString("AvatarClothingSortingView")
table.insert(List, {
	AvatarClothingSortingViewFastString,
	function()
		-- upvalues: AvatarScreen (copy)
		return {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{ name = AvatarScreen.LayeredClothingSort }
			}
		}
	end
})
Default:registerURL((AvatarClothingSortingViewFastString:gsub("%%", "\\")))

if FFlagEnableProfilePictureEditorDeepLinkModule then
	local AvatarProfilePictureEditorFastString: string = game:GetFastString("AvatarProfilePictureEditor")
	table.insert(List, {
		AvatarProfilePictureEditorFastString,
		function()
			-- upvalues: AvatarScreen (copy)
			return {
				{
					{ name = AvatarScreen.AvatarExperienceLandingPage },
					{ name = AvatarScreen.Catalog },
					{ name = AvatarScreen.ProfilePictureEditorEmotes }
				}
			}
		end
	})
	Default:registerURL((AvatarProfilePictureEditorFastString:gsub("%%", "\\")))
end
local AvatarDeepLinkPatternFastString: string = game:GetFastString("AvatarDeepLinkPattern")
table.insert(List, {
	AvatarDeepLinkPatternFastString,
	function(p3)
		-- upvalues: AvatarScreen (copy), UtilsModule (copy), ConstantsModule1 (copy), ConstantsModule (copy), buildHistoryFromRoute (copy)
		local List = {
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.AvatarEditor }
		}
		
		if p3.itemtype == "character" then
			local AvatarEditorCategory, AvatarEditorCategory2 = UtilsModule.findAvatarEditorCategory(ConstantsModule1.CharacterKey, ConstantsModule1.PurchasedCharacterKey)
			table.insert(List, {
				name = AvatarScreen.OutfitDetails,
				extraProps = {
					itemId = p3.itemid,
					category = AvatarEditorCategory,
					subcategory = AvatarEditorCategory2
				}
			})
		elseif p3.itemtype == "asset" then
			local CategoryIndicesFromAssetType, CategoryIndicesFromAssetType2 = UtilsModule.getCategoryIndicesFromAssetType(p3.itemsubtype)
			table.insert(List, {
				name = AvatarScreen.ItemDetails,
				extraProps = {
					mountAsFullView = true,
					itemId = p3.itemid,
					itemType = ConstantsModule.ItemType.Asset,
					category = CategoryIndicesFromAssetType,
					subcategory = CategoryIndicesFromAssetType2,
					opaquePage = AvatarScreen.AvatarEditor
				}
			})
		end
		return (buildHistoryFromRoute(List))
	end
})
Default:registerURL((AvatarDeepLinkPatternFastString:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("AvatarHttpPattern"), function(_, p3)
	-- upvalues: CryoModule (copy), AvatarScreen (copy)
	return CryoModule.List.join(p3.history, {
		{ { name = AvatarScreen.AvatarExperienceLandingPage } },
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.AvatarEditor }
		}
	})
end)
local MorePageDeepLinkPatternFastString: string = game:GetFastString("MorePageDeepLinkPattern")
table.insert(List, {
	MorePageDeepLinkPatternFastString,
	function()
		-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy)
		return {
			{
				{
					name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
				}
			}
		}
	end
})
Default:registerURL((MorePageDeepLinkPatternFastString:gsub("%%", "\\")))

local function subSettingsMapping(Detail, TitleKey)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy), TransitionAnimationModule (copy)
	return {
		{
			{
				name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
			}
		},
		{
			{
				name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
			},
			{ name = AppPageModule.Settings }
		},
		{
			{
				name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
			},
			{ name = AppPageModule.Settings },
			{
				name = AppPageModule.SettingsSubPage,
				detail = Detail,
				extraProps = {
					titleKey = TitleKey,
					transitionAnimation = TransitionAnimationModule.None
				}
			}
		}
	}
end

local NotificationSettingsDeepLinkPatternFastString: string = game:GetFastString("NotificationSettingsDeepLinkPattern")
table.insert(List, {
	NotificationSettingsDeepLinkPatternFastString,
	function(p3)
		-- upvalues: UrlBuilderModule (copy), EnableNotificationSettingsTypeDeeplink (copy), subSettingsMapping (copy)
		local NotificationsResult = UrlBuilderModule.static.settings.notifications()
		
		if EnableNotificationSettingsTypeDeeplink and p3 then
			local Category = if p3.category == "" then nil else p3.category
			local Type = if p3.type == "" then nil else p3.type
			
			if Category and Type then
				NotificationsResult ..= "/" .. Category .. "/" .. Type
			elseif Category then
				NotificationsResult ..= "/" .. Category
			end
		end
		return (subSettingsMapping(NotificationsResult, "Feature.AccountSettings.Heading.Tab.Notifications"))
	end
})
Default:registerURL((NotificationSettingsDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagEnableNotificationsDeeplink then
	local NotificationsDeepLinkPatternFastString: string = game:GetFastString("NotificationsDeepLinkPattern")
	table.insert(List, {
		NotificationsDeepLinkPatternFastString,
		function()
			-- upvalues: FFlagStreamNotificationDropdownSingleOwner (copy), StreamNotificationStore (copy)
			if FFlagStreamNotificationDropdownSingleOwner then
				StreamNotificationStore.setActiveBellId(StreamNotificationStore.PrimaryBellId)
			end
			StreamNotificationStore.setStreamPresented(true)
			
			return nil
		end
	})
	Default:registerURL((NotificationsDeepLinkPatternFastString:gsub("%%", "\\")))
end
local function getChatEntryPointEnum(Text: string)
	-- upvalues: ChatEntryPointNames (copy)
	if type(Text) ~= "string" then
		return ChatEntryPointNames.Unknown
	end
	for i, chatEntryPointName in pairs(ChatEntryPointNames) do
		if string.lower(i) == string.lower(Text) then
			return chatEntryPointName
		end
	end
	return ChatEntryPointNames.Unknown
end

local RoactChatDeepLinkPatternFastString: string = game:GetFastString("RoactChatDeepLinkPattern")
table.insert(List, {
	RoactChatDeepLinkPatternFastString,
	function(p3, p4)
		-- upvalues: getChatEntryPointEnum (copy), CreateConversationFunction (copy), AppPageModule (copy)
		local ExtraProps = { entryPoint = getChatEntryPointEnum(p3.entrypoint) }
		
		return if p3.chatid == nil and p3.userid ~= nil then CreateConversationFunction(p4.network, "one_to_one", { p3.userid }):andThen(function(Result)
			-- upvalues: AppPageModule (upval), ExtraProps (copy)
			return {
				{
					{
						name = AppPageModule.Chat,
						detail = tostring(Result.responseBody.conversations[1].id),
						extraProps = ExtraProps
					}
				}
			}
		end):catch(function()
			-- upvalues: AppPageModule (upval), ExtraProps (copy)
			return {
				{ { name = AppPageModule.Chat, extraProps = ExtraProps } }
			}
		end) else {
			{
				{
					name = AppPageModule.Chat,
					detail = p3.chatid,
					extraProps = ExtraProps
				}
			}
		}
	end
})
Default:registerURL((RoactChatDeepLinkPatternFastString:gsub("%%", "\\")))
local GameDetailsDeepLinkPatternFastString: string = game:GetFastString("GameDetailsDeepLinkPattern")
table.insert(List, {
	GameDetailsDeepLinkPatternFastString,
	function(p3)
		-- upvalues: AppPageModule (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy), GetFFlagLuaAppFixStudioNotchSupportModule (copy), HardwareSafeAreaInsets (copy), Workspace (copy), UseGameDetailsPeekViewFunction (copy), ArgCheckModule (copy)
		local GameDetail = AppPageModule.GameDetail
		
		if FFlagEnableShareLinksInGameDetailEvent then
			LogGameDetailsDeepLinkEventModule(p3.gameid, "GameDetailsDeeplink", {})
		else
			LogGameDetailsDeepLinkEventModule(p3.gameid, "GameDetailsDeeplink")
		end
		if p3.homeroot then
			local AbsoluteSize = if GetFFlagLuaAppFixStudioNotchSupportModule() then HardwareSafeAreaInsets.fullscreenGui().AbsoluteSize else Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize or Vector2.zero
			GameDetail = if AbsoluteSize.Y > AbsoluteSize.X and UseGameDetailsPeekViewFunction() then AppPageModule.GameDetail else AppPageModule.ExperienceDetail
			
			return {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = GameDetail,
						detail = ArgCheckModule.isNotNil(p3.gameid, "gameId"),
						extraProps = { mountAsFullView = false, mountAnimation = true }
					}
				}
			}
		else
			return {
				{ { name = AppPageModule.Games } },
				{
					{ name = AppPageModule.Games },
					{
						name = GameDetail,
						detail = ArgCheckModule.isNotNil(p3.gameid, "gameId"),
						extraProps = { mountAsFullView = true, mountAnimation = false }
					}
				}
			}
		end
	end
})
Default:registerURL((GameDetailsDeepLinkPatternFastString:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("GameDetailsHttpPattern"), function(PlaceId, p3, p4)
	-- upvalues: ShareLinkTypesModule (copy), ExperienceService (copy), AppPageModule (copy), GamesMultigetPlaceDetailsFunction (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy)
	if p3.privateserverlinkcode == nil then
		local GameDetail = AppPageModule.GameDetail
		
		return GamesMultigetPlaceDetailsFunction(p4.network, PlaceId):andThen(function(Result)
			-- upvalues: FFlagEnableShareLinksInGameDetailEvent (upval), LogGameDetailsDeepLinkEventModule (upval), AppPageModule (upval), GameDetail (copy)
			local Text = tostring(Result.responseBody[1].universeId)
			
			if FFlagEnableShareLinksInGameDetailEvent then
				LogGameDetailsDeepLinkEventModule(Text, "GameDetailsHTTPDeepLink", {})
			else
				LogGameDetailsDeepLinkEventModule(Text, "GameDetailsHTTPDeepLink")
			end
			return {
				{ { name = AppPageModule.Games } },
				{
					{ name = AppPageModule.Games },
					{
						name = GameDetail,
						detail = Text,
						extraProps = { mountAsFullView = true, mountAnimation = false }
					}
				}
			}
		end)
	else
		p4.analyticsImpls.shareLinksAnalytics.openAppViaShareLink({
			placeId = PlaceId,
			linkCode = p3.privateserverlinkcode,
			linkType = ShareLinkTypesModule.LongPrivateServerLink
		})
		ExperienceService:LaunchExperience({
			placeId = if type(PlaceId) == "number" then PlaceId else tonumber(PlaceId),
			linkCode = p3.privateserverlinkcode
		})
		
		return nil
	end
end)
addHttpMapping(game:GetFastString("GameDetailsReferralHttpPattern"), function(p3, p4)
	-- upvalues: ArgCheckModule (copy), AppPageModule (copy), GamesMultigetPlaceDetailsFunction (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy)
	local GameDetail = AppPageModule.GameDetail
	
	return GamesMultigetPlaceDetailsFunction(p4.network, (ArgCheckModule.isNotNil(p3.placeid, "placeid"))):andThen(function(Result)
		-- upvalues: FFlagEnableShareLinksInGameDetailEvent (upval), LogGameDetailsDeepLinkEventModule (upval), AppPageModule (upval), GameDetail (copy)
		local Text = tostring(Result.responseBody[1].universeId)
		
		if FFlagEnableShareLinksInGameDetailEvent then
			LogGameDetailsDeepLinkEventModule(Text, "GameDetailsHTTPReferralDeepLink", {})
		else
			LogGameDetailsDeepLinkEventModule(Text, "GameDetailsHTTPReferralDeepLink")
		end
		return {
			{ { name = AppPageModule.Games } },
			{
				{ name = AppPageModule.Games },
				{
					name = GameDetail,
					detail = Text,
					extraProps = { mountAsFullView = true, mountAnimation = false }
				}
			}
		}
	end)
end)
local ProfileCardDeepLinkPatternFastString: string = game:GetFastString("ProfileCardDeepLinkPattern")
table.insert(List, {
	ProfileCardDeepLinkPatternFastString,
	function(p3)
		-- upvalues: AppPageModule (copy), EnumsModule (copy)
		return {
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.ProfilePlatform,
					detail = p3.userid or "",
					extraProps = { source = EnumsModule.Sources.ProfileDeepLink }
				}
			}
		}
	end
})
Default:registerURL((ProfileCardDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagTCParentChildAutoUpgrade then
	local ProfileTrustedFriendsDeepLinkPatternFastString: string = game:GetFastString("ProfileTrustedFriendsDeepLinkPattern")
	table.insert(List, {
		ProfileTrustedFriendsDeepLinkPatternFastString,
		function(p3, _)
			-- upvalues: AppPageModule (copy), EnumsModule (copy)
			local Userid = p3.userid or ""
			
			return {
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.ProfilePlatform,
						detail = Userid,
						extraProps = { source = EnumsModule.Sources.ProfileDeepLink }
					},
					{
						name = AppPageModule.TrustedContactsModal,
						props = {
							source = "Deeplink_Profile_TrustedFriends",
							userId = Userid
						}
					}
				}
			}
		end
	})
	Default:registerURL((ProfileTrustedFriendsDeepLinkPatternFastString:gsub("%%", "\\")))
end
local ProfileDeepLinkPatternFastString: string = game:GetFastString("ProfileDeepLinkPattern")
table.insert(List, {
	ProfileDeepLinkPatternFastString,
	function(p3, p4)
		-- upvalues: ArgCheckModule (copy), UrlBuilderModule (copy), AppPageModule (copy), TransitionAnimationModule (copy)
		local UserId = ArgCheckModule.isNotNil(p3.userid, "userId")
		local Friendshipsourcetype = p3.friendshipsourcetype
		local ProfileResult = UrlBuilderModule.user.profile({ userId = UserId, sourceType = Friendshipsourcetype })
		
		if Friendshipsourcetype == "profileshare" then
			p4.analyticsImpls.socialProfileShareAnalytics.inviteePageLoad(UserId, "playerProfile")
		end
		return {
			{ { name = AppPageModule.Home } },
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.GenericWebPage,
					detail = ProfileResult,
					extraProps = {
						titleKey = "CommonUI.Features.Label.Profile",
						transitionAnimation = TransitionAnimationModule.None
					}
				}
			}
		}
	end
})
Default:registerURL((ProfileDeepLinkPatternFastString:gsub("%%", "\\")))
local GroupsDeepLinkPatternFastString: string = game:GetFastString("GroupsDeepLinkPattern")
table.insert(List, {
	GroupsDeepLinkPatternFastString,
	function(p3)
		-- upvalues: UrlBuilderModule (copy), ArgCheckModule (copy), FFlagLuaAppForumsDeeplinkFix (copy), AppPageModule (copy), GetFFlagUseCommunitiesTranslationFunction (copy), TransitionAnimationModule (copy)
		return {
			{ { name = AppPageModule.Home } },
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.GenericWebPage,
					detail = if p3.forumcategoryid and p3.forumcategoryid ~= "" and p3.forumpostid and p3.forumpostid ~= "" and p3.forumcommentid and p3.forumcommentid ~= "" then UrlBuilderModule.user.forumComment({
						groupId = ArgCheckModule.isNotNil(p3.groupid, "groupId"),
						categoryId = if FFlagLuaAppForumsDeeplinkFix then "category-" .. ArgCheckModule.isNotNil(p3.forumcategoryid, "categoryId") else ArgCheckModule.isNotNil(p3.forumcategoryid, "categoryId"),
						postId = if FFlagLuaAppForumsDeeplinkFix then "post-" .. ArgCheckModule.isNotNil(p3.forumpostid, "postId") else ArgCheckModule.isNotNil(p3.forumpostid, "postId"),
						commentId = ArgCheckModule.isNotNil(p3.forumcommentid, "commentId")
					}) else UrlBuilderModule.user.group({
						groupId = ArgCheckModule.isNotNil(p3.groupid, "groupId")
					}),
					extraProps = {
						titleKey = if GetFFlagUseCommunitiesTranslationFunction() then "CommonUI.Features.Label.Groups" else "CommonUI.Features.Label.sGroups",
						transitionAnimation = TransitionAnimationModule.None
					}
				}
			}
		}
	end
})
Default:registerURL((GroupsDeepLinkPatternFastString:gsub("%%", "\\")))
local ContactsDeepLinkPatternFastString: string = game:GetFastString("ContactsDeepLinkPattern")
table.insert(List, {
	ContactsDeepLinkPatternFastString,
	function(p3, _)
		-- upvalues: AppPageModule (copy), Constants (copy), FFlagCiDeprecateFindFriendsModal (copy), ContactImporterModalInfo (copy), AppStorageService (copy), LocalPlayer (copy)
		local config1 = nil
		if p3.contactid and p3.contactid ~= "" then
			config1 = {
				name = AppPageModule.ProfilePlatform,
				detail = p3.contactid,
				extraProps = { profileType = Constants.CONTACT }
			}
		else
			local config = { detail = "" }
			local ContactImporter = nil
			
			if FFlagCiDeprecateFindFriendsModal then
				ContactImporter = AppPageModule.ContactImporter
			else
				local Text: string = if LocalPlayer and LocalPlayer.UserId then tostring(LocalPlayer.UserId) else ""
				ContactImporter = if ContactImporterModalInfo:isUserOptedInLocalStorage(AppStorageService, Text) then AppPageModule.ContactsList else AppPageModule.ContactImporter
			end
			config.name = ContactImporter
			config.extraProps = {
				isPhoneVerified = true,
				entryPoint = if FFlagCiDeprecateFindFriendsModal then p3.entryPoint else nil
			}
			config1 = config
		end
		return {
			if FFlagCiDeprecateFindFriendsModal then { { name = AppPageModule.Home }, config1 } else {
				{ name = AppPageModule.Home },
				{ name = AppPageModule.AddFriendsPage },
				config1
			}
		}
	end
})
Default:registerURL((ContactsDeepLinkPatternFastString:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("StaticShareLinkHttpPattern"), function(p4, p5, p6, p7)
	-- upvalues: HandleStaticShareLinkModule (copy), CryoModule (copy)
	return HandleStaticShareLinkModule(p4, p5, CryoModule.Dictionary.join(p6, { isViaAppsFlyer = false }), p7)
end)
local StaticShareLinkDeepLinkPatternFastString: string = game:GetFastString("StaticShareLinkDeepLinkPattern")
table.insert(List, {
	StaticShareLinkDeepLinkPatternFastString,
	function(p4, p5, p6, p7)
		-- upvalues: HandleStaticShareLinkModule (copy), CryoModule (copy)
		return HandleStaticShareLinkModule(p4, p5, CryoModule.Dictionary.join(p6, { isViaAppsFlyer = true }), p7)
	end
})
Default:registerURL((StaticShareLinkDeepLinkPatternFastString:gsub("%%", "\\")))
local ShareLinkDeepLinkPatternFastString: string = game:GetFastString("ShareLinkDeepLinkPattern")
table.insert(List, {
	ShareLinkDeepLinkPatternFastString,
	function(p4, p5)
		-- upvalues: HandleShareLinkRootModule (copy), CryoModule (copy)
		return HandleShareLinkRootModule(CryoModule.Dictionary.join(p4, { isViaAppsFlyer = true }), p5)
	end
})
Default:registerURL((ShareLinkDeepLinkPatternFastString:gsub("%%", "\\")))

local function v114(p4, p5)
	-- upvalues: HandleShareLinkRootModule (copy), CryoModule (copy)
	return HandleShareLinkRootModule(CryoModule.Dictionary.join(p4, { isViaAppsFlyer = false }), p5)
end

addHttpMapping(game:GetFastString("ShareLinkHttpPattern"), v114)
addHttpMapping(game:GetFastString("ShortShareLinkHttpPattern"), v114)

if game:GetFastFlag("EnableJoinLinkWebDeepLink") then
	addHttpMapping(game:GetFastString("JoinLinkHttpPattern"), function(p4, p5, p6)
		-- upvalues: HandleJoinLinkModule (copy)
		return HandleJoinLinkModule(p4, p5, p6)
	end)
end
local CatalogEquipDeepLinkPatternFastString: string = game:GetFastString("CatalogEquipDeepLinkPattern")
table.insert(List, {
	CatalogEquipDeepLinkPatternFastString,
	function(p4)
		-- upvalues: AvatarScreen (copy)
		return {
			{ { name = AvatarScreen.AvatarExperienceLandingPage } },
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{
					name = AvatarScreen.Catalog,
					extraProps = {
						wasItemEquipped = false,
						fetchItemFailed = false,
						itemId = p4.itemid,
						itemType = p4.itemtype
					}
				}
			}
		}
	end
})
Default:registerURL((CatalogEquipDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagEnableCatalogSearchDeepLinksModule then
	local CatalogSearchDeepLinkPatternFastString: string = game:GetFastString("CatalogSearchDeepLinkPattern")
	table.insert(List, {
		CatalogSearchDeepLinkPatternFastString,
		function(ExtraProps)
			-- upvalues: AvatarScreen (copy)
			local List = { { { name = AvatarScreen.AvatarExperienceLandingPage } } }
			local ExtraProps1 = {
				creatorName = ExtraProps.creatorname,
				minPrice = ExtraProps.minprice,
				maxPrice = ExtraProps.maxprice,
				salesTypeFilter = ExtraProps.salestypefilter,
				includeNotForSale = ExtraProps.includenotforsale,
				sortType = ExtraProps.sorttype,
				sortAggregation = ExtraProps.sortaggregation,
				category = ExtraProps.category,
				subcategory = ExtraProps.subcategory,
				taxonomy = ExtraProps.taxonomy,
				keyword = ExtraProps.keyword,
				topics = ExtraProps.topics,
				wearTimeFilter = ExtraProps.wearTimeFilter
			}
			
			if ExtraProps1.keyword then
				table.insert(List, {
					{ name = AvatarScreen.AvatarExperienceLandingPage },
					{
						name = AvatarScreen.CatalogSearch,
						extraProps = ExtraProps1
					}
				})
				
				return List
			else
				table.insert(List, {
					{ name = AvatarScreen.AvatarExperienceLandingPage },
					{ name = AvatarScreen.Catalog, extraProps = ExtraProps1 }
				})
				
				return List
			end
		end
	})
	Default:registerURL((CatalogSearchDeepLinkPatternFastString:gsub("%%", "\\")))
end
local ExperienceSortDeepLinkPatternFastString: string = game:GetFastString("ExperienceSortDeepLinkPattern")
table.insert(List, {
	ExperienceSortDeepLinkPatternFastString,
	function(p4, ...)
		-- upvalues: SortIdMapperModule (copy), AppPageModule (copy), FFlagLuaAppSortDeeplinkFix (copy)
		if not p4.sortId then return end
		local SortIdMapperModuleResult, SortIdMapperModuleResult2 = SortIdMapperModule(p4.sortId)
		
		return {
			{
				{ name = AppPageModule.Home },
				{
					name = if FFlagLuaAppSortDeeplinkFix then AppPageModule.DeeplinkGamesList else AppPageModule.GamesList,
					detail = SortIdMapperModuleResult,
					extraProps = {
						sortName = SortIdMapperModuleResult,
						pageContext = if FFlagLuaAppSortDeeplinkFix then nil else "Deeplink",
						isOmni = SortIdMapperModuleResult2,
						sortIndex = if FFlagLuaAppSortDeeplinkFix or not SortIdMapperModuleResult2 then nil else 1
					}
				}
			}
		}
	end
})
Default:registerURL((ExperienceSortDeepLinkPatternFastString:gsub("%%", "\\")))
local CatalogDeepLinkPatternFastString: string = game:GetFastString("CatalogDeepLinkPattern")
table.insert(List, {
	CatalogDeepLinkPatternFastString,
	function()
		-- upvalues: AvatarScreen (copy)
		return {
			{ { name = AvatarScreen.AvatarExperienceLandingPage } },
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog }
			}
		}
	end
})
Default:registerURL((CatalogDeepLinkPatternFastString:gsub("%%", "\\")))
local ItemDetailsDeepLinkPatternFastString: string = game:GetFastString("ItemDetailsDeepLinkPattern")
table.insert(List, {
	ItemDetailsDeepLinkPatternFastString,
	function(p4)
		-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), AvatarScreen (copy), FFlagEnableLookDetailsDeepLinkModule (copy)
		local ItemId = ArgCheckModule.isNotNil(p4.itemid, "itemId")
		local ItemType: string = ArgCheckModule.isNotNil(p4.itemtype, "itemType")
		local ItemType1: string? = nil
		
		for _, value in pairs(ConstantsModule.ItemType) do
			if string.lower(ItemType) == string.lower(value) then
				ItemType1 = value
				break
			end
		end
		local List = {
			{ { name = AvatarScreen.AvatarExperienceLandingPage } },
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog }
			}
		}
		local config = {
			name = if FFlagEnableLookDetailsDeepLinkModule and ItemType1 == ConstantsModule.ItemType.Look then AvatarScreen.LookDetails else AvatarScreen.ItemDetails,
			detail = tostring(ItemType1) .. tostring(ItemId),
			extraProps = {
				mountAsFullView = true,
				mountAnimation = false,
				itemId = ItemId,
				itemType = ItemType1
			}
		}
		
		if ItemType1 ~= nil then
			table.insert(List, {
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				config
			})
		end
		return List
	end
})
Default:registerURL((ItemDetailsDeepLinkPatternFastString:gsub("%%", "\\")))
addHttpMapping(game:GetFastString("ItemDetailsHttpPattern"), function(ItemId, _, p5)
	-- upvalues: ConstantsModule (copy), CryoModule (copy), AvatarScreen (copy)
	local Asset = ConstantsModule.ItemType.Asset
	
	return CryoModule.List.join(p5.history, {
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.Catalog }
		}
	}, {
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.Catalog },
			{
				name = AvatarScreen.ItemDetails,
				detail = Asset .. ItemId,
				extraProps = {
					mountAsFullView = true,
					mountAnimation = false,
					itemId = ItemId,
					itemType = Asset
				}
			}
		}
	})
end)

if EnableBundleItemDetailHttpLink then
	addHttpMapping(game:GetFastString("BundleItemDetailsHttpPattern"), function(ItemId, _, p5)
		-- upvalues: ConstantsModule (copy), CryoModule (copy), AvatarScreen (copy)
		local Bundle = ConstantsModule.ItemType.Bundle
		
		return CryoModule.List.join(p5.history, {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{
					name = AvatarScreen.ItemDetails,
					detail = Bundle .. ItemId,
					extraProps = {
						mountAsFullView = true,
						mountAnimation = false,
						itemId = ItemId,
						itemType = Bundle
					}
				}
			}
		})
	end)
end
if FFlagEnableLookDetailsDeepLinkModule then
	addHttpMapping(game:GetFastString("LookItemDetailsHttpPattern"), function(ItemId, _, p5)
		-- upvalues: ConstantsModule (copy), CryoModule (copy), AvatarScreen (copy)
		return CryoModule.List.join(p5.history, {
			{
				{ name = AvatarScreen.AvatarExperienceLandingPage },
				{ name = AvatarScreen.Catalog },
				{
					name = AvatarScreen.LookDetails,
					detail = ConstantsModule.ItemType.Look .. ItemId,
					extraProps = { mountAsFullView = true, itemId = ItemId }
				}
			}
		})
	end)
end
if FFlagQRCodeItemRedemptionEnabledModule then
	local ItemRedemptionDeepLinkPatternFastString: string = game:GetFastString("ItemRedemptionDeepLinkPattern")
	table.insert(List, {
		ItemRedemptionDeepLinkPatternFastString,
		function(p5)
			-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), AvatarScreen (copy)
			local ItemId = ArgCheckModule.isNotNil(p5.itemid, "itemId")
			local ItemType: string = ArgCheckModule.isNotNil(p5.itemtype, "itemType")
			local ItemType1: string? = nil
			
			for _, value in pairs(ConstantsModule.ItemType) do
				if string.lower(ItemType) == string.lower(value) then
					ItemType1 = value
					break
				end
			end
			local List = {
				{ { name = AvatarScreen.AvatarExperienceLandingPage } },
				{
					{ name = AvatarScreen.AvatarExperienceLandingPage },
					{ name = AvatarScreen.Catalog }
				}
			}
			local config = {
				name = AvatarScreen.ItemDetails,
				detail = tostring(ItemType1) .. tostring(ItemId),
				extraProps = {
					mountAsFullView = true,
					mountAnimation = false,
					redeemQRCodeItem = true,
					itemId = ItemId,
					itemType = ItemType1
				}
			}
			
			if ItemType1 ~= nil then
				table.insert(List, {
					{ name = AvatarScreen.AvatarExperienceLandingPage },
					{ name = AvatarScreen.Catalog },
					config
				})
			end
			return List
		end
	})
	Default:registerURL((ItemRedemptionDeepLinkPatternFastString:gsub("%%", "\\")))
end
addHttpMapping(game:GetFastString("CatalogHttpPattern"), function(p5, p6)
	-- upvalues: FFlagAXEnableCatalogCreatorHttpLinkModule (copy), CryoModule (copy), AvatarScreen (copy), DeepLinkUtilsModule (copy)
	return if FFlagAXEnableCatalogCreatorHttpLinkModule then CryoModule.List.join(p6.history, {
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{
				name = AvatarScreen.Catalog,
				extraProps = DeepLinkUtilsModule.convertCatalogSearchParamsV1ToV2(p5)
			}
		}
	}) else CryoModule.List.join(p6.history, {
		{
			{ name = AvatarScreen.AvatarExperienceLandingPage },
			{ name = AvatarScreen.Catalog }
		}
	})
end)
local FriendsPageDeepLinkPatternFastString: string = game:GetFastString("FriendsPageDeepLinkPattern")
table.insert(List, {
	FriendsPageDeepLinkPatternFastString,
	function()
		-- upvalues: AppPageModule (copy)
		return {
			{ { name = AppPageModule.Home } },
			{
				{ name = AppPageModule.Home },
				{ name = AppPageModule.ViewFriends }
			}
		}
	end
})
Default:registerURL((FriendsPageDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagEnablePlusUpsellDeepLink then
	local PlusUpsellDeepLinkPatternFastString: string = game:GetFastString("PlusUpsellDeepLinkPattern")
	table.insert(List, {
		PlusUpsellDeepLinkPatternFastString,
		function()
			-- upvalues: RobloxSubscriptionPurchaseAppModule (copy), SurfaceName (copy), SurfaceContext (copy)
			RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, SurfaceName.DeepLinkUpsell, SurfaceContext.InApp)
			
			return nil
		end
	})
	Default:registerURL((PlusUpsellDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnableBuyRobuxDeepLink then
	local BuyRobuxDeepLinkPatternFastString: string = game:GetFastString("BuyRobuxDeepLinkPattern")
	table.insert(List, {
		BuyRobuxDeepLinkPatternFastString,
		function(p5)
			-- upvalues: AppPageModule (copy)
			local t = {}
			
			if p5.analyticid and p5.analyticid ~= "" then
				t.analyticId = p5.analyticid
			end
			if p5.product_id and p5.product_id ~= "" then
				t.productId = p5.product_id
			end
			return {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.PurchaseRobux,
						extraProps = if next(t) then t else nil
					}
				}
			}
		end
	})
	Default:registerURL((BuyRobuxDeepLinkPatternFastString:gsub("%%", "\\")))
end
if FFlagEnableSchoolEntry then
	local AddSchoolDeepLinkPatternFastString: string = game:GetFastString("AddSchoolDeepLinkPattern")
	table.insert(List, {
		AddSchoolDeepLinkPatternFastString,
		function(p5)
			-- upvalues: AppPageModule (copy)
			local t = {}
			
			if p5.source and p5.source ~= "" then
				t.source = p5.source
			end
			return {
				{ { name = AppPageModule.AddFriendsPage } },
				{
					{ name = AppPageModule.AddFriendsPage },
					{
						name = AppPageModule.Schools,
						extraProps = if next(t) then t else nil
					}
				}
			}
		end
	})
	Default:registerURL((AddSchoolDeepLinkPatternFastString:gsub("%%", "\\")))
end
if GetFFlagEnableGiftCardsDeepLinkModule() then
	local GiftCardsPageDeepLinkPatternFastString: string = game:GetFastString("GiftCardsPageDeepLinkPattern")
	table.insert(List, {
		GiftCardsPageDeepLinkPatternFastString,
		function()
			-- upvalues: AppPageModule (copy), UrlBuilderModule (copy), TransitionAnimationModule (copy)
			return {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.GenericWebPage,
						detail = UrlBuilderModule.static.giftCards(),
						extraProps = {
							titleKey = "CommonUI.Features.Label.GiftCards",
							transitionAnimation = TransitionAnimationModule.None
						}
					}
				}
			}
		end
	})
	Default:registerURL((GiftCardsPageDeepLinkPatternFastString:gsub("%%", "\\")))
end
local function handleCurrencyTransferLink(p5, _)
	-- upvalues: FFlagCurrencyTransferDeepLinkValidateSender (copy), LocalPlayer (copy), AppPageModule (copy)
	local Direction = p5.direction
	
	if not Direction or Direction ~= "send" and Direction ~= "receive" then
		return nil
	end
	if Direction == "send" then
		if not p5.userid or p5.userid == "" then
			return nil
		end
		if FFlagCurrencyTransferDeepLinkValidateSender and p5.senderid and p5.senderid ~= "" then
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId ~= 0 then tostring(LocalPlayer.UserId) else nil
			
			if Text == nil or Text ~= p5.senderid then
				return nil
			end
		end
	elseif not p5.transferrequestid or p5.transferrequestid == "" then
		return nil
	end
	local ExtraProps = { direction = Direction }
	
	if Direction == "send" then
		ExtraProps.recipientUserId = p5.userid
		
		if p5.transferorigination then
			ExtraProps.transferOrigination = p5.transferorigination
		end
	else
		ExtraProps.transferId = p5.transferrequestid
	end
	return {
		{ { name = AppPageModule.Home } },
		{
			{ name = AppPageModule.Home },
			{
				name = AppPageModule.TransferRobuxFlow,
				extraProps = ExtraProps
			}
		}
	}
end

if FFlagEnableCurrencyTransferDeepLink then
	local CurrencyTransferDeepLinkPatternFastString: string = game:GetFastString("CurrencyTransferDeepLinkPattern")
	table.insert(List, {
		CurrencyTransferDeepLinkPatternFastString,
		handleCurrencyTransferLink
	})
	Default:registerURL((CurrencyTransferDeepLinkPatternFastString:gsub("%%", "\\")))
end
if GetFFlagEnableMessagesDeepLinkModule() then
	local SystemMessageDeepLinkPatternFastString: string = game:GetFastString("SystemMessageDeepLinkPattern")
	table.insert(List, {
		SystemMessageDeepLinkPatternFastString,
		function()
			-- upvalues: AppPageModule (copy), UrlBuilderModule (copy), TransitionAnimationModule (copy)
			return {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.GenericWebPage,
						detail = UrlBuilderModule.static.messages(),
						extraProps = {
							titleKey = "CommonUI.Features.Label.Messages",
							transitionAnimation = TransitionAnimationModule.None
						}
					}
				}
			}
		end
	})
	Default:registerURL((SystemMessageDeepLinkPatternFastString:gsub("%%", "\\")))
end
if game:GetFastFlag("EnableExternalWebDeeplink") then
	local ExternalWebUrlDeepLinkPatternFastString: string = game:GetFastString("ExternalWebUrlDeepLinkPattern")
	table.insert(List, {
		ExternalWebUrlDeepLinkPatternFastString,
		function(p5)
			-- upvalues: ExternalWebUrlNavigationHelperModule (copy), AppPageModule (copy), TransitionAnimationModule (copy)
			local ZendeskUrl = nil
			local ZendeskWebViewTitleKey = nil
			
			if p5.domain == ExternalWebUrlNavigationHelperModule.ExternalWebDomainEnum.Zendesk then
				ZendeskUrl = ExternalWebUrlNavigationHelperModule.getZendeskUrl(p5)
				ZendeskWebViewTitleKey = ExternalWebUrlNavigationHelperModule.getZendeskWebViewTitleKey(p5.type)
			end
			return if ZendeskUrl then {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.GenericWebPage,
						detail = ZendeskUrl,
						extraProps = {
							titleKey = ZendeskWebViewTitleKey,
							transitionAnimation = TransitionAnimationModule.None
						}
					}
				}
			} else nil
		end
	})
	Default:registerURL((ExternalWebUrlDeepLinkPatternFastString:gsub("%%", "\\")))
end
if GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() then
	local CrossDeviceLoginDeepLinkPatternFastString: string = game:GetFastString("CrossDeviceLoginDeepLinkPattern")
	table.insert(List, {
		CrossDeviceLoginDeepLinkPatternFastString,
		function(p5)
			-- upvalues: ArgCheckModule (copy), FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy)
			return {
				{
					{
						name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
					},
					{
						name = AppPageModule.CrossDeviceLogin,
						extraProps = {
							code = ArgCheckModule.isNotNil(p5.code, "code"),
							source = p5.source
						}
					}
				}
			}
		end
	})
	Default:registerURL((CrossDeviceLoginDeepLinkPatternFastString:gsub("%%", "\\")))
end
local EventDetailsPageDeepLinkPatternFastString: string = game:GetFastString("EventDetailsPageDeepLinkPattern")
table.insert(List, {
	EventDetailsPageDeepLinkPatternFastString,
	function(p5)
		-- upvalues: AppPageModule (copy), ArgCheckModule (copy)
		return {
			{ { name = AppPageModule.Home } },
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.EventDetails,
					detail = ArgCheckModule.isNotNil(p5.eventid, "eventid")
				}
			}
		}
	end
})
Default:registerURL((EventDetailsPageDeepLinkPatternFastString:gsub("%%", "\\")))
local AppealsPortalDeepLinkPatternFastString: string = game:GetFastString("AppealsPortalDeepLinkPattern")
table.insert(List, {
	AppealsPortalDeepLinkPatternFastString,
	function(p5)
		-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy), UrlBuilderModule (copy)
		return {
			{
				{
					name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
				},
				{
					name = AppPageModule.GenericWebPage,
					detail = if p5.vid then UrlBuilderModule.static.appealsPortal.violation({ source = "deeplink", id = p5.vid }) else UrlBuilderModule.static.appealsPortal.main({ source = "deeplink" }),
					extraProps = {
						titleKey = "Feature.AppealsPortal.Label.ReportAndAppeals"
					}
				}
			}
		}
	end
})
Default:registerURL((AppealsPortalDeepLinkPatternFastString:gsub("%%", "\\")))

if GetFFlagEnableSupportCenterFunction() then
	local SupportCenterDeepLinkPatternFastString: string = game:GetFastString("SupportCenterDeepLinkPattern")
	table.insert(List, {
		SupportCenterDeepLinkPatternFastString,
		function(p5)
			-- upvalues: UrlBuilderModule (copy), FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy)
			local Ticketid = p5.ticketid or p5.ticketId
			local Universeid = p5.universeid or p5.universeId
			local Number = if Universeid and Universeid ~= "" then tonumber(Universeid) else nil
			
			return {
				{
					{
						name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
					},
					{
						name = AppPageModule.GenericWebPage,
						detail = if Ticketid and Ticketid ~= "" and Number then UrlBuilderModule.static.supportCenter.ticket({ universeId = Number, ticketId = Ticketid }) else UrlBuilderModule.static.supportCenter.main(),
						extraProps = { titleKey = "CommonUI.Features.Label.SupportCenter" }
					}
				}
			}
		end
	})
	Default:registerURL((SupportCenterDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnablePrivacySettingsDeeplinks then
	local PrivacySettingsDeepLinkPatternFastString: string = game:GetFastString("PrivacySettingsDeepLinkPattern")
	table.insert(List, {
		PrivacySettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.privacy(), "Feature.AccountSettings.Heading.Tab.Privacy"))
		end
	})
	Default:registerURL((PrivacySettingsDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnableSettingSubpageDeeplinks then
	local AppPermissionsSettingsDeepLinkPatternFastString: string = game:GetFastString("AppPermissionsSettingsDeepLinkPattern")
	table.insert(List, {
		AppPermissionsSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.appPermissions(), "Feature.AccountSettings.Heading.Tab.AppPermissions"))
		end
	})
	Default:registerURL((AppPermissionsSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local ScreentimeSettingsDeepLinkPatternFastString: string = game:GetFastString("ScreentimeSettingsDeepLinkPattern")
	table.insert(List, {
		ScreentimeSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.screentimeSettings(), "Feature.AccountSettings.Heading.ScreenTime"))
		end
	})
	Default:registerURL((ScreentimeSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local CommunicationSettingsDeepLinkPatternFastString: string = game:GetFastString("CommunicationSettingsDeepLinkPattern")
	table.insert(List, {
		CommunicationSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.communicationSettings(), "Feature.AccountSettings.Heading.Communications"))
		end
	})
	Default:registerURL((CommunicationSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local BlockedUsersSettingsDeepLinkPatternFastString: string = game:GetFastString("BlockedUsersSettingsDeepLinkPattern")
	table.insert(List, {
		BlockedUsersSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.blockedUsersSettings(), "Feature.AccountSettings.Heading.BlockedUsersV2"))
		end
	})
	Default:registerURL((BlockedUsersSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local BlockedExpSettingsDeepLinkPatternFastString: string = game:GetFastString("BlockedExpSettingsDeepLinkPattern")
	table.insert(List, {
		BlockedExpSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.blockedExperiencesSettings(), "Feature.AccountSettings.Heading.BlockedExperiences"))
		end
	})
	Default:registerURL((BlockedExpSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local ExperienceChatSettingsDeepLinkPatternFastString: string = game:GetFastString("ExperienceChatSettingsDeepLinkPattern")
	table.insert(List, {
		ExperienceChatSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.experienceChatSettings(), "Feature.AccountSettings.Heading.ExperienceChat"))
		end
	})
	Default:registerURL((ExperienceChatSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local PartySettingsDeepLinkPatternFastString: string = game:GetFastString("PartySettingsDeepLinkPattern")
	table.insert(List, {
		PartySettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.partySettings(), "Feature.AccountSettings.Label.Party"))
		end
	})
	Default:registerURL((PartySettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local VoiceSettingsDeepLinkPatternFastString: string = game:GetFastString("VoiceSettingsDeepLinkPattern")
	table.insert(List, {
		VoiceSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.voiceSettings(), "Feature.AccountSettings.Heading.VoiceChat"))
		end
	})
	Default:registerURL((VoiceSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local TradingInventorySettingsDeepLinkPatternFastString: string = game:GetFastString("TradingInventorySettingsDeepLinkPattern")
	table.insert(List, {
		TradingInventorySettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.tradingInventorySettings(), "Feature.AccountSettings.Heading.TradingAndInventory"))
		end
	})
	Default:registerURL((TradingInventorySettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local FriendsContactsSettingsDeepLinkPatternFastString: string = game:GetFastString("FriendsContactsSettingsDeepLinkPattern")
	table.insert(List, {
		FriendsContactsSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.friendsContactsSettings(), "Feature.AccountSettings.Heading.FriendsAndContacts"))
		end
	})
	Default:registerURL((FriendsContactsSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local PrivateServerSettingsDeepLinkPatternFastString: string = game:GetFastString("PrivateServerSettingsDeepLinkPattern")
	table.insert(List, {
		PrivateServerSettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.privateServerSettings(), "Feature.AccountSettings.Heading.PrivateServers"))
		end
	})
	Default:registerURL((PrivateServerSettingsDeepLinkPatternFastString:gsub("%%", "\\")))
	local VisibilitySettingsDeepLinkPatternFastString: string = game:GetFastString("VisibilitySettingsDeepLinkPattern")
	table.insert(List, {
		VisibilitySettingsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.visibilitySettings(), "Feature.AccountSettings.Heading.Visibility"))
		end
	})
	Default:registerURL((VisibilitySettingsDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnableParentalControlsDeeplinks then
	local ParentalControlsDeepLinkPatternFastString: string = game:GetFastString("ParentalControlsDeepLinkPattern")
	table.insert(List, {
		ParentalControlsDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.parentalControls(), "Feature.AccountSettings.Heading.Tab.ParentalControls"))
		end
	})
	Default:registerURL((ParentalControlsDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnableAccountInfoDeeplinks then
	local AccountInfoDeepLinkPatternFastString: string = game:GetFastString("AccountInfoDeepLinkPattern")
	table.insert(List, {
		AccountInfoDeepLinkPatternFastString,
		function()
			-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
			return (subSettingsMapping(UrlBuilderModule.static.settings.account(), "Feature.AccountSettings.Heading.Tab.AccountInfo"))
		end
	})
	Default:registerURL((AccountInfoDeepLinkPatternFastString:gsub("%%", "\\")))
end
local SpendingSettingsDeepLinkPatternFastString: string = game:GetFastString("SpendingSettingsDeepLinkPattern")
table.insert(List, {
	SpendingSettingsDeepLinkPatternFastString,
	function()
		-- upvalues: UrlBuilderModule (copy), subSettingsMapping (copy)
		return (subSettingsMapping(UrlBuilderModule.static.settings.billing(), "Feature.AccountSettings.Heading.Tab.Billing"))
	end
})
Default:registerURL((SpendingSettingsDeepLinkPatternFastString:gsub("%%", "\\")))

if EnableDevicePreferencesDeeplink then
	local DevicePreferencesDeepLinkPatternFastString: string = game:GetFastString("DevicePreferencesDeepLinkPattern")
	table.insert(List, {
		DevicePreferencesDeepLinkPatternFastString,
		function()
			-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), AppPageModule (copy)
			return {
				{
					{
						name = if FFlagEnableFlyoutSidePanelModule then AppPageModule.Home else AppPageModule.More
					},
					{ name = AppPageModule.Settings },
					{ name = AppPageModule.Accessibility }
				}
			}
		end
	})
	Default:registerURL((DevicePreferencesDeepLinkPatternFastString:gsub("%%", "\\")))
end
if GetFFlagEnableSecurityAlertDeeplinkFunction() then
	local SecurityAlertDeepLinkPatternFastString: string = game:GetFastString("SecurityAlertDeepLinkPattern")
	table.insert(List, {
		SecurityAlertDeepLinkPatternFastString,
		function(p5, _)
			-- upvalues: GetFFlagGenerateLinkWithChannelFunction (copy), UrlBuilderModule (copy), AppPageModule (copy), TransitionAnimationModule (copy)
			return if p5.payload and p5.payload ~= "" and p5.username and p5.username ~= "" then {
				{ { name = AppPageModule.Home } },
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.SecurityAlertInfo,
						detail = if GetFFlagGenerateLinkWithChannelFunction() then UrlBuilderModule.static.securityAlertWithChannel({
							payload = p5.payload,
							username = p5.username,
							channel = p5.channel or ""
						}) else UrlBuilderModule.static.securityAlert({ payload = p5.payload, username = p5.username }),
						extraProps = { transitionAnimation = TransitionAnimationModule.None }
					}
				}
			} else { { { name = AppPageModule.Home } } }
		end
	})
	Default:registerURL((SecurityAlertDeepLinkPatternFastString:gsub("%%", "\\")))
end
local SquadLobbyDeepLinkPatternFastString: string = game:GetFastString("SquadLobbyDeepLinkPattern")
table.insert(List, {
	SquadLobbyDeepLinkPatternFastString,
	function(p5, _)
		-- upvalues: ArgCheckModule (copy), AppPageModule (copy), FFlagEnableSquadDeeplinkWithChatId (copy)
		return {
			{
				{
					name = AppPageModule.SquadLobby,
					detail = ArgCheckModule.isNotNil(p5.partyid, "partyId"),
					extraProps = if FFlagEnableSquadDeeplinkWithChatId then { conversationId = p5.chatid } else nil
				}
			}
		}
	end
})
Default:registerURL((SquadLobbyDeepLinkPatternFastString:gsub("%%", "\\")))
local FAEUpsellOverlayDeepLinkPatternFastString: string = game:GetFastString("FAEUpsellOverlayDeepLinkPattern")
table.insert(List, {
	FAEUpsellOverlayDeepLinkPatternFastString,
	function(p5)
		-- upvalues: ArgCheckModule (copy), config1 (copy), AppPageModule (copy)
		return {
			{
				{
					name = AppPageModule.FAEUpsellOverlay,
					extraProps = {
						source = config1[ArgCheckModule.isNotNil(p5.source, "source")] or "",
						isPhase2 = p5.is_phase2 == "true"
					}
				}
			}
		}
	end
})
Default:registerURL((FAEUpsellOverlayDeepLinkPatternFastString:gsub("%%", "\\")))
local FAEDeepLinkPatternFastString: string = game:GetFastString("FAEDeepLinkPattern")
table.insert(List, {
	FAEDeepLinkPatternFastString,
	function(p5)
		-- upvalues: ArgCheckModule (copy), config1 (copy), AppPageModule (copy)
		return {
			{
				{
					name = AppPageModule.FAE,
					extraProps = {
						source = config1[ArgCheckModule.isNotNil(p5.source, "source")] or ""
					}
				}
			}
		}
	end
})
Default:registerURL((FAEDeepLinkPatternFastString:gsub("%%", "\\")))

if FFlagEnableAmpWizardDeepLink then
	local AmpWizardDeepLinkPatternFastString: string = game:GetFastString("AmpWizardDeepLinkPattern")
	table.insert(List, {
		AmpWizardDeepLinkPatternFastString,
		function(p5)
			-- upvalues: ArgCheckModule (copy), AppPageModule (copy), FFlagEnableAmpWizardDeepLinkValidateUserId (copy)
			return {
				{
					{
						name = AppPageModule.AmpWizardContainer,
						extraProps = {
							featureName = ArgCheckModule.isNotNil(p5.feature_name, "feature_name"),
							nameSpace = p5.namespace,
							entryPointEventCtx = p5.entry_point,
							returnPage = p5.returnpage,
							targetUserId = if FFlagEnableAmpWizardDeepLinkValidateUserId then p5.user_id else nil
						}
					}
				}
			}
		end
	})
	Default:registerURL((AmpWizardDeepLinkPatternFastString:gsub("%%", "\\")))
end
if FFlagEnableAccountUnlockDeepLink then
	local AccountUnlockDeepLinkPatternFastString: string = game:GetFastString("AccountUnlockDeepLinkPattern")
	table.insert(List, {
		AccountUnlockDeepLinkPatternFastString,
		function(p5)
			-- upvalues: FFlagAccountUnlockAllowMissingUserId (copy), ArgCheckModule (copy), AppPageModule (copy)
			return {
				{
					{ name = AppPageModule.Home },
					{
						name = AppPageModule.AccountUnlock,
						extraProps = {
							targetUserId = if FFlagAccountUnlockAllowMissingUserId then p5.user_id else ArgCheckModule.isNotNil(p5.user_id, "user_id")
						}
					}
				}
			}
		end
	})
	Default:registerURL((AccountUnlockDeepLinkPatternFastString:gsub("%%", "\\")))
end
if EnableEmptyContainerWidgetDeepLink then
	local EnterAppFromWidgetFastString: string = game:GetFastString("EnterAppFromWidget")
	table.insert(List, {
		EnterAppFromWidgetFastString,
		function(p5)
			-- upvalues: LogWidgetClickedModule (copy)
			LogWidgetClickedModule("Default", p5.entry_point)
			
			return nil
		end
	})
	Default:registerURL((EnterAppFromWidgetFastString:gsub("%%", "\\")))
	
	return List
else
	local EnterAppFromLockScreenWidgetFastString: string = game:GetFastString("EnterAppFromLockScreenWidget")
	table.insert(List, {
		EnterAppFromLockScreenWidgetFastString,
		function(_, _)
			-- upvalues: LogLockScreenWidgetClickedModule (copy)
			LogLockScreenWidgetClickedModule("Default")
			
			return nil
		end
	})
	Default:registerURL((EnterAppFromLockScreenWidgetFastString:gsub("%%", "\\")))
	
	return List
end