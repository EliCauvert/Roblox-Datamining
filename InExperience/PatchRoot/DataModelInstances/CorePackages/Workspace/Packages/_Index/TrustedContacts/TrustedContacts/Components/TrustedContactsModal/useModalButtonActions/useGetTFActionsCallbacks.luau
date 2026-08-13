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
local var7 = require(trustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue) and (ampUpsellModule.GetFFlagEnableAmpVPCPrologue() and (ampUpsellModule.GetFFlagEnableReusableVPCPrologue() and ampUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix()))
local fStringConnectionGraphCoreAmpNameSpace = require(parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local _ = require(trustedContacts.Common.Types)
local var8 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p0, p1) --[[ line: 68 | named "useGetTFActionsCallbacks" ]]
	-- upvalues: useNavigation (ref), useAppPolicy (ref), userProfilesModule (ref), useLocalization (ref), var7 (ref), reactModule (ref), eventNames (ref), fFlagTCUpdateProfileCTAButton (ref), contexts (ref), fStringConnectionGraphCoreAmpNameSpace (ref), appPage (ref), fFlagTFUpdateAnalyticsModule (ref), var8 (ref), fFlagTrustedFriendsLinkVPCModule (ref)
	local fireAnalyticsEvent = p1.fireAnalyticsEvent
	local var9 = useNavigation()
	local var10 = useAppPolicy(function(p2) --[[ line: 72 ]]
		return p2.getShareSheetEnabled()
	end)
	local var11 = ""
	local var12 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0 },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if var12 and var12.data then
		var11 = userProfilesModule.Selectors.getCombinedNameFromId(var12.data, p0) or ""
	end
	local var13 = useLocalization({
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		trustedConnectionRequestSentToast = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		isATrustedConnectionNowToast = {
			"Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = var11
		},
		ask = if var7 then "Feature.Friends.Label.Ask" else nil,
		askYourParent = if var7 then "Feature.Friends.Label.AskYourParent" else nil,
		vpcRequired = if var7 then "Feature.Friends.Label.AddFriendVPC" else nil
	})
	local var14 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TrustedFriendsModalOkClicked)
		
		if p1.onAcknowledged then
			p1.onAcknowledged()
		end
		p1.closeModal()
	end, { p1.closeModal, p1.onAcknowledged, fireAnalyticsEvent })
	local var15 = reactModule.useCallback(function() --[[ line: 107 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), fFlagTCUpdateProfileCTAButton (copy), p1 (ref), var7 (copy), p0 (ref), contexts (copy), fStringConnectionGraphCoreAmpNameSpace (copy), var13 (ref), var9 (ref), appPage (copy)
		fireAnalyticsEvent(eventNames.TrustedFriendsVPCPrologueOpened)
		local onRequestAccepted = nil
		
		if fFlagTCUpdateProfileCTAButton then
			if p1.onRequestSent then
				onRequestAccepted = p1.onRequestSent
			elseif p1.onRequestAccepted then
				onRequestAccepted = p1.onRequestAccepted
			end
		end
		local dismissModal = p1.dismissModal
		local openAmpWizard = p1.openAmpWizard
		
		if var7 then
			local t = {
				featureName = "TriggerTrustedFriendVPCRecourse",
				usePrologue = true,
				completionCallback = function() --[[ line: 124 ]]
					-- upvalues: onRequestAccepted (write)
					if onRequestAccepted then
						onRequestAccepted()
					end
				end,
				recourseData = { targetUserId = p0 },
				entryPointEventCtx = contexts.TrustedFriendsVPCPrologue,
				extraParameters = { { name = "targetUser", type = "UserId", value = p0 } },
				nameSpace = fStringConnectionGraphCoreAmpNameSpace,
				prologueOptions = {
					config = {
						titleText = var13.askYourParent,
						bodyText = var13.vpcRequired,
						confirmText = var13.ask
					},
					onConfirm = function() --[[ line: 140 ]]
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCAskClicked)
					end,
					onCancel = function() --[[ line: 143 ]]
						-- upvalues: fireAnalyticsEvent (copy), eventNames (copy)
						fireAnalyticsEvent(eventNames.TrustedFriendsVPCCancelClicked)
					end
				}
			}
			dismissModal()
			openAmpWizard(t)
		else
			var9.replace(appPage.TrustedFriendsVPCPrologue, { userId = p0, completionCallback = onRequestAccepted })
		end
	end, {
		fireAnalyticsEvent, var9, p0,
		if fFlagTCUpdateProfileCTAButton then p1.onRequestSent else nil,
		if fFlagTCUpdateProfileCTAButton then p1.onRequestAccepted else nil,
		if var7 then p1.dismissModal else nil, if var7 then p1.openAmpWizard else nil,
		if var7 then var13 else nil
	})
	local var16 = reactModule.useCallback(function() --[[ line: 170 ]]
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), var13 (ref)
		if fFlagTFUpdateAnalyticsModule then
			fireAnalyticsEvent(eventNames.TCUpsellIsATrustedConnectionNowToastShown)
		else
			fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
		end
		p1.showToast(var13.isATrustedConnectionNowToast)
	end, {
		var13.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		p1.showToast
	})
	
	return {
		onOkButtonPress = var14,
		onOpenVPCProloguePress = var15,
		onCancelButtonPress = reactModule.useCallback(function() --[[ line: 185 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellCancelClicked)
			p1.closeModal()
		end, { p1.closeModal, fireAnalyticsEvent }),
		onAcceptRequestReceived = reactModule.useCallback(function() --[[ line: 227 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var8 (copy), p0 (ref), var16 (ref), p1 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var8.acceptTrustedConnectionRequest(p0):andThen(function() --[[ line: 233 ]]
				-- upvalues: var16 (copy)
				var16()
			end):andThen(function() --[[ line: 236 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end):andThen(function() --[[ line: 239 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 242 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, { p1, p0, var16, fireAnalyticsEvent }),
		onAddTrustedFriendFromLink = reactModule.useCallback(function() --[[ line: 247 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var8 (copy), p0 (ref), p1 (ref), var16 (ref), fFlagTCUpdateProfileCTAButton (copy)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var8.addTrustedFriendFromLink(p0, p1.tokens or {}):andThen(function() --[[ line: 253 ]]
				-- upvalues: var16 (copy)
				var16()
			end):andThen(if fFlagTCUpdateProfileCTAButton then function() --[[ line: 257 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end else nil):andThen(function() --[[ line: 261 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 264 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, { p1, p0, var16, fireAnalyticsEvent }),
		onSendTrustedConnectionRequest = reactModule.useCallback(function() --[[ line: 270 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var8 (copy), p0 (ref), p1 (ref), var13 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
			end
			var8.sendTrustedConnectionRequest(p0, if p1.sentFromQrCode then "qr" else nil):andThen(function() --[[ line: 279 ]]
				-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), p1 (copy), var13 (copy)
				if not fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellAddTrustedConnectionClicked)
				end
				p1.showToast(var13.trustedConnectionRequestSentToast)
			end):andThen(function() --[[ line: 285 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function() --[[ line: 288 ]]
				-- upvalues: p1 (copy)
				p1.closeModal()
			end):catch(function() --[[ line: 291 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, {
			p1,
			p0,
			var13,
			fireAnalyticsEvent,
			p1.showToast
		}),
		onAddViaLinkButtonPress = reactModule.useCallback(function() --[[ line: 191 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var8 (copy), p0 (ref), p1 (ref), contexts (copy), var10 (ref), var13 (ref)
			fireAnalyticsEvent(eventNames.TCUpsellAddViaLinkClicked)
			var8.createTrustedFriendLink(p0):andThen(function(p3) --[[ line: 194 ]]
				-- upvalues: p1 (copy), contexts (copy)
				p1.shareUrl({
					url = p3.responseBody.link,
					context = contexts.TCUpsellModal
				})
			end):andThen(function() --[[ line: 200 ]]
				-- upvalues: p1 (copy)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function() --[[ line: 203 ]]
				-- upvalues: var10 (copy), p1 (copy), var13 (copy)
				if not var10 then
					p1.showToast(var13.linkCopiedToast)
				end
				p1.closeModal()
			end):catch(function() --[[ line: 209 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
				p1.closeModal()
			end)
		end, {
			p1.closeModal, p1.showGenericErrorModal, p1.onRequestSent, fireAnalyticsEvent,
			p0, var13, var10, p1.shareUrl, p1.showToast
		}),
		onAddTrustedFriendFromLinkWithVPC = if fFlagTrustedFriendsLinkVPCModule then if fFlagTrustedFriendsLinkVPCModule then reactModule.useCallback(function() --[[ line: 306 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var8 (copy), p0 (ref), p1 (ref), var15 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			var8.addTrustedFriendFromLink(p0, p1.tokens or {}):andThen(function() --[[ line: 312 ]]
				-- upvalues: var15 (copy)
				var15()
			end):catch(function() --[[ line: 315 ]]
				-- upvalues: p1 (copy)
				p1.showGenericErrorModal()
			end)
		end, {
			p0,
			p1.tokens,
			var15,
			p1.showGenericErrorModal,
			fireAnalyticsEvent
		}) else nil else nil
	}
end