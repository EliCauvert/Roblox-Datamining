local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Text = FoundationModule.Text
local View = FoundationModule.View
local CreateTextWithLinksModule = require(GenericAbuseReporting.Bedui.Utils.createTextWithLinks)
local NotificationType = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).NotificationType
local WebViewLinkModule = require(GenericAbuseReporting.Bedui.Components.WebViewLink)
local FFlagChangeWebViewReportButtonToText = require(Parent.SharedFlags).FFlagChangeWebViewReportButtonToText

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CreateTextWithLinksModule (copy), FFlagChangeWebViewReportButtonToText (copy), WebViewLinkModule (copy), Button (copy), ButtonVariant (copy), HttpService (copy), GuiService (copy), NotificationType (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-small",
			LayoutOrder = 0,
			Text = ReactModule.useMemo(function()
				-- upvalues: CreateTextWithLinksModule (upval), p1 (copy)
				return CreateTextWithLinksModule(p1.component.paragraph.text, p1.component.paragraph.links)
			end, {
				p1.component.paragraph.text,
				p1.component.paragraph.links
			}),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Links = ReactModule.createElement(View, { tag = "size-full-0 auto-y col wraps", LayoutOrder = 1 }, (ReactModule.useMemo(function()
			-- upvalues: p1 (copy), FFlagChangeWebViewReportButtonToText (upval), ReactModule (upval), WebViewLinkModule (upval), Button (upval), ButtonVariant (upval), HttpService (upval), GuiService (upval), NotificationType (upval)
			if not p1.component.paragraph.links then
				return {}
			end
			local Elements = {}
			
			for _, link in p1.component.paragraph.links do
				if FFlagChangeWebViewReportButtonToText then
					table.insert(Elements, ReactModule.createElement(WebViewLinkModule, {
						component = {
							componentType = "link",
							isOptional = true,
							formDataKey = nil,
							link = link
						}
					}))
				else
					table.insert(Elements, ReactModule.createElement(Button, {
						text = link.linkButtonLabel,
						variant = ButtonVariant.Text,
						onActivated = function()
							-- upvalues: HttpService (upval), link (copy), GuiService (upval), NotificationType (upval)
							local Success, Result = pcall(function()
								-- upvalues: HttpService (upval), link (upval)
								return HttpService:JSONEncode({
									presentationStyle = nil,
									visible = true,
									title = link.label,
									url = link.url
								})
							end)
							
							if Success then
								GuiService:BroadcastNotification(Result, NotificationType.OpenCustomWebView)
								
								return
							else
								warn("Failed to encode notification data for bedui paragraph")
							end
						end
					}))
				end
			end
			return Elements
		end, { p1.component })))
	})
end)