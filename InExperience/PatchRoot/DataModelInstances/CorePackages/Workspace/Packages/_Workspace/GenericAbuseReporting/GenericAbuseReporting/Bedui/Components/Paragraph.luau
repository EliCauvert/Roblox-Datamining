local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local createTextWithLinksModule = require(genericAbuseReporting.Bedui.Utils.createTextWithLinks)
local webViewLinkModule = require(genericAbuseReporting.Bedui.Components.WebViewLink)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), createTextWithLinksModule (ref), webViewLinkModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-small",
			LayoutOrder = 0,
			Text = reactModule.useMemo(function()
				-- upvalues: createTextWithLinksModule (copy), p1 (ref)
				return createTextWithLinksModule(p1.component.paragraph.text, p1.component.paragraph.links)
			end, {
				p1.component.paragraph.text,
				p1.component.paragraph.links
			}),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Links = reactModule.createElement(view, { tag = "size-full-0 auto-y col wraps", LayoutOrder = 1 }, reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), webViewLinkModule (copy)
			if not p1.component.paragraph.links then
				return {}
			end
			local t = {}
			
			for i, v in p1.component.paragraph.links do
				table.insert(t, reactModule.createElement(webViewLinkModule, {
					component = {
						componentType = "link",
						isOptional = true,
						formDataKey = nil,
						link = v
					}
				}))
			end
			return t
		end, { p1.component }))
	})
end)