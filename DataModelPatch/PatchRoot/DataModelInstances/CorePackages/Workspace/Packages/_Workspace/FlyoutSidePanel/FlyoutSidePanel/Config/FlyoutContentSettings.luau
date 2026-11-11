local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ConstantsModule = require(script.Parent.Parent.Constants)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local FlyoutMomentsPlaceURI = game:DefineFastString("FlyoutMomentsPlaceURI", "roblox://experiences/start?placeId=119524072047648")
local FFlagCreateConnectionsHub = SharedFlagsModule.FFlagCreateConnectionsHub
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local FFlagFlyoutTermsPrivacyFooterModule = require(script.Parent.Parent.Flags.FFlagFlyoutTermsPrivacyFooter)
local CommunityListExperimentation = require(Parent.Groups).Experiments.CommunityListExperimentation
local ItemType = {
	Favorites = "Favorites",
	ContinuePlaying = "ContinuePlaying",
	Inventory = "Inventory",
	Connections = "Connections",
	Communities = "Communities",
	Messages = "Messages",
	Settings = "Settings",
	HelpAndSafety = "HelpAndSafety",
	Moments = "Moments",
	Charts = "Charts",
	Learn = "Learn",
	CreateGames = "CreateGames",
	Premium = "Premium",
	GiftCards = "GiftCards",
	Redeem = "Redeem",
	Events = "Events",
	RobuxPill = "RobuxPill",
	QuickSignin = "QuickSignin",
	ReportLogs = "ReportLogs",
	Profile = "Profile",
	Terms = "Terms",
	Privacy = "Privacy"
}
local EventNameMappings = {
	[ItemType.Premium] = "BuildersClub",
	[ItemType.Connections] = "Friends",
	[ItemType.Moments] = "RM",
	[ItemType.Communities] = "Groups",
	[ItemType.HelpAndSafety] = "SafetySupport",
	[ItemType.Events] = "TheHunt",
	[ItemType.QuickSignin] = "Login Code"
}
local ItemTextKey = {
	[ItemType.Favorites] = "Feature.Catalog.Label.Favorites",
	[ItemType.ContinuePlaying] = "Feature.FlyoutSidePanel.Action.ContinuePlaying",
	[ItemType.Inventory] = "CommonUI.Features.Label.Inventory",
	[ItemType.Connections] = if SharedFlagsModule.FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.Friends" else "CommonUI.Features.Label.Connections",
	[ItemType.Communities] = "CommonUI.Features.Label.Groups",
	[ItemType.Messages] = "CommonUI.Features.Label.Messages",
	[ItemType.Settings] = "CommonUI.Features.Label.Settings",
	[ItemType.HelpAndSafety] = "CommonUI.Features.Label.HelpAndSafety",
	[ItemType.Moments] = "CommonUI.Features.Label.RM",
	[ItemType.Charts] = "CommonUI.Features.Label.Charts",
	[ItemType.Learn] = "CommonUI.Features.Label.Learn",
	[ItemType.CreateGames] = "CommonUI.Features.Label.CreateGames",
	[ItemType.Premium] = "CommonUI.Features.Label.Premium",
	[ItemType.GiftCards] = "CommonUI.Features.Label.GiftCards",
	[ItemType.Redeem] = "CommonUI.Features.Label.Redeem",
	[ItemType.Events] = "CommonUI.Features.Label.TheHunt",
	[ItemType.Terms] = if FFlagFlyoutTermsPrivacyFooterModule then "CommonUI.Features.Label.Terms" else nil,
	[ItemType.Privacy] = if FFlagFlyoutTermsPrivacyFooterModule then "CommonUI.Features.Label.Privacy" else nil
}
local ItemInfo = {
	[ItemType.Favorites] = {
		itemType = ItemType.Favorites,
		textKey = ItemTextKey[ItemType.Favorites],
		icon = BuilderIconsModule.Icon.Bookmark,
		context = { appUri = ConstantsModule.FAVORITES_URI }
	},
	[ItemType.ContinuePlaying] = {
		itemType = ItemType.ContinuePlaying,
		textKey = ItemTextKey[ItemType.ContinuePlaying],
		icon = BuilderIconsModule.Icon.ClockSpinReverse,
		context = { appUri = ConstantsModule.CONTINUE_PLAYING_URI }
	},
	[ItemType.Inventory] = {
		itemType = ItemType.Inventory,
		textKey = ItemTextKey[ItemType.Inventory],
		icon = BuilderIconsModule.Icon.Backpack,
		context = {
			urlGenerator = function(UserId)
				-- upvalues: UrlBuilder (copy)
				return UserId and UrlBuilder.user.inventory({ userId = UserId }) or nil
			end
		}
	},
	[ItemType.Connections] = {
		itemType = ItemType.Connections,
		textKey = ItemTextKey[ItemType.Connections],
		icon = BuilderIconsModule.Icon.TwoPeople,
		context = {
			appPage = if FFlagCreateConnectionsHub then AppPage.CoHubMyConnections else AppPage.ViewFriends
		}
	},
	[ItemType.Communities] = {
		itemType = ItemType.Communities,
		textKey = ItemTextKey[ItemType.Communities],
		icon = BuilderIconsModule.Icon.ThreePeople,
		context = if SharedFlagsModule.GetFFlagEnableCommunityListExperimentation() and CommunityListExperimentation.getCommunityListEnabled() then { appPage = AppPage.Groups } else { url = UrlBuilder.static.groups() }
	},
	[ItemType.Messages] = {
		itemType = ItemType.Messages,
		textKey = ItemTextKey[ItemType.Messages],
		icon = BuilderIconsModule.Icon.Envelope,
		context = { url = UrlBuilder.static.messages() }
	},
	[ItemType.Settings] = {
		itemType = ItemType.Settings,
		textKey = ItemTextKey[ItemType.Settings],
		icon = BuilderIconsModule.Icon.Gear,
		context = { appPage = AppPage.Settings }
	},
	[ItemType.HelpAndSafety] = {
		itemType = ItemType.HelpAndSafety,
		textKey = ItemTextKey[ItemType.HelpAndSafety],
		icon = BuilderIconsModule.Icon.ShieldLock,
		context = { appPage = AppPage.SafetySupport }
	},
	[ItemType.Moments] = {
		itemType = ItemType.Moments,
		textKey = ItemTextKey[ItemType.Moments],
		icon = BuilderIconsModule.Icon.Moments,
		context = if (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout) and FFlagEnableArgus then { appPage = AppPage.Moments } else { appUri = FlyoutMomentsPlaceURI }
	},
	[ItemType.Charts] = {
		itemType = ItemType.Charts,
		textKey = ItemTextKey[ItemType.Charts],
		icon = BuilderIconsModule.Icon.ChartThreeVerticalBars,
		context = {}
	},
	[ItemType.Learn] = {
		itemType = ItemType.Learn,
		textKey = ItemTextKey[ItemType.Learn],
		icon = BuilderIconsModule.Icon.PersonGraduate,
		context = {
			appUri = game:DefineFastString("FlyoutLearnPlaceURI", "roblox://experiences/start?placeId=92498145666402")
		}
	},
	[ItemType.CreateGames] = {
		itemType = ItemType.CreateGames,
		textKey = ItemTextKey[ItemType.CreateGames],
		icon = BuilderIconsModule.Icon.Studio,
		context = {
			urlGenerator = function(Callback)
				return Callback({ utm_content = "side_panel" })
			end
		}
	},
	[ItemType.Premium] = {
		itemType = ItemType.Premium,
		textKey = ItemTextKey[ItemType.Premium],
		icon = BuilderIconsModule.Icon.Premium,
		context = { appPage = AppPage.BuildersClub }
	},
	[ItemType.GiftCards] = {
		itemType = ItemType.GiftCards,
		textKey = ItemTextKey[ItemType.GiftCards],
		icon = BuilderIconsModule.Icon.GiftCard,
		context = {
			urlGenerator = function(p1)
				-- upvalues: UrlBuilder (copy)
				return UrlBuilder.static.giftCards(p1)
			end
		}
	},
	[ItemType.Redeem] = {
		itemType = ItemType.Redeem,
		textKey = ItemTextKey[ItemType.Redeem],
		icon = BuilderIconsModule.Icon.Wallet,
		context = { url = UrlBuilder.static.redeem() }
	},
	[ItemType.Events] = {
		itemType = ItemType.Events,
		textKey = ItemTextKey[ItemType.Events],
		icon = BuilderIconsModule.Icon.CalendarStar,
		context = {
			url = if GetFStringPlatformEventUrlFunction() == "" then UrlBuilder.static.help() else UrlBuilder.fromString(GetFStringPlatformEventUrlFunction())()
		}
	},
	[ItemType.Terms] = if FFlagFlyoutTermsPrivacyFooterModule then {
		itemType = ItemType.Terms,
		textKey = ItemTextKey[ItemType.Terms],
		context = {
			urlGenerator = function(_, p1)
				-- upvalues: UrlBuilder (copy)
				local TermsOfUseLink = if p1 then p1.getTermsOfUseLink() else nil
				
				if TermsOfUseLink == nil or TermsOfUseLink == "" then
					TermsOfUseLink = UrlBuilder.static.about.terms({ useGameQQUrls = true })
				end
				return TermsOfUseLink
			end
		}
	} else nil,
	[ItemType.Privacy] = if FFlagFlyoutTermsPrivacyFooterModule then {
		itemType = ItemType.Privacy,
		textKey = ItemTextKey[ItemType.Privacy],
		context = {
			urlGenerator = function(_, p1)
				-- upvalues: UrlBuilder (copy)
				local PrivacyPolicyLink = if p1 then p1.getPrivacyPolicyLink() else nil
				
				if PrivacyPolicyLink == nil or PrivacyPolicyLink == "" then
					PrivacyPolicyLink = UrlBuilder.static.about.privacy({ useGameQQUrls = true })
				end
				return PrivacyPolicyLink
			end
		}
	} else nil
}

if SharedFlagsModule.FFlagEnableBlackbird and FFlagEnableBlackbirdOnFlyoutMenu then
	ItemType.Blackbird = "Blackbird"
	EventNameMappings[ItemType.Blackbird] = "Blackbird"
	ItemTextKey[ItemType.Blackbird] = "CommonUI.Features.Label.X"
	ItemInfo[ItemType.Blackbird] = {
		itemType = ItemType.Blackbird,
		textKey = ItemTextKey[ItemType.Blackbird],
		icon = FoundationModule.Enums.IconName.RobloxPlus,
		context = { appPage = AppPage.Blackbird }
	}
end
return {
	ItemType = ItemType,
	ItemTextKey = ItemTextKey,
	ItemInfo = ItemInfo,
	EventNameMappings = EventNameMappings
}