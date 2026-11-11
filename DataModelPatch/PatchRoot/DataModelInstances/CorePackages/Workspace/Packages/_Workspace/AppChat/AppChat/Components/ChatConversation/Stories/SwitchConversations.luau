local AppChat = script:FindFirstAncestor("AppChat")
local RoactModule = require(AppChat.Parent.Roact)
local ChatConversationModule = require(AppChat.Components.ChatConversation.ChatConversation)
local Story = RoactModule.PureComponent:extend("Story")
local CreateMockMessagesModule = require(AppChat.Tests.Utils.createMockMessages)

function Story.init(p1)
	-- upvalues: CreateMockMessagesModule (copy)
	p1.conversation1 = {
		id = "CONVERSATION_ONE",
		itemList = CreateMockMessagesModule({ messageIdPrefix = "CONVERSATION_ONE", read = true }, 50)
	}
	p1.conversation2 = {
		id = "CONVERSATION_TWO",
		itemList = CreateMockMessagesModule({ messageIdPrefix = "CONVERSATION_TWO", read = true }, 40)
	}
	
	function p1.makeChatNotVisible()
		-- upvalues: p1 (copy)
		p1:setState({ chatIsVisible = false })
	end
	
	function p1.switchConversations()
		-- upvalues: p1 (copy)
		p1:setState({
			conversation = p1.state.conversation.id == "CONVERSATION_ONE" and p1.conversation2 or p1.conversation1
		})
	end
	
	function p1.switchUnreadStatus()
		-- upvalues: p1 (copy)
		p1:setState({
			readingMessagesIsEnabled = not p1.state.readingMessagesIsEnabled
		})
	end
	
	p1.state = {
		conversation = p1.conversation1,
		readingMessagesIsEnabled = p1.props.initialReadingMessagesIsEnabled,
		chatIsVisible = p1.props.initialChatIsVisible or true
	}
end

function Story.render(p1)
	-- upvalues: RoactModule (copy), ChatConversationModule (copy)
	return RoactModule.createFragment({
		layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		chatConversation = RoactModule.createElement(ChatConversationModule, {
			itemList = p1.state.conversation.itemList,
			conversationId = p1.state.conversation.id,
			markConversationAsRead = p1.props.markConversationAsRead or function() end,
			readingMessagesIsEnabled = p1.state.readingMessagesIsEnabled,
			chatIsVisible = p1.state.chatIsVisible,
			replyingToMessageDispatch = p1.props.replyingToMessageDispatch or function() end
		}),
		makeChatNotVisibleButton = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0, 120, 0, 50),
			Text = "Make Chat Not Visible",
			[RoactModule.Event.Activated] = p1.makeChatNotVisible
		}),
		switchConversationButton = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0, 120, 0, 50),
			Text = "Switch Conversations",
			[RoactModule.Event.Activated] = p1.switchConversations
		}),
		toggleReadState = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0, 120, 0, 50),
			Text = "Toggle UnreadStatus",
			[RoactModule.Event.Activated] = p1.switchUnreadStatus
		})
	})
end

return function(p1)
	-- upvalues: RoactModule (copy), Story (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BackgroundColor3 = Color3.fromRGB(244, 244, 244),
		Size = UDim2.new(0, 512, 0, 300)
	}, { ChatConversation = RoactModule.createElement(Story, p1) })
end