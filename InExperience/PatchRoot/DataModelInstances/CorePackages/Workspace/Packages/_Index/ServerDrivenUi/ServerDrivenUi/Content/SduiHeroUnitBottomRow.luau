local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagLuaAppAlignHeroUnitBottomRowCtaButton = require(parent.SharedFlags).FFlagLuaAppAlignHeroUnitBottomRowCtaButton

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagLuaAppAlignHeroUnitBottomRowCtaButton (ref)
	local layoutOrder = p1.layoutOrder
	local zIndex = p1.zIndex
	local position = p1.position
	local var1 = useTokens()
	local bodySmall = var1.Typography.BodySmall
	local color3 = var1.Color.Extended.Gray.Gray_400.Color3
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, var1.Size.Size_1000),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Position = position,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			ItemLineAlignment = if fFlagLuaAppAlignHeroUnitBottomRowCtaButton then Enum.ItemLineAlignment.Automatic else Enum.ItemLineAlignment.Center
		}),
		CTAButtonContainer = if fFlagLuaAppAlignHeroUnitBottomRowCtaButton then p1.ctaButton else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, { ButtonContent = p1.ctaButton }),
		LabelContainer = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Label = reactModule.useMemo(function()
				-- upvalues: p1 (ref), reactModule (copy), bodySmall (ref), color3 (ref)
				return if p1.rightLabelContent then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}, { Content = p1.rightLabelContent }) elseif p1.labelText and p1.labelText ~= "" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, bodySmall.FontSize * bodySmall.LineHeight),
					Text = p1.labelText,
					TextSize = bodySmall.FontSize,
					Font = bodySmall.Font,
					TextColor3 = color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}) else nil
			end, { p1.rightLabelContent, p1.labelText, bodySmall, color3 })
		})
	})
end)