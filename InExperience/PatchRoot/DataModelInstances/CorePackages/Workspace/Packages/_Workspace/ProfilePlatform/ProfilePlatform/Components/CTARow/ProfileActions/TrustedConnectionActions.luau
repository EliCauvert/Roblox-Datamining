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
local var9 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return {
	[enumsModule.ProfileActions.RemoveTrustedConnection] = function(p0) --[[ line: 27 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), var9 (ref), setCurrentToastMessage (ref), images (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p0.localized[enumsModule.ProfileActions.RemoveTrustedConnection],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 31 ]]
					-- upvalues: p0 (ref), eventNamesModule (copy), var9 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
					p0.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p0.buttonSurface })
					
					return var9.removeTrustedConnectionRequest(p0.profileId):andThen(function() --[[ line: 35 ]]
						-- upvalues: p0 (copy), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy)
						p0.dispatch(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = p0.localized.trustedConnectionRemovedToast,
							toastIcon = images["icons/actions/friends/friendRemove"]
						}))
						
						return p0.dispatch(refreshProfilePlatformActionInfoModule(p0.profileId, p0.actionsComponentRequest))
					end)
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then function(p1) --[[ line: 51 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), sources (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p1.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 55 ]]
					-- upvalues: p1 (ref), eventNamesModule (copy), appPage (copy), sources (copy), refreshProfilePlatformActionInfoModule (copy)
					p1.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1.buttonSurface })
					p1.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p1.profileId,
							source = sources.ProfilePlatform,
							onRequestSent = function() --[[ line: 63 ]]
								-- upvalues: p1 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p1.dispatch(refreshProfilePlatformActionInfoModule(p1.profileId, p1.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = function(p2) --[[ line: 79 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), sources (ref), appPage (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p2.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 83 ]]
					-- upvalues: p2 (ref), eventNamesModule (copy), sources (copy), appPage (copy), refreshProfilePlatformActionInfoModule (copy)
					p2.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p2.buttonSurface,
						modalVariantOverride = sources.ShareLinkSender
					})
					p2.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p2.profileId,
							source = sources.ProfilePlatform,
							modalVariantOverride = sources.ShareLinkSender,
							onRequestSent = function() --[[ line: 93 ]]
								-- upvalues: p2 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p2.dispatch(refreshProfilePlatformActionInfoModule(p2.profileId, p2.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end,
	[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then function(p3) --[[ line: 106 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref), eventNamesModule (ref), appPage (ref), refreshProfilePlatformActionInfoModule (ref)
		return {
			text = p3.localized[enumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = {
				[profileTypes.User] = function() --[[ line: 110 ]]
					-- upvalues: p3 (ref), eventNamesModule (copy), appPage (copy), refreshProfilePlatformActionInfoModule (copy)
					p3.analytics.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p3.buttonSurface })
					p3.navigation.push(appPage.TrustedContactsModal, {
						props = {
							userId = p3.profileId,
							onRequestAccepted = function() --[[ line: 120 ]]
								-- upvalues: p3 (copy), refreshProfilePlatformActionInfoModule (copy)
								return p3.dispatch(refreshProfilePlatformActionInfoModule(p3.profileId, p3.actionsComponentRequest))
							end
						}
					})
				end
			}
		}
	end else nil,
	[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then function(p4) --[[ line: 137 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p4.localized[enumsModule.ProfileActions.AddTrustedConnection],
			onActivated = { [profileTypes.User] = function() --[[ line: 142 ]] end }
		}
	end else nil,
	[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection) then function(p5) --[[ line: 149 ]]
		-- upvalues: enumsModule (ref), profileTypes (ref)
		return {
			isDisabled = true,
			text = p5.localized[enumsModule.ProfileActions.AddIncomingTrustedConnection],
			onActivated = { [profileTypes.User] = function() --[[ line: 154 ]] end }
		}
	end else nil
}