local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local ReactModule = require(AbuseReporting.Parent.React)
local _ = require(AbuseReporting.Common.Types)
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local ReportActionBarModule = require(AbuseReporting.Components.ReportActionBar)
local _UDim2 = UDim2.fromScale(1, 1)
local _UDim = UDim.new(0, 10)

return function(p1)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), _UDim2 (copy), _UDim (copy), ReactModule (copy), ReportActionBarModule (copy)
	local UseAbuseReportingDesignTokensModuleResult = UseAbuseReportingDesignTokensModule()
	local ReportStep = UseAbuseReportingDesignTokensModuleResult.ReportStep
	local VerticalPadding = ReportStep.verticalPadding or _UDim
	local _UDim1 = UDim.new((UseAbuseReportingDesignTokensModuleResult.ReportActionBar.size and UseAbuseReportingDesignTokensModuleResult.ReportActionBar.size.Y.Scale or 0) + 2 * VerticalPadding.Scale, (UseAbuseReportingDesignTokensModuleResult.ReportActionBar.size and UseAbuseReportingDesignTokensModuleResult.ReportActionBar.size.Y.Offset or 0) + 2 * VerticalPadding.Offset)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = ReportStep.size and ReportStep.size or _UDim2
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = VerticalPadding,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = p1.title and ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.title,
			Font = ReportStep.headerFontStyle and ReportStep.headerFontStyle.Font,
			TextColor3 = ReportStep.headerTextColor and ReportStep.headerTextColor.Color3,
			TextSize = ReportStep.headerFontStyle and ReportStep.headerFontStyle.FontSize,
			LineHeight = ReportStep.headerFontStyle and ReportStep.headerFontStyle.LineHeight
		}) or nil,
		Body = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1 - _UDim1.Scale, -_UDim1.Offset)
		}, p1.children),
		Actions = ReactModule.createElement(ReportActionBarModule, {
			layoutOrder = 3,
			buttons = p1.buttons,
			tokens = UseAbuseReportingDesignTokensModuleResult.ReportActionBar
		})
	})
end