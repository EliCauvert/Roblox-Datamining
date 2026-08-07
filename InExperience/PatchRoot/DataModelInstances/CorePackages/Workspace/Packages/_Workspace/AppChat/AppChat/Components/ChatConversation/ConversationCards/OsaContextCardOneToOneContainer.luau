local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local osaContextCardOneToOneModule = require(appChat.Components.ChatConversation.ConversationCards.OsaContextCardOneToOne)
local getThumbnailsForUserIdsModule = require(appChat.Users.getThumbnailsForUserIds)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local name = require(appChat.Logger):new(script.Name)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local getCombinedNameFromId = userProfilesModule.Selectors.getCombinedNameFromId
local getUsernameFromId = userProfilesModule.Selectors.getUsernameFromId
local API = appChatNetworkingModule.rodux.GetConversationDetails.API
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useIsGuiInChatVisibleModule = require(appChat.Hooks.useIsGuiInChatVisible)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = userProfilesModule.Hooks.useIsRobloxSubscriber

return reactModule.memo(function(p0) --[[ line: 37 ]]
	-- upvalues: useDispatch (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useChatPagePaddingModule (ref), reactModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useRecordModalSequenceResponseForConversationModule (ref), useGetConversationFromIdModule (ref), appChatNetworkingModule (ref), useIsGuiInChatVisibleModule (ref), useSelector (ref), roduxNetworkingModule (ref), API (ref), name (ref), getUsernameFromId (ref), getCombinedNameFromId (ref), getThumbnailsForUserIdsModule (ref), foundationModule (ref), osaContextCardOneToOneModule (ref)
	local var15 = useDispatch()
	local conversationId = useGetOneToOneFriendIdFromConversationIdModule(p0.conversationId) or ""
	local var17 = useChatPagePaddingModule()
	local var18 = reactModule.useMemo(function() --[[ line: 41 ]]
		-- upvalues: var17 (ref)
		return {
			left = UDim.new(0, var17.left),
			right = UDim.new(0, var17.right)
		}
	end, { var17.left, var17.right })
	local var19 = useIsChatUserMessagesEnabledModule()
	local var20 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck and conversationId ~= "" then conversationId else nil)
	local var21 = useUserProfilesFetch({
		overrideRetryCount = 4,
		userIds = { conversationId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var22, var23 = reactModule.useState(false)
	local var24 = useRecordModalSequenceResponseForConversationModule(p0.conversationId)
	local var25 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: p0 (ref), conversationId (ref)
		if p0.openViewProfile then
			p0.openViewProfile(conversationId)
		end
	end, { conversationId })
	local var26 = useGetConversationFromIdModule(p0.conversationId)
	local var27 = var26 and var26.osaAcknowledgementStatus == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
	local var28 = reactModule.useRef(nil)
	local var29 = if var27 then useIsGuiInChatVisibleModule(var28, { var28.current }) else false
	local var30 = useSelector(function(p1) --[[ line: 79 ]]
		-- upvalues: appChatNetworkingModule (copy), p0 (ref)
		return appChatNetworkingModule.rodux.RecordModalSequenceResponse.getStatus(p1, p0.conversationId)
	end)
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var27 (ref), var29 (ref), var30 (ref), roduxNetworkingModule (copy), var22 (ref), var24 (ref), var23 (ref), var26 (ref), var15 (ref), API (copy), p0 (ref), name (copy)
		if var27 and var29 and (var30 ~= roduxNetworkingModule.Enum.NetworkStatus.Fetching and not var22) and var24 then
			var24("record_has_seen", "conversation_inline_top_modal", nil, "OsaContextCard"):andThen(function() --[[ line: 96 ]]
				-- upvalues: var23 (copy), var26 (copy), var15 (copy), API (copy), p0 (copy)
				var23(true)
				
				if var26 and var26.source ~= "friends" then
					var15(API(p0.conversationId))
				end
			end):catch(function(p2) --[[ line: 104 ]]
				-- upvalues: name (copy)
				name:error("Error in OsaContextCardOneToOneContainer -> recordModalSequenceResponseForConversation -> record_has_seen: " .. tostring(p2))
			end)
		end
	end, {
		var27, var29, var30, var24, var22, var15, p0.conversationId
	})
	reactModule.useEffect(function() --[[ line: 123 ]]
		-- upvalues: var21 (ref), conversationId (ref), getUsernameFromId (copy), var32 (ref), var34 (ref), getCombinedNameFromId (copy)
		if var21.data and conversationId then
			local var35 = getUsernameFromId(var21.data, conversationId)
			var32(if var35 then "@" .. var35 else nil)
			var34(getCombinedNameFromId(var21.data, conversationId))
		end
	end, { var21.data, conversationId })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y align-x-center padding-top-xxlarge padding-bottom-large",
		padding = var18
	}, {
		OsaContextCardOneToOne = reactModule.createElement(osaContextCardOneToOneModule, {
			displayName = var33,
			username = var31,
			avatarThumbnail = reactModule.useMemo(function() --[[ line: 131 ]]
				-- upvalues: getThumbnailsForUserIdsModule (copy), conversationId (ref)
				return getThumbnailsForUserIdsModule({ conversationId })[1]
			end, { conversationId }),
			onAvatarActivated = var25,
			hasError = if var21.error then true else false,
			isChatUserMessagesEnabled = var19,
			ref = var28,
			userId = conversationId,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var20 else nil
		})
	})
end)