local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseCountdownBindingFunction = require(Parent.InterventionShared).Hooks.useCountdownBinding
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local config = {
	bodyText = "Chat Disabled",
	defaultCountdownString = "",
	onActivated = function() --[[ Line: 28 ]] end,
	contentVerticalAlignment = Enum.VerticalAlignment.Top
}

return function(p1) --[[ Line: 32 | Named "ChatInputBoxDisabled" ]]
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseCountdownBindingFunction (copy), ReactModule (copy), Interactable (copy), FoundationFontFaceMigration (copy), ImageSetLabel (copy), Images (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseCountdownBindingResult = UseCountdownBindingFunction(UnionResult.endTimestamp, UnionResult.defaultCountdownString)
	local Center = if UnionResult.contentVerticalAlignment == Enum.VerticalAlignment.Center then Enum.TextYAlignment.Center elseif UnionResult.contentVerticalAlignment == Enum.VerticalAlignment.Bottom then Enum.TextYAlignment.Bottom else Enum.TextYAlignment.Top
	
	return ReactModule.createElement(Interactable, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[ReactModule.Event.Activated] = UnionResult.onActivated
	}, {
		uiListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = UnionResult.contentVerticalAlignment,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		disabledText = ReactModule.createElement(FoundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			tag = "fill",
			LayoutOrder = 1,
			Size = UDim2.new(0, 0, 1, 0),
			Text = UnionResult.bodyText,
			Font = if FoundationFontFaceMigration then nil else UnionResult.font,
			fontStyle = if FoundationFontFaceMigration then CryoModule.Dictionary.join(UseTokensResult.Typography.BodyLarge, { FontSize = UnionResult.contentSize }) else nil,
			TextSize = UnionResult.contentSize,
			textStyle = UseTokensResult.Color.System.Alert,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		countdownText = if UnionResult.endTimestamp == nil then nil else ReactModule.createElement(FoundationModule.Text, {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			Text = UseCountdownBindingResult,
			Font = if FoundationFontFaceMigration then nil else UnionResult.font,
			fontStyle = if FoundationFontFaceMigration then CryoModule.Dictionary.join(UseTokensResult.Typography.BodyLarge, { FontSize = UnionResult.contentSize }) else nil,
			TextSize = UnionResult.contentSize,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Center
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