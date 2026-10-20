local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local StyleModule = require(Parent.Style)
local Colors = StyleModule.Colors
local LightTheme = StyleModule.Themes.LightTheme
local GetTextSizeFunction = StyleModule.GetTextSize
local UseDesignTokensFunction = StyleModule.useDesignTokens

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), GetTextSizeFunction (copy), Colors (copy), LightTheme (copy)
	if Frame.text and string.len(Frame.text) ~= 0 then
		local UseDesignTokensResult = UseDesignTokensFunction()
		local Size200 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100
		local Size150 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_150 else UseDesignTokensResult.Global.Space_75
		local HeadingLargeFont = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingLarge.Font else UseDesignTokensResult.Semantic.Typography.Title.Font
		local FontSize300 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.FontSize.FontSize_300 else UseDesignTokensResult.Semantic.Typography.CaptionHeader.FontSize
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: GetTextSizeFunction (upval), Frame (copy), FontSize300 (copy), HeadingLargeFont (copy)
			return GetTextSizeFunction(Frame.text, FontSize300, HeadingLargeFont, Vector2.new(1e999, 1e999))
		end, { Frame.text, FontSize300, HeadingLargeFont })
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.1,
			BackgroundColor3 = Colors.White,
			Position = Frame.Position,
			AnchorPoint = Frame.AnchorPoint,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Size150),
				PaddingLeft = UDim.new(0, Size200),
				PaddingBottom = UDim.new(0, Size150),
				PaddingRight = UDim.new(0, Size200)
			}),
			TextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.fromOffset(UseMemoResult.X, UseMemoResult.Y),
				Text = Frame.text,
				TextColor3 = LightTheme.TextEmphasis.Color3,
				Font = HeadingLargeFont,
				TextSize = FontSize300,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Frame.maxWidthBinding:map(function(p1)
						-- upvalues: Size200 (copy), UseMemoResult (copy)
						local X = p1 - Size200 * 2
						
						return if X > 0 then Vector2.new(X, UseMemoResult.Y) else nil
					end)
				})
			})
		})
	else
		return nil
	end
end