local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local colors = styleModule.Colors
local lightTheme = styleModule.Themes.LightTheme
local getTextSize = styleModule.GetTextSize
local useDesignTokens = styleModule.useDesignTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), getTextSize (ref), colors (ref), lightTheme (ref)
	if p1.text and string.len(p1.text) ~= 0 then
		local var1 = useDesignTokens()
		local size200 = var1.Size.Size_200
		local size150 = var1.Size.Size_150
		local font = var1.Typography.HeadingLarge.Font
		local fontSize300 = var1.FontSize.FontSize_300
		local var2 = reactModule.useMemo(function()
			-- upvalues: getTextSize (copy), p1 (ref), fontSize300 (ref), font (ref)
			return getTextSize(p1.text, fontSize300, font, Vector2.new(1e999, 1e999))
		end, { p1.text, fontSize300, font })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 0.1,
			BackgroundColor3 = colors.White,
			Position = p1.Position,
			AnchorPoint = p1.AnchorPoint,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, size150),
				PaddingLeft = UDim.new(0, size200),
				PaddingBottom = UDim.new(0, size150),
				PaddingRight = UDim.new(0, size200)
			}),
			TextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.fromOffset(var2.X, var2.Y),
				Text = p1.text,
				TextColor3 = lightTheme.TextEmphasis.Color3,
				Font = font,
				TextSize = fontSize300,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", {
					MaxSize = p1.maxWidthBinding:map(function(p2)
						-- upvalues: size200 (ref), var2 (ref)
						local var3 = p2 - size200 * 2
						
						return if var3 > 0 then Vector2.new(var3, var2.Y) else nil
					end)
				})
			})
		})
	end
	return nil
end