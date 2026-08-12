local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local loggerModule = require(script.Parent.Logger)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local memo = reactModule.memo
local images = require(parent.UIBlox).App.ImageSet.Images
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local useTokens = require(parent.Foundation).Hooks.useTokens
local sectionHeaderModule = require(script.Parent.SectionHeader)
local groupNameEntryCellModule = require(script.Parent.GroupNameEntryCell)
local addFriendsEntryModule = require(script.Parent.AddFriendsEntry)
local participantListModule = require(script.Parent.ParticipantList)
local leaveGroupCellModule = require(script.Parent.LeaveGroupCell)
local testStyle = require(appChat.SocialLibraries).Components.TestStyle
local conversationTypeCellModule = require(script.Parent.UnfilteredThreads.ConversationTypeCell)
local createUnfilteredChatCellModule = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell)
local useIsAppChatVerticallyConstrainedModule = require(appChat.App.Hooks.useIsAppChatVerticallyConstrained)
local appChatDetailsPageAutomaticCanvasSize = game:DefineFastFlag("AppChatDetailsPageAutomaticCanvasSize", false)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local fFlagHideConversationTypeInfoIfNoWebViewModule = require(appChat.Flags.FFlagHideConversationTypeInfoIfNoWebView)
local t = {
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
	navigateBack = function() --[[ line: 84 ]] end,
	onGroupNameEntryCellActivated = function(_) --[[ line: 99 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage")
	end,
	onAddFriendsCellActivated = function(_) --[[ line: 102 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage")
	end,
	onLeaveGroupCellActivated = function(_) --[[ line: 105 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage")
	end,
	onParticipantCellActivated = function(_, _) --[[ line: 108 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onParticipantCellActivated was not passed to ChatDetailsPage")
	end,
	onConversationTypeIconActivated = function(_) --[[ line: 111 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage")
	end,
	onCreateUnfilteredChatCellActivated = function(_) --[[ line: 114 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage")
	end,
	style = cryoModule.Dictionary.join(testStyle, {
		Tokens = { Color = { None = {} }, Size = { Size_0 = 0 } }
	})
}

function ChatDetailsPage(p0) --[[ line: 133 ]]
	-- upvalues: cryoModule (ref), t (ref), useTextSizeOffset (ref), useTokens (ref), useIsAppChatVerticallyConstrainedModule (ref), loggerModule (ref), useCallback (ref), useIsChatUserMessagesEnabledModule (ref), reactModule (ref), appChatDetailsPageAutomaticCanvasSize (ref), sectionHeaderModule (ref), groupNameEntryCellModule (ref), images (ref), addFriendsEntryModule (ref), participantListModule (ref), leaveGroupCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), conversationTypeCellModule (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), createUnfilteredChatCellModule (ref)
	local var18 = cryoModule.Dictionary.join(t, p0)
	local style = var18.style
	local var19 = useTokens().Size.Size_1200 + 2 * useTextSizeOffset()
	local var20 = useIsAppChatVerticallyConstrainedModule()
	local t_1 = {
		ChatGroupHeader = {
			marginTop = style.Tokens.Size.Size_0,
			marginBottom = style.Tokens.Size.Size_0
		},
		MembersHeader = {
			marginTop = style.Tokens.Size.Size_0,
			marginBottom = style.Tokens.Size.Size_0
		},
		GroupNameEntryCell = { paddingBottom = style.Tokens.Size.Size_0 }
	}
	
	local var22 = function() --[[ line: 156 ]]
		-- upvalues: var18 (ref)
		var18.onGroupNameEntryCellActivated(var18.conversation)
	end
	
	local var23 = function() --[[ line: 160 ]]
		-- upvalues: var18 (ref)
		var18.onAddFriendsCellActivated(var18.conversation)
	end
	
	local var24 = function() --[[ line: 164 ]]
		-- upvalues: var18 (ref)
		var18.onLeaveGroupCellActivated(var18.conversation)
	end
	
	local var25 = function(p1, p2) --[[ line: 168 ]]
		-- upvalues: loggerModule (copy), var18 (ref)
		loggerModule:info("onParticipantCellActivated: {}", p1.id)
		
		if p1.isLocalUser then
			return
		end
		var18.onParticipantCellActivated(p1.id, p2)
	end
	
	local var26 = useCallback(function() --[[ line: 177 ]]
		-- upvalues: var18 (ref)
		var18.onCreateUnfilteredChatCellActivated(var18.conversation)
	end, { var18.conversation })
	local var27 = useCallback(function(_, p3, p4) --[[ line: 182 ]]
		-- upvalues: var18 (ref)
		if not var18.wideMode and p3 == Enum.SwipeDirection.Right and p4 == 1 then
			var18.navigateBack()
		end
	end)
	local var28 = 0
	
	for i, v in pairs(var18.participants) do
		var28 += 1
	end
	local var29 = useIsChatUserMessagesEnabledModule()
	local shouldShowAddFriends = var18.shouldShowAddFriends
	local var30 = (if shouldShowAddFriends then var28 + 1 else var28) * var19
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		LayoutOrder = var18.LayoutOrder,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Transparency = style.Tokens.Color.None.Transparency,
		[reactModule.Event.TouchSwipe] = var27,
		Selectable = false
	}, {
		ScrollingContent = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(1, 0, 0, if appChatDetailsPageAutomaticCanvasSize then 0 else var30 + 8 * var19),
			AutomaticCanvasSize = if appChatDetailsPageAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			LayoutOrder = var18.LayoutOrder,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatGroupHeader = var18.isGroupConversation and reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 1,
				marginTop = if var20 then t_1.ChatGroupHeader.marginTop else 20,
				marginBottom = if var20 then t_1.ChatGroupHeader.marginBottom else nil,
				Text = var18.chatGroupText,
				style = var18.style
			}),
			GroupNameEntryCell = var18.isGroupConversation and reactModule.createElement(groupNameEntryCellModule, {
				LayoutOrder = 2,
				groupNameText = var18.conversationTitle,
				iconImage = images["icons/actions/edit/edit"],
				isDisabled = var18.shouldHideGroupChatFunctionality or not var29,
				cellHeight = var19,
				paddingBottom = if var20 then t_1.GroupNameEntryCell.paddingBottom else nil,
				onActivated = var22,
				style = var18.style
			}),
			MembersHeader = reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 3,
				marginTop = if var20 then t_1.MembersHeader.marginTop else 14,
				marginBottom = if var20 then t_1.MembersHeader.marginBottom else 8,
				Text = var18.membersText,
				style = var18.style
			}),
			MembersFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, var30),
				BackgroundColor3 = style.Theme.BackgroundDefault.Color,
				BackgroundTransparency = style.Tokens.Color.None.Transparency
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AddFriendsCell = if shouldShowAddFriends then reactModule.createElement(addFriendsEntryModule, {
					LayoutOrder = 1,
					Text = var18.addFriendsText,
					iconImage = images["icons/actions/edit/add"],
					cellHeight = var19,
					onActivated = var23,
					style = var18.style
				}) else nil,
				ParticipantList = reactModule.createElement(participantListModule, {
					LayoutOrder = 2,
					childWidth = 120,
					activeParticipantId = var18.activeParticipantId,
					entries = var18.participants,
					entryHeight = var19,
					onlinePresenceText = var18.onlinePresenceText,
					offlinePresenceText = var18.offlinePresenceText,
					onEntryActivated = var25
				})
			}),
			LeaveGroupCell = var18.isGroupConversation and reactModule.createElement(leaveGroupCellModule, {
				LayoutOrder = 5,
				leaveGroupText = var18.leaveGroupText,
				iconImage = images["icons/controls/vehicle/exit"],
				cellHeight = var19,
				onActivated = var24,
				style = var18.style,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton("leaveGroup") else nil
			}),
			ConversationTypeHeader = if var29 then reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 6,
				marginTop = 26,
				Text = var18.conversationTypeHeaderText,
				style = var18.style
			}) else nil,
			ConversationTypeCell = if var29 then reactModule.createElement(conversationTypeCellModule, {
				layoutOrder = 7,
				bodyText = var18.conversationTypeText,
				iconImage = images["icons/actions/info"],
				onIconActivated = var18.onConversationTypeIconActivated,
				shouldShowIcon = if fFlagHideConversationTypeInfoIfNoWebViewModule then var18.shouldShowConversationTypeInfo else nil,
				style = var18.style
			}) else nil,
			CreateUnfilteredChatCell = if var29 and var18.shouldShowCreateUnfilteredChat then reactModule.createElement(createUnfilteredChatCellModule, {
				layoutOrder = 8,
				bodyText = var18.createUnfilteredChatText,
				subTitleText = var18.createUnfilteredChatSubTitleText,
				iconImage = images["icons/actions/edit/copy"],
				cellHeight = var19,
				isLoading = var18.isCreateUnfilteredChatLoading,
				conversationId = var18.conversationId,
				onActivated = var26,
				style = var18.style
			}) else nil
		})
	})
end

return memo(ChatDetailsPage)