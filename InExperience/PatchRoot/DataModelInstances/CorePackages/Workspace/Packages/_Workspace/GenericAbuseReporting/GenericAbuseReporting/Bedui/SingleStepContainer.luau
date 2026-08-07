local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local singleStepInnerContentRendererModule = require(genericAbuseReporting.Bedui.SingleStepInnerContentRenderer)

return reactModule.memo(function(p0) --[[ line: 23 | named "SingleStepContainer" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), singleStepInnerContentRendererModule (ref)
	local var4 = useTokens()
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, {
		Title = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 0,
			Text = p0.node.title,
			fontStyle = var4.Typography.HeadingLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Subtitle = if p0.node.subtitle and #p0.node.subtitle > 0 then reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 1,
			Text = p0.node.subtitle,
			fontStyle = var4.Typography.LabelLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}) else nil,
		InnerContent = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			InnerContentRenderer = reactModule.createElement(singleStepInnerContentRendererModule, {
				contentConfig = p0.contentConfig or p0.node.innerContentConfig,
				formDataKeysWithError = p0.formDataKeysWithError
			})
		})
	})
end)