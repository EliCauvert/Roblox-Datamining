local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Colors = require(Parent.Style).Colors
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Colors (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	if p1.text and p1.text ~= "" then
		local LayoutOrder = p1.layoutOrder
		local AnchorPoint = p1.anchorPoint
		local Position = p1.position
		local ZIndex = p1.zIndex
		local BackgroundColor3 = p1.backgroundColor3
		local BackgroundTransparency = p1.backgroundTransparency
		local TextColor3 = p1.textColor3
		local UseTokensResult = UseTokensFunction()
		local Small = UseTokensResult.Padding.Small
		local XSmall = UseTokensResult.Padding.XSmall
		local FontStyle = p1.fontStyle or UseTokensResult.Typography.LabelSmall
		
		return ReactModule.createElement("Frame", {
			[ReactModule.Tag] = "data-testid=--sdui-text-pill",
			BackgroundColor3 = BackgroundColor3 or Colors.White,
			BackgroundTransparency = BackgroundTransparency or 0,
			Position = Position,
			AnchorPoint = AnchorPoint,
			LayoutOrder = LayoutOrder,
			ZIndex = ZIndex,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, XSmall),
				PaddingLeft = UDim.new(0, Small),
				PaddingBottom = UDim.new(0, XSmall),
				PaddingRight = UDim.new(0, Small)
			}),
			TextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.new(0, 0, 0, FontStyle.FontSize * FontStyle.LineHeight),
				AutomaticSize = Enum.AutomaticSize.X,
				Text = p1.text,
				TextColor3 = TextColor3 or UseTokensResult.LightMode.Content.Emphasis.Color3,
				Font = if FoundationFontFaceMigration then nil else FontStyle.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(FontStyle.Font) else nil,
				TextSize = FontStyle.FontSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	else
		return nil
	end
end)