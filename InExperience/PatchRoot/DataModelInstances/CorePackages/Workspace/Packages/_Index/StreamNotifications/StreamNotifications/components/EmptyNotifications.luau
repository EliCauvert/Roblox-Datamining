local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FFlagLuaAppAddTestIdsForArrow = require(Parent.SharedFlags).FFlagLuaAppAddTestIdsForArrow

return function()
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), NormalizeFontFaceFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), FFlagLuaAppAddTestIdsForArrow (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	local NormalizeFontFaceResult = NormalizeFontFaceFunction(UseTokensResult.Typography.TitleLarge.Font)
	local FontSize = UseTokensResult.Typography.TitleLarge.FontSize
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
			Text = UseLocalizationResult and UseLocalizationResult.emptyText,
			LayoutOrder = 2,
			FontFace = NormalizeFontFaceResult,
			TextSize = FontSize,
			BackgroundTransparency = 1,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			Size = UDim2.new(1, 0, 0, ConstantsModule.EmptyNotifications.LabelHeight),
			[ReactModule.Tag] = if FFlagLuaAppAddTestIdsForArrow then "data-testid=--stream-notifications-empty-text" else nil
		})
	})
end