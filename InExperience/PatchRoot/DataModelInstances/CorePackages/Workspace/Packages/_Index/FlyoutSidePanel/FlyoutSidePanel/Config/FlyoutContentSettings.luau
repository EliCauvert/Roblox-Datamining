local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FlyoutSidePanelIXP = require(Parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local ConstantsModule = require(script.Parent.Parent.Constants)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local FlyoutMomentsPlaceURI = game:DefineFastString("FlyoutMomentsPlaceURI", "roblox://experiences/start?placeId=119524072047648")
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableBlackbirdOnFlyoutMenu = SharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local FFlagFlyoutSidePanelTradesEntryModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelTradesEntry)
local FFlagFlyoutFilterWebViewsAndBrowserLinks = SharedFlagsModule.FFlagFlyoutFilterWebViewsAndBrowserLinks
local FFlagFlyoutResolveItemContextOnActivationModule = require(FlyoutSidePanel.Flags.FFlagFlyoutResolveItemContextOnActivation)
local FFlagUserLibrary = SharedFlagsModule.FFlagUserLibrary
local CommunityListRouting = require(Parent.Groups).CommunityListRouting
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
	UserLibrary = "UserLibrary",
	Learn = "Learn",
	CreateGames = "CreateGames",
	Premium = "Premium",
	GiftCards = "GiftCards",
	Redeem = "Redeem",
	Trades = "Trades",
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
	[ItemType.Connections] = "CommonUI.Features.Label.Friends",
	[ItemType.Communities] = "CommonUI.Features.Label.Groups",
	[ItemType.Messages] = "CommonUI.Features.Label.Messages",
	[ItemType.Settings] = "CommonUI.Features.Label.Settings",
	[ItemType.HelpAndSafety] = "CommonUI.Features.Label.HelpAndSafety",
	[ItemType.Moments] = "CommonUI.Features.Label.RM",
	[ItemType.Charts] = "CommonUI.Features.Label.Charts",
	[ItemType.UserLibrary] = "Feature.UserLibrary.Label.MyLibrary",
	[ItemType.Learn] = "CommonUI.Features.Label.Learn",
	[ItemType.CreateGames] = "CommonUI.Features.Label.CreateGames",
	[ItemType.Premium] = "CommonUI.Features.Label.Premium",
	[ItemType.GiftCards] = "CommonUI.Features.Label.GiftCards",
	[ItemType.Redeem] = "CommonUI.Features.Label.Redeem",
	[ItemType.Trades] = "CommonUI.Features.Label.Trades",
	[ItemType.Events] = "CommonUI.Features.Label.TheHunt",
	[ItemType.Terms] = "CommonUI.Features.Label.Terms",
	[ItemType.Privacy] = "CommonUI.Features.Label.Privacy"
}
local DestinationType = {
	WebView = "WebView",
	WebLink = "WebLink",
	AppPage = "AppPage",
	GameSortDeeplink = "GameSortDeeplink",
	PlaceLaunch = "PlaceLaunch"
}

local function getCommunitiesContext()
	-- upvalues: CommunityListRouting (copy), AppPage (copy), DestinationType (copy), UrlBuilder (copy)
	return if CommunityListRouting.getShouldUseLuaCommunityList() then {
		appPage = AppPage.Groups,
		destinationType = DestinationType.AppPage
	} else {
		url = UrlBuilder.static.groups(),
		destinationType = DestinationType.WebView
	}
end

local function _(p1)
	-- upvalues: FFlagFlyoutResolveItemContextOnActivationModule (copy)
	return if FFlagFlyoutResolveItemContextOnActivationModule and p1.getContext then p1.getContext() else p1.context
end

local _ = function(p1)
	-- upvalues: FFlagFlyoutResolveItemContextOnActivationModule (copy)
	local Context = if FFlagFlyoutResolveItemContextOnActivationModule and p1.getContext then p1.getContext() else p1.context
	
	return if Context then Context.destinationType else nil
end

local function itemRequiresWebView(p1, p2): boolean
	-- upvalues: FFlagFlyoutResolveItemContextOnActivationModule (copy), DestinationType (copy)
	local Context = if FFlagFlyoutResolveItemContextOnActivationModule and p1.getContext then p1.getContext() else p1.context
	local DestinationType1 = if Context then Context.destinationType else nil
	
	return DestinationType1 == DestinationType.WebView or DestinationType1 == DestinationType.WebLink and not p2
end

local function itemIsGameSortDeeplink(p1): boolean
	-- upvalues: FFlagFlyoutResolveItemContextOnActivationModule (copy), DestinationType (copy)
	local Context = if FFlagFlyoutResolveItemContextOnActivationModule and p1.getContext then p1.getContext() else p1.context
	
	return (if Context then Context.destinationType else nil) == DestinationType.GameSortDeeplink
end

local FFlagFlyoutResolveItemContextOnActivationModule1 = SharedFlagsModule.FFlagEnableLuaCommunityList and FFlagFlyoutResolveItemContextOnActivationModule
local ItemInfo = {
	[ItemType.Favorites] = {
		itemType = ItemType.Favorites,
		textKey = ItemTextKey[ItemType.Favorites],
		icon = BuilderIconsModule.Icon.Bookmark,
		context = {
			appUri = ConstantsModule.FAVORITES_URI,
			destinationType = DestinationType.GameSortDeeplink
		}
	},
	[ItemType.ContinuePlaying] = {
		itemType = ItemType.ContinuePlaying,
		textKey = ItemTextKey[ItemType.ContinuePlaying],
		icon = BuilderIconsModule.Icon.ClockSpinReverse,
		context = {
			appUri = ConstantsModule.CONTINUE_PLAYING_URI,
			destinationType = DestinationType.GameSortDeeplink
		}
	},
	[ItemType.Inventory] = {
		itemType = ItemType.Inventory,
		textKey = ItemTextKey[ItemType.Inventory],
		icon = BuilderIconsModule.Icon.Backpack,
		context = {
			urlGenerator = function(UserId)
				-- upvalues: UrlBuilder (copy)
				return UserId and UrlBuilder.user.inventory({ userId = UserId }) or nil
			end,
			destinationType = DestinationType.WebView
		}
	},
	[ItemType.Connections] = {
		itemType = ItemType.Connections,
		textKey = ItemTextKey[ItemType.Connections],
		icon = BuilderIconsModule.Icon.TwoPeople,
		context = {
			appPage = if SharedFlagsModule.FFlagCreateConnectionsHub then AppPage.CoHubMyConnections else AppPage.ViewFriends,
			destinationType = DestinationType.AppPage
		}
	},
	[ItemType.Communities] = {
		itemType = ItemType.Communities,
		textKey = ItemTextKey[ItemType.Communities],
		icon = BuilderIconsModule.Icon.ThreePeople,
		context = if FFlagFlyoutResolveItemContextOnActivationModule1 then nil else {
			url = UrlBuilder.static.groups(),
			destinationType = DestinationType.WebView
		},
		getContext = if FFlagFlyoutResolveItemContextOnActivationModule1 then getCommunitiesContext else nil
	},
	[ItemType.Messages] = {
		itemType = ItemType.Messages,
		textKey = ItemTextKey[ItemType.Messages],
		icon = BuilderIconsModule.Icon.Envelope,
		context = {
			url = UrlBuilder.static.messages(),
			destinationType = DestinationType.WebView
		}
	},
	[ItemType.Settings] = {
		itemType = ItemType.Settings,
		textKey = ItemTextKey[ItemType.Settings],
		icon = BuilderIconsModule.Icon.Gear,
		context = {
			appPage = AppPage.Settings,
			destinationType = DestinationType.AppPage
		}
	},
	[ItemType.HelpAndSafety] = {
		itemType = ItemType.HelpAndSafety,
		textKey = ItemTextKey[ItemType.HelpAndSafety],
		icon = BuilderIconsModule.Icon.ShieldLock,
		context = {
			appPage = AppPage.SafetySupport,
			destinationType = DestinationType.AppPage
		}
	},
	[ItemType.Moments] = {
		itemType = ItemType.Moments,
		textKey = ItemTextKey[ItemType.Moments],
		icon = BuilderIconsModule.Icon.Moments,
		context = if FFlagEnableArgus then {
			appPage = AppPage.Moments,
			destinationType = DestinationType.AppPage
		} else {
			appUri = FlyoutMomentsPlaceURI,
			destinationType = DestinationType.PlaceLaunch
		}
	},
	[ItemType.Charts] = {
		itemType = ItemType.Charts,
		textKey = ItemTextKey[ItemType.Charts],
		icon = BuilderIconsModule.Icon.ChartThreeVerticalBars,
		context = {
			appPage = if SharedFlagsModule.FFlagEnableChartsInFlyout and FlyoutSidePanelIXP.isChartsInFlyoutEnabled() then AppPage.Games else nil,
			destinationType = DestinationType.AppPage
		}
	},
	[ItemType.UserLibrary] = {
		itemType = ItemType.UserLibrary,
		textKey = ItemTextKey[ItemType.UserLibrary],
		icon = BuilderIconsModule.Icon.Bookmark,
		context = {
			appPage = if FFlagUserLibrary then AppPage.UserLibrary else nil,
			destinationType = DestinationType.AppPage
		}
	},
	[ItemType.Learn] = {
		itemType = ItemType.Learn,
		textKey = ItemTextKey[ItemType.Learn],
		icon = BuilderIconsModule.Icon.PersonGraduate,
		context = {
			appUri = game:DefineFastString("FlyoutLearnPlaceURI", "roblox://experiences/start?placeId=92498145666402"),
			destinationType = DestinationType.PlaceLaunch
		}
	},
	[ItemType.CreateGames] = {
		itemType = ItemType.CreateGames,
		textKey = ItemTextKey[ItemType.CreateGames],
		icon = BuilderIconsModule.Icon.Studio,
		context = {
			urlGenerator = function(Callback)
				return Callback({ utm_content = "side_panel" })
			end,
			destinationType = if FFlagFlyoutFilterWebViewsAndBrowserLinks then DestinationType.WebLink else DestinationType.WebView
		}
	},
	[ItemType.Premium] = {
		itemType = ItemType.Premium,
		textKey = ItemTextKey[ItemType.Premium],
		icon = BuilderIconsModule.Icon.Premium,
		context = {
			appPage = AppPage.BuildersClub,
			destinationType = DestinationType.WebView
		}
	},
	[ItemType.GiftCards] = {
		itemType = ItemType.GiftCards,
		textKey = ItemTextKey[ItemType.GiftCards],
		icon = BuilderIconsModule.Icon.GiftCard,
		context = {
			urlGenerator = function(p1)
				-- upvalues: UrlBuilder (copy)
				return UrlBuilder.static.giftCards(p1)
			end,
			destinationType = if FFlagFlyoutFilterWebViewsAndBrowserLinks then DestinationType.WebLink else DestinationType.WebView
		}
	},
	[ItemType.Redeem] = {
		itemType = ItemType.Redeem,
		textKey = ItemTextKey[ItemType.Redeem],
		icon = BuilderIconsModule.Icon.Wallet,
		context = {
			url = UrlBuilder.static.redeem(),
			destinationType = DestinationType.WebView
		}
	},
	[ItemType.Trades] = if FFlagFlyoutSidePanelTradesEntryModule then {
		itemType = ItemType.Trades,
		textKey = ItemTextKey[ItemType.Trades],
		icon = BuilderIconsModule.Icon.HandTwoArrowsHorizontal,
		context = {
			url = UrlBuilder.static.trades(),
			destinationType = DestinationType.WebView
		}
	} else nil,
	[ItemType.Events] = {
		itemType = ItemType.Events,
		textKey = ItemTextKey[ItemType.Events],
		icon = BuilderIconsModule.Icon.CalendarStar,
		context = {
			url = if GetFStringPlatformEventUrlFunction() == "" then UrlBuilder.static.help() else UrlBuilder.fromString(GetFStringPlatformEventUrlFunction())(),
			destinationType = DestinationType.WebView
		}
	},
	[ItemType.Terms] = {
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
			end,
			destinationType = if FFlagFlyoutFilterWebViewsAndBrowserLinks then DestinationType.WebLink else DestinationType.WebView
		}
	},
	[ItemType.Privacy] = {
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
			end,
			destinationType = if FFlagFlyoutFilterWebViewsAndBrowserLinks then DestinationType.WebLink else DestinationType.WebView
		}
	}
}

if SharedFlagsModule.FFlagEnableBlackbird and FFlagEnableBlackbirdOnFlyoutMenu then
	ItemType.Blackbird = "Blackbird"
	EventNameMappings[ItemType.Blackbird] = "Blackbird"
	ItemTextKey[ItemType.Blackbird] = "CommonUI.Features.Label.X"
	ItemInfo[ItemType.Blackbird] = {
		itemType = ItemType.Blackbird,
		textKey = ItemTextKey[ItemType.Blackbird],
		icon = FoundationModule.Enums.IconName.RobloxPlus,
		context = {
			appPage = AppPage.Blackbird,
			destinationType = DestinationType.WebView
		}
	}
end
return {
	ItemType = ItemType,
	ItemTextKey = ItemTextKey,
	ItemInfo = ItemInfo,
	EventNameMappings = EventNameMappings,
	MomentsExperienceUri = FlyoutMomentsPlaceURI,
	DestinationType = DestinationType,
	itemRequiresWebView = itemRequiresWebView,
	itemIsGameSortDeeplink = itemIsGameSortDeeplink
}