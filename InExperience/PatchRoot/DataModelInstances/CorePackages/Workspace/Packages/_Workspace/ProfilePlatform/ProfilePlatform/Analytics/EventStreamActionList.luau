local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local analyticsConstantsModule = require(script.Parent.AnalyticsConstants)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)
local fFlagProfilePlatformUseProfileTypeContextModule = require(profilePlatform.Flags.FFlagProfilePlatformUseProfileTypeContext)
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditAppearanceAnalyticsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceAnalytics)
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics

local var8 = function(p0) --[[ line: 29 ]]
	return p0
end

return {
	[eventNamesModule.ProfilePageLoadedWithData] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendStatus = var8,
			playerPresence = var8,
			absolutePosition = var8,
			isHomePageCarousel = var8,
			isRecommendation = var8,
			recommendationContextType = var8,
			recommendationRank = var8,
			recommendationSessionId = var8,
			source = var8,
			profileType = var8,
			shareLinkId = var8,
			primaryAction = var8
		}
	},
	[eventNamesModule.ProfilePresenceLoaded] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PresenceLoaded,
		formatRulesForAdditionalInfo = { presenceType = var8, universeId = var8 }
	},
	[eventNamesModule.ContextualMenuButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Chat
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.IgnoreFriendRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonReport] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Report
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfriend
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonBlock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Block
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonSetAlias] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.SetAlias
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonCopyLink] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CopyLink
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.LeaveCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.ContextualMenuButtonUnfollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfollow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemoveTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, modalVariantOverride = var8 }
	},
	[eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddIncomingTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.MakePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemovePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.ContextualMenuButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.CTAButtonOpenEditProfilePage] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.OpenEditProfilePage
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Chat },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonUnlockChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.UnlockChat },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unfriend },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonUnblock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unblock },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonAddFriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.AddFriend },
		formatRulesForAdditionalInfo = {
			absolutePosition = var8,
			isHomePageCarousel = var8,
			isRecommendation = var8,
			recommendationContextType = var8,
			recommendationRank = var8,
			recommendationSessionId = var8,
			source = var8,
			contextualInfoType = var8,
			shareLinkId = var8,
			profileType = var8
		}
	},
	[eventNamesModule.CTAButtonAddFriendFromContacts] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AddFriendFromContacts
		},
		formatRulesForAdditionalInfo = { shareLinkId = var8 }
	},
	[eventNamesModule.CTAButtonAcceptFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AcceptFriendRequest
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var8,
			contextualInfoType = var8,
			isHomePageCarousel = var8,
			isRecommendation = var8,
			recommendationContextType = var8,
			recommendationRank = var8,
			recommendationSessionId = var8,
			source = var8,
			buttonSurface = var8,
			shareLinkId = var8,
			profileType = var8
		}
	},
	[eventNamesModule.CTAButtonEditAvatar] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAvatar },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonEditLook] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditLook },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonShareProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.ShareProfile },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonShareProfileQRCode] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.ShareProfileQRCode
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonJoinCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.JoinCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.CTAButtonFollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.Follow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	},
	[eventNamesModule.CTAButtonViewCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.CTAButtonViewFullProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewFullProfile
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.CTAButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CancelJoinCommunityRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8, btnContext = var8 }
	},
	[eventNamesModule.FriendsButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Friends }
	},
	[eventNamesModule.FollowersButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Followers }
	},
	[eventNamesModule.FollowingsButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Following }
	},
	[eventNamesModule.MutualFriendsButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.MutualFriends }
	},
	[eventNamesModule.ViewPlayerProfileButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.ViewPlayerProfile },
		formatRulesForAdditionalInfo = {
			absolutePosition = var8,
			friendStatus = var8,
			isHomePageCarousel = var8,
			isRecommendation = var8,
			recommendationContextType = var8,
			recommendationRank = var8,
			recommendationSessionId = var8,
			source = var8,
			buttonSurface = var8
		}
	},
	[eventNamesModule.ContextualMenuButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.ContextualMenu }
	},
	[eventNamesModule.GameDetailsButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.GameDetails }
	},
	[eventNamesModule.EditDisplayNameButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EditDisplayName },
		formatRulesForAdditionalInfo = { canSetDisplayName = var8 }
	},
	[eventNamesModule.SetAliasButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.SetAlias }
	},
	[eventNamesModule.ProfileClosed] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.Dismissed
	},
	[eventNamesModule.StoreHeaderButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.StoreHeader }
	},
	[eventNamesModule.FavoriteExperienceOpened] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.FavoriteExperience },
		formatRulesForAdditionalInfo = { experienceId = var8, positionInComponent = var8 }
	},
	[eventNamesModule.FavoriteExperienceSeeAll] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.FavoriteExperienceSeeAll
		}
	},
	[eventNamesModule.ExperienceOpened] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Experience },
		formatRulesForAdditionalInfo = { experienceId = var8, positionInComponent = var8 }
	},
	[eventNamesModule.EventOpened] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Event },
		formatRulesForAdditionalInfo = { virtualEventId = var8 }
	},
	[eventNamesModule.EventRSVP] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventRSVP },
		formatRulesForAdditionalInfo = { virtualEventId = var8, status = var8 }
	},
	[eventNamesModule.EventJoined] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventJoin },
		formatRulesForAdditionalInfo = { virtualEventId = var8 }
	},
	[eventNamesModule.CatalogItemOpened] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.ViewCatalogItem },
		formatRulesForAdditionalInfo = if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = var8,
			btnUnitId = var8,
			btnSortPosition = var8
		} else {
			itemId = var8,
			positionInComponent = var8,
			component = var8
		}
	},
	[eventNamesModule.UsernameCopied] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Username }
	},
	[eventNamesModule.ContextualMenuButtonViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.ViewPlatformProfile
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.CTAButtonEditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAppearance },
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditEmote] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditEmote
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuSwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceSwitchAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule and fFlagProfilePlatformEditBackgroundMenuItemModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditBackground
		},
		formatRulesForAdditionalInfo = { buttonSurface = var8 }
	} else nil,
	[eventNamesModule.InspectAvatarOpened] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.InspectAvatar },
		formatRulesForAdditionalInfo = { profileSessionId = var8 }
	} else nil,
	[eventNamesModule.InspectAvatarBuyClicked] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarBuyItems
		},
		formatRulesForAdditionalInfo = {
			profileSessionId = var8,
			itemIds = var8,
			totalPrice = var8
		}
	} else nil,
	[eventNamesModule.InspectAvatarPurchaseConfirmed] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarConfirmBuy
		},
		formatRulesForAdditionalInfo = { profileSessionId = var8 }
	} else nil,
	[eventNamesModule.MomentsSeeAll] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.MomentsSeeAll }
	},
	[eventNamesModule.MomentOpened] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Moment }
	}
}