local Parent = script:FindFirstAncestor("GameTile").Parent
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local ReactModule = require(Parent.React)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseTokensFunction = FoundationModule.Hooks.useTokens
local t = {}

return ReactModule.memo(function(Frame)
	-- upvalues: t (copy), UseTokensFunction (copy), ReactModule (copy), GetTextSizeFunction (copy), Icon (copy), IconSize (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local Icons = Frame.icons or t
	local Text = Frame.text or ""
	local v1 = #Icons > 0
	local v2 = #Text > 0
	local UseTokensResult = UseTokensFunction()
	local BackgroundColorStyle = Frame.styleOptions and Frame.styleOptions.backgroundColorStyle or UseTokensResult.Color.Extended.White.White_90
	local ContentColorStyle = Frame.styleOptions and Frame.styleOptions.contentColorStyle or UseTokensResult.LightMode.Content.Emphasis
	local CornerRadius = Frame.styleOptions and Frame.styleOptions.cornerRadius or UDim.new(1, 0)
	local Size200 = if v2 or #Icons > 1 then UseTokensResult.Size.Size_200 else UseTokensResult.Size.Size_150
	local VerticalPadding = Frame.styleOptions and Frame.styleOptions.verticalPadding or UseTokensResult.Size.Size_150
	local XSmall = UseTokensResult.Padding.XSmall
	local TitleSmall = UseTokensResult.Typography.TitleSmall
	local Size400 = UseTokensResult.Size.Size_400
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: v2 (copy), GetTextSizeFunction (upval), Text (copy), TitleSmall (copy)
		return if v2 then GetTextSizeFunction(Text, TitleSmall.FontSize, TitleSmall.Font, Vector2.new(1e999, 1e999)) else Vector2.new(0, 0)
	end, { Text, v2, TitleSmall.FontSize, TitleSmall.Font })
	
	if not v2 and not v1 then
		return nil
	end
	local config = {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, VerticalPadding),
			PaddingLeft = UDim.new(0, Size200),
			PaddingBottom = UDim.new(0, VerticalPadding),
			PaddingRight = UDim.new(0, Size200)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, XSmall)
		})
	}
	local Total = 0
	
	for LayoutOrder, icon in Icons do
		config[`Icon{LayoutOrder}`] = ReactModule.createElement(Icon, {
			LayoutOrder = LayoutOrder,
			name = icon,
			size = IconSize.Small,
			style = ContentColorStyle
		})
		Total += Size400 + XSmall
	end
	if v2 then
		config.BadgeText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = #Icons + 1,
			Size = UDim2.fromOffset(UseMemoResult.X, UseMemoResult.Y),
			Text = Text,
			TextColor3 = ContentColorStyle.Color3,
			Font = if FoundationFontFaceMigration then nil else TitleSmall.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleSmall.Font) else nil,
			TextSize = TitleSmall.FontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Frame.maxWidthBinding:map(function(p1)
					-- upvalues: Size200 (copy), Total (ref)
					local SizeDelta = p1 - 2 * Size200 - Total
					
					return if SizeDelta > 0 then Vector2.new(SizeDelta, 1e999) else nil
				end)
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = BackgroundColorStyle.Color3,
		BackgroundTransparency = BackgroundColorStyle.Transparency,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = CornerRadius }),
		BadgeContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, config)
	})
end)