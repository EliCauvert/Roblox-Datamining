local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local singleStepInnerContentRendererModule = require(genericAbuseReporting.Bedui.SingleStepInnerContentRenderer)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), singleStepInnerContentRendererModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, {
		Title = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 0,
			Text = p1.node.title,
			fontStyle = var1.Typography.HeadingLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Subtitle = if p1.node.subtitle and #p1.node.subtitle > 0 then reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-medium",
			LayoutOrder = 1,
			Text = p1.node.subtitle,
			fontStyle = var1.Typography.LabelLarge,
			TextXAlignment = Enum.TextXAlignment.Left
		}) else nil,
		InnerContent = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			InnerContentRenderer = reactModule.createElement(singleStepInnerContentRendererModule, {
				contentConfig = p1.contentConfig or p1.node.innerContentConfig,
				formDataKeysWithError = p1.formDataKeysWithError
			})
		})
	})
end)