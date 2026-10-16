local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local CreateTextWithLinksModule = require(GenericAbuseReporting.Bedui.Utils.createTextWithLinks)
local WebViewLinkModule = require(GenericAbuseReporting.Bedui.Components.WebViewLink)

return ReactModule.memo(function(p1) --[[ Line: 21 | Named "Paragraph" ]]
	-- upvalues: ReactModule (copy), CreateTextWithLinksModule (copy), WebViewLinkModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-small",
			LayoutOrder = 0,
			Text = ReactModule.useMemo(function() --[[ Line: 22 ]]
				-- upvalues: CreateTextWithLinksModule (upval), p1 (copy)
				return CreateTextWithLinksModule(p1.component.paragraph.text, p1.component.paragraph.links)
			end, {
				p1.component.paragraph.text,
				p1.component.paragraph.links
			}),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Links = ReactModule.createElement(View, { tag = "size-full-0 auto-y col wraps", LayoutOrder = 1 }, (ReactModule.useMemo(function() --[[ Line: 30 ]]
			-- upvalues: p1 (copy), ReactModule (upval), WebViewLinkModule (upval)
			if not p1.component.paragraph.links then
				return {}
			end
			local Elements = {}
			
			for _, link in p1.component.paragraph.links do
				table.insert(Elements, ReactModule.createElement(WebViewLinkModule, {
					component = {
						componentType = "link",
						isOptional = true,
						formDataKey = nil,
						link = link
					}
				}))
			end
			return Elements
		end, { p1.component })))
	})
end)