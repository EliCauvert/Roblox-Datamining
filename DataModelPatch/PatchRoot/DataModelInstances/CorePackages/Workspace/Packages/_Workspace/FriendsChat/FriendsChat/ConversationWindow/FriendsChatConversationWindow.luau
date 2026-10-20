local Players = game:GetService("Players")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationModule = require(Parent.Localization)
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local LocalizeStringsFunction = LocalizationModule.localizeStrings
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local FetchMessagePageModule = require(Parent.AppChat.fetchMessagePage)
local UseChatWindowModule = require(script.Parent.Parent.Bridge.useChatWindow)
local UseMessageDisplayStoreModule = require(script.Parent.Parent.Message.MessageDisplayStore.useMessageDisplayStore)
local FFlagDebugFriendsChatModule = require(script.Parent.Parent.Flags.FFlagDebugFriendsChat)
local FStringDebugFriendsChatConversationIdModule = require(script.Parent.Parent.Flags.FStringDebugFriendsChatConversationId)
local UseMessagePoolFunction = require(Parent.ChatUIPrimitives).useMessagePool
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local FriendsChatTextMessageModule = require(script.Parent.Parent.Message.FriendsChatTextMessage)
local FriendsChatConversationHeaderBarModule = require(script.Parent.Parent.HeaderBar.FriendsChatConversationHeaderBar)
local GetFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)
local FriendsChatInputBarHostModule = require(script.Parent.FriendsChatInputBarHost)
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local UIListLayout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })

local function _(List, p1): boolean
	if List == p1 then
		return true
	end
	if List == nil or p1 == nil or #List ~= #p1 then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

local function areSelectedConversationHeaderFieldsEqual(p2, p3): boolean
	if p2 == p3 then
		return true
	end
	if p2 == nil or p3 == nil then
		return false
	end
	local Flag = false
	
	if p2.source == p3.source then
		Flag = false
		
		if p2.title == p3.title then
			Flag = false
			
			if p2.titleForViewer == p3.titleForViewer then
				local Participants = p2.participants
				local Participants1 = p3.participants
				
				if Participants == Participants1 then
					return true
				end
				if Participants == nil or Participants1 == nil or #Participants ~= #Participants1 then
					return false
				end
				for i, participant in Participants do
					if Participants1[i] ~= participant then
						return false
					end
				end
				Flag = true
			end
		end
	end
	return Flag
end

return function(p4)
	-- upvalues: UseChatWindowModule (copy), FFlagDebugFriendsChatModule (copy), FStringDebugFriendsChatConversationIdModule (copy), Players (copy), ExpChatConversationListAdapterModule (copy), ReactModule (copy), SignalsModule (copy), areSelectedConversationHeaderFieldsEqual (copy), SignalsReactModule (copy), GetFriendsChatHeaderPropsModule (copy), GetConversationMessageListStoreModule (copy), LocalizationRoactContext (copy), LocalizeStringsFunction (copy), UseMessageDisplayStoreModule (copy), FriendsChatTextMessageModule (copy), UseMessagePoolFunction (copy), UIListLayout (copy), FetchMessagePageModule (copy), NewResult (copy), LayoutConstantsModule (copy), FriendsChatConversationHeaderBarModule (copy), FriendsChatInputBarHostModule (copy)
	local UseChatWindowModuleResult = UseChatWindowModule()
	local ConversationId = p4.conversationId or ""
	
	if ConversationId == "" and FFlagDebugFriendsChatModule then
		ConversationId = FStringDebugFriendsChatConversationIdModule
	end
	local IsNotConversationIdMatch = ConversationId ~= ""
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else 0
	local ConversationStore = ExpChatConversationListAdapterModule.getConversationStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), IsNotConversationIdMatch (copy), ConversationStore (copy), ConversationId (ref), areSelectedConversationHeaderFieldsEqual (upval)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: IsNotConversationIdMatch (upval), ConversationStore (upval), ConversationId (upval)
			if IsNotConversationIdMatch then
				local Conversation = ConversationStore.getConversation(ConversationId, p5)
				
				return if Conversation == nil then nil else {
					source = Conversation.source,
					title = Conversation.title,
					titleForViewer = Conversation.titleForViewer,
					participants = Conversation.participants
				}
			else
				return nil
			end
		end, areSelectedConversationHeaderFieldsEqual)
	end, {
		ConversationStore,
		ConversationId,
		IsNotConversationIdMatch
	})))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), GetFriendsChatHeaderPropsModule (upval), UserId (copy)
		return if UseSignalStateResult == nil then nil else GetFriendsChatHeaderPropsModule(UseSignalStateResult, UserId)
	end, { UseSignalStateResult, UserId })
	local IsSourceMatch: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.source == ExpChatConversationListAdapterModule.ConversationSource.Friends
	local IsFriends: boolean = UseSignalStateResult == nil and string.sub(ConversationId, 1, 8) == "friends:"
	local NoIsFriends: boolean = IsNotConversationIdMatch and (not IsSourceMatch and not IsFriends)
	local NoIsSourceMatch: boolean = IsNotConversationIdMatch and not IsSourceMatch
	ReactModule.useEffect(function()
		-- upvalues: IsNotConversationIdMatch (copy), ExpChatConversationListAdapterModule (upval), ConversationId (ref)
		if IsNotConversationIdMatch then
			ExpChatConversationListAdapterModule.markConversationRead(ConversationId)
		end
	end, { ConversationId, IsNotConversationIdMatch })
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseMessageDisplayStoreModuleResult = UseMessageDisplayStoreModule(ReactModule.useMemo(function()
		-- upvalues: NoIsSourceMatch (copy), GetConversationMessageListStoreModule (upval), ConversationId (ref)
		return if NoIsSourceMatch then function(p5)
			-- upvalues: GetConversationMessageListStoreModule (upval), ConversationId (upval)
			return GetConversationMessageListStoreModule(p5).getOrderedIds(ConversationId, p5)
		end else function()
			return {}
		end
	end, { ConversationId, NoIsSourceMatch }), ConversationId, (ReactModule.useCallback(function(Value)
		-- upvalues: UseContextResult (copy), LocalizeStringsFunction (upval)
		if UseContextResult == nil then
			return ""
		else
			local Success, Result = pcall(function()
				-- upvalues: LocalizeStringsFunction (upval), UseContextResult (upval), Value (copy)
				return LocalizeStringsFunction(UseContextResult, { value = Value }).value
			end)
			
			return if Success and typeof(Result) == "string" then Result else ""
		end
	end, { UseContextResult })))
	local UseMessagePoolResult = UseMessagePoolFunction({
		maxSlots = 50,
		messageIdsSignal = UseMessageDisplayStoreModuleResult.getDisplayIds,
		createSlotElement = ReactModule.useCallback(function(p5)
			-- upvalues: ReactModule (upval), FriendsChatTextMessageModule (upval), UseMessageDisplayStoreModuleResult (copy), p4 (copy)
			return ReactModule.createElement(FriendsChatTextMessageModule, {
				getDisplayId = p5.getMessageId,
				getDisplayFromId = UseMessageDisplayStoreModuleResult.getDisplayFromId,
				getLayoutOrder = p5.getLayoutOrder,
				chatWindowSettings = p4.chatWindowSettings,
				textTransparency = p4.textTransparency,
				isSpatialUIEnabled = p4.isSpatialUIEnabled
			})
		end, {
			UseMessageDisplayStoreModuleResult,
			p4.chatWindowSettings,
			p4.textTransparency,
			p4.isSpatialUIEnabled
		})
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMessagePoolResult (copy), UIListLayout (upval)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: UseMessagePoolResult (upval), UIListLayout (upval)
			local Copy = table.clone(UseMessagePoolResult(p5))
			Copy["$layout"] = UIListLayout
			
			return Copy
		end)
	end, { UseMessagePoolResult })
	ReactModule.useEffect(function()
		-- upvalues: NoIsSourceMatch (copy), FetchMessagePageModule (upval), ConversationId (ref), NewResult (upval)
		if not NoIsSourceMatch then return end
		local Flag = false
		FetchMessagePageModule(ConversationId, nil):catch(function(Err)
			-- upvalues: Flag (ref), NewResult (upval), ConversationId (upval)
			if not Flag then
				NewResult:warning(`Failed to fetch conversation messages for {ConversationId}: {tostring(Err)}`)
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { ConversationId, NoIsSourceMatch })
	local ParentLayoutOrder = p4.parentLayoutOrder or 1
	local OnOpenDetailsFunction = p4.onOpenDetails
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnOpenDetailsFunction (copy), ConversationId (ref)
		OnOpenDetailsFunction(ConversationId)
	end, { OnOpenDetailsFunction, ConversationId })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		friendsChatHeaderWindow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = ParentLayoutOrder,
			Size = UDim2.new(1, 0, 1, LayoutConstantsModule.PanelTopSpacerHeight)
		}, {
			layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			header = ReactModule.createElement(FriendsChatConversationHeaderBarModule, {
				layoutOrder = 1,
				localUserId = UserId,
				participantUserIds = if UseMemoResult then UseMemoResult.participantUserIds else nil,
				titleText = if UseMemoResult then UseMemoResult.titleText else nil,
				chatWindowSettings = p4.chatWindowSettings,
				transparencyValue = p4.transparencyValue,
				onHovered = p4.onHovered,
				onUnhovered = p4.onUnhovered,
				onBack = p4.onBack,
				onActivated = if p4.onOpenDetails and NoIsFriends then UseResult else nil
			}),
			windowSlot = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 0)
			}, {
				flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				window = ReactModule.createElement(UseChatWindowModuleResult, {
					disableLineReporting = true,
					size = UDim2.fromScale(1, 1),
					isChannelBarVisible = p4.isChannelBarVisible,
					scrollResetKey = "FriendsChat:" .. ConversationId,
					messageComponentsSignal = UseMemoResult1,
					chatWindowSettings = p4.chatWindowSettings,
					transparencyValue = p4.transparencyValue,
					textTransparency = p4.textTransparency,
					isSpatialUIEnabled = p4.isSpatialUIEnabled,
					onHovered = p4.onHovered,
					onUnhovered = p4.onUnhovered,
					onAbsoluteSizeChanged = p4.onAbsoluteSizeChanged,
					onAbsolutePositionChanged = p4.onAbsolutePositionChanged,
					resetTargetChannel = ReactModule.useCallback(function()
						-- upvalues: NewResult (upval)
						NewResult:warning("resetTargetChannel called on FriendsChatConversationWindow; not supported")
					end, {}),
					activateWhisperMode = ReactModule.useCallback(function()
						-- upvalues: NewResult (upval)
						NewResult:warning("activateWhisperMode called on FriendsChatConversationWindow; not supported")
					end, {})
				})
			})
		}),
		friendsChatInput = ReactModule.createElement(FriendsChatInputBarHostModule, {
			LayoutOrder = ParentLayoutOrder + 1,
			conversationId = ConversationId,
			onFriendPlaceholderConversationCreated = p4.onFriendPlaceholderConversationCreated,
			chatWindowSettings = p4.chatWindowSettings,
			transparencyValue = p4.transparencyValue,
			isSpatialUIEnabled = p4.isSpatialUIEnabled,
			onHovered = p4.onHovered,
			onUnhovered = p4.onUnhovered
		})
	})
end