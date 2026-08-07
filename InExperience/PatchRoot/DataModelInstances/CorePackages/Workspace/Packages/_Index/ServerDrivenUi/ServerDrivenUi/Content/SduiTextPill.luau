local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local colors = require(parent.Style).Colors
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0) --[[ line: 23 | named "SduiTextPill" ]]
	-- upvalues: useTokens (ref), reactModule (ref), colors (ref)
	if p0.text and p0.text ~= "" then
		local layoutOrder = p0.layoutOrder
		local anchorPoint = p0.anchorPoint
		local position = p0.position
		local zIndex = p0.zIndex
		local backgroundColor3 = p0.backgroundColor3
		local backgroundTransparency = p0.backgroundTransparency
		local textColor3 = p0.textColor3
		local var2 = useTokens()
		local small = var2.Padding.Small
		local xSmall = var2.Padding.XSmall
		local fontStyle = p0.fontStyle or var2.Typography.LabelSmall
		
		return reactModule.createElement("Frame", {
			[reactModule.Tag] = "data-testid=--sdui-text-pill",
			BackgroundColor3 = backgroundColor3 or colors.White,
			BackgroundTransparency = backgroundTransparency or 0,
			Position = position,
			AnchorPoint = anchorPoint,
			LayoutOrder = layoutOrder,
			ZIndex = zIndex,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, xSmall),
				PaddingLeft = UDim.new(0, small),
				PaddingBottom = UDim.new(0, xSmall),
				PaddingRight = UDim.new(0, small)
			}),
			TextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.new(0, 0, 0, fontStyle.FontSize * fontStyle.LineHeight),
				AutomaticSize = Enum.AutomaticSize.X,
				Text = p0.text,
				TextColor3 = textColor3 or var2.LightMode.Content.Emphasis.Color3,
				Font = fontStyle.Font,
				TextSize = fontStyle.FontSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	end
	return nil
end)