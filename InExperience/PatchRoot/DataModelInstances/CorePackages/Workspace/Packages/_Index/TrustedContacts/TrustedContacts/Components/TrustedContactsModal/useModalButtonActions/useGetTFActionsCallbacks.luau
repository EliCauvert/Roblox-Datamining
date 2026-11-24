local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AmpUpsellModule = require(Parent.AmpUpsell)
local EventNames = require(TrustedContacts.Analytics).EventNames
local FFlagTCUpdateProfileCTAButton = require(Parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local FFlagTrustedFriendsLinkVPCModule = require(TrustedContacts.Flags.FFlagTrustedFriendsLinkVPC)
local FFlagTFUpdateAnalyticsModule = require(TrustedContacts.Flags.FFlagTFUpdateAnalytics)
local FFlagEnableAmpWizardVPCNavigationFix = require(TrustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue) and (AmpUpsellModule.GetFFlagEnableAmpVPCPrologue() and (AmpUpsellModule.GetFFlagEnableReusableVPCPrologue() and AmpUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix()))
local FStringConnectionGraphCoreAmpNameSpace = require(Parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local _ = require(TrustedContacts.Common.Types)
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(TargetUserId, p1)
	-- upvalues: UseNavigationFunction (copy), UseAppPolicyFunction (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), FFlagEnableAmpWizardVPCNavigationFix (copy), ReactModule (copy), EventNames (copy), FFlagTCUpdateProfileCTAButton (copy), Contexts (copy), FStringConnectionGraphCoreAmpNameSpace (copy), AppPage (copy), FFlagTFUpdateAnalyticsModule (copy), GetResult (copy), FFlagTrustedFriendsLinkVPCModule (copy)
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getShareSheetEnabled()
	end)
	local CombinedNameFromId = ""
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { TargetUserId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then
		CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, TargetUserId) or ""
	end
	local UseLocalizationResult = UseLocalizationFunction({
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		trustedConnectionRequestSentToast = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		isATrustedConnectionNowToast = {
			"Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = CombinedNameFromId
		},
		ask = if FFlagEnableAmpWizardVPCNavigationFix then "Feature.Friends.Label.Ask" else nil,
		askYourParent = if FFlagEnableAmpWizardVPCNavigationFix then "Feature.Friends.Label.AskYourParent" else nil,
		vpcRequired = if FFlagEnableAmpWizardVPCNavigationFix then "Feature.Friends.Label.AddFriendVPC" else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), FFlagTCUpdateProfileCTAButton (upval), p1 (copy), FFlagEnableAmpWizardVPCNavigationFix (upval), TargetUserId (copy), Contexts (upval), FStringConnectionGraphCoreAmpNameSpace (upval), UseLocalizationResult (copy), UseNavigationResult (copy), AppPage (upval)
		FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCPrologueOpened)
		local OnRequestAcceptedFunction = nil
		
		if FFlagTCUpdateProfileCTAButton then
			if p1.onRequestSent then
				OnRequestAcceptedFunction = p1.onRequestSent
			elseif p1.onRequestAccepted then
				OnRequestAcceptedFunction = p1.onRequestAccepted
			end
		end
		local DismissModalFunction: () -> () = p1.dismissModal
		local OpenAmpWizardFunction: (any) -> () = p1.openAmpWizard
		
		if FFlagEnableAmpWizardVPCNavigationFix then
			local config = {
				featureName = "TriggerTrustedFriendVPCRecourse",
				usePrologue = true,
				completionCallback = function()
					-- upvalues: OnRequestAcceptedFunction (ref)
					if OnRequestAcceptedFunction then
						OnRequestAcceptedFunction()
					end
				end,
				recourseData = { targetUserId = TargetUserId },
				entryPointEventCtx = Contexts.TrustedFriendsVPCPrologue,
				extraParameters = {
					{
						name = "targetUser",
						type = "UserId",
						value = TargetUserId
					}
				},
				nameSpace = FStringConnectionGraphCoreAmpNameSpace,
				prologueOptions = {
					config = {
						titleText = UseLocalizationResult.askYourParent,
						bodyText = UseLocalizationResult.vpcRequired,
						confirmText = UseLocalizationResult.ask
					},
					onConfirm = function()
						-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval)
						FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCAskClicked)
					end,
					onCancel = function()
						-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval)
						FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCCancelClicked)
					end
				}
			}
			DismissModalFunction()
			OpenAmpWizardFunction(config)
		else
			UseNavigationResult.replace(AppPage.TrustedFriendsVPCPrologue, {
				userId = TargetUserId,
				completionCallback = OnRequestAcceptedFunction
			})
		end
	end, {
		FireAnalyticsEventFunction, UseNavigationResult, TargetUserId,
		if FFlagTCUpdateProfileCTAButton then p1.onRequestSent else nil,
		if FFlagTCUpdateProfileCTAButton then p1.onRequestAccepted else nil,
		if FFlagEnableAmpWizardVPCNavigationFix then p1.dismissModal else nil,
		if FFlagEnableAmpWizardVPCNavigationFix then p1.openAmpWizard else nil,
		if FFlagEnableAmpWizardVPCNavigationFix then UseLocalizationResult else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy), UseLocalizationResult (copy)
		if FFlagTFUpdateAnalyticsModule then
			FireAnalyticsEventFunction(EventNames.TCUpsellIsATrustedConnectionNowToastShown)
		else
			FireAnalyticsEventFunction(EventNames.TCUpsellAcceptTrustedConnectionClicked)
		end
		p1.showToast(UseLocalizationResult.isATrustedConnectionNowToast)
	end, {
		UseLocalizationResult.isATrustedConnectionNowToast,
		FireAnalyticsEventFunction,
		p1.showToast
	})
	local UseResult2 = if FFlagTrustedFriendsLinkVPCModule then ReactModule.useCallback(function()
		-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), TargetUserId (copy), p1 (copy), UseResult (copy)
		if FFlagTFUpdateAnalyticsModule then
			FireAnalyticsEventFunction(EventNames.TCUpsellAcceptTrustedConnectionClicked)
		end
		GetResult.addTrustedFriendFromLink(TargetUserId, p1.tokens or {}):andThen(function()
			-- upvalues: UseResult (upval)
			UseResult()
		end):catch(function()
			-- upvalues: p1 (upval)
			p1.showGenericErrorModal()
		end)
	end, {
		TargetUserId,
		p1.tokens,
		UseResult,
		p1.showGenericErrorModal,
		FireAnalyticsEventFunction
	}) else nil
	
	return {
		onOkButtonPress = ReactModule.useCallback(function()
			-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy)
			FireAnalyticsEventFunction(EventNames.TrustedFriendsModalOkClicked)
			
			if p1.onAcknowledged then
				p1.onAcknowledged()
			end
			p1.closeModal()
		end, {
			p1.closeModal,
			p1.onAcknowledged,
			FireAnalyticsEventFunction
		}),
		onOpenVPCProloguePress = UseResult,
		onCancelButtonPress = ReactModule.useCallback(function()
			-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy)
			FireAnalyticsEventFunction(EventNames.TCUpsellCancelClicked)
			p1.closeModal()
		end, { p1.closeModal, FireAnalyticsEventFunction }),
		onAcceptRequestReceived = ReactModule.useCallback(function()
			-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), TargetUserId (copy), UseResult1 (copy), p1 (copy)
			if FFlagTFUpdateAnalyticsModule then
				FireAnalyticsEventFunction(EventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			GetResult.acceptTrustedConnectionRequest(TargetUserId):andThen(function()
				-- upvalues: UseResult1 (upval)
				UseResult1()
			end):andThen(function()
				-- upvalues: p1 (upval)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end):andThen(function()
				-- upvalues: p1 (upval)
				p1.closeModal()
			end):catch(function()
				-- upvalues: p1 (upval)
				p1.showGenericErrorModal()
			end)
		end, { p1, TargetUserId, UseResult1, FireAnalyticsEventFunction }),
		onAddTrustedFriendFromLink = ReactModule.useCallback(function()
			-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), TargetUserId (copy), p1 (copy), UseResult1 (copy), FFlagTCUpdateProfileCTAButton (upval)
			if FFlagTFUpdateAnalyticsModule then
				FireAnalyticsEventFunction(EventNames.TCUpsellAcceptTrustedConnectionClicked)
			end
			GetResult.addTrustedFriendFromLink(TargetUserId, p1.tokens or {}):andThen(function()
				-- upvalues: UseResult1 (upval)
				UseResult1()
			end):andThen(if FFlagTCUpdateProfileCTAButton then function()
				-- upvalues: p1 (upval)
				return p1.onRequestAccepted and p1.onRequestAccepted()
			end else nil):andThen(function()
				-- upvalues: p1 (upval)
				p1.closeModal()
			end):catch(function()
				-- upvalues: p1 (upval)
				p1.showGenericErrorModal()
			end)
		end, { p1, TargetUserId, UseResult1, FireAnalyticsEventFunction }),
		onSendTrustedConnectionRequest = ReactModule.useCallback(function()
			-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), TargetUserId (copy), p1 (copy), UseLocalizationResult (copy)
			if FFlagTFUpdateAnalyticsModule then
				FireAnalyticsEventFunction(EventNames.TCUpsellAddTrustedConnectionClicked)
			end
			GetResult.sendTrustedConnectionRequest(TargetUserId, if p1.sentFromQrCode then "qr" else nil):andThen(function()
				-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), p1 (upval), UseLocalizationResult (upval)
				if not FFlagTFUpdateAnalyticsModule then
					FireAnalyticsEventFunction(EventNames.TCUpsellAddTrustedConnectionClicked)
				end
				p1.showToast(UseLocalizationResult.trustedConnectionRequestSentToast)
			end):andThen(function()
				-- upvalues: p1 (upval)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function()
				-- upvalues: p1 (upval)
				p1.closeModal()
			end):catch(function()
				-- upvalues: p1 (upval)
				p1.showGenericErrorModal()
			end)
		end, {
			p1,
			TargetUserId,
			UseLocalizationResult,
			FireAnalyticsEventFunction,
			p1.showToast
		}),
		onAddViaLinkButtonPress = ReactModule.useCallback(function()
			-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), TargetUserId (copy), p1 (copy), Contexts (upval), UseAppPolicyResult (copy), UseLocalizationResult (copy)
			FireAnalyticsEventFunction(EventNames.TCUpsellAddViaLinkClicked)
			GetResult.createTrustedFriendLink(TargetUserId):andThen(function(Result)
				-- upvalues: p1 (upval), Contexts (upval)
				p1.shareUrl({
					url = Result.responseBody.link,
					context = Contexts.TCUpsellModal
				})
			end):andThen(function()
				-- upvalues: p1 (upval)
				return p1.onRequestSent and p1.onRequestSent()
			end):andThen(function()
				-- upvalues: UseAppPolicyResult (upval), p1 (upval), UseLocalizationResult (upval)
				if not UseAppPolicyResult then
					p1.showToast(UseLocalizationResult.linkCopiedToast)
				end
				p1.closeModal()
			end):catch(function()
				-- upvalues: p1 (upval)
				p1.showGenericErrorModal()
				p1.closeModal()
			end)
		end, {
			p1.closeModal, p1.showGenericErrorModal, p1.onRequestSent,
			FireAnalyticsEventFunction, TargetUserId, UseLocalizationResult,
			UseAppPolicyResult, p1.shareUrl, p1.showToast
		}),
		onAddTrustedFriendFromLinkWithVPC = if FFlagTrustedFriendsLinkVPCModule then UseResult2 else nil
	}
end