local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local colors = styleModule.Colors
local lightTheme = styleModule.Themes.LightTheme
local getTextSize = styleModule.GetTextSize
local useDesignTokens = styleModule.useDesignTokens

return function(p0) --[[ line: 19 | named "GameTileOverlayTextPill" ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), getTextSize (ref), colors (ref), lightTheme (ref)
	if p0.text and string.len(p0.text) ~= 0 then
		local var2 = useDesignTokens()
		local size200 = var2.Size.Size_200
		local size150 = var2.Size.Size_150
		local font = var2.Typography.HeadingLarge.Font
		local fontSize300 = var2.FontSize.FontSize_300
		local var3 = reactModule.useMemo(function() --[[ line: 32 ]]
			-- upvalues: getTextSize (copy), p0 (ref), fontSize300 (ref), font (ref)
			return getTextSize(p0.text, fontSize300, font, Vector2.new(1e999, 1e999))
		end, { p0.text, fontSize300, font })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 0.1,
			BackgroundColor3 = colors.White,
			Position = p0.Position,
			AnchorPoint = p0.AnchorPoint,
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
				Size = UDim2.fromOffset(var3.X, var3.Y),
				Text = p0.text,
				TextColor3 = lightTheme.TextEmphasis.Color3,
				Font = font,
				TextSize = fontSize300,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", {
					MaxSize = p0.maxWidthBinding:map(function(p1) --[[ line: 65 ]]
						-- upvalues: size200 (ref), var3 (ref)
						local var4 = p1 - size200 * 2
						
						return if var4 > 0 then Vector2.new(var4, var3.Y) else nil
					end)
				})
			})
		})
	end
	return nil
end