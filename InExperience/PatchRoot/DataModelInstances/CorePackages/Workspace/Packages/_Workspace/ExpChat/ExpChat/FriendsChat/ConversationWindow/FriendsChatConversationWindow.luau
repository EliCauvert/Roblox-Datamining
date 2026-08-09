local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local getConversationMessageListStoreModule = require(parent.AppChat.GetConversationMessageListStore)
local fetchMessagePageModule = require(parent.AppChat.fetchMessagePage)
local chatWindowModule = require(expChat.ChatWindow.UI.ChatWindow)
local fFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local fStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local useFriendsChatMessagePoolModule = require(script.Parent.Parent.Message.useFriendsChatMessagePool)
local friendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local getFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)
local friendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local name = expChatSharedModule.Logger:new(script.Name)

local function _(p0, p1) --[[ line: 86 | named "areArraysEqual" ]]
	if p0 == p1 then
		return true
	elseif p0 == nil or p1 == nil or #p0 ~= #p1 then
		return false
	end
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	return true
end

local function areSelectedConversationHeaderFieldsEqual(p2, p3) --[[ line: 101 ]]
	if p2 == p3 then
		return true
	elseif p2 == nil or p3 == nil then
		return false
	end
	local var18 = false
	
	if p2.source == p3.source then
		var18 = false
		
		if p2.type == p3.type then
			var18 = false
			
			if p2.title == p3.title then
				var18 = false
				
				if p2.titleForViewer == p3.titleForViewer then
					var18 = false
					
					if p2.isDefaultTitle == p3.isDefaultTitle then
						local participants = p2.participants
						local participants_1 = p3.participants
						
						if participants == participants_1 then
							return true
						elseif participants == nil or participants_1 == nil or #participants ~= #participants_1 then
							return false
						end
						for i, v in participants do
							if participants_1[i] ~= v then
								return false
							end
						end
						var18 = true
					end
				end
			end
		end
	end
	return var18
end

return function(p4) --[[ line: 119 | named "FriendsChatConversationWindow" ]]
	-- upvalues: fFlagDebugFriendsChatModule (ref), fStringDebugFriendsChatConversationIdModule (ref), playersService (ref), expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), areSelectedConversationHeaderFieldsEqual (ref), signalsReactModule (ref), getFriendsChatHeaderPropsModule (ref), getConversationMessageListStoreModule (ref), useFriendsChatMessagePoolModule (ref), fetchMessagePageModule (ref), name (ref), friendsChatConversationHeaderBarModule (ref), chatWindowModule (ref), friendsChatInputBarHostModule (ref)
	local conversationId = p4.conversationId
	
	if (conversationId == nil or conversationId == "") and fFlagDebugFriendsChatModule then
		conversationId = fStringDebugFriendsChatConversationIdModule
	end
	conversationId = conversationId or ""
	local var19 = conversationId ~= nil and conversationId ~= ""
	local localPlayer = playersService.LocalPlayer
	local var20 = if localPlayer then localPlayer.UserId else 0
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	local var22 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: signalsModule (copy), var19 (ref), conversationStore (ref), conversationId (write), areSelectedConversationHeaderFieldsEqual (copy)
		return signalsModule.createComputed(function(p5) --[[ line: 132 ]]
			-- upvalues: var19 (copy), conversationStore (copy), conversationId (copy)
			if not var19 then
				return nil
			end
			local conversation = conversationStore.getConversation(conversationId, p5)
			
			return if conversation == nil then nil else {
				source = conversation.source,
				type = conversation.type,
				title = conversation.title,
				titleForViewer = conversation.titleForViewer,
				isDefaultTitle = conversation.isDefaultTitle,
				participants = conversation.participants
			}
		end, areSelectedConversationHeaderFieldsEqual)
	end, { conversationStore, conversationId, var19 }))
	local var23 = reactModule.useMemo(function() --[[ line: 151 ]]
		-- upvalues: var22 (ref), getFriendsChatHeaderPropsModule (copy), var20 (ref)
		return if var22 == nil then nil else getFriendsChatHeaderPropsModule(var22, var20)
	end, { var22, var20 })
	local var24 = var19 and not (var22 ~= nil and var22.source == expChatConversationListAdapterModule.ConversationSource.Friends)
	reactModule.useEffect(function() --[[ line: 161 ]]
		-- upvalues: var19 (ref), expChatConversationListAdapterModule (copy), conversationId (write)
		if var19 then
			expChatConversationListAdapterModule.markConversationRead(conversationId)
		end
	end, { conversationId, var19 })
	local var25 = useFriendsChatMessagePoolModule({
		messageIdsSignal = reactModule.useMemo(function() --[[ line: 170 ]]
			-- upvalues: var24 (ref), getConversationMessageListStoreModule (copy), conversationId (write)
			return if var24 then function(p6) --[[ line: 176 ]]
				-- upvalues: getConversationMessageListStoreModule (copy), conversationId (copy)
				return getConversationMessageListStoreModule(p6).getOrderedIds(conversationId, p6)
			end else function() --[[ line: 172 ]]
				return {}
			end
		end, { conversationId, var24 }),
		chatWindowSettings = p4.chatWindowSettings,
		textTransparency = p4.textTransparency,
		isSpatialUIEnabled = p4.isSpatialUIEnabled
	})
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: var24 (ref), fetchMessagePageModule (copy), conversationId (write), name (copy)
		if var24 then
			local var28 = false
			fetchMessagePageModule(conversationId, nil):catch(function(p7) --[[ line: 205 ]]
				-- upvalues: var28 (write), name (copy), conversationId (copy)
				if var28 then
					return
				end
				name:warning(`Failed to fetch conversation messages for {conversationId}: {tostring(p7)}`)
			end)
			
			return function() --[[ line: 212 ]]
				-- upvalues: var28 (write)
				var28 = true
			end
		end
	end, { conversationId, var24 })
	local parentLayoutOrder = p4.parentLayoutOrder or 1
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		friendsChatHeaderWindow = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = parentLayoutOrder,
			Size = UDim2.new(1, 0, 1, 8)
		}, {
			layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = reactModule.createElement(friendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				localUserId = var20,
				participantUserIds = if var23 then var23.participantUserIds else nil,
				titleText = if var23 then var23.titleText else nil,
				chatWindowSettings = p4.chatWindowSettings,
				transparencyValue = p4.transparencyValue,
				onHovered = p4.onHovered,
				onUnhovered = p4.onUnhovered,
				onBack = p4.onBack
			}),
			windowSlot = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 0)
			}, {
				flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				window = reactModule.createElement(chatWindowModule, {
					disableLineReporting = true,
					size = UDim2.fromScale(1, 1),
					isChannelBarVisible = p4.isChannelBarVisible,
					scrollResetKey = "FriendsChat:" .. conversationId,
					messageComponentsSignal = var25,
					chatWindowSettings = p4.chatWindowSettings,
					transparencyValue = p4.transparencyValue,
					textTransparency = p4.textTransparency,
					mutedUserIds = p4.mutedUserIds,
					verifiedUserIds = p4.verifiedUserIds,
					showTranslationButton = p4.showTranslationButton,
					isSpatialUIEnabled = p4.isSpatialUIEnabled,
					onHovered = p4.onHovered,
					onUnhovered = p4.onUnhovered,
					onAbsoluteSizeChanged = p4.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p4.onAbsolutePositionChanged,
					resetTargetChannel = reactModule.useCallback(function() --[[ line: 225 ]]
						-- upvalues: name (copy)
						name:warning("resetTargetChannel called on FriendsChatConversationWindow; not supported")
					end, {}),
					activateWhisperMode = reactModule.useCallback(function() --[[ line: 228 ]]
						-- upvalues: name (copy)
						name:warning("activateWhisperMode called on FriendsChatConversationWindow; not supported")
					end, {})
				})
			})
		}),
		friendsChatInput = reactModule.createElement(friendsChatInputBarHostModule, {
			LayoutOrder = parentLayoutOrder + 1,
			conversationId = conversationId,
			onFriendPlaceholderConversationCreated = p4.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p4.chatWindowSettings,
			transparencyValue = p4.transparencyValue,
			isSpatialUIEnabled = p4.isSpatialUIEnabled,
			onHovered = p4.onHovered,
			onUnhovered = p4.onUnhovered
		})
	})
end