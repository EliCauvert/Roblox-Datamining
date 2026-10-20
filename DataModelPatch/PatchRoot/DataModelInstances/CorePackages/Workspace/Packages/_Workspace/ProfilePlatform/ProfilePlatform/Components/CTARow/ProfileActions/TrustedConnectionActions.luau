local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local Images = require(Parent.UIBlox).App.ImageSet.Images
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = EnumsModule.ProfileTypes
local FFlagProfilePlatformAddTC = require(Parent.SharedFlags).FFlagProfilePlatformAddTC
local FFlagPendingIncomingTrustedConnectionModule = require(ProfilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return {
	[EnumsModule.ProfileActions.RemoveTrustedConnection] = function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), GetResult (copy), SetCurrentToastMessageFunction (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.RemoveTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), GetResult (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1.buttonSurface })
					
					return GetResult.removeTrustedConnectionRequest(p1.profileId):andThen(function()
						-- upvalues: p1 (upval), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval)
						p1.dispatch(SetCurrentToastMessageFunction({
							isLocalized = true,
							toastMessage = p1.localized.trustedConnectionRemovedToast,
							toastIcon = Images["icons/actions/friends/friendRemove"]
						}))
						
						return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.AddTrustedConnection] = if FFlagProfilePlatformAddTC then function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), Sources (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), AppPage (upval), Sources (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(AppPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							source = Sources.ProfilePlatform,
							onRequestSent = function()
								-- upvalues: p1 (upval), RefreshProfilePlatformActionInfoModule (upval)
								return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.AddTrustedConnectionViaLink] = function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), Sources (copy), AppPage (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), Sources (upval), AppPage (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p1.buttonSurface,
						modalVariantOverride = Sources.ShareLinkSender
					})
					p1.navigation.push(AppPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							source = Sources.ProfilePlatform,
							modalVariantOverride = Sources.ShareLinkSender,
							onRequestSent = function()
								-- upvalues: p1 (upval), RefreshProfilePlatformActionInfoModule (upval)
								return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end,
	[EnumsModule.ProfileActions.AddIncomingTrustedConnection] = if FFlagProfilePlatformAddTC then function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy), EventNamesModule (copy), AppPage (copy), RefreshProfilePlatformActionInfoModule (copy)
		return {
			text = p1.localized[EnumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function()
					-- upvalues: p1 (copy), EventNamesModule (upval), AppPage (upval), RefreshProfilePlatformActionInfoModule (upval)
					p1.analytics.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(AppPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							onRequestAccepted = function()
								-- upvalues: p1 (upval), RefreshProfilePlatformActionInfoModule (upval)
								return p1.dispatch(RefreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[EnumsModule.ProfileActions.PendingTrustedConnection] = if FFlagProfilePlatformAddTC then function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy)
		return {
			isDisabled = true,
			text = p1.localized[EnumsModule.ProfileActions.AddTrustedConnection],
			onActivated = { [ProfileTypes.User] = function() end }
		}
	end else nil,
	[EnumsModule.ProfileActions.PendingIncomingTrustedConnection] = if FFlagPendingIncomingTrustedConnectionModule then function(p1)
		-- upvalues: EnumsModule (copy), ProfileTypes (copy)
		return {
			isDisabled = true,
			text = p1.localized[EnumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = { [ProfileTypes.User] = function() end }
		}
	end else nil
}