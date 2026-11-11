local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local EventServiceModule = require(AccountRecovery.Analytics.EventService)

local function _()
	-- upvalues: UserInputService (copy), GuiService (copy)
	local FocusedTextBox = UserInputService:GetFocusedTextBox()
	
	if FocusedTextBox then
		FocusedTextBox:ReleaseFocus()
	end
	if GuiService.SelectedObject ~= nil then
		GuiService.SelectedObject = nil
	end
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy), UserInputService (copy), GuiService (copy), EventServiceModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		BackButton = if Frame.onBackActivated then ReactModule.createElement(IconButton, {
			icon = "icons/actions/cycleLeft",
			size = InputSize.Medium,
			variant = ButtonVariant.Utility,
			Position = UDim2.new(0, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			onActivated = function()
				-- upvalues: UserInputService (upval), GuiService (upval), EventServiceModule (upval), Frame (copy)
				local FocusedTextBox = UserInputService:GetFocusedTextBox()
				
				if FocusedTextBox then
					FocusedTextBox:ReleaseFocus()
				end
				if GuiService.SelectedObject ~= nil then
					GuiService.SelectedObject = nil
				end
				EventServiceModule.sendBackButtonClickedEvent(Frame.recoverySessionId or "", Frame.currentComponent or "")
				Frame.onBackActivated()
			end,
			isDisabled = Frame.backButtonDisabled or false
		}) else nil,
		RecoveryHeadingText = ReactModule.createElement(Text, {
			Text = Frame.recoveryHeadingText,
			Size = UDim2.new(1, 0, 1, 0),
			fontStyle = UseTokensResult.Typography.HeadingSmall,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end