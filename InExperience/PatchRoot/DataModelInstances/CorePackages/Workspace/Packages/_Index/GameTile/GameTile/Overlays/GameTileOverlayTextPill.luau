local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local styleModule = require(parent.Style)
local colors = styleModule.Colors
local lightTheme = styleModule.Themes.LightTheme
local getTextSize = styleModule.GetTextSize
local useDesignTokens = styleModule.useDesignTokens

return function(p0) --[[ line: 21 | named "GameTileOverlayTextPill" ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), getTextSize (ref), colors (ref), lightTheme (ref)
	if p0.text and string.len(p0.text) ~= 0 then
		local var2 = useDesignTokens()
		local var3 = if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_200 else var2.Global.Space_100
		local var4 = if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_150 else var2.Global.Space_75
		local var5 = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.HeadingLarge.Font else var2.Semantic.Typography.Title.Font
		local var6 = if fFlagRenameDeprecatedUIBloxTokens then var2.FontSize.FontSize_300 else var2.Semantic.Typography.CaptionHeader.FontSize
		local var7 = reactModule.useMemo(function() --[[ line: 46 ]]
			-- upvalues: getTextSize (copy), p0 (ref), var6 (ref), var5 (ref)
			return getTextSize(p0.text, var6, var5, Vector2.new(1e999, 1e999))
		end, { p0.text, var6, var5 })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 0.1,
			BackgroundColor3 = colors.White,
			Position = p0.Position,
			AnchorPoint = p0.AnchorPoint,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var4),
				PaddingLeft = UDim.new(0, var3),
				PaddingBottom = UDim.new(0, var4),
				PaddingRight = UDim.new(0, var3)
			}),
			TextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.fromOffset(var7.X, var7.Y),
				Text = p0.text,
				TextColor3 = lightTheme.TextEmphasis.Color3,
				Font = var5,
				TextSize = var6,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = reactModule.createElement("UISizeConstraint", {
					MaxSize = p0.maxWidthBinding:map(function(p1) --[[ line: 79 ]]
						-- upvalues: var3 (ref), var7 (ref)
						local var8 = p1 - var3 * 2
						
						return if var8 > 0 then Vector2.new(var8, var7.Y) else nil
					end)
				})
			})
		})
	end
	return nil
end