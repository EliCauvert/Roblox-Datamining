local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local t = {
	searchPlaceholder = "Feature.Catalog.Label.Search",
	clear = "Feature.Avatar.Action.Clear"
}

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), reactModule (ref), foundationModule (ref)
	local var3 = useTokens()
	local var4 = useLocalization(t)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge radius-medium",
		testId = "SearchInputView"
	}, {
		BackButton = reactModule.createElement(foundationModule.IconButton, {
			LayoutOrder = 0,
			icon = foundationModule.Enums.IconName.ChevronLargeLeft,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			size = foundationModule.Enums.ButtonSize.Small,
			onActivated = p0.onBack
		}),
		SearchField = reactModule.createElement(foundationModule.View, {
			tag = "fill radius-medium bg-surface-200",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(0, 36)
		}, {
			SearchIcon = reactModule.createElement(foundationModule.Icon, {
				name = foundationModule.Enums.IconName.MagnifyingGlass,
				size = foundationModule.Enums.IconSize.Small,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 12, 0.5, 0)
			}),
			TextBox = reactModule.createElement("TextBox", {
				ref = p0.textBoxRef,
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = false,
				ClipsDescendants = true,
				FontFace = Font.fromEnum(var3.Typography.BodyMedium.Font),
				PlaceholderText = var4.searchPlaceholder,
				PlaceholderColor3 = var3.Color.Content.Default.Color3,
				Position = UDim2.new(0, 40, 0.5, 0),
				Size = UDim2.new(1, -40, 1, 0),
				Text = p0.text,
				TextColor3 = var3.Color.Content.Emphasis.Color3,
				TextSize = var3.Typography.BodyMedium.FontSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = false,
				[reactModule.Change.Text] = p0.onTextChanged,
				[reactModule.Event.FocusLost] = p0.onFocusLost
			})
		}),
		ClearButton = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			text = var4.clear,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			size = foundationModule.Enums.InputSize.XSmall,
			onActivated = p0.onClear
		})
	})
end