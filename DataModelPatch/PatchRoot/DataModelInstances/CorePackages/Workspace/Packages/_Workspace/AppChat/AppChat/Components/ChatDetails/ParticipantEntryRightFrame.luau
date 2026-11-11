local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LabelModule = require(AppChat.Components.Label.Label)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local GetFFlagAppChatParticipantDialogFoundationMenuModule = require(AppChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local config = {
	shouldShowDots = false,
	dotsSize = UDim2.new(0, 36, 0, 36),
	image = UIBloxModule.App.ImageSet.Images["icons/common/more"],
	onDotsActivated = function() end
}

function ParticipantEntryRightFrame(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), GetFFlagAppChatParticipantDialogFoundationMenuModule (copy), ReactModule (copy), LabelModule (copy), IconButton (copy), IconName (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), IconSize (copy), ButtonVariant (copy), ImageSetLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local FFlagAppChatParticipantDialogFoundationMenuModule = GetFFlagAppChatParticipantDialogFoundationMenuModule()
	
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
			Dots = if FFlagAppChatParticipantDialogFoundationMenuModule then ReactModule.createElement(IconButton, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				icon = IconName.ThreeDotsHorizontal,
				onActivated = JoinResult.onDotsActivated,
				Position = UDim2.fromScale(0.5, 0.5),
				ref = JoinResult.dotsRef,
				Size = UDim2.new(0, 36, 0, 36),
				testId = if FFlagDebugAppChatEnableDomLocatorsModule then JoinResult.testId else nil,
				size = IconSize.Medium,
				variant = ButtonVariant.Utility
			}) else ReactModule.createElement(ImageSetLabel, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = JoinResult.image,
				ImageColor3 = JoinResult.imageColor3 or Style.Theme.IconEmphasis.Color,
				ImageTransparency = JoinResult.imageTransparency or Style.Theme.IconEmphasis.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(0, 36, 0, 36),
				[ReactModule.Tag] = if FFlagDebugAppChatEnableDomLocatorsModule and p1.testId then `data-testid={p1.testId}` else nil
			})
		}) else nil
	})
end

return MemoFunction(ParticipantEntryRightFrame)