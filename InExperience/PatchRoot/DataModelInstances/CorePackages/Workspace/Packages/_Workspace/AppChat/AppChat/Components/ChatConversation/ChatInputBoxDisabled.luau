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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useCountdownBinding (ref), reactModule (ref), interactable (ref), imageSetLabel (ref), images (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = if var5.contentVerticalAlignment == Enum.VerticalAlignment.Center then Enum.TextYAlignment.Center elseif var5.contentVerticalAlignment == Enum.VerticalAlignment.Bottom then Enum.TextYAlignment.Bottom else Enum.TextYAlignment.Top
	
	return reactModule.createElement(interactable, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Event.Activated] = var5.onActivated
	}, {
		uiListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var6.Gap.Small),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = var5.contentVerticalAlignment,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		disabledText = reactModule.createElement(foundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			tag = "fill",
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 1, 0),
			Text = var5.bodyText,
			Font = var5.font,
			TextSize = var5.contentSize,
			textStyle = var6.Color.System.Alert,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = var7,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		countdownText = if var5.endTimestamp ~= nil then nil else reactModule.createElement(foundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			Text = useCountdownBinding(var5.endTimestamp, var5.defaultCountdownString),
			Font = var5.font,
			TextSize = var5.contentSize,
			textStyle = var6.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = var7
		}),
		icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, var5.contentSize, 0, var5.contentSize),
			ImageColor3 = var6.Color.System.Alert.Color3,
			ImageTransparency = var6.Color.System.Alert.Transparency,
			Image = images["icons/status/error_large"]
		})
	})
end