local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local LabelModule = require(AppChat.Components.Label.Label)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local config = {
	shouldShowDots = false,
	onDotsActivated = function() end
}

function ParticipantEntryRightFrame(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), LabelModule (copy), IconButton (copy), IconName (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), IconSize (copy), ButtonVariant (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		[ReactModule.Change.AbsoluteSize] = JoinResult[ReactModule.Change.AbsoluteSize]
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 22),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 22),
			PaddingRight = UDim.new(0, 22)
		}),
		label = if JoinResult.labelText then ReactModule.createElement(LabelModule, {
			layoutOrder = 1,
			backgroundColor3 = Style.Theme.BackgroundContrast.Color,
			backgroundTransparency = Style.Theme.BackgroundContrast.Transparency,
			bodyText = JoinResult.labelText
		}) else nil,
		dots = if JoinResult.shouldShowDots then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Name = "dots",
			Size = UDim2.new(0, 20, 1, 0)
		}, {
			Dots = ReactModule.createElement(IconButton, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				icon = IconName.ThreeDotsHorizontal,
				onActivated = JoinResult.onDotsActivated,
				Position = UDim2.fromScale(0.5, 0.5),
				ref = JoinResult.dotsRef,
				Size = UDim2.new(0, 36, 0, 36),
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then JoinResult.testId else nil,
				size = IconSize.Medium,
				variant = ButtonVariant.Utility
			})
		}) else nil
	})
end

return MemoFunction(ParticipantEntryRightFrame)