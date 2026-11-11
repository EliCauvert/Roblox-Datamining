local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AnalyticsConstantsModule = require(script.Parent.AnalyticsConstants)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local FFlagProfilePlatformUseProfileTypeContextModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseProfileTypeContext)
local FFlagEnablePlatformProfileContextualMenuOption = require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditAppearanceAnalyticsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceAnalytics)
local FFlagSocialEnableProfileInspectAndBuyAnalytics = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics

local function ButtonSurface(p1)
	return p1
end

return {
	[EventNamesModule.ProfilePageLoadedWithData] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendStatus = ButtonSurface,
			playerPresence = ButtonSurface,
			absolutePosition = ButtonSurface,
			isHomePageCarousel = ButtonSurface,
			isRecommendation = ButtonSurface,
			recommendationContextType = ButtonSurface,
			recommendationRank = ButtonSurface,
			recommendationSessionId = ButtonSurface,
			source = ButtonSurface,
			profileType = ButtonSurface,
			shareLinkId = ButtonSurface,
			primaryAction = ButtonSurface
		}
	},
	[EventNamesModule.ProfilePresenceLoaded] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.PresenceLoaded,
		formatRulesForAdditionalInfo = { presenceType = ButtonSurface, universeId = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.Chat
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.IgnoreFriendRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonReport] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.Report
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonUnfriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.Unfriend
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonBlock] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.Block
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonSetAlias] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.SetAlias
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonCopyLink] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.CopyLink
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.LeaveCommunity
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.ContextualMenuButtonUnfollow] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.Unfollow
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.RemoveTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.AddTrustedConnection
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			modalVariantOverride = ButtonSurface
		}
	},
	[EventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.AddIncomingTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.MakePrimaryCommunity
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.RemovePrimaryCommunity
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.ContextualMenuButtonCurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.CTAButtonOpenEditProfilePage] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.CTAButtons.OpenEditProfilePage
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.Chat },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonUnlockChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.UnlockChat },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonUnfriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.Unfriend },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonUnblock] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.Unblock },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonAddFriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.AddFriend },
		formatRulesForAdditionalInfo = {
			absolutePosition = ButtonSurface,
			isHomePageCarousel = ButtonSurface,
			isRecommendation = ButtonSurface,
			recommendationContextType = ButtonSurface,
			recommendationRank = ButtonSurface,
			recommendationSessionId = ButtonSurface,
			source = ButtonSurface,
			contextualInfoType = ButtonSurface,
			shareLinkId = ButtonSurface,
			profileType = ButtonSurface
		}
	},
	[EventNamesModule.CTAButtonAddFriendFromContacts] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.CTAButtons.AddFriendFromContacts
		},
		formatRulesForAdditionalInfo = { shareLinkId = ButtonSurface }
	},
	[EventNamesModule.CTAButtonAcceptFriendRequest] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.CTAButtons.AcceptFriendRequest
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = ButtonSurface,
			contextualInfoType = ButtonSurface,
			isHomePageCarousel = ButtonSurface,
			isRecommendation = ButtonSurface,
			recommendationContextType = ButtonSurface,
			recommendationRank = ButtonSurface,
			recommendationSessionId = ButtonSurface,
			source = ButtonSurface,
			buttonSurface = ButtonSurface,
			shareLinkId = ButtonSurface,
			profileType = ButtonSurface
		}
	},
	[EventNamesModule.CTAButtonEditAvatar] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.EditAvatar },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonEditLook] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.EditLook },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonShareProfile] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.ShareProfile },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonShareProfileQRCode] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.CTAButtons.ShareProfileQRCode
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonJoinCommunity] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.JoinCommunity
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.CTAButtonFollow] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.Follow
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	},
	[EventNamesModule.CTAButtonViewCommunity] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.ViewCommunity
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.CTAButtonViewFullProfile] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.ViewFullProfile
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.CTAButtonCurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.CTAButtons.CancelJoinCommunityRequest
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = ButtonSurface,
			btnContext = ButtonSurface
		}
	},
	[EventNamesModule.FriendsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Friends }
	},
	[EventNamesModule.FollowersButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Followers }
	},
	[EventNamesModule.FollowingsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Following }
	},
	[EventNamesModule.MutualFriendsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.MutualFriends }
	},
	[EventNamesModule.ViewPlayerProfileButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.ViewPlayerProfile },
		formatRulesForAdditionalInfo = {
			absolutePosition = ButtonSurface,
			friendStatus = ButtonSurface,
			isHomePageCarousel = ButtonSurface,
			isRecommendation = ButtonSurface,
			recommendationContextType = ButtonSurface,
			recommendationRank = ButtonSurface,
			recommendationSessionId = ButtonSurface,
			source = ButtonSurface,
			buttonSurface = ButtonSurface
		}
	},
	[EventNamesModule.ContextualMenuButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.ContextualMenu }
	},
	[EventNamesModule.GameDetailsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.GameDetails }
	},
	[EventNamesModule.EditDisplayNameButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.EditDisplayName },
		formatRulesForAdditionalInfo = { canSetDisplayName = ButtonSurface }
	},
	[EventNamesModule.SetAliasButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.SetAlias }
	},
	[EventNamesModule.ProfileClosed] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.Dismissed
	},
	[EventNamesModule.StoreHeaderButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.StoreHeader }
	},
	[EventNamesModule.FavoriteExperienceOpened] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.FavoriteExperience },
		formatRulesForAdditionalInfo = {
			experienceId = ButtonSurface,
			positionInComponent = ButtonSurface
		}
	},
	[EventNamesModule.FavoriteExperienceSeeAll] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.FavoriteExperienceSeeAll
		}
	},
	[EventNamesModule.ExperienceOpened] = {
		context = if FFlagProfilePlatformUseProfileTypeContextModule then Contexts.CommunityProfile else Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Experience },
		formatRulesForAdditionalInfo = {
			experienceId = ButtonSurface,
			positionInComponent = ButtonSurface
		}
	},
	[EventNamesModule.EventOpened] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Event },
		formatRulesForAdditionalInfo = { virtualEventId = ButtonSurface }
	},
	[EventNamesModule.EventRSVP] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.EventRSVP },
		formatRulesForAdditionalInfo = { virtualEventId = ButtonSurface, status = ButtonSurface }
	},
	[EventNamesModule.EventJoined] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.EventJoin },
		formatRulesForAdditionalInfo = { virtualEventId = ButtonSurface }
	},
	[EventNamesModule.CatalogItemOpened] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.ViewCatalogItem },
		formatRulesForAdditionalInfo = if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = ButtonSurface,
			btnUnitId = ButtonSurface,
			btnSortPosition = ButtonSurface
		} else {
			itemId = ButtonSurface,
			positionInComponent = ButtonSurface,
			component = ButtonSurface
		}
	},
	[EventNamesModule.UsernameCopied] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Username }
	},
	[EventNamesModule.ContextualMenuButtonViewPlatformProfile] = if FFlagEnablePlatformProfileContextualMenuOption then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = AnalyticsConstantsModule.ContextualMenuButtons.ViewPlatformProfile
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.CTAButtonEditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.CTAButtons.EditAppearance },
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.EditAppearanceEditAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditEmote] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.EditAppearanceEditEmote
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.EditAppearanceMenuSwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.EditAppearanceSwitchAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and (FFlagProfilePlatformEnableEditAppearanceAnalyticsModule and FFlagProfilePlatformEditBackgroundMenuItemModule) then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.EditAppearanceEditBackground
		},
		formatRulesForAdditionalInfo = { buttonSurface = ButtonSurface }
	} else nil,
	[EventNamesModule.InspectAvatarOpened] = if FFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.InspectAvatar },
		formatRulesForAdditionalInfo = { profileSessionId = ButtonSurface }
	} else nil,
	[EventNamesModule.InspectAvatarBuyClicked] = if FFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.InspectAvatarBuyItems
		},
		formatRulesForAdditionalInfo = {
			profileSessionId = ButtonSurface,
			itemIds = ButtonSurface,
			totalPrice = ButtonSurface
		}
	} else nil,
	[EventNamesModule.InspectAvatarPurchaseConfirmed] = if FFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstantsModule.Btns.InspectAvatarConfirmBuy
		},
		formatRulesForAdditionalInfo = { profileSessionId = ButtonSurface }
	} else nil,
	[EventNamesModule.MomentsSeeAll] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.MomentsSeeAll }
	},
	[EventNamesModule.MomentOpened] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = AnalyticsConstantsModule.Btns.Moment }
	}
}