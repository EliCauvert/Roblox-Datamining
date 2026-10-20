local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseCountdownBindingFunction = require(Parent.InterventionShared).Hooks.useCountdownBinding
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local config = {
	bodyText = "Chat Disabled",
	defaultCountdownString = "",
	onActivated = function() end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseCountdownBindingFunction (copy), ReactModule (copy), Interactable (copy), ImageSetLabel (copy), Images (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCountdownBindingResult = UseCountdownBindingFunction(UnionResult.endTimestamp, UnionResult.defaultCountdownString)
	
	return ReactModule.createElement(Interactable, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[ReactModule.Event.Activated] = UnionResult.onActivated
	}, {
		uiListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		disabledText = ReactModule.createElement(FoundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			tag = "fill",
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 1, 0),
			Text = UnionResult.bodyText,
			Font = UnionResult.font,
			TextSize = UnionResult.contentSize,
			textStyle = UseTokensResult.Color.System.Alert,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		countdownText = if UnionResult.endTimestamp == nil then nil else ReactModule.createElement(FoundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			Text = UseCountdownBindingResult,
			Font = UnionResult.font,
			TextSize = UnionResult.contentSize,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top
		}),
		icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, UnionResult.contentSize, 0, UnionResult.contentSize),
			ImageColor3 = UseTokensResult.Color.System.Alert.Color3,
			ImageTransparency = UseTokensResult.Color.System.Alert.Transparency,
			Image = Images["icons/status/error_large"]
		})
	})
end