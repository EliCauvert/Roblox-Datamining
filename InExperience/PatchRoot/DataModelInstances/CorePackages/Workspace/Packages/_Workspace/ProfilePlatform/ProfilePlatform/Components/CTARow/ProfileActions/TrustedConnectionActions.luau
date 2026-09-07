local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local UIBloxModule = require(parent.UIBlox)
local sharedFlagsModule = require(parent.SharedFlags)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local dataHydrationModule = require(parent.DataHydration)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local images = UIBloxModule.App.ImageSet.Images
local appPage = robloxAppEnumsModule.AppPage
local sources = socialLuaAnalyticsModule.Analytics.Enums.Sources
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Components.CTARow.Types)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local profileTypes = enumsModule.ProfileTypes
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local var1 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return {
	[enumsModule.ProfileActions.RemoveTrustedConnection] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), var1 (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.RemoveTrustedConnection],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), var1 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1.buttonSurface })
					
					return var1.removeTrustedConnectionRequest(p1.profileId):andThen(function()
						-- upvalues: p1 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p1.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p1.localized.trustedConnectionRemovedToast,
							toastIcon = images["icons/actions/friends/friendRemove"]
						}))
						
						return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), sources (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), sources (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							source = sources.ProfilePlatform,
							onRequestSent = function()
								-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), sources (ref), appPage (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), sources (copy), appPage (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p1.buttonSurface,
						modalVariantOverride = sources.ShareLinkSender
					})
					p1.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							source = sources.ProfilePlatform,
							modalVariantOverride = sources.ShareLinkSender,
							onRequestSent = function()
								-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = {
				[profileTypes.User] = function()
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							onRequestAccepted = function()
								-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p1.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = { [profileTypes.User] = function() end }
		}
	end else nil,
	[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection) then function(p1)
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p1.localized[enumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = { [profileTypes.User] = function() end }
		}
	end else nil
}