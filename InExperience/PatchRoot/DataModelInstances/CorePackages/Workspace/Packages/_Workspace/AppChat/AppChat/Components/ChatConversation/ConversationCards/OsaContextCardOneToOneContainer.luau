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

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useChatPagePaddingModule (ref), reactModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), useUserProfilesFetch (ref), userProfilesModule (ref), useRecordModalSequenceResponseForConversationModule (ref), useGetConversationFromIdModule (ref), appChatNetworkingModule (ref), useIsGuiInChatVisibleModule (ref), useSelector (ref), roduxNetworkingModule (ref), API (ref), name (ref), getUsernameFromId (ref), getCombinedNameFromId (ref), getThumbnailsForUserIdsModule (ref), foundationModule (ref), osaContextCardOneToOneModule (ref)
	local var1 = useDispatch()
	local conversationId = useGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) or ""
	local var2 = useChatPagePaddingModule()
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			left = UDim.new(0, var2.left),
			right = UDim.new(0, var2.right)
		}
	end, { var2.left, var2.right })
	local var4 = useIsChatUserMessagesEnabledModule()
	local var5 = useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck and conversationId ~= "" then conversationId else nil)
	local var6 = useUserProfilesFetch({
		overrideRetryCount = 4,
		userIds = { conversationId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var7, var8 = reactModule.useState(false)
	local var9 = useRecordModalSequenceResponseForConversationModule(p1.conversationId)
	local var10 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), conversationId (ref)
		if p1.openViewProfile then
			p1.openViewProfile(conversationId)
		end
	end, { conversationId })
	local var11 = useGetConversationFromIdModule(p1.conversationId)
	local var12 = var11 and var11.osaAcknowledgementStatus == appChatNetworkingModule.Constants.OsaAcknowledgementStatusResponse.Unacknowledged
	local var13 = reactModule.useRef(nil)
	local var14 = if var12 then useIsGuiInChatVisibleModule(var13, { var13.current }) else false
	local var15 = useSelector(function(p2)
		-- upvalues: appChatNetworkingModule (copy), p1 (ref)
		return appChatNetworkingModule.rodux.RecordModalSequenceResponse.getStatus(p2, p1.conversationId)
	end)
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var14 (ref), var15 (ref), roduxNetworkingModule (copy), var7 (ref), var9 (ref), var8 (ref), var11 (ref), var1 (ref), API (copy), p1 (ref), name (copy)
		if var12 and var14 and (var15 ~= roduxNetworkingModule.Enum.NetworkStatus.Fetching and not var7) and var9 then
			var9("record_has_seen", "conversation_inline_top_modal", nil, "OsaContextCard"):andThen(function()
				-- upvalues: var8 (copy), var11 (copy), var1 (copy), API (copy), p1 (copy)
				var8(true)
				
				if var11 and var11.source ~= "friends" then
					var1(API(p1.conversationId))
				end
			end):catch(function(p2)
				-- upvalues: name (copy)
				name:error("Error in OsaContextCardOneToOneContainer -> recordModalSequenceResponseForConversation -> record_has_seen: " .. tostring(p2))
			end)
		end
	end, {
		var12, var14, var15, var9, var7, var1, p1.conversationId
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), conversationId (ref), getUsernameFromId (copy), var17 (ref), var19 (ref), getCombinedNameFromId (copy)
		if var6.data and conversationId then
			local var20 = getUsernameFromId(var6.data, conversationId)
			var17(if var20 then "@" .. var35 else nil)
			var19(getCombinedNameFromId(var6.data, conversationId))
		end
	end, { var6.data, conversationId })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "col size-full-0 auto-y align-x-center padding-top-xxlarge padding-bottom-large",
		padding = var3
	}, {
		OsaContextCardOneToOne = reactModule.createElement(osaContextCardOneToOneModule, {
			displayName = var18,
			username = var16,
			avatarThumbnail = reactModule.useMemo(function()
				-- upvalues: getThumbnailsForUserIdsModule (copy), conversationId (ref)
				return getThumbnailsForUserIdsModule({ conversationId })[1]
			end, { conversationId }),
			onAvatarActivated = var10,
			hasError = if var6.error then true else false,
			isChatUserMessagesEnabled = var4,
			ref = var13,
			userId = conversationId,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var5 else nil
		})
	})
end)