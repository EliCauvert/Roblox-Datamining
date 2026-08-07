local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local userProfilesModule = require(parent.UserProfiles)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local eventNames = require(trustedContacts.Analytics).EventNames
local fFlagTCUpdateProfileCTAButton = require(parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)
local _ = require(trustedContacts.Common.Types)
local var6 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0, p1) --[[ line: 54 | named "useGetTFActionsCallbacks" ]]
	-- upvalues: useNavigation (ref), useAppPolicy (ref), userProfilesModule (ref), useLocalization (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), appPage (ref), fFlagTFUpdateAnalyticsModule (ref), var6 (ref), contexts (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local fireAnalyticsEvent = p1.fireAnalyticsEvent
	local var7 = useNavigation()
	local var8 = useAppPolicy(function(p2) --[[ line: 58 ]]
		return p2.getShareSheetEnabled()
	end)
	local var9 = ""
	local var10 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0 },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if var10 and var10.data then
		var9 = userProfilesModule.Selectors.getCombinedNameFromId(var10.data, p0) or ""
	end
	local var11 = useLocalization({
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		trustedConnectionRequestSentToast = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		isATrustedConnectionNowToast = {
			"Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = var9
		}
	})
	local var12 = reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsModalOkClicked)
		
		if p1.onAcknowledged then
			p1.onAcknowledged()
		end
		p1.closeModal()
	end, { p1.closeModal, p1.onAcknowledged, fireAnalyticsEvent })
	local var13 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagTCUpdateProfileCTAButton (copy), p1 (ref), var7 (ref), appPage (copy), p0 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCPrologueOpened)
		local onRequestAccepted = nil
		
		if fFlagTCUpdateProfileCTAButton then
			if p1.onRequestSent then
				onRequestAccepted = p1.onRequestSent
			elseif p1.onRequestAccepted then
				onRequestAccepted = p1.onRequestAccepted
			end
		end
		var7.replace(appPage.TrustedFriendsVPCPrologue, { userId = p0, completionCallback = onRequestAccepted })
	end, {
		fireAnalyticsEvent,
		var7,
		p0,
		if fFlagTCUpdateProfileCTAButton then p1.onRequestSent else nil,
		if fFlagTCUpdateProfileCTAButton then p1.onRequestAccepted else nil
	})
	local var14 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), var11 (ref)
		if fFlagTFUpdateAnalyticsModule then
			fireAnalyticsEvent(eventNames.TCUpsellIsATrustedConnectionNowToastShown)
		else
			fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
		end
		p1.showToast(var11.isATrustedConnectionNowToast)
	end, {
		var11.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		p1.showToast
	})
	
	return {
		onOkButtonPress = var12,
		onOpenVPCProloguePress = var13,
		onCancelButtonPress = reactModule.useCallback(function() --[[ line: 132 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellCancelClicked)
			p1.closeModal()
		end, { p1.closeModal, fireAnalyticsEvent }),
		onAcceptRequestReceived = reactModule.useCallback(function() --[[ line: 174 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var6 (copy), p0 (ref), var14 (ref), p1 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var6.acceptTrustedConnectionRequest(p0):andThen(function() --[[ line: 180 ]]
				-- upvalues: var14 (copy)
				var14()
			end):andThen(function() --[[ line: 183 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end):andThen(function() --[[ line: 186 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 189 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, { p1, p0, var14, fireAnalyticsEvent }),
		onAddTrustedFriendFromLink = reactModule.useCallback(function() --[[ line: 194 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var6 (copy), p0 (ref), p1 (ref), var14 (ref), fFlagTCUpdateProfileCTAButton (copy)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var6.addTrustedFriendFromLink(p0, p1.tokens or {}):andThen(function() --[[ line: 200 ]]
				-- upvalues: var14 (copy)
				var14()
			end):andThen(if fFlagTCUpdateProfileCTAButton then function() --[[ line: 204 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end else nil):andThen(function() --[[ line: 208 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 211 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, { p1, p0, var14, fireAnalyticsEvent }),
		onSendTrustedConnectionRequest = reactModule.useCallback(function() --[[ line: 217 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var6 (copy), p0 (ref), p1 (ref), var11 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
			end
			var6.sendTrustedConnectionRequest(p0, if p1.sentFromQrCode then "qr" else nil):andThen(function() --[[ line: 226 ]]
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), p1 (copy), var11 (copy)
				if not fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
				end
				p1.showToast(var11.trustedConnectionRequestSentToast)
			end):andThen(function() --[[ line: 232 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function() --[[ line: 235 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 238 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, {
			p1,
			p0,
			var11,
			fireAnalyticsEvent,
			p1.showToast
		}),
		onAddViaLinkButtonPress = reactModule.useCallback(function() --[[ line: 138 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var6 (copy), p0 (ref), p1 (ref), contexts (copy), var8 (ref), var11 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellAddViaLinkClicked)
			var6.createTrustedFriendLink(p0):andThen(function(p3) --[[ line: 141 ]]
				-- upvalues: p1 (copy), contexts (copy)
				p1.shareUrl({
					url = p3.responseBody.link,
					context = contexts.TCUpsellModal
				})
			end):andThen(function() --[[ line: 147 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function() --[[ line: 150 ]]
				-- upvalues: var8 (copy), p1 (copy), var11 (copy)
				if not var8 then
					p1.showToast(var11.linkCopiedToast)
				end
				p1.closeModal()
			end):catch(function() --[[ line: 156 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
				p1.closeModal()
			end)
		end, {
			p1.closeModal, p1.showGenericErrorModal, p1.onRequestSent, fireAnalyticsEvent,
			p0, var11, var8, p1.shareUrl, p1.showToast
		}),
		onAddTrustedFriendFromLinkWithVPC = if fFlagTrustedFriendsLinkVPCModule then if fFlagTrustedFriendsLinkVPCModule then reactModule.useCallback(function() --[[ line: 253 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var6 (copy), p0 (ref), p1 (ref), var13 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var6.addTrustedFriendFromLink(p0, p1.tokens or {}):andThen(function() --[[ line: 259 ]]
				-- upvalues: var13 (copy)
				var13()
			end):catch(function() --[[ line: 262 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, {
			p0,
			p1.tokens,
			var13,
			p1.showGenericErrorModal,
			fireAnalyticsEvent
		}) else nil else nil
	}
end