local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	searchPlaceholder = "Feature.Catalog.Label.Search",
	clear = "Feature.Avatar.Action.Clear"
}

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge radius-medium",
		testId = "SearchInputView"
	}, {
		BackButton = ReactModule.createElement(FoundationModule.IconButton, {
			LayoutOrder = 0,
			icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.ButtonSize.Small,
			onActivated = p1.onBack
		}),
		SearchField = ReactModule.createElement(FoundationModule.View, {
			tag = "fill radius-medium bg-surface-200",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(0, 36)
		}, {
			SearchIcon = ReactModule.createElement(FoundationModule.Icon, {
				name = FoundationModule.Enums.IconName.MagnifyingGlass,
				size = FoundationModule.Enums.IconSize.Small,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 12, 0.5, 0)
			}),
			TextBox = ReactModule.createElement("TextBox", {
				ref = p1.textBoxRef,
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				ClipsDescendants = true,
				FontFace = Font.fromEnum(UseTokensResult.Typography.BodyMedium.Font),
				PlaceholderText = UseLocalizationResult.searchPlaceholder,
				PlaceholderColor3 = UseTokensResult.Color.Content.Default.Color3,
				Position = UDim2.new(0, 40, 0.5, 0),
				Size = UDim2.new(1, -40, 1, 0),
				Text = p1.text,
				TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
				TextSize = UseTokensResult.Typography.BodyMedium.FontSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = false,
				[ReactModule.Change.Text] = p1.onTextChanged,
				[ReactModule.Event.FocusLost] = p1.onFocusLost
			})
		}),
		ClearButton = ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 2,
			text = UseLocalizationResult.clear,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.InputSize.XSmall,
			onActivated = p1.onClear
		})
	})
end