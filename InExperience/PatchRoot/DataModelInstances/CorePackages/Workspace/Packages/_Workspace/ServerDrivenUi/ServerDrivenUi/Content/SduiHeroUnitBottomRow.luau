local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagLuaAppAlignHeroUnitBottomRowCtaButton = require(Parent.SharedFlags).FFlagLuaAppAlignHeroUnitBottomRowCtaButton
local FFlagLuaAppHeroUnitSecondaryLabelTextModule = require(ServerDrivenUi.FFlagLuaAppHeroUnitSecondaryLabelText)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagLuaAppHeroUnitSecondaryLabelTextModule (copy), ReactModule (copy), NormalizeFontFaceFunction (copy), FoundationFontFaceMigration (copy), FFlagLuaAppAlignHeroUnitBottomRowCtaButton (copy)
	local LayoutOrder = p1.layoutOrder
	local ZIndex = p1.zIndex
	local Position = p1.position
	local UseTokensResult = UseTokensFunction()
	local CaptionSmall = if FFlagLuaAppHeroUnitSecondaryLabelTextModule then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.BodySmall
	local MutedColor3 = if FFlagLuaAppHeroUnitSecondaryLabelTextModule then UseTokensResult.DarkMode.Content.Muted.Color3 else UseTokensResult.Color.Extended.Gray.Gray_400.Color3
	local FontSize = nil
	local Size400 = nil
	local X = nil
	local UseMemoResult = nil
	local UseMemoResult1 = nil
	
	if FFlagLuaAppHeroUnitSecondaryLabelTextModule then
		FontSize = CaptionSmall.FontSize
		Size400 = UseTokensResult.Size.Size_400
		X = UseTokensResult.Size.Size_2500 * 3
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: NormalizeFontFaceFunction (upval), CaptionSmall (copy)
			return (NormalizeFontFaceFunction(CaptionSmall.Font))
		end, { CaptionSmall.Font })
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (ref)
			local UseMemoResult1 = UseMemoResult
			
			return Font.new(UseMemoResult1.Family, Enum.FontWeight.SemiBold, UseMemoResult1.Style)
		end, { UseMemoResult })
	end
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		Position = Position,
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			ItemLineAlignment = if FFlagLuaAppAlignHeroUnitBottomRowCtaButton then Enum.ItemLineAlignment.Automatic else Enum.ItemLineAlignment.Center
		}),
		CTAButtonContainer = if FFlagLuaAppAlignHeroUnitBottomRowCtaButton then p1.ctaButton else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, { ButtonContent = p1.ctaButton }),
		LabelContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			Label = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), FFlagLuaAppHeroUnitSecondaryLabelTextModule (upval), FontSize (ref), Size400 (ref), CaptionSmall (copy), UseMemoResult1 (ref), MutedColor3 (copy), FoundationFontFaceMigration (upval), UseMemoResult (ref), X (ref), NormalizeFontFaceFunction (upval)
				if p1.rightLabelContent then
					return ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.XY,
						AnchorPoint = Vector2.new(1, 1),
						Position = UDim2.new(1, 0, 1, 0)
					}, { Content = p1.rightLabelContent })
				elseif (not p1.labelText or p1.labelText == "") and (not FFlagLuaAppHeroUnitSecondaryLabelTextModule or not p1.secondaryLabelText or p1.secondaryLabelText == "") then
					return nil
				elseif FFlagLuaAppHeroUnitSecondaryLabelTextModule then
					local LabelText = p1.labelText
					local SecondaryLabelText = p1.secondaryLabelText
					local TextSize = FontSize
					local YOffset: number = Size400
					
					return ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0),
						AnchorPoint = Vector2.new(1, 1),
						Position = UDim2.new(1, 0, 1, 0)
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Right,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						MaturityLabel = if LabelText and LabelText ~= "" then ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							AutomaticSize = Enum.AutomaticSize.X,
							Size = UDim2.new(0, 0, 0, CaptionSmall.FontSize * CaptionSmall.LineHeight),
							Text = LabelText,
							TextSize = CaptionSmall.FontSize,
							FontFace = UseMemoResult1,
							TextColor3 = MutedColor3,
							TextXAlignment = Enum.TextXAlignment.Right,
							TextTruncate = Enum.TextTruncate.SplitWord
						}) else nil,
						SecondaryLabel = if SecondaryLabelText and SecondaryLabelText ~= "" then ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 0, YOffset),
							Text = SecondaryLabelText,
							TextSize = TextSize,
							LineHeight = CaptionSmall.LineHeight,
							Font = if FoundationFontFaceMigration then nil else CaptionSmall.Font,
							FontFace = if FoundationFontFaceMigration then UseMemoResult else nil,
							TextColor3 = MutedColor3,
							TextXAlignment = Enum.TextXAlignment.Right,
							TextTruncate = Enum.TextTruncate.SplitWord
						}, {
							UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
								MaxSize = Vector2.new(X, (math.max(YOffset, TextSize * CaptionSmall.LineHeight * 2)))
							})
						}) else nil
					})
				else
					return ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.new(0, 0, 0, CaptionSmall.FontSize * CaptionSmall.LineHeight),
						Text = p1.labelText,
						TextSize = CaptionSmall.FontSize,
						Font = if FoundationFontFaceMigration then nil else CaptionSmall.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(CaptionSmall.Font) else nil,
						TextColor3 = MutedColor3,
						TextXAlignment = Enum.TextXAlignment.Right,
						TextTruncate = Enum.TextTruncate.SplitWord,
						AnchorPoint = Vector2.new(1, 1),
						Position = UDim2.new(1, 0, 1, 0)
					})
				end
			end, {
				p1.rightLabelContent, p1.labelText, CaptionSmall, MutedColor3,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then p1.secondaryLabelText else nil,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then FontSize else nil,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then Size400 else nil,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then X else nil,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then UseMemoResult else nil,
				if FFlagLuaAppHeroUnitSecondaryLabelTextModule then UseMemoResult1 else nil
			})
		})
	})
end)