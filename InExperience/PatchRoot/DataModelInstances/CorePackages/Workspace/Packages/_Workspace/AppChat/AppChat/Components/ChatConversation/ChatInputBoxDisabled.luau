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
	onActivated = function() --[[ line: 26 ]] end
}

return function(p0) --[[ line: 29 | named "ChatInputBoxDisabled" ]]
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useCountdownBinding (ref), reactModule (ref), interactable (ref), imageSetLabel (ref), images (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	local var6 = foundationModule.Hooks.useTokens()
	
	return reactModule.createElement(interactable, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[reactModule.Event.Activated] = var5.onActivated
	}, {
		uiListLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var6.Gap.Small),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
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
			TextYAlignment = Enum.TextYAlignment.Top,
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
			TextYAlignment = Enum.TextYAlignment.Top
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