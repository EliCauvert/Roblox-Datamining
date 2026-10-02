local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

return function()
	-- upvalues: useStyle (ref), foundationFontFaceMigration (ref), useTokens (ref), normalizeFontFace (ref), useLocalization (ref), constantsModule (ref), reactModule (ref)
	local var1 = useStyle()
	local var2 = if foundationFontFaceMigration then useTokens() else nil
	local font = var1.Font
	local var3 = useLocalization({ emptyText = constantsModule.Text.EmptyKey })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, constantsModule.DefaultPadding)
		}),
		reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = var3 and var3.emptyText,
			Font = if foundationFontFaceMigration then nil else font.Header1.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Typography.TitleLarge.Font) else nil,
			TextSize = if foundationFontFaceMigration then var2.Typography.TitleLarge.FontSize else font.BaseSize,
			TextColor3 = var1.Theme.TextDefault.Color,
			Size = UDim2.new(1, 0, 0, constantsModule.EmptyNotifications.LabelHeight)
		})
	})
end