local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return function()
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), NormalizeFontFaceFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local UseStyleResultFont = UseStyleResult.Font
	local UseLocalizationResult = UseLocalizationFunction({ emptyText = ConstantsModule.Text.EmptyKey })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, ConstantsModule.DefaultPadding)
		}),
		ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = UseLocalizationResult and UseLocalizationResult.emptyText,
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Header1.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.TitleLarge.Font) else nil,
			TextSize = if FoundationFontFaceMigration then UseTokensResult.Typography.TitleLarge.FontSize else UseStyleResultFont.BaseSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			Size = UDim2.new(1, 0, 0, ConstantsModule.EmptyNotifications.LabelHeight)
		})
	})
end