local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local ReactModule = require(AbuseReporting.Parent.React)
local _ = require(AbuseReporting.Common.Types)
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local _UDim2 = UDim2.new(1, 0, 1, 0)

return function(p1)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), _UDim2 (copy), ReactModule (copy)
	local ReportHeader = UseAbuseReportingDesignTokensModule().ReportHeader
	local DividerVerticalPadding = ReportHeader.dividerVerticalPadding or 36
	local DividerHeight = ReportHeader.dividerHeight or 2
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = ReportHeader.size or _UDim2,
		LayoutOrder = p1.layoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = if ReportHeader.verticalPadding then ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, ReportHeader.verticalPadding),
			PaddingBottom = UDim.new(0, ReportHeader.verticalPadding)
		}) else nil,
		Title = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.title,
			Font = ReportHeader.titleFontStyle and ReportHeader.titleFontStyle.Font,
			TextColor3 = ReportHeader.titleTextColor and ReportHeader.titleTextColor.Color3,
			TextSize = ReportHeader.titleFontStyle and ReportHeader.titleFontStyle.FontSize,
			LineHeight = ReportHeader.titleFontStyle and ReportHeader.titleFontStyle.LineHeight
		}),
		Subtitle = if p1.subtitle then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.subtitle,
			Font = ReportHeader.subtitleFontStyle and ReportHeader.subtitleFontStyle.Font,
			TextColor3 = ReportHeader.subtitleTextColor and ReportHeader.subtitleTextColor.Color3,
			TextSize = ReportHeader.subtitleFontStyle and ReportHeader.subtitleFontStyle.FontSize,
			LineHeight = ReportHeader.subtitleFontStyle and ReportHeader.subtitleFontStyle.LineHeight
		}) else nil,
		Decoration = if p1.hasDivider then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, DividerVerticalPadding)
		}, {
			Divider = ReactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, DividerHeight),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = ReportHeader.dividerColor and ReportHeader.dividerColor.Color3,
				BackgroundTransparency = ReportHeader.dividerColor and ReportHeader.dividerColor.Transparency or 0.8
			})
		}) else nil
	})
end