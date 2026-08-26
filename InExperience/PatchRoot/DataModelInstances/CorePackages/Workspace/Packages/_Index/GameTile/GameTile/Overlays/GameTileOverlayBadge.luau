local parent = script:FindFirstAncestor("GameTile").Parent
local foundationModule = require(parent.Foundation)
local getTextSize = require(parent.Style).GetTextSize
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local reactModule = require(parent.React)
local useTokens = foundationModule.Hooks.useTokens
local t = {}

return reactModule.memo(function(p1)
	-- upvalues: t (ref), useTokens (ref), reactModule (ref), getTextSize (ref), icon (ref), iconSize (ref)
	local icons = p1.icons or t
	local text = p1.text or ""
	local var1 = #icons > 0
	local var2 = #text > 0
	local var3 = useTokens()
	local var4 = if p1.styleOptions then p1.styleOptions.backgroundColorStyle or var3.Color.Extended.White.White_90 else var3.Color.Extended.White.White_90
	local var5 = if p1.styleOptions then p1.styleOptions.contentColorStyle or var3.LightMode.Content.Emphasis else var3.LightMode.Content.Emphasis
	local var6 = if p1.styleOptions then p1.styleOptions.cornerRadius else UDim.new(1, 0)
	local var7 = if var2 or #icons > 1 then var3.Size.Size_200 else var3.Size.Size_150
	local var8 = if p1.styleOptions then p1.styleOptions.verticalPadding or var3.Size.Size_150 else var3.Size.Size_150
	local xSmall = var3.Padding.XSmall
	local titleSmall = var3.Typography.TitleSmall
	local size400 = var3.Size.Size_400
	local var9 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), getTextSize (copy), text (ref), titleSmall (ref)
		return if var2 then getTextSize(text, titleSmall.FontSize, titleSmall.Font, Vector2.new(1e999, 1e999)) else Vector2.new(0, 0)
	end, { text, var2, titleSmall.FontSize, titleSmall.Font })
	
	if not var2 and not var1 then
		return nil
	end
	local t_1 = {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var8),
			PaddingLeft = UDim.new(0, var7),
			PaddingBottom = UDim.new(0, var8),
			PaddingRight = UDim.new(0, var7)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, xSmall)
		})
	}
	local var10 = 0
	
	for i, v in icons do
		t_1[`Icon{i}`] = reactModule.createElement(icon, {
			LayoutOrder = i,
			name = v,
			size = iconSize.Small,
			style = var5
		})
		var10 += size400 + xSmall
	end
	if var2 then
		t_1.BadgeText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = #icons + 1,
			Size = UDim2.fromOffset(var9.X, var9.Y),
			Text = text,
			TextColor3 = var5.Color3,
			Font = titleSmall.Font,
			TextSize = titleSmall.FontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = p1.maxWidthBinding:map(function(p2)
					-- upvalues: var7 (ref), var10 (write)
					local var11 = p2 - 2 * var7 - var10
					
					return if var11 > 0 then Vector2.new(var11, 1e999) else nil
				end)
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundColor3 = var4.Color3,
		BackgroundTransparency = var4.Transparency,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = var6 }),
		BadgeContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, t_1)
	})
end)