local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local EnumScreensModule = require(AppChat.EnumScreens)
local GenericDialogTypeModule = require(AppChat.Components.ChatDetails.Dialogs.GenericDialogType)
local CreateChatTopBarModule = require(AppChat.createChatTopBar)
local ModalBottomSheet = require(Parent.UIBlox).ModalBottomSheet
local Warning = require(AppChat.SocialLibraries).Components.AlertViews.Warning

local function GenericButton(Frame: Frame)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextButton", {
		AnchorPoint = Frame.AnchorPoint or Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.new(1, 1, 1),
		Font = Enum.Font.Gotham,
		LayoutOrder = Frame.LayoutOrder or 1,
		Size = Frame.Size or UDim2.new(0, 200, 0, 30),
		Position = Frame.Position or UDim2.new(0, 0, 0, 0),
		Text = Frame.Text,
		TextColor3 = Color3.new(0, 0, 0),
		TextSize = 18,
		[RoactModule.Event.Activated] = Frame.onActivated
	})
end

return {
	ChatLanding = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), EnumScreensModule (copy)
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
			CreateNewChat = RoactModule.createElement(GenericButton, {
				Text = "CreateNewChat",
				Position = UDim2.new(0.5, 0, 0, 90),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.CreateNewChat)
				end
			}),
			ChatConversation1 = RoactModule.createElement(GenericButton, {
				Text = "ChatConversation123",
				Position = UDim2.new(0.5, 0, 0, 150),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 123 })
				end
			}),
			ChatConversation2 = RoactModule.createElement(GenericButton, {
				Text = "ChatConversation456",
				Position = UDim2.new(0.5, 0, 0, 180),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 456 })
				end
			}),
			EmptyConversation = Navigation.getScreenProps("wideMode", false) and RoactModule.createElement(GenericButton, {
				Text = "Empty Conv",
				Position = UDim2.new(0.5, 0, 0, 220),
				onActivated = function()
					-- upvalues: Navigation (copy)
					Navigation.navigate("EmptyConversation")
				end
			})
		})
	end,
	CreateNewChat = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), EnumScreensModule (copy)
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
			ChatConversation = RoactModule.createElement(GenericButton, {
				Text = "ChatConversation123",
				Position = UDim2.new(0.5, 0, 0, 120),
				onActivated = function()
					-- upvalues: WideModeScreenProps (copy), Navigation (copy), EnumScreensModule (upval)
					if WideModeScreenProps then
						Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = 123 })
						
						return
					else
						Navigation.replace(EnumScreensModule.ChatConversation, { conversationId = 123 })
					end
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
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), EnumScreensModule (copy)
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
			ChatDetails = RoactModule.createElement(GenericButton, {
				Text = "ChatDetails",
				Position = UDim2.new(0.5, 0, 0, 120),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.navigate(EnumScreensModule.ChatDetails, { conversationId = ConversationIdParam })
				end
			})
		})
	end,
	ChatDetails = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), EnumScreensModule (copy)
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
			EditChatMembers = RoactModule.createElement(GenericButton, {
				Text = "EditChatMembers",
				Position = UDim2.new(0.5, 0, 0, 120),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.push(EnumScreensModule.EditChatMembers, { conversationId = ConversationIdParam })
				end
			})
		})
	end,
	EditChatMembers = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), EnumScreensModule (copy)
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
			ChatConversation = RoactModule.createElement(GenericButton, {
				Text = "Back To Conversation",
				Position = UDim2.new(0.5, 0, 0, 120),
				onActivated = function()
					-- upvalues: Navigation (copy), EnumScreensModule (upval), ConversationIdParam (copy)
					Navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = ConversationIdParam })
				end
			})
		})
	end,
	ChatDetailsWithModals = function(p1)
		-- upvalues: RoactModule (copy), CreateChatTopBarModule (copy), CryoModule (copy), GenericButton (copy), GenericDialogTypeModule (copy)
		local Navigation = p1.navigation
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 1)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 10),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatTopBar = CreateChatTopBarModule(CryoModule.Dictionary.join(p1, {
				backButtonDisabled = true,
				headerText = "ChatDetails",
				LayoutOrder = 0,
				barHeight = Navigation.getScreenProps("topBarHeight", 0),
				contentHeight = Navigation.getScreenProps("contentHeight", 0)
			})),
			EditChatGroupName = RoactModule.createElement(GenericButton, {
				LayoutOrder = 1,
				Text = "EditChatGroupName",
				onActivated = function()
					-- upvalues: Navigation (copy), GenericDialogTypeModule (upval)
					Navigation.navigate(GenericDialogTypeModule.EditChatGroupNameDialog)
				end
			}),
			LeaveGroup = RoactModule.createElement(GenericButton, {
				LayoutOrder = 2,
				Text = "LeaveGroup",
				onActivated = function()
					-- upvalues: Navigation (copy), GenericDialogTypeModule (upval)
					Navigation.navigate(GenericDialogTypeModule.LeaveGroupDialog)
				end
			}),
			RemoveUser = RoactModule.createElement(GenericButton, {
				LayoutOrder = 3,
				Text = "RemoveUser",
				onActivated = function()
					-- upvalues: Navigation (copy), GenericDialogTypeModule (upval)
					Navigation.navigate(GenericDialogTypeModule.RemoveUserDialog)
				end
			}),
			ModalBottomSheet = RoactModule.createElement(GenericButton, {
				LayoutOrder = 4,
				Text = "ModalBottomSheet",
				onActivated = function()
					-- upvalues: Navigation (copy), GenericDialogTypeModule (upval)
					Navigation.navigate(GenericDialogTypeModule.ParticipantDialog)
				end
			})
		})
	end,
	EditChatGroupNameDialog = function(p1)
		-- upvalues: RoactModule (copy), Warning (copy)
		return RoactModule.createElement(Warning, {
			titleText = "EditChatGroupName",
			bodyText = "Change to new name?",
			onModalClose = function()
				-- upvalues: p1 (copy)
				p1.navigation.goBack()
			end
		})
	end,
	LeaveGroupDialog = function(p1)
		-- upvalues: RoactModule (copy), Warning (copy)
		return RoactModule.createElement(Warning, {
			titleText = "LeaveGroup",
			bodyText = "Leave group?",
			onModalClose = function()
				-- upvalues: p1 (copy)
				p1.navigation.goBack()
			end
		})
	end,
	ParticipantDialog = function(p1)
		-- upvalues: RoactModule (copy), ModalBottomSheet (copy), GenericDialogTypeModule (copy)
		return RoactModule.createElement(ModalBottomSheet, {
			bottomGap = 10,
			screenWidth = 400,
			showImages = false,
			onDismiss = function()
				-- upvalues: p1 (copy)
				p1.navigation.goBack()
			end,
			buttonModels = {
				{
					text = "ViewProfile",
					onActivated = function()
						-- upvalues: p1 (copy)
						p1.navigation.replace("Webview")
					end
				},
				{
					text = "ReportUser",
					onActivated = function()
						-- upvalues: p1 (copy)
						p1.navigation.replace("Webview")
					end
				},
				{
					text = "RemoveUser",
					onActivated = function()
						-- upvalues: p1 (copy), GenericDialogTypeModule (upval)
						p1.navigation.replace(GenericDialogTypeModule.RemoveUserDialog)
					end
				},
				{
					text = "Cancel",
					onActivated = function() end
				}
			}
		})
	end,
	RemoveUserDialog = function(p1)
		-- upvalues: RoactModule (copy), Warning (copy)
		return RoactModule.createElement(Warning, {
			titleText = "RemoveUser",
			bodyText = "Remove user?",
			onModalClose = function()
				-- upvalues: p1 (copy)
				p1.navigation.goBack()
			end
		})
	end,
	Webview = function(p1)
		-- upvalues: RoactModule (copy), GenericButton (copy)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(0, 0, 1)
		}, {
			BackButton = RoactModule.createElement(GenericButton, {
				Text = "Back",
				AnchorPoint = Vector2.new(0, 0),
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.navigation.goBack()
				end
			})
		})
	end
}