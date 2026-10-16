local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local SingleStepInnerContentRendererModule = require(GenericAbuseReporting.Bedui.SingleStepInnerContentRenderer)

return ReactModule.memo(function(p1) --[[ Line: 23 | Named "SingleStepContainer" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), SingleStepInnerContentRendererModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-medium" }, {
		Title = ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 0,
			Text = p1.node.title,
			fontStyle = UseTokensResult.Typography.HeadingLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Subtitle = if p1.node.subtitle and #p1.node.subtitle > 0 then ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 1,
			Text = p1.node.subtitle,
			fontStyle = UseTokensResult.Typography.LabelLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}) else nil,
		InnerContent = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			InnerContentRenderer = ReactModule.createElement(SingleStepInnerContentRendererModule, {
				contentConfig = p1.contentConfig or p1.node.innerContentConfig,
				formDataKeysWithError = p1.formDataKeysWithError
			})
		})
	})
end)