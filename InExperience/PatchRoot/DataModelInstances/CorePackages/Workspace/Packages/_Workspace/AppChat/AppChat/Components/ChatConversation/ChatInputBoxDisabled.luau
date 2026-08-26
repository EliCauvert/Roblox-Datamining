local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useCountdownBinding = require(parent.InterventionShared).Hooks.useCountdownBinding
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local t = {
	bodyText = "Chat Disabled",
	defaultCountdownString = "",
	onActivated = function() end,
	contentVerticalAlignment = Enum.VerticalAlignment.Top
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useCountdownBinding (ref), reactModule (ref), interactable (ref), imageSetLabel (ref), images (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = if var1.contentVerticalAlignment == Enum.VerticalAlignment.Center then Enum.TextYAlignment.Center elseif var1.contentVerticalAlignment == Enum.VerticalAlignment.Bottom then Enum.TextYAlignment.Bottom else Enum.TextYAlignment.Top
	
	return reactModule.createElement(interactable, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Event.Activated] = var1.onActivated
	}, {
		uiListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var2.Gap.Small),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = var1.contentVerticalAlignment,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		disabledText = reactModule.createElement(foundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			tag = "fill",
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 1, 0),
			Text = var1.bodyText,
			Font = var1.font,
			TextSize = var1.contentSize,
			textStyle = var2.Color.System.Alert,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = var3,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		countdownText = if var1.endTimestamp ~= nil then nil else reactModule.createElement(foundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			Text = useCountdownBinding(var1.endTimestamp, var1.defaultCountdownString),
			Font = var1.font,
			TextSize = var1.contentSize,
			textStyle = var2.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = var3
		}),
		icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, var1.contentSize, 0, var1.contentSize),
			ImageColor3 = var2.Color.System.Alert.Color3,
			ImageTransparency = var2.Color.System.Alert.Transparency,
			Image = images["icons/status/error_large"]
		})
	})
end