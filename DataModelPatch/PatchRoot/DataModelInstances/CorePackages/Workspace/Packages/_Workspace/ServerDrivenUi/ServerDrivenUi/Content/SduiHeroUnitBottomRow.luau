local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagLuaAppAlignHeroUnitBottomRowCtaButton = require(Parent.SharedFlags).FFlagLuaAppAlignHeroUnitBottomRowCtaButton

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagLuaAppAlignHeroUnitBottomRowCtaButton (copy)
	local LayoutOrder = p1.layoutOrder
	local ZIndex = p1.zIndex
	local Position = p1.position
	local UseTokensResult = UseTokensFunction()
	local BodySmall = UseTokensResult.Typography.BodySmall
	local GrayColor3 = UseTokensResult.Color.Extended.Gray.Gray_400.Color3
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		Position = Position,
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			ItemLineAlignment = if FFlagLuaAppAlignHeroUnitBottomRowCtaButton then Enum.ItemLineAlignment.Automatic else Enum.ItemLineAlignment.Center
		}),
		CTAButtonContainer = if FFlagLuaAppAlignHeroUnitBottomRowCtaButton then p1.ctaButton else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, { ButtonContent = p1.ctaButton }),
		LabelContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Label = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), BodySmall (copy), GrayColor3 (copy)
				return if p1.rightLabelContent then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}, { Content = p1.rightLabelContent }) elseif p1.labelText and p1.labelText ~= "" then ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, BodySmall.FontSize * BodySmall.LineHeight),
					Text = p1.labelText,
					TextSize = BodySmall.FontSize,
					Font = BodySmall.Font,
					TextColor3 = GrayColor3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}) else nil
			end, {
				p1.rightLabelContent,
				p1.labelText,
				BodySmall,
				GrayColor3
			})
		})
	})
end)