local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local StyleModule = require(CorePackages.Workspace.Packages.Style)
local ReportTargetThumbnailModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.ReportTargetThumbnail)
local UseDesignTokensFunction = StyleModule.useDesignTokens
local MapTypographyVariantToFontEnumFunction = StyleModule.mapTypographyVariantToFontEnum

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), ReportTargetThumbnailModule (copy), MapTypographyVariantToFontEnumFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_2800)
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_600),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_1400)
		}),
		TargetInner = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Thumbnail = ReactModule.createElement(ReportTargetThumbnailModule, { thumbnailUrl = p1.thumbnailUrl }),
			Texts = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseDesignTokensResult.Size.Size_300)
				}),
				PrimaryText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p1.primaryText,
					Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.TitleLarge),
					TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
					TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
					TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, 0, 0, UseDesignTokensResult.Typography.TitleLarge.FontSize)
				}),
				SecondaryText = ReactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					TextWrapped = true,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p1.secondaryText,
					Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.BodyLarge),
					TextColor3 = UseDesignTokensResult.Color.Content.Default.Color3,
					TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
					TextSize = UseDesignTokensResult.Typography.BodyLarge.FontSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(0, 0, 0, UseDesignTokensResult.Typography.TitleLarge.FontSize)
				})
			})
		})
	})
end