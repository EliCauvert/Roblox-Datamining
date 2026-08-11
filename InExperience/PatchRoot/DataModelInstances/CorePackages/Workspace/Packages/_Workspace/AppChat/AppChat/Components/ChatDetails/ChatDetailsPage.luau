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
local t = {
	localUserId = nil,
	conversation = nil,
	conversationId = nil,
	isGroupConversation = false,
	topBarHeight = 0,
	shouldShowCreateUnfilteredChat = false,
	shouldHideGroupChatFunctionality = false,
	shouldShowAddFriends = true,
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
	navigateBack = function() --[[ line: 81 ]] end,
	onGroupNameEntryCellActivated = function(_) --[[ line: 96 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage")
	end,
	onAddFriendsCellActivated = function(_) --[[ line: 99 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage")
	end,
	onLeaveGroupCellActivated = function(_) --[[ line: 102 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage")
	end,
	onParticipantCellActivated = function(_, _) --[[ line: 105 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onParticipantCellActivated was not passed to ChatDetailsPage")
	end,
	onConversationTypeIconActivated = function(_) --[[ line: 108 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage")
	end,
	onCreateUnfilteredChatCellActivated = function(_) --[[ line: 111 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage")
	end,
	style = cryoModule.Dictionary.join(testStyle, {
		Tokens = { Color = { None = {} }, Size = { Size_0 = 0 } }
	})
}

function ChatDetailsPage(p0) --[[ line: 130 ]]
	-- upvalues: cryoModule (ref), t (ref), useTextSizeOffset (ref), useTokens (ref), useIsAppChatVerticallyConstrainedModule (ref), loggerModule (ref), useCallback (ref), useIsChatUserMessagesEnabledModule (ref), reactModule (ref), appChatDetailsPageAutomaticCanvasSize (ref), sectionHeaderModule (ref), groupNameEntryCellModule (ref), images (ref), addFriendsEntryModule (ref), participantListModule (ref), leaveGroupCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), conversationTypeCellModule (ref), createUnfilteredChatCellModule (ref)
	local var17 = cryoModule.Dictionary.join(t, p0)
	local style = var17.style
	local var18 = useTokens().Size.Size_1200 + 2 * useTextSizeOffset()
	local var19 = useIsAppChatVerticallyConstrainedModule()
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
	
	local var21 = function() --[[ line: 153 ]]
		-- upvalues: var17 (ref)
		var17.onGroupNameEntryCellActivated(var17.conversation)
	end
	
	local var22 = function() --[[ line: 157 ]]
		-- upvalues: var17 (ref)
		var17.onAddFriendsCellActivated(var17.conversation)
	end
	
	local var23 = function() --[[ line: 161 ]]
		-- upvalues: var17 (ref)
		var17.onLeaveGroupCellActivated(var17.conversation)
	end
	
	local var24 = function(p1, p2) --[[ line: 165 ]]
		-- upvalues: loggerModule (copy), var17 (ref)
		loggerModule:info("onParticipantCellActivated: {}", p1.id)
		
		if p1.isLocalUser then
			return
		end
		var17.onParticipantCellActivated(p1.id, p2)
	end
	
	local var25 = useCallback(function() --[[ line: 174 ]]
		-- upvalues: var17 (ref)
		var17.onCreateUnfilteredChatCellActivated(var17.conversation)
	end, { var17.conversation })
	local var26 = useCallback(function(_, p3, p4) --[[ line: 179 ]]
		-- upvalues: var17 (ref)
		if not var17.wideMode and p3 == Enum.SwipeDirection.Right and p4 == 1 then
			var17.navigateBack()
		end
	end)
	local var27 = 0
	
	for i, v in pairs(var17.participants) do
		var27 += 1
	end
	local var28 = useIsChatUserMessagesEnabledModule()
	local shouldShowAddFriends = var17.shouldShowAddFriends
	local var29 = (if shouldShowAddFriends then var27 + 1 else var27) * var18
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		LayoutOrder = var17.LayoutOrder,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Transparency = style.Tokens.Color.None.Transparency,
		[reactModule.Event.TouchSwipe] = var26,
		Selectable = false
	}, {
		ScrollingContent = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(1, 0, 0, if appChatDetailsPageAutomaticCanvasSize then 0 else var29 + 8 * var18),
			AutomaticCanvasSize = if appChatDetailsPageAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			LayoutOrder = var17.LayoutOrder,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatGroupHeader = var17.isGroupConversation and reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 1,
				marginTop = if var19 then t_1.ChatGroupHeader.marginTop else 20,
				marginBottom = if var19 then t_1.ChatGroupHeader.marginBottom else nil,
				Text = var17.chatGroupText,
				style = var17.style
			}),
			GroupNameEntryCell = var17.isGroupConversation and reactModule.createElement(groupNameEntryCellModule, {
				LayoutOrder = 2,
				groupNameText = var17.conversationTitle,
				iconImage = images["icons/actions/edit/edit"],
				isDisabled = var17.shouldHideGroupChatFunctionality or not var28,
				cellHeight = var18,
				paddingBottom = if var19 then t_1.GroupNameEntryCell.paddingBottom else nil,
				onActivated = var21,
				style = var17.style
			}),
			MembersHeader = reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 3,
				marginTop = if var19 then t_1.MembersHeader.marginTop else 14,
				marginBottom = if var19 then t_1.MembersHeader.marginBottom else 8,
				Text = var17.membersText,
				style = var17.style
			}),
			MembersFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, var29),
				BackgroundColor3 = style.Theme.BackgroundDefault.Color,
				BackgroundTransparency = style.Tokens.Color.None.Transparency
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AddFriendsCell = if shouldShowAddFriends then reactModule.createElement(addFriendsEntryModule, {
					LayoutOrder = 1,
					Text = var17.addFriendsText,
					iconImage = images["icons/actions/edit/add"],
					cellHeight = var18,
					onActivated = var22,
					style = var17.style
				}) else nil,
				ParticipantList = reactModule.createElement(participantListModule, {
					LayoutOrder = 2,
					childWidth = 120,
					activeParticipantId = var17.activeParticipantId,
					entries = var17.participants,
					entryHeight = var18,
					onlinePresenceText = var17.onlinePresenceText,
					offlinePresenceText = var17.offlinePresenceText,
					onEntryActivated = var24
				})
			}),
			LeaveGroupCell = var17.isGroupConversation and reactModule.createElement(leaveGroupCellModule, {
				LayoutOrder = 5,
				leaveGroupText = var17.leaveGroupText,
				iconImage = images["icons/controls/vehicle/exit"],
				cellHeight = var18,
				onActivated = var23,
				style = var17.style,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton("leaveGroup") else nil
			}),
			ConversationTypeHeader = if var28 then reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 6,
				marginTop = 26,
				Text = var17.conversationTypeHeaderText,
				style = var17.style
			}) else nil,
			ConversationTypeCell = if var28 then reactModule.createElement(conversationTypeCellModule, {
				layoutOrder = 7,
				bodyText = var17.conversationTypeText,
				iconImage = images["icons/actions/info"],
				onIconActivated = var17.onConversationTypeIconActivated,
				style = var17.style
			}) else nil,
			CreateUnfilteredChatCell = if var28 and var17.shouldShowCreateUnfilteredChat then reactModule.createElement(createUnfilteredChatCellModule, {
				layoutOrder = 8,
				bodyText = var17.createUnfilteredChatText,
				subTitleText = var17.createUnfilteredChatSubTitleText,
				iconImage = images["icons/actions/edit/copy"],
				cellHeight = var18,
				isLoading = var17.isCreateUnfilteredChatLoading,
				conversationId = var17.conversationId,
				onActivated = var25,
				style = var17.style
			}) else nil
		})
	})
end

return memo(ChatDetailsPage)