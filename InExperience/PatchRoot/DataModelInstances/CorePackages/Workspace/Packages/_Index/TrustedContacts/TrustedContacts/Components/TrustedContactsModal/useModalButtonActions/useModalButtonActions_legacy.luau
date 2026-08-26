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
local var1 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1, p2, p3, p4)
	-- upvalues: useNavigation (ref), useAppPolicy (ref), reactModule (ref), ampApiProvider (ref), fStringConnectionGraphCoreAmpNameSpace (ref), ampEnums (ref), userProfilesModule (ref), useLocalization (ref), useTCAnalytics (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), appPage (ref), inverseTFRequestEnabled (ref), var1 (ref), contexts (ref), trustedConnectionStatus (ref), foundationModule (ref)
	local var2 = useNavigation()
	local var3 = useAppPolicy(function(p5)
		return p5.getShareSheetEnabled()
	end)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), ampApiProvider (copy), fStringConnectionGraphCoreAmpNameSpace (copy), ampEnums (copy), var5 (ref), var7 (ref)
		if ampApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, fStringConnectionGraphCoreAmpNameSpace, { { name = "targetUser", type = "UserId", value = p1 } }).access == ampEnums.AccessResponseEnum.Granted then
			var5(true)
		end
		var7(false)
	end, { p1 })
	local var8 = ""
	local var9 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1 },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if var9 and var9.data then
		var8 = userProfilesModule.Selectors.getCombinedNameFromId(var9.data, p1) or ""
	end
	local var10 = useLocalization({
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
			name = var8
		}
	})
	local fireAnalyticsEvent = useTCAnalytics({ friendId = p1, modalVariant = p3, source = p2 }).fireAnalyticsEvent
	local var11 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p4 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsModalOkClicked)
		
		if p4.onAcknowledged then
			p4.onAcknowledged()
		end
		p4.closeModal()
	end, { p4.closeModal, p4.onAcknowledged, fireAnalyticsEvent })
	local var12 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagTCUpdateProfileCTAButton (copy), p4 (ref), var2 (ref), appPage (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCPrologueOpened)
		local onRequestAccepted = nil
		
		if fFlagTCUpdateProfileCTAButton then
			if p4.onRequestSent then
				onRequestAccepted = p4.onRequestSent
			elseif p4.onRequestAccepted then
				onRequestAccepted = p4.onRequestAccepted
			end
		end
		var2.replace(appPage.TrustedFriendsVPCPrologue, { userId = p1, completionCallback = onRequestAccepted })
	end, {
		fireAnalyticsEvent,
		var2,
		p1,
		if fFlagTCUpdateProfileCTAButton then p4.onRequestSent else nil,
		if fFlagTCUpdateProfileCTAButton then p4.onRequestAccepted else nil
	})
	local var13 = if inverseTFRequestEnabled then reactModule.useCallback(function()
		-- upvalues: var1 (copy), p1 (ref), p4 (ref), var12 (ref)
		var1.addTrustedFriendFromLink(p1, p4.tokens or {}):andThen(function()
			-- upvalues: var12 (copy)
			var12()
		end):catch(function()
			-- upvalues: p4 (copy)
			p4.showGenericErrorModal()
		end)
	end, { p1, p4.tokens, var12, p4.showGenericErrorModal }) else nil
	local var14 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p4 (ref), var10 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
		p4.showToast(var10.isATrustedConnectionNowToast)
	end, {
		var10.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		p4.showToast
	})
	local var15 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p4 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCancelClicked)
		p4.closeModal()
	end, { p4.closeModal, fireAnalyticsEvent })
	local var16 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var1 (copy), p1 (ref), p4 (ref), contexts (copy), var3 (ref), var10 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellAddViaLinkClicked)
		var1.createTrustedFriendLink(p1):andThen(function(p5)
			-- upvalues: p4 (copy), contexts (copy)
			p4.shareUrl({
				url = p5.responseBody.link,
				context = contexts.TCUpsellModal
			})
		end):andThen(function()
			-- upvalues: p4 (copy)
			return p4.onRequestSent and p4.onRequestSent()
		end):andThen(function()
			-- upvalues: var3 (copy), p4 (copy), var10 (copy)
			if not var3 then
				p4.showToast(var10.linkCopiedToast)
			end
			p4.closeModal()
		end):catch(function()
			-- upvalues: p4 (copy)
			p4.showGenericErrorModal()
			p4.closeModal()
		end)
	end, {
		p4.closeModal, p4.showGenericErrorModal, fireAnalyticsEvent, p1, var10, var3,
		p4.shareUrl, p4.showToast
	})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), p1 (ref), var14 (ref), p4 (ref)
		var1.acceptTrustedConnectionRequest(p1):andThen(function()
			-- upvalues: var14 (copy)
			var14()
		end):andThen(function()
			-- upvalues: p4 (copy)
			return p4.onRequestAccepted and p4.onRequestAccepted()
		end):andThen(function()
			-- upvalues: p4 (copy)
			p4.closeModal()
		end):catch(function()
			-- upvalues: p4 (copy)
			p4.showGenericErrorModal()
		end)
	end, { p4, p1, var14 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), p1 (ref), p4 (ref), var14 (ref), fFlagTCUpdateProfileCTAButton (copy)
		var1.addTrustedFriendFromLink(p1, p4.tokens or {}):andThen(function()
			-- upvalues: var14 (copy)
			var14()
		end):andThen(if fFlagTCUpdateProfileCTAButton then function()
			-- upvalues: p4 (copy)
			return p4.onRequestAccepted and p4.onRequestAccepted()
		end else nil):andThen(function()
			-- upvalues: p4 (copy)
			p4.closeModal()
		end):catch(function()
			-- upvalues: p4 (copy)
			p4.showGenericErrorModal()
		end)
	end, { p4, p1, var14 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), p1 (ref), p4 (ref), fireAnalyticsEvent (ref), eventNames (copy), var10 (ref)
		var1.sendTrustedConnectionRequest(p1, if p4.sentFromQrCode then "qr" else nil):andThen(function()
			-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), p4 (copy), var10 (copy)
			fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
			p4.showToast(var10.trustedConnectionRequestSentToast)
		end):andThen(function()
			-- upvalues: p4 (copy)
			return p4.onRequestSent and p4.onRequestSent()
		end):andThen(function()
			-- upvalues: p4 (copy)
			p4.closeModal()
		end):catch(function()
			-- upvalues: p4 (copy)
			p4.showGenericErrorModal()
		end)
	end, { p4, p1, var10, fireAnalyticsEvent })
	
	return reactModule.useMemo(function()
		-- upvalues: p3 (ref), trustedConnectionStatus (copy), var10 (ref), var11 (ref), var15 (ref), var6 (ref), inverseTFRequestEnabled (copy), p4 (ref), var4 (ref), foundationModule (copy), var13 (ref), var12 (ref), var18 (ref), var17 (ref), var16 (ref), var19 (ref)
		if not p3 then
			return nil
		elseif p3 == trustedConnectionStatus.TrustedFriends then
			return { { text = var10.ok, onActivated = var11 } }
		end
		local t = {
			icon = nil,
			isLoading = false,
			text = var10.cancel,
			onActivated = var15
		}
		
		return if var6 then {
			{
				isLoading = true,
				onActivated = function() end
			},
			t
		} elseif p3 == trustedConnectionStatus.RequestReceived then if var4 then {
			{
				text = var10.accept,
				icon = foundationModule.Enums.IconName.LockClosed,
				onActivated = if inverseTFRequestEnabled and (if inverseTFRequestEnabled and p4.tokens and #p4.tokens > 0 then true else nil) then var13 else var12
			},
			t
		} elseif p4.tokens and #p4.tokens > 0 then { { text = var10.accept, onActivated = var18 }, t } else { { text = var10.accept, onActivated = var17 }, t } elseif p3 == trustedConnectionStatus.Friends then if var4 then {
			{
				text = var10.add,
				icon = foundationModule.Enums.IconName.LockClosed,
				onActivated = var12
			},
			t
		} elseif p4.isShareLinkSender then { { text = var10.addViaLink, onActivated = var16 }, t } else { { text = var10.add, onActivated = var19 }, t } else nil
	end, {
		p3, var6, var4, var10, p4.tokens, p4.isShareLinkSender, var11, var12, var15,
		var17, var18, var19, var16, var13
	})
end