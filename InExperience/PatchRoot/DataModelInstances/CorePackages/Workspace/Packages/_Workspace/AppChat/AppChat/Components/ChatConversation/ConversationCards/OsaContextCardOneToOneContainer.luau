local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local OsaContextCardOneToOneModule = require(AppChat.Components.ChatConversation.ConversationCards.OsaContextCardOneToOne)
local GetThumbnailsForUserIdsModule = require(AppChat.Users.getThumbnailsForUserIds)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local UseProfileNameModule = require(AppChat.Hooks.useProfileName)
local DataStatus = require(Parent.DataHydration).DataStatus
local GetCombinedNameFromIdFunction = UserProfilesModule.Selectors.getCombinedNameFromId
local GetUsernameFromIdFunction = UserProfilesModule.Selectors.getUsernameFromId
local APIFunction = AppChatNetworkingModule.rodux.GetConversationDetails.API
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local UseIsGuiInChatVisibleModule = require(AppChat.Hooks.useIsGuiInChatVisible)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseRecordModalSequenceResponseForConversationModule = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseIsChatUserMessagesEnabledModule = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagAppChatUseUserProfileHydrationModule = require(AppChat.Flags.FFlagAppChatUseUserProfileHydration)
local UseIsRobloxSubscriberFunction = UserProfilesModule.Hooks.useIsRobloxSubscriber

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), UseChatPagePaddingModule (copy), ReactModule (copy), UseIsChatUserMessagesEnabledModule (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), FFlagAppChatUseUserProfileHydrationModule (copy), UseProfileNameModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), UseRecordModalSequenceResponseForConversationModule (copy), UseGetConversationFromIdModule (copy), AppChatNetworkingModule (copy), UseIsGuiInChatVisibleModule (copy), UseSelectorFunction (copy), RoduxNetworkingModule (copy), APIFunction (copy), NewResult (copy), GetUsernameFromIdFunction (copy), GetCombinedNameFromIdFunction (copy), GetThumbnailsForUserIdsModule (copy), FoundationModule (copy), OsaContextCardOneToOneModule (copy), DataStatus (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) or ""
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatPagePaddingModuleResult (copy)
		return {
			left = UDim.new(0, UseChatPagePaddingModuleResult.left),
			right = UDim.new(0, UseChatPagePaddingModuleResult.right)
		}
	end, {
		UseChatPagePaddingModuleResult.left,
		UseChatPagePaddingModuleResult.right
	})
	local UseIsChatUserMessagesEnabledModuleResult = UseIsChatUserMessagesEnabledModule()
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck and UseGetOneToOneFriendIdFromConversationIdModuleResult ~= "" then UseGetOneToOneFriendIdFromConversationIdModuleResult else nil)
	local v1 = nil
	local v2 = nil
	
	if FFlagAppChatUseUserProfileHydrationModule then
		v2 = UseProfileNameModule(UseGetOneToOneFriendIdFromConversationIdModuleResult)
	else
		v1 = UseUserProfilesFetchFunction({
			overrideRetryCount = 4,
			userIds = { UseGetOneToOneFriendIdFromConversationIdModuleResult },
			query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRecordModalSequenceResponseForConversationModuleResult = UseRecordModalSequenceResponseForConversationModule(p1.conversationId)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy)
		if p1.openViewProfile then
			p1.openViewProfile(UseGetOneToOneFriendIdFromConversationIdModuleResult)
		end
	end, { UseGetOneToOneFriendIdFromConversationIdModuleResult })
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1.conversationId)
	local IsOsaAcknowledgementStatusMatch: boolean = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.osaAcknowledgementStatus == AppChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsGuiInChatVisibleModuleResult = UseIsGuiInChatVisibleModule(UseRefResult, { UseRefResult.current })
	local UseIsGuiInChatVisibleModuleResult1 = if IsOsaAcknowledgementStatusMatch then UseIsGuiInChatVisibleModuleResult else false
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: AppChatNetworkingModule (upval), p1 (copy)
		return AppChatNetworkingModule.rodux.RecordModalSequenceResponse.getStatus(p2, p1.conversationId)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: IsOsaAcknowledgementStatusMatch (copy), UseIsGuiInChatVisibleModuleResult1 (copy), UseSelectorResult (copy), RoduxNetworkingModule (upval), UseStateResult (copy), UseRecordModalSequenceResponseForConversationModuleResult (copy), UseStateResult2 (copy), UseGetConversationFromIdModuleResult (copy), UseDispatchResult (copy), APIFunction (upval), p1 (copy), NewResult (upval)
		if IsOsaAcknowledgementStatusMatch and UseIsGuiInChatVisibleModuleResult1 and UseSelectorResult ~= RoduxNetworkingModule.Enum.NetworkStatus.Fetching and not UseStateResult and UseRecordModalSequenceResponseForConversationModuleResult then
			UseRecordModalSequenceResponseForConversationModuleResult("record_has_seen", "conversation_inline_top_modal", nil, "OsaContextCard"):andThen(function()
				-- upvalues: UseStateResult2 (upval), UseGetConversationFromIdModuleResult (upval), UseDispatchResult (upval), APIFunction (upval), p1 (upval)
				UseStateResult2(true)
				
				if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.source ~= "friends" then
					UseDispatchResult(APIFunction(p1.conversationId))
				end
			end):catch(function(Err)
				-- upvalues: NewResult (upval)
				NewResult:error("Error in OsaContextCardOneToOneContainer -> recordModalSequenceResponseForConversation -> record_has_seen: " .. tostring(Err))
			end)
		end
	end, {
		IsOsaAcknowledgementStatusMatch, UseIsGuiInChatVisibleModuleResult1,
		UseSelectorResult, UseRecordModalSequenceResponseForConversationModuleResult,
		UseStateResult, UseDispatchResult, p1.conversationId
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatUseUserProfileHydrationModule (upval), v1 (ref), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy), GetUsernameFromIdFunction (upval), UseStateResult2_1 (copy), UseStateResult2_2 (copy), GetCombinedNameFromIdFunction (upval)
		if not FFlagAppChatUseUserProfileHydrationModule and v1.data and UseGetOneToOneFriendIdFromConversationIdModuleResult then
			local UsernameFromId = GetUsernameFromIdFunction(v1.data, UseGetOneToOneFriendIdFromConversationIdModuleResult)
			UseStateResult2_1(if UsernameFromId then "@" .. UsernameFromId else nil)
			UseStateResult2_2(GetCombinedNameFromIdFunction(v1.data, UseGetOneToOneFriendIdFromConversationIdModuleResult))
		end
	end, {
		UseGetOneToOneFriendIdFromConversationIdModuleResult,
		if FFlagAppChatUseUserProfileHydrationModule then nil else v1.data
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full-0 auto-y align-x-center padding-top-xxlarge padding-bottom-large",
		padding = UseMemoResult
	}, {
		OsaContextCardOneToOne = ReactModule.createElement(OsaContextCardOneToOneModule, {
			displayName = if FFlagAppChatUseUserProfileHydrationModule then v2.combinedName else UseStateResult3,
			username = if FFlagAppChatUseUserProfileHydrationModule then if v2.username then "@" .. v2.username else nil else UseStateResult1,
			avatarThumbnail = ReactModule.useMemo(function()
				-- upvalues: GetThumbnailsForUserIdsModule (upval), UseGetOneToOneFriendIdFromConversationIdModuleResult (copy)
				return GetThumbnailsForUserIdsModule({ UseGetOneToOneFriendIdFromConversationIdModuleResult })[1]
			end, { UseGetOneToOneFriendIdFromConversationIdModuleResult }),
			onAvatarActivated = UseResult,
			hasError = if FFlagAppChatUseUserProfileHydrationModule then v2.status == DataStatus.Failed elseif v1.error then true else false,
			isChatUserMessagesEnabled = UseIsChatUserMessagesEnabledModuleResult,
			ref = UseRefResult,
			userId = UseGetOneToOneFriendIdFromConversationIdModuleResult,
			isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
		})
	})
end)