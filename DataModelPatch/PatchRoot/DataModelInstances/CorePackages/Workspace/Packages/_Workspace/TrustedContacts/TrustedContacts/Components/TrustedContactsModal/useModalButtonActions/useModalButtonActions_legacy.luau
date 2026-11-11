local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AnalyticsModule = require(TrustedContacts.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local FFlagTCUpdateProfileCTAButton = require(Parent.SharedFlags).FFlagTCUpdateProfileCTAButton
local InverseTFRequestEnabled = game:DefineFastFlag("InverseTFRequestEnabled", false)
local FStringConnectionGraphCoreAmpNameSpace = require(Parent.SharedFlags).FStringConnectionGraphCoreAmpNameSpace
local _ = require(TrustedContacts.Common.Types)
local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(FriendId, Source, ModalVariant, p1)
	-- upvalues: UseNavigationFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), AmpApiProvider (copy), FStringConnectionGraphCoreAmpNameSpace (copy), AmpEnums (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), UseTCAnalyticsFunction (copy), EventNames (copy), FFlagTCUpdateProfileCTAButton (copy), AppPage (copy), InverseTFRequestEnabled (copy), GetResult (copy), Contexts (copy), TrustedConnectionStatus (copy), FoundationModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getShareSheetEnabled()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: FriendId (copy), AmpApiProvider (upval), FStringConnectionGraphCoreAmpNameSpace (upval), AmpEnums (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if AmpApiProvider.upsellFeatureAccess("ShowTrustedFriendVPCModalVariant", {}, FStringConnectionGraphCoreAmpNameSpace, {
			{ name = "targetUser", type = "UserId", value = FriendId }
		}).access == AmpEnums.AccessResponseEnum.Granted then
			UseStateResult2(true)
		end
		UseStateResult2_1(false)
	end, { FriendId })
	local CombinedNameFromId = ""
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { FriendId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	
	if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then
		CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, FriendId) or ""
	end
	local UseLocalizationResult = UseLocalizationFunction({
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
			name = CombinedNameFromId
		}
	})
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction({
		friendId = FriendId,
		modalVariant = ModalVariant,
		source = Source
	}).fireAnalyticsEvent
	local UseResult = ReactModule.useCallback(function()
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
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), FFlagTCUpdateProfileCTAButton (upval), p1 (copy), UseNavigationResult (copy), AppPage (upval), FriendId (copy)
		FireAnalyticsEventFunction(EventNames.TrustedFriendsVPCPrologueOpened)
		local OnRequestAccepted = nil
		
		if FFlagTCUpdateProfileCTAButton then
			if p1.onRequestSent then
				OnRequestAccepted = p1.onRequestSent
			elseif p1.onRequestAccepted then
				OnRequestAccepted = p1.onRequestAccepted
			end
		end
		UseNavigationResult.replace(AppPage.TrustedFriendsVPCPrologue, {
			userId = FriendId,
			completionCallback = OnRequestAccepted
		})
	end, {
		FireAnalyticsEventFunction,
		UseNavigationResult,
		FriendId,
		if FFlagTCUpdateProfileCTAButton then p1.onRequestSent else nil,
		if FFlagTCUpdateProfileCTAButton then p1.onRequestAccepted else nil
	})
	local UseResult2 = if InverseTFRequestEnabled then ReactModule.useCallback(function()
		-- upvalues: GetResult (upval), FriendId (copy), p1 (copy), UseResult1 (copy)
		GetResult.addTrustedFriendFromLink(FriendId, p1.tokens or {}):andThen(function()
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end):catch(function()
			-- upvalues: p1 (upval)
			p1.showGenericErrorModal()
		end)
	end, {
		FriendId,
		p1.tokens,
		UseResult1,
		p1.showGenericErrorModal
	}) else nil
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy), UseLocalizationResult (copy)
		FireAnalyticsEventFunction(EventNames.TCUpsellAcceptTrustedConnectionClicked)
		p1.showToast(UseLocalizationResult.isATrustedConnectionNowToast)
	end, {
		UseLocalizationResult.isATrustedConnectionNowToast,
		FireAnalyticsEventFunction,
		p1.showToast
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy)
		FireAnalyticsEventFunction(EventNames.TCUpsellCancelClicked)
		p1.closeModal()
	end, { p1.closeModal, FireAnalyticsEventFunction })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), GetResult (upval), FriendId (copy), p1 (copy), Contexts (upval), UseAppPolicyResult (copy), UseLocalizationResult (copy)
		FireAnalyticsEventFunction(EventNames.TCUpsellAddViaLinkClicked)
		GetResult.createTrustedFriendLink(FriendId):andThen(function(Result)
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
		p1.closeModal, p1.showGenericErrorModal, FireAnalyticsEventFunction, FriendId,
		UseLocalizationResult, UseAppPolicyResult, p1.shareUrl, p1.showToast
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: GetResult (upval), FriendId (copy), UseResult3 (copy), p1 (copy)
		GetResult.acceptTrustedConnectionRequest(FriendId):andThen(function()
			-- upvalues: UseResult3 (upval)
			UseResult3()
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
	end, { p1, FriendId, UseResult3 })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: GetResult (upval), FriendId (copy), p1 (copy), UseResult3 (copy), FFlagTCUpdateProfileCTAButton (upval)
		GetResult.addTrustedFriendFromLink(FriendId, p1.tokens or {}):andThen(function()
			-- upvalues: UseResult3 (upval)
			UseResult3()
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
	end, { p1, FriendId, UseResult3 })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: GetResult (upval), FriendId (copy), p1 (copy), FireAnalyticsEventFunction (copy), EventNames (upval), UseLocalizationResult (copy)
		GetResult.sendTrustedConnectionRequest(FriendId, if p1.sentFromQrCode then "qr" else nil):andThen(function()
			-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), p1 (upval), UseLocalizationResult (upval)
			FireAnalyticsEventFunction(EventNames.TCUpsellAddTrustedConnectionClicked)
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
		FriendId,
		UseLocalizationResult,
		FireAnalyticsEventFunction
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: ModalVariant (copy), TrustedConnectionStatus (upval), UseLocalizationResult (copy), UseResult (copy), UseResult4 (copy), UseStateResult1 (copy), InverseTFRequestEnabled (upval), p1 (copy), UseStateResult (copy), FoundationModule (upval), UseResult2 (copy), UseResult1 (copy), UseResult7 (copy), UseResult6 (copy), UseResult5 (copy), UseResult8 (copy)
		if not ModalVariant then
			return nil
		elseif ModalVariant == TrustedConnectionStatus.TrustedFriends then
			return {
				{ text = UseLocalizationResult.ok, onActivated = UseResult }
			}
		else
			local config = {
				icon = nil,
				isLoading = false,
				text = UseLocalizationResult.cancel,
				onActivated = UseResult4
			}
			
			if UseStateResult1 then
				return {
					{
						isLoading = true,
						onActivated = function() end
					},
					config
				}
			elseif ModalVariant == TrustedConnectionStatus.RequestReceived then
				local v1 = InverseTFRequestEnabled and p1.tokens and #p1.tokens > 0 or nil
				
				return if UseStateResult then {
					{
						text = UseLocalizationResult.accept,
						icon = FoundationModule.Enums.IconName.LockClosed,
						onActivated = if InverseTFRequestEnabled and v1 then UseResult2 else UseResult1
					},
					config
				} elseif p1.tokens and #p1.tokens > 0 then {
					{
						text = UseLocalizationResult.accept,
						onActivated = UseResult7
					},
					config
				} else {
					{
						text = UseLocalizationResult.accept,
						onActivated = UseResult6
					},
					config
				}
			else
				return if ModalVariant == TrustedConnectionStatus.Friends then if UseStateResult then {
					{
						text = UseLocalizationResult.add,
						icon = FoundationModule.Enums.IconName.LockClosed,
						onActivated = UseResult1
					},
					config
				} elseif p1.isShareLinkSender then {
					{
						text = UseLocalizationResult.addViaLink,
						onActivated = UseResult5
					},
					config
				} else {
					{
						text = UseLocalizationResult.add,
						onActivated = UseResult8
					},
					config
				} else nil
			end
		end
	end, {
		ModalVariant, UseStateResult1, UseStateResult, UseLocalizationResult,
		p1.tokens, p1.isShareLinkSender, UseResult, UseResult1, UseResult4, UseResult6,
		UseResult7, UseResult8, UseResult5, UseResult2
	})
end