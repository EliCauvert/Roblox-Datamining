local DependenciesModule = require(script:FindFirstAncestor("ShareTargetGame").dependencies)
local Roact = DependenciesModule.Roact
local Text = DependenciesModule.Text
local UIBlox = DependenciesModule.UIBlox
local ConversationCellModule = require(game:GetService("CorePackages").Workspace.Packages.AppChat.ConversationCell)
local SendButtonModule = require(script.Parent.SendButton)

return function(Frame)
	-- upvalues: UIBlox (copy), Text (copy), Roact (copy), ConversationCellModule (copy), SendButtonModule (copy)
	local FailedText = Frame.failedText or ""
	local SendingText = Frame.sendingText or ""
	local SendText = Frame.sendText or ""
	local SentText = Frame.sentText or ""
	local IsLoading = Frame.isLoading or false
	local Conversation = Frame.conversation
	local OnSendButtonActivatedFunction = Frame.onSendButtonActivated
	
	return UIBlox.Style.withStyle(function(Style)
		-- upvalues: Text (upval), SendText (copy), Roact (upval), Frame (copy), ConversationCellModule (upval), Conversation (copy), IsLoading (copy), SendButtonModule (upval), SentText (copy), SendingText (copy), FailedText (copy), OnSendButtonActivatedFunction (copy)
		local StyleFont = Style.Font
		
		return Roact.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = Style.Theme.BackgroundUIDefault.Transparency,
			BackgroundColor3 = Style.Theme.BackgroundUIDefault.Color,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = Frame.Visible,
			LayoutOrder = Frame.LayoutOrder
		}, {
			content = Roact.createElement(ConversationCellModule, {
				style = Style,
				conversation = Conversation,
				subTitleText = Frame.subTitleText,
				secondaryTitleText = Frame.secondaryTitleText,
				childWidth = Text.GetTextWidth(SendText, StyleFont.CaptionBody.Font, StyleFont.CaptionBody.RelativeSize * StyleFont.BaseSize) + 14 + 24 + 12,
				Size = UDim2.new(1, 0, 1, 0),
				isLoading = IsLoading
			}, {
				rightAlignedComponent = Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					padding = Roact.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
					layout = Roact.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					sendButton = Roact.createElement(SendButtonModule, {
						sendText = SendText,
						sentText = SentText,
						sendingText = SendingText,
						sentStatus = Frame.sentStatus,
						failedText = FailedText,
						isLoading = IsLoading,
						conversation = Conversation,
						onActivated = function()
							-- upvalues: OnSendButtonActivatedFunction (upval), Conversation (upval)
							return OnSendButtonActivatedFunction(Conversation)
						end
					})
				})
			})
		})
	end)
end