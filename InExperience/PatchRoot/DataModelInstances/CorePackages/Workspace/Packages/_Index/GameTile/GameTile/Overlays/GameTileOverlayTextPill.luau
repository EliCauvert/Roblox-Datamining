local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local StyleModule = require(Parent.Style)
local Colors = StyleModule.Colors
local LightTheme = StyleModule.Themes.LightTheme
local GetTextSizeFunction = StyleModule.GetTextSize
local UseDesignTokensFunction = StyleModule.useDesignTokens

return function(Frame) --[[ Line: 22 | Named "GameTileOverlayTextPill" ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), GetTextSizeFunction (copy), Colors (copy), LightTheme (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	if Frame.text and string.len(Frame.text) ~= 0 then
		local UseDesignTokensResult = UseDesignTokensFunction()
		local Size200 = UseDesignTokensResult.Size.Size_200
		local Size150 = UseDesignTokensResult.Size.Size_150
		local HeadingLargeFont = UseDesignTokensResult.Typography.HeadingLarge.Font
		local FontSize300 = UseDesignTokensResult.FontSize.FontSize_300
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 35 ]]
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
				Font = if FoundationFontFaceMigration then nil else HeadingLargeFont,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(HeadingLargeFont) else nil,
				TextSize = FontSize300,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = Frame.maxWidthBinding:map(function(p1) --[[ Line: 69 ]]
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