local parent = script:FindFirstAncestor("GameTile").Parent
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local t = {}

return reactModule.memo(function(p0)
	-- upvalues: t (ref), useTokens (ref), reactModule (ref), getTextSize (ref), icon (ref), iconSize (ref)
	local icons = p0.icons or t
	local text = p0.text or ""
	local var5 = #icons > 0
	local var6 = #text > 0
	local var7 = useTokens()
	local var8 = if p0.styleOptions then p0.styleOptions.backgroundColorStyle or var7.Color.Extended.White.White_90 else var7.Color.Extended.White.White_90
	local var9 = if p0.styleOptions then p0.styleOptions.contentColorStyle or var7.LightMode.Content.Emphasis else var7.LightMode.Content.Emphasis
	local var10 = if p0.styleOptions then p0.styleOptions.cornerRadius else UDim.new(1, 0)
	local var11 = if var6 or #icons > 1 then var7.Size.Size_200 else var7.Size.Size_150
	local var12 = if p0.styleOptions then p0.styleOptions.verticalPadding or var7.Size.Size_150 else var7.Size.Size_150
	local xSmall = var7.Padding.XSmall
	local titleSmall = var7.Typography.TitleSmall
	local size400 = var7.Size.Size_400
	local var13 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), getTextSize (copy), text (ref), titleSmall (ref)
		return if var6 then getTextSize(text, titleSmall.FontSize, titleSmall.Font, Vector2.new(1e999, 1e999)) else Vector2.new(0, 0)
	end, { text, var6, titleSmall.FontSize, titleSmall.Font })
	
	if not var6 and not var5 then
		return nil
	end
	local t_1 = {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var12),
			PaddingLeft = UDim.new(0, var11),
			PaddingBottom = UDim.new(0, var12),
			PaddingRight = UDim.new(0, var11)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, xSmall)
		})
	}
	local var15 = 0
	
	for i, v in icons do
		t_1[`Icon{i}`] = reactModule.createElement(icon, {
			LayoutOrder = i,
			name = v,
			size = iconSize.Small,
			style = var9
		})
		var15 += size400 + xSmall
	end
	if var6 then
		t_1.BadgeText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = #icons + 1,
			Size = UDim2.fromOffset(var13.X, var13.Y),
			Text = text,
			TextColor3 = var9.Color3,
			Font = titleSmall.Font,
			TextSize = titleSmall.FontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = p0.maxWidthBinding:map(function(p1)
					-- upvalues: var11 (ref), var15 (write)
					local var16 = p1 - 2 * var11 - var15
					
					return if var16 > 0 then Vector2.new(var16, 1e999) else nil
				end)
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundColor3 = var8.Color3,
		BackgroundTransparency = var8.Transparency,
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = var10 }),
		BadgeContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, t_1)
	})
end)