local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local GroupsNetworkingModule = require(ProfilePlatform.Networking.GroupsNetworking)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local RefreshProfilePlatformModule = require(ProfilePlatform.Networking.refreshProfilePlatform)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local MakeViewGroupPageModule = require(ProfilePlatform.Utils.makeViewGroupPage)
local ProfileTypes = EnumsModule.ProfileTypes
local ShareName: string = `{require(Parent.Http).Url.BASE_URL}share/g/%s`

return {
	[EnumsModule.ProfileActions.CopyLink] = function(p1) --[[ Line: 40 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), Default (copy), Contexts (copy), ShareName (copy), SetCurrentToastMessageFunction (copy), TextKeysModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.CopyLink],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 44 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), Default (upval), Contexts (upval), ShareName (upval), SetCurrentToastMessageFunction (upval), TextKeysModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1.buttonSurface })
					Default:setClipboardText({
						context = Contexts.ProfileCard,
						text = string.format(ShareName, p1.profileId)
					})
					p1.dispatch(SetCurrentToastMessageFunction({ toastMessage = TextKeysModule.LinkCopied }))
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.JoinCommunity] = function(p1) --[[ Line: 61 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			variant = ButtonVariant.Emphasis,
			text = p1.localized[EnumsModule.ProfileActions.JoinCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 66 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonJoinCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(GroupsNetworkingModule.JoinGroup.API({ groupId = p1.profileId })):andThen(function() --[[ Line: 76 ]]
						-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
						p1.dispatch(GetProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = GetAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.CancelJoinCommunityRequest] = function(p1) --[[ Line: 89 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), RefreshProfilePlatformModule (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[EnumsModule.ProfileActions.CancelJoinCommunityRequest],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 94 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonCancelJoinCommunityRequest, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(GroupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function() --[[ Line: 105 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
						p1.dispatch(RefreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { EnumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.ViewCommunity] = function(p1) --[[ Line: 119 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), MakeViewGroupPageModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			variant = ButtonVariant.SubEmphasis,
			text = p1.localized[EnumsModule.ProfileActions.ViewCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 124 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), MakeViewGroupPageModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonViewCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local ViewGroupPageModule = MakeViewGroupPageModule(p1.profileId, function() --[[ Line: 130 ]]
						-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
						p1.dispatch(GetProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = GetAvailableCommunityComponentsModule()
						}))
					end)
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(ViewGroupPageModule))
						
						return
					else
						p1.dispatch(NavigateDownFunction(ViewGroupPageModule))
					end
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.ViewFullProfile] = function(p1) --[[ Line: 148 ]]
		-- upvalues: ButtonVariant (copy), EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), UrlBuilder (copy), UrlBase (copy), TextKeysModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
		return {
			variant = ButtonVariant.SubEmphasis,
			text = p1.localized[EnumsModule.ProfileActions.ViewFullProfile],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 153 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), AppPage (upval), UrlBuilder (upval), UrlBase (upval), TextKeysModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.CTAButtonViewFullProfile, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					local config = {
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.new({ base = UrlBase.WWW, path = `profiles/{p1.profileId}` })(),
						extraProps = {
							titleKey = TextKeysModule.Profile,
							onClose = function() --[[ Line: 167 ]]
								-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
								p1.dispatch(GetProfilePlatformModule.API({
									includeComponentOrdering = true,
									profileType = p1.profileType,
									profileId = p1.profileId,
									components = GetAvailableCommunityComponentsModule()
								}))
							end
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						p1.dispatch(NavigateDownFunction(config))
					end
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.LeaveCommunity] = function(p1) --[[ Line: 187 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.LeaveCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 191 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonLeaveCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(GroupsNetworkingModule.LeaveGroup.API({ groupId = p1.profileId, userId = p1.localUserId })):andThen(function() --[[ Line: 202 ]]
						-- upvalues: p1 (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval)
						p1.dispatch(GetProfilePlatformModule.API({
							includeComponentOrdering = true,
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = GetAvailableCommunityComponentsModule()
						}))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.MakePrimaryCommunity] = function(p1) --[[ Line: 215 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), RefreshProfilePlatformModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.MakePrimaryCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 219 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonMakePrimaryCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(GroupsNetworkingModule.MakePrimaryGroup.API({ groupId = p1.profileId })):andThen(function() --[[ Line: 229 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
						p1.dispatch(RefreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { EnumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.RemovePrimaryCommunity] = function(p1) --[[ Line: 243 ]]
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GroupsNetworkingModule (copy), RefreshProfilePlatformModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.RemovePrimaryCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() --[[ Line: 247 ]]
					-- upvalues: p1 (copy), EventNamesModule (upval), GroupsNetworkingModule (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, {
						buttonSurface = p1.buttonSurface,
						btnContext = p1.profileWrapperContext.sourceInfo.source
					})
					
					return p1.dispatch(GroupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 253 ]]
						-- upvalues: p1 (upval), RefreshProfilePlatformModule (upval), EnumsModule (upval)
						p1.dispatch(RefreshProfilePlatformModule({
							profileType = p1.profileType,
							profileId = p1.profileId,
							components = { EnumsModule.Components.Actions }
						}))
					end)
				end
			}
		}
	end
}