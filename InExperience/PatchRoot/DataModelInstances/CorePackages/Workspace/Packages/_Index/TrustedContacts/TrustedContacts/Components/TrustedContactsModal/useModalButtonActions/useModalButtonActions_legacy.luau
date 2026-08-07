local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local ampApiProvider = require(parent.AmpUpsell).AmpApiProvider
local ampEnums = require(parent.AmpUpsell).AmpEnums
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local userProfilesModule = require(parent.UserProfiles)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local analyticsModule = require(trustedContacts.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local fFlagTCUpdateProfileCTAButton = require(parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local inverseTFRequestEnabled = game:DefineFastFlag("InverseTFRequestEnabled", false)
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local _ = require(trustedContacts.Common.Types)
local var7 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0, p1, p2, p3) --[[ line: 58 | named "useModalButtonActions" ]]
	-- upvalues: useNavigation (ref), useAppPolicy (ref), reactModule (ref), ampApiProvider (ref), fStringConnectionGraphCoreAmpNameSpace (ref), ampEnums (ref), userProfilesModule (ref), useLocalization (ref), useTCAnalytics (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), appPage (ref), inverseTFRequestEnabled (ref), var7 (ref), contexts (ref), trustedConnectionStatus (ref), foundationModule (ref)
	local var8 = useNavigation()
	local var9 = useAppPolicy(function(p4) --[[ line: 65 ]]
		return p4.getShareSheetEnabled()
	end)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(true)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: p0 (ref), ampApiProvider (copy), fStringConnectionGraphCoreAmpNameSpace (copy), ampEnums (copy), var11 (ref), var13 (ref)
		if ampApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, fStringConnectionGraphCoreAmpNameSpace, { { name = "targetUser", type = "UserId", value = p0 } }).access == ampEnums.AccessResponseEnum.Granted then
			var11(true)
		end
		var13(false)
	end, { p0 })
	local var14 = ""
	local var15 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0 },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if var15 and var15.data then
		var14 = userProfilesModule.Selectors.getCombinedNameFromId(var15.data, p0) or ""
	end
	local var16 = useLocalization({
		cancel = "CommonUI.Controls.Action.Cancel",
		add = "Feature.Friends.Action.Add",
		addViaLink = "Feature.Friends.Button.AddViaLink",
		ok = "CommonUI.Controls.Action.OK",
		accept = "CommonUI.Controls.Action.Accept",
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		trustedConnectionRequestSentToast = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		isATrustedConnectionNowToast = {
			"Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = var14
		}
	})
	local fireAnalyticsEvent = useTCAnalytics({ friendId = p0, modalVariant = p2, source = p1 }).fireAnalyticsEvent
	local var17 = reactModule.useCallback(function() --[[ line: 115 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p3 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsModalOkClicked)
		
		if p3.onAcknowledged then
			p3.onAcknowledged()
		end
		p3.closeModal()
	end, { p3.closeModal, p3.onAcknowledged, fireAnalyticsEvent })
	local var18 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagTCUpdateProfileCTAButton (copy), p3 (ref), var8 (ref), appPage (copy), p0 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCPrologueOpened)
		local onRequestAccepted = nil
		
		if fFlagTCUpdateProfileCTAButton then
			if p3.onRequestSent then
				onRequestAccepted = p3.onRequestSent
			elseif p3.onRequestAccepted then
				onRequestAccepted = p3.onRequestAccepted
			end
		end
		var8.replace(appPage.TrustedFriendsVPCPrologue, { userId = p0, completionCallback = onRequestAccepted })
	end, {
		fireAnalyticsEvent,
		var8,
		p0,
		if fFlagTCUpdateProfileCTAButton then p3.onRequestSent else nil,
		if fFlagTCUpdateProfileCTAButton then p3.onRequestAccepted else nil
	})
	local var19 = if inverseTFRequestEnabled then reactModule.useCallback(function() --[[ line: 152 ]]
		-- upvalues: var7 (copy), p0 (ref), p3 (ref), var18 (ref)
		var7.addTrustedFriendFromLink(p0, p3.tokens or {}):andThen(function() --[[ line: 154 ]]
			-- upvalues: var18 (copy)
			var18()
		end):catch(function() --[[ line: 157 ]]
			-- upvalues: p3 (copy)
			p3.showGenericErrorModal()
		end)
	end, { p0, p3.tokens, var18, p3.showGenericErrorModal }) else nil
	local var20 = reactModule.useCallback(function() --[[ line: 171 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p3 (ref), var16 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
		p3.showToast(var16.isATrustedConnectionNowToast)
	end, {
		var16.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		p3.showToast
	})
	local var21 = reactModule.useCallback(function() --[[ line: 182 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p3 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCancelClicked)
		p3.closeModal()
	end, { p3.closeModal, fireAnalyticsEvent })
	local var22 = reactModule.useCallback(function() --[[ line: 188 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var7 (copy), p0 (ref), p3 (ref), contexts (copy), var9 (ref), var16 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellAddViaLinkClicked)
		var7.createTrustedFriendLink(p0):andThen(function(p5) --[[ line: 191 ]]
			-- upvalues: p3 (copy), contexts (copy)
			p3.shareUrl({
				url = p5.responseBody.link,
				context = contexts.TCUpsellModal
			})
		end):andThen(function() --[[ line: 197 ]]
			-- upvalues: p3 (copy)
			return p3.onRequestSent and p3.onRequestSent()
		end):andThen(function() --[[ line: 200 ]]
			-- upvalues: var9 (copy), p3 (copy), var16 (copy)
			if not var9 then
				p3.showToast(var16.linkCopiedToast)
			end
			p3.closeModal()
		end):catch(function() --[[ line: 206 ]]
			-- upvalues: p3 (copy)
			p3.showGenericErrorModal()
			p3.closeModal()
		end)
	end, {
		p3.closeModal, p3.showGenericErrorModal, fireAnalyticsEvent, p0, var16, var9,
		p3.shareUrl, p3.showToast
	})
	local var23 = reactModule.useCallback(function() --[[ line: 223 ]]
		-- upvalues: var7 (copy), p0 (ref), var20 (ref), p3 (ref)
		var7.acceptTrustedConnectionRequest(p0):andThen(function() --[[ line: 225 ]]
			-- upvalues: var20 (copy)
			var20()
		end):andThen(function() --[[ line: 228 ]]
			-- upvalues: p3 (copy)
			return p3.onRequestAccepted and p3.onRequestAccepted()
		end):andThen(function() --[[ line: 231 ]]
			-- upvalues: p3 (copy)
			p3.closeModal()
		end):catch(function() --[[ line: 234 ]]
			-- upvalues: p3 (copy)
			p3.showGenericErrorModal()
		end)
	end, { p3, p0, var20 })
	local var24 = reactModule.useCallback(function() --[[ line: 239 ]]
		-- upvalues: var7 (copy), p0 (ref), p3 (ref), var20 (ref), fFlagTCUpdateProfileCTAButton (copy)
		var7.addTrustedFriendFromLink(p0, p3.tokens or {}):andThen(function() --[[ line: 241 ]]
			-- upvalues: var20 (copy)
			var20()
		end):andThen(if fFlagTCUpdateProfileCTAButton then function() --[[ line: 245 ]]
			-- upvalues: p3 (copy)
			return p3.onRequestAccepted and p3.onRequestAccepted()
		end else nil):andThen(function() --[[ line: 249 ]]
			-- upvalues: p3 (copy)
			p3.closeModal()
		end):catch(function() --[[ line: 252 ]]
			-- upvalues: p3 (copy)
			p3.showGenericErrorModal()
		end)
	end, { p3, p0, var20 })
	local var25 = reactModule.useCallback(function() --[[ line: 258 ]]
		-- upvalues: var7 (copy), p0 (ref), p3 (ref), fireAnalyticsEvent (ref), eventNames (copy), var16 (ref)
		var7.sendTrustedConnectionRequest(p0, if p3.sentFromQrCode then "qr" else nil):andThen(function() --[[ line: 263 ]]
			-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), p3 (copy), var16 (copy)
			fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
			p3.showToast(var16.trustedConnectionRequestSentToast)
		end):andThen(function() --[[ line: 267 ]]
			-- upvalues: p3 (copy)
			return p3.onRequestSent and p3.onRequestSent()
		end):andThen(function() --[[ line: 270 ]]
			-- upvalues: p3 (copy)
			p3.closeModal()
		end):catch(function() --[[ line: 273 ]]
			-- upvalues: p3 (copy)
			p3.showGenericErrorModal()
		end)
	end, { p3, p0, var16, fireAnalyticsEvent })
	
	return reactModule.useMemo(function() --[[ line: 286 ]]
		-- upvalues: p2 (ref), trustedConnectionStatus (copy), var16 (ref), var17 (ref), var21 (ref), var12 (ref), inverseTFRequestEnabled (copy), p3 (ref), var10 (ref), foundationModule (copy), var19 (ref), var18 (ref), var24 (ref), var23 (ref), var22 (ref), var25 (ref)
		if not p2 then
			return nil
		elseif p2 == trustedConnectionStatus.TrustedFriends then
			return { { text = var16.ok, onActivated = var17 } }
		end
		local t = {
			icon = nil,
			isLoading = false,
			text = var16.cancel,
			onActivated = var21
		}
		
		return if var12 then {
			{
				isLoading = true,
				onActivated = function() --[[ line: 306 ]] end
			},
			t
		} elseif p2 == trustedConnectionStatus.RequestReceived then if var10 then {
			{
				text = var16.accept,
				icon = foundationModule.Enums.IconName.LockClosed,
				onActivated = if inverseTFRequestEnabled and (if inverseTFRequestEnabled and p3.tokens and #p3.tokens > 0 then true else nil) then var19 else var18
			},
			t
		} elseif p3.tokens and #p3.tokens > 0 then { { text = var16.accept, onActivated = var24 }, t } else { { text = var16.accept, onActivated = var23 }, t } elseif p2 == trustedConnectionStatus.Friends then if var10 then {
			{
				text = var16.add,
				icon = foundationModule.Enums.IconName.LockClosed,
				onActivated = var18
			},
			t
		} elseif p3.isShareLinkSender then { { text = var16.addViaLink, onActivated = var22 }, t } else { { text = var16.add, onActivated = var25 }, t } else nil
	end, {
		p2, var12, var10, var16, p3.tokens, p3.isShareLinkSender, var17, var18, var21,
		var23, var24, var25, var22, var19
	})
end