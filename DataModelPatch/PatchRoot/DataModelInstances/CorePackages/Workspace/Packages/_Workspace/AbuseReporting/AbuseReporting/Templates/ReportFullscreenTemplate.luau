local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local ReportHeaderModule = require(AbuseReporting.Components.ReportHeader)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), ReactModule (copy), ReportHeaderModule (copy), CryoModule (copy)
	local UseAbuseReportingDesignTokensModuleResult = UseAbuseReportingDesignTokensModule()
	local _UDim = UDim.new(if UseAbuseReportingDesignTokensModuleResult.ReportHeader.size then UseAbuseReportingDesignTokensModuleResult.ReportHeader.size.Y.Scale else 0, if UseAbuseReportingDesignTokensModuleResult.ReportHeader.size then UseAbuseReportingDesignTokensModuleResult.ReportHeader.size.Y.Offset else 0)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseAbuseReportingDesignTokensModuleResult.ReportBackground.backgroundColor and UseAbuseReportingDesignTokensModuleResult.ReportBackground.backgroundColor.Color3,
		ref = Ref
	}, {
		Gradient = ReactModule.createElement("UIGradient", {
			Rotation = UseAbuseReportingDesignTokensModuleResult.ReportBackground.gradientRotation,
			Transparency = UseAbuseReportingDesignTokensModuleResult.ReportBackground.gradientTransparency
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = ReactModule.createElement(ReportHeaderModule, {
			layoutOrder = 1,
			hasDivider = true,
			title = p1.title,
			subtitle = p1.subtitle
		}),
		Body = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1 - _UDim.Scale, -_UDim.Offset)
		}, CryoModule.Dictionary.join({
			Layout = p1.children and ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			} or nil)
		}, p1.children or {}))
	})
end)