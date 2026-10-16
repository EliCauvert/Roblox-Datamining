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
	navigateBack = function() end,
	onGroupNameEntryCellActivated = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage")
	end,
	onAddFriendsCellActivated = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage")
	end,
	onLeaveGroupCellActivated = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage")
	end,
	onParticipantCellActivated = function(_, _)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onParticipantCellActivated was not passed to ChatDetailsPage")
	end,
	onConversationTypeIconActivated = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage")
	end,
	onCreateUnfilteredChatCellActivated = function(_)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage")
	end,
	style = cryoModule.Dictionary.join(testStyle, {
		Tokens = { Color = { None = {} }, Size = { Size_0 = 0 } }
	})
}

function ChatDetailsPage(p1)
	-- upvalues: cryoModule (ref), t (ref), useTextSizeOffset (ref), useTokens (ref), useIsAppChatVerticallyConstrainedModule (ref), loggerModule (ref), useCallback (ref), useIsChatUserMessagesEnabledModule (ref), reactModule (ref), appChatDetailsPageAutomaticCanvasSize (ref), sectionHeaderModule (ref), groupNameEntryCellModule (ref), images (ref), addFriendsEntryModule (ref), participantListModule (ref), leaveGroupCellModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), conversationTypeCellModule (ref), fFlagHideConversationTypeInfoIfNoWebViewModule (ref), createUnfilteredChatCellModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style
	local var2 = useTokens().Size.Size_1200 + 2 * useTextSizeOffset()
	local var3 = useIsAppChatVerticallyConstrainedModule()
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
	
	local var4 = function()
		-- upvalues: var1 (ref)
		var1.onGroupNameEntryCellActivated(var1.conversation)
	end
	
	local var5 = function()
		-- upvalues: var1 (ref)
		var1.onAddFriendsCellActivated(var1.conversation)
	end
	
	local var6 = function()
		-- upvalues: var1 (ref)
		var1.onLeaveGroupCellActivated(var1.conversation)
	end
	
	local var7 = function(p2, p3)
		-- upvalues: loggerModule (copy), var1 (ref)
		loggerModule:info("onParticipantCellActivated: {}", p2.id)
		
		if p2.isLocalUser then
			return
		end
		var1.onParticipantCellActivated(p2.id, p3)
	end
	
	local var8 = useCallback(function()
		-- upvalues: var1 (ref)
		var1.onCreateUnfilteredChatCellActivated(var1.conversation)
	end, { var1.conversation })
	local var9 = useCallback(function(_, p2, p3)
		-- upvalues: var1 (ref)
		if not var1.wideMode and p2 == Enum.SwipeDirection.Right and p3 == 1 then
			var1.navigateBack()
		end
	end)
	local var10 = 0
	
	for i, v in pairs(var1.participants) do
		var10 += 1
	end
	local var11 = useIsChatUserMessagesEnabledModule()
	local shouldShowAddFriends = var1.shouldShowAddFriends
	local var12 = (if shouldShowAddFriends then var10 + 1 else var10) * var2
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		LayoutOrder = var1.LayoutOrder,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Transparency = style.Tokens.Color.None.Transparency,
		[reactModule.Event.TouchSwipe] = var9,
		Selectable = false
	}, {
		ScrollingContent = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(1, 0, 0, if appChatDetailsPageAutomaticCanvasSize then 0 else var12 + 8 * var2),
			AutomaticCanvasSize = if appChatDetailsPageAutomaticCanvasSize then Enum.AutomaticSize.Y else nil,
			LayoutOrder = var1.LayoutOrder,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatGroupHeader = var1.isGroupConversation and reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 1,
				marginTop = if var3 then t_1.ChatGroupHeader.marginTop else 20,
				marginBottom = if var3 then t_1.ChatGroupHeader.marginBottom else nil,
				Text = var1.chatGroupText,
				style = var1.style
			}),
			GroupNameEntryCell = var1.isGroupConversation and reactModule.createElement(groupNameEntryCellModule, {
				LayoutOrder = 2,
				groupNameText = var1.conversationTitle,
				iconImage = images["icons/actions/edit/edit"],
				isDisabled = var1.shouldHideGroupChatFunctionality or not var11,
				cellHeight = var2,
				paddingBottom = if var3 then t_1.GroupNameEntryCell.paddingBottom else nil,
				onActivated = var4,
				style = var1.style
			}),
			MembersHeader = reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 3,
				marginTop = if var3 then t_1.MembersHeader.marginTop else 14,
				marginBottom = if var3 then t_1.MembersHeader.marginBottom else 8,
				Text = var1.membersText,
				style = var1.style
			}),
			MembersFrame = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, var12),
				BackgroundColor3 = style.Theme.BackgroundDefault.Color,
				BackgroundTransparency = style.Tokens.Color.None.Transparency
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AddFriendsCell = if shouldShowAddFriends then reactModule.createElement(addFriendsEntryModule, {
					LayoutOrder = 1,
					Text = var1.addFriendsText,
					iconImage = images["icons/actions/edit/add"],
					cellHeight = var2,
					onActivated = var5,
					style = var1.style
				}) else nil,
				ParticipantList = reactModule.createElement(participantListModule, {
					LayoutOrder = 2,
					childWidth = 120,
					activeParticipantId = var1.activeParticipantId,
					entries = var1.participants,
					entryHeight = var2,
					onlinePresenceText = var1.onlinePresenceText,
					offlinePresenceText = var1.offlinePresenceText,
					onEntryActivated = var7
				})
			}),
			LeaveGroupCell = var1.isGroupConversation and reactModule.createElement(leaveGroupCellModule, {
				LayoutOrder = 5,
				leaveGroupText = var1.leaveGroupText,
				iconImage = images["icons/controls/vehicle/exit"],
				cellHeight = var2,
				onActivated = var6,
				style = var1.style,
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.chatDetailsListActionButton("leaveGroup") else nil
			}),
			ConversationTypeHeader = if var11 then reactModule.createElement(sectionHeaderModule, {
				LayoutOrder = 6,
				marginTop = 26,
				Text = var1.conversationTypeHeaderText,
				style = var1.style
			}) else nil,
			ConversationTypeCell = if var11 then reactModule.createElement(conversationTypeCellModule, {
				layoutOrder = 7,
				bodyText = var1.conversationTypeText,
				iconImage = images["icons/actions/info"],
				onIconActivated = var1.onConversationTypeIconActivated,
				shouldShowIcon = if fFlagHideConversationTypeInfoIfNoWebViewModule then var1.shouldShowConversationTypeInfo else nil,
				style = var1.style
			}) else nil,
			CreateUnfilteredChatCell = if var11 and var1.shouldShowCreateUnfilteredChat then reactModule.createElement(createUnfilteredChatCellModule, {
				layoutOrder = 8,
				bodyText = var1.createUnfilteredChatText,
				subTitleText = var1.createUnfilteredChatSubTitleText,
				iconImage = images["icons/actions/edit/copy"],
				cellHeight = var2,
				isLoading = var1.isCreateUnfilteredChatLoading,
				conversationId = var1.conversationId,
				onActivated = var8,
				style = var1.style
			}) else nil
		})
	})
end

return memo(ChatDetailsPage)