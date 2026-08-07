local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagLuaAppAlignHeroUnitBottomRowCtaButton = require(parent.SharedFlags).FFlagLuaAppAlignHeroUnitBottomRowCtaButton

return reactModule.memo(function(p0) --[[ line: 27 | named "SduiHeroUnitBottomRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), fFlagLuaAppAlignHeroUnitBottomRowCtaButton (ref)
	local layoutOrder = p0.layoutOrder
	local zIndex = p0.zIndex
	local position = p0.position
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
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			ItemLineAlignment = if fFlagLuaAppAlignHeroUnitBottomRowCtaButton then Enum.ItemLineAlignment.Automatic else Enum.ItemLineAlignment.Center
		}),
		CTAButtonContainer = if fFlagLuaAppAlignHeroUnitBottomRowCtaButton then p0.ctaButton else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, { ButtonContent = p0.ctaButton }),
		LabelContainer = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Label = reactModule.useMemo(function() --[[ line: 36 ]]
				-- upvalues: p0 (ref), reactModule (copy), bodySmall (ref), color3 (ref)
				return if p0.rightLabelContent then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}, { Content = p0.rightLabelContent }) elseif p0.labelText and p0.labelText ~= "" then reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, bodySmall.FontSize * bodySmall.LineHeight),
					Text = p0.labelText,
					TextSize = bodySmall.FontSize,
					Font = bodySmall.Font,
					TextColor3 = color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				}) else nil
			end, { p0.rightLabelContent, p0.labelText, bodySmall, color3 })
		})
	})
end)