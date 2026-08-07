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
	[enumsModule.ProfileActions.CopyLink] = function(p0) --[[ line: 41 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), default (ref), contexts (ref), base_url (ref), setCurrentToastMessage (ref), textKeysModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.CopyLink],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 45 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), default (copy), contexts (copy), base_url (copy), setCurrentToastMessage (copy), textKeysModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p0.buttonSurface })
					default:setClipboardText({
						context = contexts.ProfileCard,
						text = string.format(base_url, p0.profileId)
					})
					p0.dispatch(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
				end
			}
		}
	end,
	[enumsModule.ProfileActions.JoinCommunity] = function(p1) --[[ line: 62 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			variant = buttonVariant.Emphasis,
			text = p1.localized[enumsModule.ProfileActions.JoinCommunity],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 67 ]]
					-- upvalues: p1 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(groupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function() --[[ line: 77 ]]
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
	[enumsModule.ProfileActions.CancelJoinCommunityRequest] = function(p2) --[[ line: 90 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			variant = buttonVariant.Standard,
			text = p2.localized[enumsModule.ProfileActions.CancelJoinCommunityRequest],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 95 ]]
					-- upvalues: p2 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p2.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, {
						buttonSurface = p2.buttonSurface,
						btnContext = p2.profileWrapperContext.sourceInfo.source
					})
					
					return p2.dispatch(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = p2.profileId, userId = p2.localUserId })):andThen(function() --[[ line: 106 ]]
						-- upvalues: p2 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p2.dispatch(refreshProfilePlatformModule({
							profileType = p2.profileType,
							profileId = p2.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.ViewCommunity] = function(p3) --[[ line: 120 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), urlBuilder (ref), textKeysModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			variant = buttonVariant.SubEmphasis,
			text = p3.localized[enumsModule.ProfileActions.ViewCommunity],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 125 ]]
					-- upvalues: p3 (ref), eventNamesModule (copy), appPage (copy), urlBuilder (copy), textKeysModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					p3.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, {
						buttonSurface = p3.buttonSurface,
						btnContext = p3.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.user.group({ groupId = p3.profileId }),
						extraProps = {
							titleKey = textKeysModule.Community,
							onClose = function() --[[ line: 136 ]]
								-- upvalues: p3 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
								p3.dispatch(getProfilePlatformModule.API({
									includeComponentOrdering = true,
									profileType = p3.profileType,
									profileId = p3.profileId,
									components = getAvailableCommunityComponentsModule()
								}))
							end
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					p3.dispatch(navigateDown(t))
				end
			}
		}
	end,
	[enumsModule.ProfileActions.ViewFullProfile] = if require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities) then function(p4) --[[ line: 157 ]]
		-- upvalues: buttonVariant (ref), enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), urlBuilder (ref), urlBase (ref), textKeysModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
		return {
			variant = buttonVariant.SubEmphasis,
			text = p4.localized[enumsModule.ProfileActions.ViewFullProfile],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 162 ]]
					-- upvalues: p4 (ref), eventNamesModule (copy), appPage (copy), urlBuilder (copy), urlBase (copy), textKeysModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
					p4.analytics.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p4.buttonSurface,
						btnContext = p4.profileWrapperContext.sourceInfo.source
					})
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{p4.profileId}` })(),
						extraProps = {
							titleKey = textKeysModule.Profile,
							onClose = function() --[[ line: 176 ]]
								-- upvalues: p4 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
								p4.dispatch(getProfilePlatformModule.API({
									includeComponentOrdering = true,
									profileType = p4.profileType,
									profileId = p4.profileId,
									components = getAvailableCommunityComponentsModule()
								}))
							end
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					p4.dispatch(navigateDown(t))
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.LeaveCommunity] = function(p5) --[[ line: 197 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref)
		return {
			text = p5.localized[enumsModule.ProfileActions.LeaveCommunity],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 201 ]]
					-- upvalues: p5 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
					p5.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, {
						buttonSurface = p5.buttonSurface,
						btnContext = p5.profileWrapperContext.sourceInfo.source
					})
					
					return p5.dispatch(groupsNetworkingModule.LeaveGroup.API({ groupId = p5.profileId, userId = p5.localUserId })):andThen(function() --[[ line: 212 ]]
						-- upvalues: p5 (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy)
						p5.dispatch(getProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p5.profileType,
							profileId = p5.profileId,
							components = getAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.MakePrimaryCommunity] = function(p6) --[[ line: 225 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			text = p6.localized[enumsModule.ProfileActions.MakePrimaryCommunity],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 229 ]]
					-- upvalues: p6 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p6.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, {
						buttonSurface = p6.buttonSurface,
						btnContext = p6.profileWrapperContext.sourceInfo.source
					})
					
					return p6.dispatch(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = p6.profileId })):andThen(function() --[[ line: 239 ]]
						-- upvalues: p6 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p6.dispatch(refreshProfilePlatformModule({
							profileType = p6.profileType,
							profileId = p6.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.RemovePrimaryCommunity] = function(p7) --[[ line: 253 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), groupsNetworkingModule (ref), refreshProfilePlatformModule (ref)
		return {
			text = p7.localized[enumsModule.ProfileActions.RemovePrimaryCommunity],
			onActivated = {
				[profileTypes.Community] = function() --[[ line: 257 ]]
					-- upvalues: p7 (ref), eventNamesModule (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
					p7.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, {
						buttonSurface = p7.buttonSurface,
						btnContext = p7.profileWrapperContext.sourceInfo.source
					})
					
					return p7.dispatch(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ line: 263 ]]
						-- upvalues: p7 (copy), refreshProfilePlatformModule (copy), enumsModule (copy)
						p7.dispatch(refreshProfilePlatformModule({
							profileType = p7.profileType,
							profileId = p7.profileId,
							components = { enumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end
}