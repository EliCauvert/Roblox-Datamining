local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)

return {
	ChatLanding = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), EnumScreensModule (copy)
		local Navigation = p1.navigation
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 1, 0)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				backButtonDisabled = true,
				headerText = "Chat",
				barHeight = Navigation.getScreenProps("topBarHeight", 0)
			})),
			CreateNewChat = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 90),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "CreateNewChat",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.CreateNewChat)
				end
			}),
			ChatConversation1 = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 150),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "ChatConversation123",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 123 })
				end
			}),
			ChatConversation2 = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 180),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "ChatConversation456",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 456 })
				end
			}),
			EmptyConversation = Navigation.getScreenProps("wideMode", false) and RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 220),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Empty Conv",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy)
					Navigation.navigate("EmptyConversation")
				end
			}),
			Toast = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 280),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = "This is a toast nagivated to by the ChatLanding screen"
							}
						}
					})
				end
			})
		})
	end,
	CreateNewChat = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), EnumScreensModule (copy)
		local Navigation = p1.navigation
		local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 1, 0)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				headerText = "CreateNewChat",
				barHeight = Navigation.getScreenProps("topBarHeight", 0)
			})),
			ChatConversation = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 120),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "ChatConversation123",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: WideModeScreenProps (copy), Navigation (copy), EnumScreensModule (upval)
					if WideModeScreenProps then
						Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 123 })
						
						return
					else
						Navigation.replace(EnumScreensModule.ChatConversation, { conversationId = 123 })
					end
				end
			}),
			Toast = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 250),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = "This is a toast nagivated to by the CreateNewChat screen"
							}
						}
					})
				end
			})
		})
	end,
	EmptyConversation = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy)
		return RoactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			Text = "Empty Conversation page",
			TextSize = 18,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 0, 0),
			Font = Enum.Font.Gotham,
			TextColor3 = Color3.new(0, 0, 0)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				backButtonDisabled = true,
				headerText = "No Title",
				barHeight = p1.navigation.getScreenProps("topBarHeight", 0)
			}))
		})
	end,
	ChatConversation = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), EnumScreensModule (copy)
		local Navigation = p1.navigation
		local ConversationIdParam = Navigation.getParam("conversationId", 0)
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 0, 0)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				backButtonDisabled = Navigation.getScreenProps("wideMode", false),
				barHeight = Navigation.getScreenProps("topBarHeight", 0),
				headerText = "Conversation" .. tostring(ConversationIdParam)
			})),
			ChatDetails = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 120),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "ChatDetails",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.navigate(EnumScreensModule.ChatDetails, { conversationId = ConversationIdParam })
				end
			}),
			Toast = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 180),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = "This is a toast nagivated to by the ChatConversation screen"
							}
						}
					})
				end
			})
		})
	end,
	ChatDetails = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), EnumScreensModule (copy)
		local Navigation = p1.navigation
		local ConversationIdParam = Navigation.getParam("conversationId", 0)
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 1)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				barHeight = Navigation.getScreenProps("topBarHeight", 0),
				headerText = "ChatDetails" .. ConversationIdParam
			})),
			EditChatMembers = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 120),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "EditChatMembers",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.push(EnumScreensModule.EditChatMembers, { conversationId = ConversationIdParam })
				end
			}),
			Toast = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 180),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = {
								toastTitle = "This is a toast nagivated to by the ChatDetails screen"
							}
						}
					})
				end
			})
		})
	end,
	EditChatMembers = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), EnumScreensModule (copy)
		local Navigation = p1.navigation
		local ConversationIdParam = Navigation.getParam("conversationId", 0)
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 1, 1)
		}, {
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				headerText = "EditChatMembers",
				barHeight = Navigation.getScreenProps("topBarHeight", 0)
			})),
			ChatConversation = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 120),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Back To Conversation",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationIdParam })
				end
			}),
			Toast1 = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 180),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = { toastContent = { toastTitle = "A Toast this is" } }
					})
				end
			}),
			Toast2 = RoactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Font = Enum.Font.Gotham,
				Position = UDim2.new(0.5, 0, 0, 210),
				Size = UDim2.new(0, 200, 0, 30),
				Text = "Show a Different Toast",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 18,
				[RoactModule.Event.Activated] = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.RoactChatToast, {
						toastProps = {
							toastContent = { toastTitle = "This is a different toast" }
						}
					})
				end
			})
		})
	end
}