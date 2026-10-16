local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local LoggerModule = require(script.Parent.Logger)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local MemoFunction = ReactModule.memo
local Images = require(Parent.UIBlox).App.ImageSet.Images
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SectionHeaderModule = require(script.Parent.SectionHeader)
local GroupNameEntryCellModule = require(script.Parent.GroupNameEntryCell)
local AddFriendsEntryModule = require(script.Parent.AddFriendsEntry)
local ParticipantListModule = require(script.Parent.ParticipantList)
local LeaveGroupCellModule = require(script.Parent.LeaveGroupCell)
local ConversationTypeCellModule = require(script.Parent.UnfilteredThreads.ConversationTypeCell)
local CreateUnfilteredChatCellModule = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell)
local UseIsAppChatVerticallyConstrainedModule = require(AppChat.App.Hooks.useIsAppChatVerticallyConstrained)
local AppChatDetailsPageAutomaticCanvasSize = game:DefineFastFlag("AppChatDetailsPageAutomaticCanvasSize", false)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local UseIsChatUserMessagesEnabledModule = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local config = {
	localUserId = nil,
	conversation = nil,
	conversationId = nil,
	isGroupConversation = false,
	topBarHeight = 0,
	shouldShowCreateUnfilteredChat = false,
	shouldHideGroupChatFunctionality = false,
	shouldShowAddFriends = true,
	shouldShowConversationTypeInfo = true,
	conversationTitle = "PlaceholderTitle",
	pageHeaderText = "localizedText.ChatDetails",
	generalText = "localizedText.General",
	membersText = "localizedText.Members",
	addFriendsText = "localizedText.AddFriends",
	leaveGroupText = "localizedText.LeaveGroup",
	onlinePresenceText = "localizedText.OnlineText",
	offlinePresenceText = "localizedText.OfflineText",
	conversationTypeHeaderText = "Expressive Chat Features",
	conversationTypeText = "localizedText.ConversationTypeText",
	createUnfilteredChatText = "Create new chat without filters",
	createUnfilteredChatSubTitleText = "All members of this conversation will be invited, but some are not eligible to join.",
	LayoutOrder = 0,
	participants = {},
	navigateBack = function() --[[ Line: 83 ]] end,
	onGroupNameEntryCellActivated = function(_) --[[ Line: 98 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage")
	end,
	onAddFriendsCellActivated = function(_) --[[ Line: 101 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage")
	end,
	onLeaveGroupCellActivated = function(_) --[[ Line: 104 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage")
	end,
	onParticipantCellActivated = function(_, _) --[[ Line: 107 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onParticipantCellActivated was not passed to ChatDetailsPage")
	end,
	onConversationTypeIconActivated = function(_) --[[ Line: 110 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage")
	end,
	onCreateUnfilteredChatCellActivated = function(_) --[[ Line: 113 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage")
	end,
	style = CryoModule.Dictionary.join(require(AppChat.SocialLibraries).Components.TestStyle, {
		Tokens = { Color = { None = {} }, Size = { Size_0 = 0 } }
	})
}

function ChatDetailsPage(p1) --[[ Line: 132 ]]
	-- upvalues: CryoModule (copy), config (copy), UseTextSizeOffsetFunction (copy), UseTokensFunction (copy), UseIsAppChatVerticallyConstrainedModule (copy), LoggerModule (copy), UseCallbackFunction (copy), UseIsChatUserMessagesEnabledModule (copy), ReactModule (copy), AppChatDetailsPageAutomaticCanvasSize (copy), SectionHeaderModule (copy), GroupNameEntryCellModule (copy), Images (copy), AddFriendsEntryModule (copy), ParticipantListModule (copy), LeaveGroupCellModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ConversationTypeCellModule (copy), CreateUnfilteredChatCellModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Style = JoinResult.style
	local NewSize = UseTokensFunction().Size.Size_1200 + 2 * UseTextSizeOffsetFunction()
	local UseIsAppChatVerticallyConstrainedModuleResult = UseIsAppChatVerticallyConstrainedModule()
	local config1 = {
		ChatGroupHeader = {
			marginTop = Style.Tokens.Size.Size_0,
			marginBottom = Style.Tokens.Size.Size_0
		},
		MembersHeader = {
			marginTop = Style.Tokens.Size.Size_0,
			marginBottom = Style.Tokens.Size.Size_0
		},
		GroupNameEntryCell = { paddingBottom = Style.Tokens.Size.Size_0 }
	}
	
	local function OnActivated() --[[ Line: 155 ]]
		-- upvalues: JoinResult (copy)
		JoinResult.onGroupNameEntryCellActivated(JoinResult.conversation)
	end
	
	local function OnActivated1() --[[ Line: 159 ]]
		-- upvalues: JoinResult (copy)
		JoinResult.onAddFriendsCellActivated(JoinResult.conversation)
	end
	
	local function OnActivated2() --[[ Line: 163 ]]
		-- upvalues: JoinResult (copy)
		JoinResult.onLeaveGroupCellActivated(JoinResult.conversation)
	end
	
	local function OnEntryActivated(p2, p3) --[[ Line: 167 ]]
		-- upvalues: LoggerModule (upval), JoinResult (copy)
		LoggerModule:info("onParticipantCellActivated: {}", p2.id)
		
		if not p2.isLocalUser then
			JoinResult.onParticipantCellActivated(p2.id, p3)
			
			return
		end
	end
	
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 176 ]]
		-- upvalues: JoinResult (copy)
		JoinResult.onCreateUnfilteredChatCellActivated(JoinResult.conversation)
	end, { JoinResult.conversation })
	local UseCallbackResult1 = UseCallbackFunction(function(_, SwipeDirection, p2) --[[ Line: 181 ]]
		-- upvalues: JoinResult (copy)
		if not JoinResult.wideMode and SwipeDirection == Enum.SwipeDirection.Right and p2 == 1 then
			JoinResult.navigateBack()
		end
	end)
	local Count = 0
	
	for _, _ in pairs(JoinResult.participants) do
		Count += 1
	end
	local UseIsChatUserMessagesEnabledModuleResult = UseIsChatUserMessagesEnabledModule()
	local ShouldShowAddFriends = JoinResult.shouldShowAddFriends
	local YOffset = (if ShouldShowAddFriends then Count + 1 else Count) * NewSize
	local NewYOffset = YOffset + 8 * NewSize
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundColor3 = Style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		LayoutOrder = JoinResult.LayoutOrder,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Transparency = Style.Tokens.Color.None.Transparency,
		[ReactModule.Event.TouchSwipe] = UseCallbackResult1,
		Selectable = false
	}, {
		ScrollingContent = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(1, 0, 0, if AppChatDetailsPageAutomaticCanvasSize then 0 else NewYOffset),
			AutomaticCanvasSize = if AppChatDetailsPageAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			LayoutOrder = JoinResult.LayoutOrder,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatGroupHeader = JoinResult.isGroupConversation and ReactModule.createElement(SectionHeaderModule, {
				LayoutOrder = 1,
				marginTop = if UseIsAppChatVerticallyConstrainedModuleResult then config1.ChatGroupHeader.marginTop else 20,
				marginBottom = if UseIsAppChatVerticallyConstrainedModuleResult then config1.ChatGroupHeader.marginBottom else nil,
				Text = JoinResult.chatGroupText,
				style = JoinResult.style
			}),
			GroupNameEntryCell = JoinResult.isGroupConversation and ReactModule.createElement(GroupNameEntryCellModule, {
				LayoutOrder = 2,
				groupNameText = JoinResult.conversationTitle,
				iconImage = Images["icons/actions/edit/edit"],
				isDisabled = JoinResult.shouldHideGroupChatFunctionality or not UseIsChatUserMessagesEnabledModuleResult,
				cellHeight = NewSize,
				paddingBottom = if UseIsAppChatVerticallyConstrainedModuleResult then config1.GroupNameEntryCell.paddingBottom else nil,
				onActivated = OnActivated,
				style = JoinResult.style
			}),
			MembersHeader = ReactModule.createElement(SectionHeaderModule, {
				LayoutOrder = 3,
				marginTop = if UseIsAppChatVerticallyConstrainedModuleResult then config1.MembersHeader.marginTop else 14,
				marginBottom = if UseIsAppChatVerticallyConstrainedModuleResult then config1.MembersHeader.marginBottom else 8,
				Text = JoinResult.membersText,
				style = JoinResult.style
			}),
			MembersFrame = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, YOffset),
				BackgroundColor3 = Style.Theme.BackgroundDefault.Color,
				BackgroundTransparency = Style.Tokens.Color.None.Transparency
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AddFriendsCell = if ShouldShowAddFriends then ReactModule.createElement(AddFriendsEntryModule, {
					LayoutOrder = 1,
					Text = JoinResult.addFriendsText,
					iconImage = Images["icons/actions/edit/add"],
					cellHeight = NewSize,
					onActivated = OnActivated1,
					style = JoinResult.style
				}) else nil,
				ParticipantList = ReactModule.createElement(ParticipantListModule, {
					LayoutOrder = 2,
					childWidth = 120,
					activeParticipantId = JoinResult.activeParticipantId,
					entries = JoinResult.participants,
					entryHeight = NewSize,
					onlinePresenceText = JoinResult.onlinePresenceText,
					offlinePresenceText = JoinResult.offlinePresenceText,
					onEntryActivated = OnEntryActivated
				})
			}),
			LeaveGroupCell = JoinResult.isGroupConversation and ReactModule.createElement(LeaveGroupCellModule, {
				LayoutOrder = 5,
				leaveGroupText = JoinResult.leaveGroupText,
				iconImage = Images["icons/controls/vehicle/exit"],
				cellHeight = NewSize,
				onActivated = OnActivated2,
				style = JoinResult.style,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.chatDetailsListActionButton("leaveGroup") else nil
			}),
			ConversationTypeHeader = if UseIsChatUserMessagesEnabledModuleResult then ReactModule.createElement(SectionHeaderModule, {
				LayoutOrder = 6,
				marginTop = 26,
				Text = JoinResult.conversationTypeHeaderText,
				style = JoinResult.style
			}) else nil,
			ConversationTypeCell = if UseIsChatUserMessagesEnabledModuleResult then ReactModule.createElement(ConversationTypeCellModule, {
				layoutOrder = 7,
				bodyText = JoinResult.conversationTypeText,
				iconImage = Images["icons/actions/info"],
				onIconActivated = JoinResult.onConversationTypeIconActivated,
				shouldShowIcon = JoinResult.shouldShowConversationTypeInfo,
				style = JoinResult.style
			}) else nil,
			CreateUnfilteredChatCell = if UseIsChatUserMessagesEnabledModuleResult and JoinResult.shouldShowCreateUnfilteredChat then ReactModule.createElement(CreateUnfilteredChatCellModule, {
				layoutOrder = 8,
				bodyText = JoinResult.createUnfilteredChatText,
				subTitleText = JoinResult.createUnfilteredChatSubTitleText,
				iconImage = Images["icons/actions/edit/copy"],
				cellHeight = NewSize,
				isLoading = JoinResult.isCreateUnfilteredChatLoading,
				conversationId = JoinResult.conversationId,
				onActivated = UseCallbackResult,
				style = JoinResult.style
			}) else nil
		})
	})
end

return MemoFunction(ChatDetailsPage)