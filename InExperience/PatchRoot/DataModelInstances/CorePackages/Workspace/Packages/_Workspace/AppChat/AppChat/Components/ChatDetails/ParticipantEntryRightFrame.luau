local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local memo = reactModule.memo
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local labelModule = require(appChat.Components.Label.Label)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local getFFlagAppChatParticipantDialogFoundationMenuModule = require(appChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local t = {
	shouldShowDots = false,
	dotsSize = UDim2.new(0, 36, 0, 36),
	image = images["icons/common/more"],
	onDotsActivated = function() --[[ line: 42 ]] end
}

function ParticipantEntryRightFrame(p0) --[[ line: 48 ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), labelModule (ref), iconButton (ref), iconName (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), iconSize (ref), buttonVariant (ref), imageSetLabel (ref)
	local var15
	local var9 = cryoModule.Dictionary.join(t, p0)
	local style = var9.style or useStyle()
	local var11 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local createElement = reactModule.createElement
	local var12 = "Frame"
	local t_1 = {
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		[reactModule.Change.AbsoluteSize] = var9[reactModule.Change.AbsoluteSize]
	}
	local t_2 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 22),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 22),
			PaddingRight = UDim.new(0, 22)
		}),
		label = if var9.labelText then reactModule.createElement(labelModule, {
			layoutOrder = 1,
			backgroundColor3 = style.Theme.BackgroundContrast.Color,
			backgroundTransparency = style.Theme.BackgroundContrast.Transparency,
			bodyText = var9.labelText
		}) else nil
	}
	
	if var9.shouldShowDots then
		local var19
		var15 = reactModule.createElement
		local var16 = "Frame"
		local t_3 = {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Name = "dots",
			Size = UDim2.new(0, 20, 1, 0)
		}
		local t_4 = {}
		
		if var11 then
			var19 = reactModule.createElement(iconButton, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				icon = iconName.ThreeDotsHorizontal,
				onActivated = var9.onDotsActivated,
				Position = UDim2.fromScale(0.5, 0.5),
				ref = var9.dotsRef,
				Size = UDim2.new(0, 36, 0, 36),
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then var9.testId else nil,
				size = iconSize.Medium,
				variant = buttonVariant.Utility
			})
		else
			var19 = reactModule.createElement
			var19 = var19(imageSetLabel, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = var9.image,
				ImageColor3 = var9.imageColor3 or style.Theme.IconEmphasis.Color,
				ImageTransparency = var9.imageTransparency or style.Theme.IconEmphasis.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(0, 36, 0, 36),
				[reactModule.Tag] = if fFlagDebugAppChatEnableDomLocatorsModule and p0.testId then `data-testid={p0.testId}` else nil
			})
		end
		t_4.Dots = var19
		var15 = var15(var16, t_3, t_4)
	else
		var15 = nil
	end
	t_2.dots = var15
	
	return createElement(var12, t_1, t_2)
end

return memo(ParticipantEntryRightFrame)