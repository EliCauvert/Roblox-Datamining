local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local appPage = require(parent.RobloxAppEnums).AppPage
local constantsModule = require(script.Parent.Parent.Constants)
local FAVORITES_URI = constantsModule.FAVORITES_URI
local CONTINUE_PLAYING_URI = constantsModule.CONTINUE_PLAYING_URI
local sharedFlagsModule = require(parent.SharedFlags)
local getFStringPlatformEventUrl = sharedFlagsModule.GetFStringPlatformEventUrl
local flyoutMomentsPlaceURI = game:DefineFastString("FlyoutMomentsPlaceURI", "roblox://experiences/start?placeId=119524072047648")
local flyoutLearnPlaceURI = game:DefineFastString("FlyoutLearnPlaceURI", "roblox://experiences/start?placeId=92498145666402")
local fFlagCreateConnectionsHub = sharedFlagsModule.FFlagCreateConnectionsHub
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagArgusTabImpliesFlyout = sharedFlagsModule.FFlagArgusTabImpliesFlyout
local fFlagEnableBlackbird = sharedFlagsModule.FFlagEnableBlackbird
local fFlagEnableBlackbirdOnFlyoutMenu = sharedFlagsModule.FFlagEnableBlackbirdOnFlyoutMenu
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagFlyoutSidePanelTradesEntryModule = require(script.Parent.Parent.Flags.FFlagFlyoutSidePanelTradesEntry)
local fFlagEnableLuaCommunityList = sharedFlagsModule.FFlagEnableLuaCommunityList
local fFlagFlyoutResolveItemContextOnActivationModule = require(flyoutSidePanel.Flags.FFlagFlyoutResolveItemContextOnActivation)
local communityListRouting = require(parent.Groups).CommunityListRouting
local t = {
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
	Trades = "Trades",
	Events = "Events",
	RobuxPill = "RobuxPill",
	QuickSignin = "QuickSignin",
	ReportLogs = "ReportLogs",
	Profile = "Profile",
	Terms = "Terms",
	Privacy = "Privacy"
}
local t_1 = {
	[t.Premium] = "BuildersClub",
	[t.Connections] = "Friends",
	[t.Moments] = "RM",
	[t.Communities] = "Groups",
	[t.HelpAndSafety] = "SafetySupport",
	[t.Events] = "TheHunt",
	[t.QuickSignin] = "Login Code"
}
local t_2 = {
	[t.Favorites] = "Feature.Catalog.Label.Favorites",
	[t.ContinuePlaying] = "Feature.FlyoutSidePanel.Action.ContinuePlaying",
	[t.Inventory] = "CommonUI.Features.Label.Inventory",
	[t.Connections] = if fFlagConnectionsToFriendsRename then "CommonUI.Features.Label.Friends" else "CommonUI.Features.Label.Connections",
	[t.Communities] = "CommonUI.Features.Label.Groups",
	[t.Messages] = "CommonUI.Features.Label.Messages",
	[t.Settings] = "CommonUI.Features.Label.Settings",
	[t.HelpAndSafety] = "CommonUI.Features.Label.HelpAndSafety",
	[t.Moments] = "CommonUI.Features.Label.RM",
	[t.Charts] = "CommonUI.Features.Label.Charts",
	[t.Learn] = "CommonUI.Features.Label.Learn",
	[t.CreateGames] = "CommonUI.Features.Label.CreateGames",
	[t.Premium] = "CommonUI.Features.Label.Premium",
	[t.GiftCards] = "CommonUI.Features.Label.GiftCards",
	[t.Redeem] = "CommonUI.Features.Label.Redeem",
	[t.Trades] = "CommonUI.Features.Label.Trades",
	[t.Events] = "CommonUI.Features.Label.TheHunt",
	[t.Terms] = "CommonUI.Features.Label.Terms",
	[t.Privacy] = "CommonUI.Features.Label.Privacy"
}
local fFlagFlyoutResolveItemContextOnActivationModule_1 = fFlagEnableLuaCommunityList and fFlagFlyoutResolveItemContextOnActivationModule
local t_3 = {
	[t.Favorites] = {
		itemType = t.Favorites,
		textKey = t_2[t.Favorites],
		icon = builderIconsModule.Icon.Bookmark,
		context = { appUri = FAVORITES_URI }
	},
	[t.ContinuePlaying] = {
		itemType = t.ContinuePlaying,
		textKey = t_2[t.ContinuePlaying],
		icon = builderIconsModule.Icon.ClockSpinReverse,
		context = { appUri = CONTINUE_PLAYING_URI }
	},
	[t.Inventory] = {
		itemType = t.Inventory,
		textKey = t_2[t.Inventory],
		icon = builderIconsModule.Icon.Backpack,
		context = {
			urlGenerator = function(p0) --[[ line: 135 ]]
				-- upvalues: urlBuilder (ref)
				return p0 and urlBuilder.user.inventory({ userId = p0 }) or nil
			end
		}
	},
	[t.Connections] = {
		itemType = t.Connections,
		textKey = t_2[t.Connections],
		icon = builderIconsModule.Icon.TwoPeople,
		context = {
			appPage = if fFlagCreateConnectionsHub then appPage.CoHubMyConnections else appPage.ViewFriends
		}
	},
	[t.Communities] = {
		itemType = t.Communities,
		textKey = t_2[t.Communities],
		icon = builderIconsModule.Icon.ThreePeople,
		context = if fFlagFlyoutResolveItemContextOnActivationModule_1 then nil else { url = urlBuilder.static.groups() },
		getContext = if fFlagFlyoutResolveItemContextOnActivationModule_1 then function() --[[ line: 105 | named "getCommunitiesContext" ]]
			-- upvalues: communityListRouting (ref), appPage (ref), urlBuilder (ref)
			return if communityListRouting.getShouldUseLuaCommunityList() then { appPage = appPage.Groups } else { url = urlBuilder.static.groups() }
		end else nil
	},
	[t.Messages] = {
		itemType = t.Messages,
		textKey = t_2[t.Messages],
		icon = builderIconsModule.Icon.Envelope,
		context = { url = urlBuilder.static.messages() }
	},
	[t.Settings] = {
		itemType = t.Settings,
		textKey = t_2[t.Settings],
		icon = builderIconsModule.Icon.Gear,
		context = { appPage = appPage.Settings }
	},
	[t.HelpAndSafety] = {
		itemType = t.HelpAndSafety,
		textKey = t_2[t.HelpAndSafety],
		icon = builderIconsModule.Icon.ShieldLock,
		context = { appPage = appPage.SafetySupport }
	},
	[t.Moments] = {
		itemType = t.Moments,
		textKey = t_2[t.Moments],
		icon = builderIconsModule.Icon.Moments,
		context = if (fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout) and fFlagEnableArgus then { appPage = appPage.Moments } else { appUri = flyoutMomentsPlaceURI }
	},
	[t.Charts] = {
		itemType = t.Charts,
		textKey = t_2[t.Charts],
		icon = builderIconsModule.Icon.ChartThreeVerticalBars,
		context = {}
	},
	[t.Learn] = {
		itemType = t.Learn,
		textKey = t_2[t.Learn],
		icon = builderIconsModule.Icon.PersonGraduate,
		context = { appUri = flyoutLearnPlaceURI }
	},
	[t.CreateGames] = {
		itemType = t.CreateGames,
		textKey = t_2[t.CreateGames],
		icon = builderIconsModule.Icon.Studio,
		context = {
			urlGenerator = function(p1) --[[ line: 206 ]]
				return p1({ utm_content = "side_panel" })
			end
		}
	},
	[t.Premium] = {
		itemType = t.Premium,
		textKey = t_2[t.Premium],
		icon = builderIconsModule.Icon.Premium,
		context = { appPage = appPage.BuildersClub }
	},
	[t.GiftCards] = {
		itemType = t.GiftCards,
		textKey = t_2[t.GiftCards],
		icon = builderIconsModule.Icon.GiftCard,
		context = {
			urlGenerator = function(p2) --[[ line: 224 ]]
				-- upvalues: urlBuilder (ref)
				return urlBuilder.static.giftCards(p2)
			end
		}
	},
	[t.Redeem] = {
		itemType = t.Redeem,
		textKey = t_2[t.Redeem],
		icon = builderIconsModule.Icon.Wallet,
		context = { url = urlBuilder.static.redeem() }
	},
	[t.Trades] = if fFlagFlyoutSidePanelTradesEntryModule then {
		itemType = t.Trades,
		textKey = t_2[t.Trades],
		icon = builderIconsModule.Icon.HandTwoArrowsHorizontal,
		context = { url = urlBuilder.static.trades() }
	} else nil,
	[t.Events] = {
		itemType = t.Events,
		textKey = t_2[t.Events],
		icon = builderIconsModule.Icon.CalendarStar,
		context = {
			url = if getFStringPlatformEventUrl() ~= "" then urlBuilder.static.help() else urlBuilder.fromString(getFStringPlatformEventUrl())()
		}
	},
	[t.Terms] = {
		itemType = t.Terms,
		textKey = t_2[t.Terms],
		context = {
			urlGenerator = function(_, p3) --[[ line: 261 ]]
				-- upvalues: urlBuilder (ref)
				local var14 = if p3 then p3.getTermsOfUseLink() else nil
				
				if var14 == nil or var14 == "" then
					var14 = urlBuilder.static.about.terms({ useGameQQUrls = true })
				end
				return var14
			end
		}
	},
	[t.Privacy] = {
		itemType = t.Privacy,
		textKey = t_2[t.Privacy],
		context = {
			urlGenerator = function(_, p4) --[[ line: 277 ]]
				-- upvalues: urlBuilder (ref)
				local var15 = if p4 then p4.getPrivacyPolicyLink() else nil
				
				if var15 == nil or var15 == "" then
					var15 = urlBuilder.static.about.privacy({ useGameQQUrls = true })
				end
				return var15
			end
		}
	}
}

if fFlagEnableBlackbird and fFlagEnableBlackbirdOnFlyoutMenu then
	t.Blackbird = "Blackbird"
	t_1[t.Blackbird] = "Blackbird"
	t_2[t.Blackbird] = "CommonUI.Features.Label.X"
	t_3[t.Blackbird] = {
		itemType = t.Blackbird,
		textKey = t_2[t.Blackbird],
		icon = foundationModule.Enums.IconName.RobloxPlus,
		context = { appPage = appPage.Blackbird }
	}
end
return {
	ItemType = t,
	ItemTextKey = t_2,
	ItemInfo = t_3,
	EventNameMappings = t_1,
	MomentsExperienceUri = flyoutMomentsPlaceURI
}