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
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics

local var7 = function(p0) --[[ line: 27 ]]
	return p0
end

return {
	[eventNamesModule.ProfilePageLoadedWithData] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendStatus = var7,
			playerPresence = var7,
			absolutePosition = var7,
			isHomePageCarousel = var7,
			isRecommendation = var7,
			recommendationContextType = var7,
			recommendationRank = var7,
			recommendationSessionId = var7,
			source = var7,
			profileType = var7,
			shareLinkId = var7,
			primaryAction = var7
		}
	},
	[eventNamesModule.ProfilePresenceLoaded] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PresenceLoaded,
		formatRulesForAdditionalInfo = { presenceType = var7, universeId = var7 }
	},
	[eventNamesModule.ContextualMenuButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Chat
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.IgnoreFriendRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonReport] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Report
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfriend
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonBlock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Block
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonSetAlias] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.SetAlias
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonCopyLink] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CopyLink
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.LeaveCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.ContextualMenuButtonUnfollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfollow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemoveTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, modalVariantOverride = var7 }
	},
	[eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddIncomingTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.MakePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemovePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.ContextualMenuButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.CTAButtonOpenEditProfilePage] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.OpenEditProfilePage
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Chat },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonUnlockChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.UnlockChat },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unfriend },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonUnblock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unblock },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonAddFriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.AddFriend },
		formatRulesForAdditionalInfo = {
			absolutePosition = var7,
			isHomePageCarousel = var7,
			isRecommendation = var7,
			recommendationContextType = var7,
			recommendationRank = var7,
			recommendationSessionId = var7,
			source = var7,
			contextualInfoType = var7,
			shareLinkId = var7,
			profileType = var7
		}
	},
	[eventNamesModule.CTAButtonAddFriendFromContacts] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AddFriendFromContacts
		},
		formatRulesForAdditionalInfo = { shareLinkId = var7 }
	},
	[eventNamesModule.CTAButtonAcceptFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AcceptFriendRequest
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var7,
			contextualInfoType = var7,
			isHomePageCarousel = var7,
			isRecommendation = var7,
			recommendationContextType = var7,
			recommendationRank = var7,
			recommendationSessionId = var7,
			source = var7,
			buttonSurface = var7,
			shareLinkId = var7,
			profileType = var7
		}
	},
	[eventNamesModule.CTAButtonEditAvatar] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAvatar },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonEditLook] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditLook },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonShareProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.ShareProfile },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonShareProfileQRCode] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.ShareProfileQRCode
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonJoinCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.JoinCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.CTAButtonFollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.Follow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	},
	[eventNamesModule.CTAButtonViewCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.CTAButtonViewFullProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewFullProfile
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.CTAButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CancelJoinCommunityRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7, btnContext = var7 }
	},
	[eventNamesModule.SchoolButton] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.School }
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
			absolutePosition = var7,
			friendStatus = var7,
			isHomePageCarousel = var7,
			isRecommendation = var7,
			recommendationContextType = var7,
			recommendationRank = var7,
			recommendationSessionId = var7,
			source = var7,
			buttonSurface = var7
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
		formatRulesForAdditionalInfo = { canSetDisplayName = var7 }
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
		formatRulesForAdditionalInfo = { experienceId = var7, positionInComponent = var7 }
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
		formatRulesForAdditionalInfo = { experienceId = var7, positionInComponent = var7 }
	},
	[eventNamesModule.EventOpened] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Event },
		formatRulesForAdditionalInfo = { virtualEventId = var7 }
	},
	[eventNamesModule.EventRSVP] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventRSVP },
		formatRulesForAdditionalInfo = { virtualEventId = var7, status = var7 }
	},
	[eventNamesModule.EventJoined] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventJoin },
		formatRulesForAdditionalInfo = { virtualEventId = var7 }
	},
	[eventNamesModule.CatalogItemOpened] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.ViewCatalogItem },
		formatRulesForAdditionalInfo = if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = var7,
			btnUnitId = var7,
			btnSortPosition = var7
		} else {
			itemId = var7,
			positionInComponent = var7,
			component = var7
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
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.CTAButtonEditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAppearance },
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditEmote] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditEmote
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuSwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceSwitchAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditBackground
		},
		formatRulesForAdditionalInfo = { buttonSurface = var7 }
	} else nil,
	[eventNamesModule.InspectAvatarOpened] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.InspectAvatar },
		formatRulesForAdditionalInfo = { profileSessionId = var7 }
	} else nil,
	[eventNamesModule.InspectAvatarBuyClicked] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarBuyItems
		},
		formatRulesForAdditionalInfo = {
			profileSessionId = var7,
			itemIds = var7,
			totalPrice = var7
		}
	} else nil,
	[eventNamesModule.InspectAvatarPurchaseConfirmed] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarConfirmBuy
		},
		formatRulesForAdditionalInfo = { profileSessionId = var7 }
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