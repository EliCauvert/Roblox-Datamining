local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)
local AnalyticsConstantsModule = require(script.Parent.AnalyticsConstants)
local FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(ProfilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagEnablePlatformProfileContextualMenuOption = require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableTradeItemsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local FFlagProfileTradeItemsImpressionLoggingModule = require(ProfilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging)
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ProfilePlatformAnalyticsThrottlingThousandths", 1000)
	},
	[EventNamesModule.ProfileLoadingStage] = {
		description = "Stage of loading profile",
		lastUpdated = { 24, 6, 6 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				overrideName = function(p1): string
					-- upvalues: EventNamesModule (copy)
					return EventNamesModule.ProfileLoadingStage .. "Time" .. p1.status
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
	[EventNamesModule.ProfilePlatformPageReloaded] = {
		description = "ReloadedProfilePlatform",
		lastUpdated = { 25, 4, 25 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					reloadCount = function(p1: number): string
						return if p1 <= 10 then `ReloadCount${p1}` else "ReloadCount5+"
					end
				}
			}
		}
	},
	[EventNamesModule.ProfileInExperienceUserLoadingStage] = {
		description = "User in experience opened",
		lastUpdated = { 24, 6, 10 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
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
	[EventNamesModule.ProfilePageLoadedWithData] = {
		description = "Profile page loaded with data",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					friendStatus = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.ProfilePresenceLoaded] = {
		description = "Profile presence loaded",
		lastUpdated = { 25, 2, 19 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					presenceType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.ContextualMenuButtonCall] = if FFlagFriendsCallingClientGateDEV then {
		description = "Call button clicked from contextual menu",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.ContextualMenuButtonChat] = {
		description = "Chat button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonIgnoreFriendRequest] = {
		description = "Ignore friend request button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonReport] = {
		description = "Report button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonUnfriend] = {
		description = "Unfriend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonBlock] = {
		description = "Block button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonSetAlias] = {
		description = "Set alias button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonCopyLink] = {
		description = "Copy Link button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonLeaveCommunity] = {
		description = "Leave Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonMakePrimaryCommunity] = {
		description = "Make Primary Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonRemovePrimaryCommunity] = {
		description = "Remove Primary Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonRemoveTrustedConnection] = {
		description = "Remove Trusted Connection button clicked",
		lastUpdated = { 25, 6, 16 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonAddTrustedConnection] = {
		description = "Add Trusted Connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariantOverride = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection] = {
		description = "Accept Trusted Connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonOpenEditProfilePage] = {
		description = "Open edit profile page button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonCall] = if FFlagFriendsCallingClientGateDEV then {
		description = "Call CTA button clicked",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.CTAButtonChat] = {
		description = "Chat button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonUnfriend] = {
		description = "Unfriend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonUnblock] = {
		description = "Unblock button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonAddFriend] = {
		description = "Add friend button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonAddFriendFromContacts] = {
		description = "Add friend from contacts clicked",
		lastUpdated = { 24, 9, 12 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonAcceptFriendRequest] = {
		description = "Accept friend request button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonEditAvatar] = {
		description = "Edit avatar button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonEditLook] = {
		description = "Edit look button clicked",
		lastUpdated = { 26, 3, 18 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonShareProfile] = {
		description = "Share profile button clicked",
		lastUpdated = { 25, 3, 12 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonShareProfileQRCode] = {
		description = "Share profile QR code button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonJoinCommunity] = {
		description = "Join Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonViewCommunity] = {
		description = "View Community button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CTAButtonCancelJoinCommunityRequest] = {
		description = "Cancel Join Community Request button clicked",
		lastUpdated = { 25, 3, 4 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SchoolButton] = {
		description = "School button clicked",
		lastUpdated = { 26, 7, 20 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FriendsButton] = {
		description = "Friends button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FollowersButton] = {
		description = "Followers button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FollowingsButton] = {
		description = "Following button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.MutualFriendsButton] = {
		description = "Mutual friends button clicked",
		lastUpdated = { 25, 8, 19 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ViewPlayerProfileButton] = {
		description = "View player profile button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButton] = {
		description = "Contextual menu button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.GameDetailsButton] = {
		description = "Game details button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.EditDisplayNameButton] = {
		description = "Edit display name button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SetAliasButton] = {
		description = "Set alias button clicked",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ProfileClosed] = {
		description = "Profile closed",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[EventNamesModule.StoreHeaderButton] = {
		description = "Store header button clicked",
		lastUpdated = { 25, 4, 23 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CatalogItemOpened] = {
		description = "Catalog item opened",
		lastUpdated = { 24, 7, 31 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = if FFlagProfilePlatformEnableStore then if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
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
	[EventNamesModule.ProfileImpressionsSent] = {
		description = "Impressions sent",
		lastUpdated = { 25, 2, 24 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					component = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.UsernameCopied] = {
		description = "Username copied to clipboard",
		lastUpdated = { 25, 8, 5 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ContextualMenuButtonViewPlatformProfile] = if FFlagEnablePlatformProfileContextualMenuOption then {
		description = "View platform profile button clicked",
		lastUpdated = { 25, 9, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.ContextualMenuButtonCurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then {
		description = "Currency transfer button clicked from contextual menu",
		lastUpdated = { 26, 3, 24 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.CTAButtonCurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then {
		description = "Currency transfer CTA button clicked",
		lastUpdated = { 26, 3, 24 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.ContextualMenuButtonTradeItems] = if FFlagProfilePlatformEnableTradeItemsModule then {
		description = "Trade Items button clicked from contextual menu",
		lastUpdated = { 26, 8, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.ContextualMenuTradeItemsImpression] = if FFlagProfilePlatformEnableTradeItemsModule and FFlagProfileTradeItemsImpressionLoggingModule then {
		description = "Trade Items row shown in the profile overflow menu",
		lastUpdated = { 26, 9, 3 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.CTAButtonTradeItems] = if FFlagProfilePlatformEnableTradeItemsModule then {
		description = "Trade Items CTA button clicked",
		lastUpdated = { 26, 8, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.CTAButtonEditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit appearance menu opened",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditEmote] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Edit emote clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.EditAppearanceMenuSwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
		description = "Switch avatar clicked from edit appearance menu",
		lastUpdated = { 26, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.EditAppearanceMenuEditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then {
		description = "Edit background clicked from edit appearance menu",
		lastUpdated = { 26, 5, 14 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.InspectAvatarInsufficientRobuxShown] = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Insufficient Robux dialog shown from the Inspect Avatar sheet",
		lastUpdated = { 26, 7, 31 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.PlayerProfile,
					btn = AnalyticsConstantsModule.Btns.InspectAvatarInsufficientRobux
				},
				dynamicCustomFields = {
					totalPrice = function(p1)
						return p1
					end
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.InspectAvatarBuyRobuxClicked] = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Buy Robux clicked on the insufficient Robux dialog",
		lastUpdated = { 26, 7, 31 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.PlayerProfile,
					btn = AnalyticsConstantsModule.Btns.InspectAvatarBuyRobux
				},
				dynamicCustomFields = {
					totalPrice = function(p1)
						return p1
					end
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.CurrentlyWearingHeaderButton] = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then {
		description = "Currently Wearing header button clicked to open the Inspect Avatar sheet",
		lastUpdated = { 26, 8, 3 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.PlayerProfile,
					btn = AnalyticsConstantsModule.Btns.CurrentlyWearingHeader
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}