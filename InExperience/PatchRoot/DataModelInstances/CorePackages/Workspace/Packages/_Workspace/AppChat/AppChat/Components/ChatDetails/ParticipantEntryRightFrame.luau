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
	onDotsActivated = function() end
}

function ParticipantEntryRightFrame(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), labelModule (ref), iconButton (ref), iconName (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), iconSize (ref), buttonVariant (ref), imageSetLabel (ref)
	local var1
	local var2 = cryoModule.Dictionary.join(t, p1)
	local style = var2.style or useStyle()
	local var3 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local createElement = reactModule.createElement
	local var4 = "Frame"
	local t_1 = {
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		[reactModule.Change.AbsoluteSize] = var2[reactModule.Change.AbsoluteSize]
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
		label = if var2.labelText then reactModule.createElement(labelModule, {
			layoutOrder = 1,
			backgroundColor3 = style.Theme.BackgroundContrast.Color,
			backgroundTransparency = style.Theme.BackgroundContrast.Transparency,
			bodyText = var2.labelText
		}) else nil
	}
	
	if var2.shouldShowDots then
		local var5
		var1 = reactModule.createElement
		local var6 = "Frame"
		local t_3 = {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Name = "dots",
			Size = UDim2.new(0, 20, 1, 0)
		}
		local t_4 = {}
		
		if var3 then
			var5 = reactModule.createElement(iconButton, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				icon = iconName.ThreeDotsHorizontal,
				onActivated = var2.onDotsActivated,
				Position = UDim2.fromScale(0.5, 0.5),
				ref = var2.dotsRef,
				Size = UDim2.new(0, 36, 0, 36),
				testId = if fFlagDebugAppChatEnableDomLocatorsModule then var2.testId else nil,
				size = iconSize.Medium,
				variant = buttonVariant.Utility
			})
		else
			var5 = reactModule.createElement
			var5 = var5(imageSetLabel, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Image = var2.image,
				ImageColor3 = var2.imageColor3 or style.Theme.IconEmphasis.Color,
				ImageTransparency = var2.imageTransparency or style.Theme.IconEmphasis.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(0, 36, 0, 36),
				[reactModule.Tag] = if fFlagDebugAppChatEnableDomLocatorsModule and p1.testId then `data-testid={p1.testId}` else nil
			})
		end
		t_4.Dots = var5
		var1 = var1(var6, t_3, t_4)
	else
		var1 = nil
	end
	t_2.dots = var1
	
	return createElement(var4, t_1, t_2)
end

return memo(ParticipantEntryRightFrame)