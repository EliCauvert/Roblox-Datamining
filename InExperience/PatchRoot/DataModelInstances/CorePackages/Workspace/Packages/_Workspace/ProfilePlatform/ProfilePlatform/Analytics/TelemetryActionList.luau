local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)
local analyticsConstantsModule = require(script.Parent.AnalyticsConstants)
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagFriendsCallingClientGateDEV = require(parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ProfilePlatformAnalyticsThrottlingThousandths", 1000)
	},
	[eventNamesModule.ProfileLoadingStage] = {
		description = "Stage of loading profile",
		lastUpdated = { 24, 6, 6 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				overrideName = function(p1)
					-- upvalues: eventNamesModule (ref)
					return eventNamesModule.ProfileLoadingStage .. "Time" .. p1.status
				end,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end,
					isProfilePlatform = function(p1)
						return p1 or false
					end
				}
			}
		}
	},
	[eventNamesModule.ProfilePlatformPageReloaded] = {
		description = "ReloadedProfilePlatform",
		lastUpdated = { 25, 4, 25 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					reloadCount = function(p1)
						return if p1 <= 10 then `ReloadCount${p1}` else "ReloadCount5+"
					end
				}
			}
		}
	},
	[eventNamesModule.ProfileInExperienceUserLoadingStage] = {
		description = "User in experience opened",
		lastUpdated = { 24, 6, 10 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end,
					isInExperience = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.ProfilePageLoadedWithData] = {
		description = "Profile page loaded with data",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					friendStatus = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.ProfilePresenceLoaded] = {
		description = "Profile presence loaded",
		lastUpdated = { 25, 2, 19 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					presenceType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.ContextualMenuButtonCall] = if fFlagFriendsCallingClientGateDEV then {
		description = "Call button clicked from contextual menu",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.ContextualMenuButtonChat] = {
		description = "Chat button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		description = "Ignore friend request button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonReport] = {
		description = "Report button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonUnfriend] = {
		description = "Unfriend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonBlock] = {
		description = "Block button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonSetAlias] = {
		description = "Set alias button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonCopyLink] = {
		description = "Copy Link button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		description = "Leave Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		description = "Make Primary Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		description = "Remove Primary Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		description = "Remove Trusted Connection button clicked",
		lastUpdated = { 25, 6, 16 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		description = "Add Trusted Connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariantOverride = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		description = "Accept Trusted Connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonOpenEditProfilePage] = {
		description = "Open edit profile page button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonCall] = if fFlagFriendsCallingClientGateDEV then {
		description = "Call CTA button clicked",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.CTAButtonChat] = {
		description = "Chat button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonUnfriend] = {
		description = "Unfriend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonUnblock] = {
		description = "Unblock button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonAddFriend] = {
		description = "Add friend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonAddFriendFromContacts] = {
		description = "Add friend from contacts clicked",
		lastUpdated = { 24, 9, 12 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonAcceptFriendRequest] = {
		description = "Accept friend request button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonEditAvatar] = {
		description = "Edit avatar button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonEditLook] = {
		description = "Edit look button clicked",
		lastUpdated = { 26, 3, 18 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonShareProfile] = {
		description = "Share profile button clicked",
		lastUpdated = { 25, 3, 12 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonShareProfileQRCode] = {
		description = "Share profile QR code button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonJoinCommunity] = {
		description = "Join Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonViewCommunity] = {
		description = "View Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		description = "Cancel Join Community Request button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SchoolButton] = {
		description = "School button clicked",
		lastUpdated = { 26, 7, 20 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.FriendsButton] = {
		description = "Friends button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.FollowersButton] = {
		description = "Followers button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.FollowingsButton] = {
		description = "Following button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.MutualFriendsButton] = {
		description = "Mutual friends button clicked",
		lastUpdated = { 25, 8, 19 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ViewPlayerProfileButton] = {
		description = "View player profile button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButton] = {
		description = "Contextual menu button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.GameDetailsButton] = {
		description = "Game details button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.EditDisplayNameButton] = {
		description = "Edit display name button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.SetAliasButton] = {
		description = "Set alias button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ProfileClosed] = {
		description = "Profile closed",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[eventNamesModule.StoreHeaderButton] = {
		description = "Store header button clicked",
		lastUpdated = { 25, 4, 23 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CatalogItemOpened] = {
		description = "Catalog item opened",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = if fFlagProfilePlatformEnableStore then if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
					btnContext = function(p1)
						return p1
					end
				} else {
					source = function(p1)
						return p1
					end
				} else nil
			}
		}
	},
	[eventNamesModule.ProfileImpressionsSent] = {
		description = "Impressions sent",
		lastUpdated = { 25, 2, 24 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					component = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.UsernameCopied] = {
		description = "Username copied to clipboard",
		lastUpdated = { 25, 8, 5 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ContextualMenuButtonViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
		description = "View platform profile button clicked",
		lastUpdated = { 25, 9, 11 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.ContextualMenuButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		description = "Currency transfer button clicked from contextual menu",
		lastUpdated = { 26, 3, 24 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.CTAButtonCurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
		description = "Currency transfer CTA button clicked",
		lastUpdated = { 26, 3, 24 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.ContextualMenuButtonTradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
		description = "Trade Items button clicked from contextual menu",
		lastUpdated = { 26, 8, 13 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.ContextualMenuTradeItemsImpression] = if fFlagProfilePlatformEnableTradeItemsModule and require(profilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging) then {
		description = "Trade Items row shown in the profile overflow menu",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.CTAButtonTradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
		description = "Trade Items CTA button clicked",
		lastUpdated = { 26, 8, 13 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.CTAButtonEditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit appearance menu opened",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditEmote] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit emote clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuSwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Switch avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then {
		description = "Edit background clicked from edit appearance menu",
		lastUpdated = { 26, 5, 14 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.InspectAvatarInsufficientRobuxShown] = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Insufficient Robux dialog shown from the Inspect Avatar sheet",
		lastUpdated = { 26, 7, 31 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.PlayerProfile,
					btn = analyticsConstantsModule.Btns.InspectAvatarInsufficientRobux
				},
				dynamicCustomFields = {
					totalPrice = function(p1)
						return p1
					end
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.InspectAvatarBuyRobuxClicked] = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Buy Robux clicked on the insufficient Robux dialog",
		lastUpdated = { 26, 7, 31 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.PlayerProfile,
					btn = analyticsConstantsModule.Btns.InspectAvatarBuyRobux
				},
				dynamicCustomFields = {
					totalPrice = function(p1)
						return p1
					end
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.CurrentlyWearingHeaderButton] = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Currently Wearing header button clicked to open the Inspect Avatar sheet",
		lastUpdated = { 26, 8, 3 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.PlayerProfile,
					btn = analyticsConstantsModule.Btns.CurrentlyWearingHeader
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}