local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local MapTypographyVariantToFontEnumFunction = require(CorePackages.Workspace.Packages.Style).mapTypographyVariantToFontEnum

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), WithLocalizationFunction (copy), ReactModule (copy), MapTypographyVariantToFontEnumFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return WithLocalizationFunction({
		statusPrimaryText = p1.statusPrimaryText,
		statusSecondaryText = p1.statusSecondaryText
	})(function(p2)
		-- upvalues: ReactModule (upval), p1 (copy), UseDesignTokensResult (copy), MapTypographyVariantToFontEnumFunction (upval)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			FetchStatus = if p1.submitError then ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 1, -UseDesignTokensResult.Typography.TitleLarge.FontSize - UseDesignTokensResult.Size.Size_300),
				Text = p2.statusPrimaryText,
				Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.BodyLarge),
				TextColor3 = p1.color,
				TextSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Typography.TitleLarge.FontSize),
				TextXAlignment = Enum.TextXAlignment.Left
			}) elseif p1.BEDUIError then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0.9, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				PrimaryText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p1.statusPrimaryText,
					Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.HeadingLarge),
					TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
					TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
					TextSize = UseDesignTokensResult.Typography.HeadingLarge.FontSize,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Typography.HeadingLarge.FontSize)
				}, {
					Padding = ReactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_400)
					})
				}),
				SecondaryText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p1.statusSecondaryText,
					Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.HeadingSmall),
					TextColor3 = UseDesignTokensResult.Color.Content.Default.Color3,
					TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
					TextSize = UseDesignTokensResult.Typography.HeadingSmall.FontSize,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Typography.HeadingSmall.FontSize)
				})
			}) else nil
		})
	end)
end