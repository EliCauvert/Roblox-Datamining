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
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics

local var1 = function(p1)
	return p1
end

return {
	[eventNamesModule.ProfilePageLoadedWithData] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendStatus = var1,
			playerPresence = var1,
			absolutePosition = var1,
			isHomePageCarousel = var1,
			isRecommendation = var1,
			recommendationContextType = var1,
			recommendationRank = var1,
			recommendationSessionId = var1,
			source = var1,
			profileType = var1,
			shareLinkId = var1,
			primaryAction = var1
		}
	},
	[eventNamesModule.ProfilePresenceLoaded] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.PresenceLoaded,
		formatRulesForAdditionalInfo = { presenceType = var1, universeId = var1 }
	},
	[eventNamesModule.ContextualMenuButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Chat
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.IgnoreFriendRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonReport] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Report
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfriend
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonBlock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Block
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonSetAlias] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.SetAlias
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonCopyLink] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CopyLink
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.LeaveCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.ContextualMenuButtonUnfollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.Unfollow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemoveTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, modalVariantOverride = var1 }
	},
	[eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.AddIncomingTrustedConnection
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.MakePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.RemovePrimaryCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.ContextualMenuButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.ContextualMenuButtonTradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.ContextualMenuButtons.TradeItems
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.CTAButtonOpenEditProfilePage] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.OpenEditProfilePage
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Chat },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonUnlockChat] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.UnlockChat },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonUnfriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unfriend },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonUnblock] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.Unblock },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonAddFriend] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.AddFriend },
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			isHomePageCarousel = var1,
			isRecommendation = var1,
			recommendationContextType = var1,
			recommendationRank = var1,
			recommendationSessionId = var1,
			source = var1,
			contextualInfoType = var1,
			shareLinkId = var1,
			profileType = var1
		}
	},
	[eventNamesModule.CTAButtonAddFriendFromContacts] = {
		context = contexts.ContactImport,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AddFriendFromContacts
		},
		formatRulesForAdditionalInfo = { shareLinkId = var1 }
	},
	[eventNamesModule.CTAButtonAcceptFriendRequest] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.AcceptFriendRequest
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			contextualInfoType = var1,
			isHomePageCarousel = var1,
			isRecommendation = var1,
			recommendationContextType = var1,
			recommendationRank = var1,
			recommendationSessionId = var1,
			source = var1,
			buttonSurface = var1,
			shareLinkId = var1,
			profileType = var1
		}
	},
	[eventNamesModule.CTAButtonEditAvatar] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAvatar },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonEditLook] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditLook },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonShareProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.ShareProfile },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonShareProfileQRCode] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.CTAButtons.ShareProfileQRCode
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonJoinCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.JoinCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.CTAButtonFollow] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.Follow
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	},
	[eventNamesModule.CTAButtonViewCommunity] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewCommunity
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.CTAButtonViewFullProfile] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.ViewFullProfile
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
	},
	[eventNamesModule.CTAButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CurrencyTransfer
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.CTAButtonTradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.TradeItems
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		context = if fFlagProfilePlatformUseProfileTypeContextModule then contexts.CommunityProfile else contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			optionType = "CTAType",
			btn = analyticsConstantsModule.CTAButtons.CancelJoinCommunityRequest
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1, btnContext = var1 }
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
			absolutePosition = var1,
			friendStatus = var1,
			isHomePageCarousel = var1,
			isRecommendation = var1,
			recommendationContextType = var1,
			recommendationRank = var1,
			recommendationSessionId = var1,
			source = var1,
			buttonSurface = var1
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
		formatRulesForAdditionalInfo = { canSetDisplayName = var1 }
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
		formatRulesForAdditionalInfo = { experienceId = var1, positionInComponent = var1 }
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
		formatRulesForAdditionalInfo = { experienceId = var1, positionInComponent = var1 }
	},
	[eventNamesModule.EventOpened] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.Event },
		formatRulesForAdditionalInfo = { virtualEventId = var1 }
	},
	[eventNamesModule.EventRSVP] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventRSVP },
		formatRulesForAdditionalInfo = { virtualEventId = var1, status = var1 }
	},
	[eventNamesModule.EventJoined] = {
		context = contexts.CommunityProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.EventJoin },
		formatRulesForAdditionalInfo = { virtualEventId = var1 }
	},
	[eventNamesModule.CatalogItemOpened] = {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.ViewCatalogItem },
		formatRulesForAdditionalInfo = if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
			btnContext = var1,
			btnUnitId = var1,
			btnSortPosition = var1
		} else {
			itemId = var1,
			positionInComponent = var1,
			component = var1
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
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.CTAButtonEditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.CTAButtons.EditAppearance },
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditEmote] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditEmote
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuSwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceSwitchAvatar
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.EditAppearanceEditBackground
		},
		formatRulesForAdditionalInfo = { buttonSurface = var1 }
	} else nil,
	[eventNamesModule.InspectAvatarOpened] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = analyticsConstantsModule.Btns.InspectAvatar },
		formatRulesForAdditionalInfo = { profileSessionId = var1 }
	} else nil,
	[eventNamesModule.InspectAvatarBuyClicked] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarBuyItems
		},
		formatRulesForAdditionalInfo = {
			profileSessionId = var1,
			itemIds = var1,
			totalPrice = var1
		}
	} else nil,
	[eventNamesModule.InspectAvatarPurchaseConfirmed] = if fFlagSocialEnableProfileInspectAndBuyAnalytics then {
		context = contexts.PlayerProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = analyticsConstantsModule.Btns.InspectAvatarConfirmBuy
		},
		formatRulesForAdditionalInfo = { profileSessionId = var1 }
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