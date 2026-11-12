local Parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(Parent.UIBlox)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ResponsiveModule = require(Parent.Responsive)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Core = UIBloxModule.Core
local App = UIBloxModule.App
local UseStyleFunction = Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagSduiComponentsUseFoundationTokens = require(Parent.SharedFlags).FFlagSduiComponentsUseFoundationTokens
local Button = UIBloxModule.App.Button.Button
local IconButton = App.Button.IconButton
local IconSize = App.ImageSet.Enum.IconSize
local ImageSetLabel = Core.ImageSet.ImageSetLabel
local GetIconSizeFunction = App.ImageSet.getIconSize
local IconsNavigationClose = App.ImageSet.Images["icons/navigation/close"]

return function(p1)
	-- upvalues: FFlagSduiComponentsUseFoundationTokens (copy), UseTokensFunction (copy), UseStyleFunction (copy), GetIconSizeFunction (copy), IconSize (copy), ReactModule (copy), ResponsiveModule (copy), ImageSetLabel (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Button (copy), CryoModule (copy), IconButton (copy), IconsNavigationClose (copy)
	local UseTokensResult = if FFlagSduiComponentsUseFoundationTokens then UseTokensFunction() else UseStyleFunction().Tokens
	local UseRefResult = ReactModule.useRef(nil)
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = p1.backgroundTransparency or UseTokensResult.Color.Surface.Surface_300.Transparency,
		BackgroundColor3 = p1.backgroundColor3 or UseTokensResult.Color.Surface.Surface_300.Color3,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		ref = UseRefResult
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ContainerRef = ReactModule.createElement(ResponsiveModule.ContainerRef.Provider, { value = UseRefResult }, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 12),
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			UILayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 12)
			}),
			HorizontalContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UILayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = if UseBreakpointXOrSmallerResult then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center
				}),
				Icon = if p1.iconImage then ReactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					Selectable = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(36, 36),
					Image = p1.iconImage,
					ImageColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
					ImageTransparency = UseTokensResult.Color.Content.Emphasis.Transparency
				}) else nil,
				MiddleFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -((if p1.iconImage then 36 else 0) + (if p1.onDismiss then GetIconSizeFunction(IconSize.Small) else 0)), 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UILayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
					}),
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 8),
						PaddingRight = UDim.new(0, 12)
					}),
					Text = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
						TextLayout = ReactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						UIPadding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
						Title = ReactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							TextScaled = false,
							Text = p1.titleMessage,
							TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
							TextTransparency = UseTokensResult.Color.Content.Emphasis.Transparency,
							TextSize = UseTokensResult.Typography.CaptionLarge.FontSize,
							Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.CaptionLarge.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							LineHeight = UseTokensResult.LineHeight.LineHeight_140
						}),
						Subline = if p1.sublineMessage then ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							TextScaled = false,
							LineHeight = 1,
							Text = p1.sublineMessage,
							TextColor3 = UseTokensResult.Color.Content.Default.Color3,
							TextTransparency = UseTokensResult.Color.Content.Default.Transparency,
							TextSize = UseTokensResult.Typography.BodySmall.FontSize,
							Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.BodySmall.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}) else nil
					}),
					Button = if UseBreakpointXOrSmallerResult or not p1.buttonProps then nil else ReactModule.createElement(Button, CryoModule.Dictionary.join({
						layoutOrder = 2,
						size = UDim2.new(0, 0, 0, 0),
						automaticSize = Enum.AutomaticSize.XY
					}, p1.buttonProps))
				}),
				DismissButtonFrame = if p1.onDismiss then ReactModule.createElement(IconButton, {
					backgroundTransparency = 1,
					layoutOrder = 3,
					icon = IconsNavigationClose,
					iconSize = IconSize.Small,
					size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
					onActivated = p1.onDismiss
				}) else nil
			}),
			Button = if UseBreakpointXOrSmallerResult and p1.buttonProps then ReactModule.createElement(Button, CryoModule.Dictionary.join({
				fitContent = false,
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.XY
			}, p1.buttonProps)) else nil
		})
	})
end