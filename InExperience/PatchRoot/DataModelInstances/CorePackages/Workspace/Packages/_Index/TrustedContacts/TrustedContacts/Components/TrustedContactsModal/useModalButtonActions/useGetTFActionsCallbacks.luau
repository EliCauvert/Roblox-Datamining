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
local ampUpsellModule = require(parent.AmpUpsell)
local eventNames = require(trustedContacts.Analytics).EventNames
local fFlagTCUpdateProfileCTAButton = require(parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local fFlagTrustedFriendsLinkVPCModule = require(trustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)
local var1 = require(trustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue) and (ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and (ampUpsellModule.GetFFlagEnableReusableVPCPrologue() and ampUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix()))
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local _ = require(trustedContacts.Common.Types)
local var2 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1, p2)
	-- upvalues: useNavigation (ref), useAppPolicy (ref), userProfilesModule (ref), useLocalization (ref), var1 (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), contexts (ref), fStringConnectionGraphCoreAmpNameSpace (ref), appPage (ref), fFlagTFUpdateAnalyticsModule (ref), var2 (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local fireAnalyticsEvent = p2.fireAnalyticsEvent
	local var3 = useNavigation()
	local var4 = useAppPolicy(function(p3)
		return p3.getShareSheetEnabled()
	end)
	local var5 = ""
	local var6 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1 },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if var6 and var6.data then
		var5 = userProfilesModule.Selectors.getCombinedNameFromId(var6.data, p1) or ""
	end
	local var7 = useLocalization({
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		trustedConnectionRequestSentToast = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		isATrustedConnectionNowToast = {
			"Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = var5
		},
		ask = if var1 then "Feature.Friends.Label.Ask" else nil,
		askYourParent = if var1 then "Feature.Friends.Label.AskYourParent" else nil,
		vpcRequired = if var1 then "Feature.Friends.Label.AddFriendVPC" else nil
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p2 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsModalOkClicked)
		
		if p2.onAcknowledged then
			p2.onAcknowledged()
		end
		p2.closeModal()
	end, { p2.closeModal, p2.onAcknowledged, fireAnalyticsEvent })
	local var9 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagTCUpdateProfileCTAButton (copy), p2 (ref), var1 (copy), p1 (ref), contexts (copy), fStringConnectionGraphCoreAmpNameSpace (copy), var7 (ref), var3 (ref), appPage (copy)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCPrologueOpened)
		local onRequestAccepted = nil
		
		if fFlagTCUpdateProfileCTAButton then
			if p2.onRequestSent then
				onRequestAccepted = p2.onRequestSent
			elseif p2.onRequestAccepted then
				onRequestAccepted = p2.onRequestAccepted
			end
		end
		local dismissModal = p2.dismissModal
		local openAmpWizard = p2.openAmpWizard
		
		if var1 then
			local t = {
				featureName = "TriggerTrustedFriendVPCRecourse",
				usePrologue = true,
				completionCallback = function()
					-- upvalues: onRequestAccepted (write)
					if onRequestAccepted then
						onRequestAccepted()
					end
				end,
				recourseData = { targetUserId = p1 },
				entryPointEventCtx = contexts.TrustedFriendsVPCPrologue,
				extraParameters = { { name = "targetUser", type = "UserId", value = p1 } },
				nameSpace = fStringConnectionGraphCoreAmpNameSpace,
				prologueOptions = {
					config = {
						titleText = var7.askYourParent,
						bodyText = var7.vpcRequired,
						confirmText = var7.ask
					},
					onConfirm = function()
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCAskClicked)
					end,
					onCancel = function()
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCCancelClicked)
					end
				}
			}
			dismissModal()
			openAmpWizard(t)
		else
			var3.replace(appPage.TrustedFriendsVPCPrologue, { userId = p1, completionCallback = onRequestAccepted })
		end
	end, {
		fireAnalyticsEvent, var3, p1,
		if fFlagTCUpdateProfileCTAButton then p2.onRequestSent else nil,
		if fFlagTCUpdateProfileCTAButton then p2.onRequestAccepted else nil,
		if var1 then p2.dismissModal else nil, if var1 then p2.openAmpWizard else nil,
		if var1 then var7 else nil
	})
	local var10 = reactModule.useCallback(function()
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), p2 (ref), var7 (ref)
		if fFlagTFUpdateAnalyticsModule then
			fireAnalyticsEvent(eventNames.TCUpsellIsATrustedConnectionNowToastShown)
		else
			fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
		end
		p2.showToast(var7.isATrustedConnectionNowToast)
	end, {
		var7.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		p2.showToast
	})
	
	return {
		onOkButtonPress = var8,
		onOpenVPCProloguePress = var9,
		onCancelButtonPress = reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p2 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellCancelClicked)
			p2.closeModal()
		end, { p2.closeModal, fireAnalyticsEvent }),
		onAcceptRequestReceived = reactModule.useCallback(function()
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var2 (copy), p1 (ref), var10 (ref), p2 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var2.acceptTrustedConnectionRequest(p1):andThen(function()
				-- upvalues: var10 (copy)
				var10()
			end):andThen(function()
				-- upvalues: p2 (copy)
				return p2.onRequestAccepted and p2.onRequestAccepted()
			end):andThen(function()
				-- upvalues: p2 (copy)
				p2.closeModal()
			end):catch(function()
				-- upvalues: p2 (copy)
				p2.showGenericErrorModal()
			end)
		end, { p2, p1, var10, fireAnalyticsEvent }),
		onAddTrustedFriendFromLink = reactModule.useCallback(function()
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var2 (copy), p1 (ref), p2 (ref), var10 (ref), fFlagTCUpdateProfileCTAButton (copy)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var2.addTrustedFriendFromLink(p1, p2.tokens or {}):andThen(function()
				-- upvalues: var10 (copy)
				var10()
			end):andThen(if fFlagTCUpdateProfileCTAButton then function()
				-- upvalues: p2 (copy)
				return p2.onRequestAccepted and p2.onRequestAccepted()
			end else nil):andThen(function()
				-- upvalues: p2 (copy)
				p2.closeModal()
			end):catch(function()
				-- upvalues: p2 (copy)
				p2.showGenericErrorModal()
			end)
		end, { p2, p1, var10, fireAnalyticsEvent }),
		onSendTrustedConnectionRequest = reactModule.useCallback(function()
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var2 (copy), p1 (ref), p2 (ref), var7 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
			end
			var2.sendTrustedConnectionRequest(p1, if p2.sentFromQrCode then "qr" else nil):andThen(function()
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), p2 (copy), var7 (copy)
				if not fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
				end
				p2.showToast(var7.trustedConnectionRequestSentToast)
			end):andThen(function()
				-- upvalues: p2 (copy)
				return p2.onRequestSent and p2.onRequestSent()
			end):andThen(function()
				-- upvalues: p2 (copy)
				p2.closeModal()
			end):catch(function()
				-- upvalues: p2 (copy)
				p2.showGenericErrorModal()
			end)
		end, {
			p2,
			p1,
			var7,
			fireAnalyticsEvent,
			p2.showToast
		}),
		onAddViaLinkButtonPress = reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var2 (copy), p1 (ref), p2 (ref), contexts (copy), var4 (ref), var7 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellAddViaLinkClicked)
			var2.createTrustedFriendLink(p1):andThen(function(p3)
				-- upvalues: p2 (copy), contexts (copy)
				p2.shareUrl({
					url = p3.responseBody.link,
					context = contexts.TCUpsellModal
				})
			end):andThen(function()
				-- upvalues: p2 (copy)
				return p2.onRequestSent and p2.onRequestSent()
			end):andThen(function()
				-- upvalues: var4 (copy), p2 (copy), var7 (copy)
				if not var4 then
					p2.showToast(var7.linkCopiedToast)
				end
				p2.closeModal()
			end):catch(function()
				-- upvalues: p2 (copy)
				p2.showGenericErrorModal()
				p2.closeModal()
			end)
		end, {
			p2.closeModal, p2.showGenericErrorModal, p2.onRequestSent, fireAnalyticsEvent,
			p1, var7, var4, p2.shareUrl, p2.showToast
		}),
		onAddTrustedFriendFromLinkWithVPC = if fFlagTrustedFriendsLinkVPCModule then if fFlagTrustedFriendsLinkVPCModule then reactModule.useCallback(function()
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var2 (copy), p1 (ref), p2 (ref), var9 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var2.addTrustedFriendFromLink(p1, p2.tokens or {}):andThen(function()
				-- upvalues: var9 (copy)
				var9()
			end):catch(function()
				-- upvalues: p2 (copy)
				p2.showGenericErrorModal()
			end)
		end, {
			p1,
			p2.tokens,
			var9,
			p2.showGenericErrorModal,
			fireAnalyticsEvent
		}) else nil else nil
	}
end