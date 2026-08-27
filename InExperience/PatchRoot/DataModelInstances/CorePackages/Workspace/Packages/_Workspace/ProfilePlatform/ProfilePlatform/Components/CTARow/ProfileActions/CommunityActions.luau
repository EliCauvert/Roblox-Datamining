local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local buttonVariant = require(parent.Foundation).Enums.ButtonVariant
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local url = require(parent.Http).Url
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local groupsNetworkingModule = require(profilePlatform.Networking.GroupsNetworking)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local refreshProfilePlatformModule = require(profilePlatform.Networking.refreshProfilePlatform)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local base_url = `{url.BASE_URL}share/g/%s`

return {
	[enumsModule.ProfileActions.CopyLink] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), default (ref), contexts (ref), base_url (ref), setCurrentToastMessage (ref), textKeysModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.CopyLink],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), default (copy), contexts (copy), base_url (copy), setCurrentToastMessage (copy), textKeysModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1.buttonSurface })
					default:setClipboardText({
						context = contexts.ProfileCard,
						text = string.format(base_url, p1.profileId)
					})
					p1.dispatch(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
				end
			}
		}
	end,
	[enumsModule.ProfileActions.JoinCommunity] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p1.localized[enumsModule.ProfileActions.JoinCommunity],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function()
						-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
						p1.dispatch(getProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = getAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.CancelJoinCommunityRequest] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p1.localized[enumsModule.ProfileActions.CancelJoinCommunityRequest],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function()
						-- upvalues: p1 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p1.dispatch(refreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.ViewCommunity] = function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), urlBuilder (ref), textKeysModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			variant = buttonVariant.SubEmphasis,
			text = p1.localized[enumsModule.ProfileActions.ViewCommunity],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), urlBuilder (copy), textKeysModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.user.group({ groupId = p1.profileId }),
						extraProps = {
							titleKey = textKeysModule.Community,
							onClose = function()
								-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
								p1.dispatch(getProfilePlatformModule.API({
									includeComponentOrdering = true,
									profileType = p1.profileType,
									profileId = p1.profileId,
									components = getAvailableCommunityComponentsModule()
								}))
							end
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					p1.dispatch(navigateDown(t))
				end
			}
		}
	end,
	[enumsModule.ProfileActions.ViewFullProfile] = if require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities) then function(p1)
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), urlBuilder (ref), urlBase (ref), textKeysModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			variant = buttonVariant.SubEmphasis,
			text = p1.localized[enumsModule.ProfileActions.ViewFullProfile],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), urlBuilder (copy), urlBase (copy), textKeysModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{p1.profileId}` })(),
						extraProps = {
							titleKey = textKeysModule.Profile,
							onClose = function()
								-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
								p1.dispatch(getProfilePlatformModule.API({
									includeComponentOrdering = true,
									profileType = p1.profileType,
									profileId = p1.profileId,
									components = getAvailableCommunityComponentsModule()
								}))
							end
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					p1.dispatch(navigateDown(t))
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.LeaveCommunity] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.LeaveCommunity],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.LeaveGroup.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function()
						-- upvalues: p1 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
						p1.dispatch(getProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = getAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.MakePrimaryCommunity] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.MakePrimaryCommunity],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = p1.profileId })):andThen(function()
						-- upvalues: p1 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p1.dispatch(refreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.RemovePrimaryCommunity] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.RemovePrimaryCommunity],
			onActivated = {
				[profileTypes.Community] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function()
						-- upvalues: p1 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p1.dispatch(refreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end
}