local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local supportedTelemetryBackends = require(parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEnableEditAppearanceAnalyticsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceAnalytics)

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
					status = function(p0) --[[ line: 35 ]]
						return p0
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				overrideName = function(p1) --[[ line: 42 ]]
					-- upvalues: eventNamesModule (ref)
					return eventNamesModule.ProfileLoadingStage .. "Time" .. p1.status
				end,
				dynamicCustomFields = {
					status = function(p2) --[[ line: 46 ]]
						return p2
					end,
					isProfilePlatform = function(p3) --[[ line: 49 ]]
						return p3 or false
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
					reloadCount = function(p4) --[[ line: 63 ]]
						return if p4 <= 10 then `ReloadCount${p4}` else "ReloadCount5+"
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
					status = function(p5) --[[ line: 83 ]]
						return p5
					end,
					isInExperience = function(p6) --[[ line: 86 ]]
						return p6
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
					friendStatus = function(p7) --[[ line: 100 ]]
						return p7
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
					presenceType = function(p8) --[[ line: 114 ]]
						return p8
					end
				}
			}
		}
	},
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
					modalVariantOverride = function(p9) --[[ line: 227 ]]
						return p9
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
					btnContext = function(p11) --[[ line: 477 ]]
						return p11
					end
				} else {
					source = function(p10) --[[ line: 482 ]]
						return p10
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
					component = function(p12) --[[ line: 497 ]]
						return p12
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
	[eventNamesModule.CTAButtonEditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		description = "Edit appearance menu opened",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		description = "Edit avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditEmote] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		description = "Edit emote clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuSwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule then {
		description = "Switch avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.EditAppearanceMenuEditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEnableEditAppearanceAnalyticsModule and require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem) then {
		description = "Edit background clicked from edit appearance menu",
		lastUpdated = { 26, 5, 14 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}