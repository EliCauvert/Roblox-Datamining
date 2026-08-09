local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local text = foundationModule.Text
local view = foundationModule.View
local createTextWithLinksModule = require(genericAbuseReporting.Bedui.Utils.createTextWithLinks)
local notificationType = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).NotificationType
local webViewLinkModule = require(genericAbuseReporting.Bedui.Components.WebViewLink)
local fFlagChangeWebViewReportButtonToText = require(parent.SharedFlags).FFlagChangeWebViewReportButtonToText

return reactModule.memo(function(p0) --[[ line: 28 | named "Paragraph" ]]
	-- upvalues: reactModule (ref), createTextWithLinksModule (ref), fFlagChangeWebViewReportButtonToText (ref), webViewLinkModule (ref), button (ref), buttonVariant (ref), httpService (ref), guiService (ref), notificationType (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p0.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			TextWrapped = true,
			tag = "auto-xy padding-bottom-small",
			LayoutOrder = 0,
			Text = reactModule.useMemo(function() --[[ line: 29 ]]
				-- upvalues: createTextWithLinksModule (copy), p0 (ref)
				return createTextWithLinksModule(p0.component.paragraph.text, p0.component.paragraph.links)
			end, {
				p0.component.paragraph.text,
				p0.component.paragraph.links
			}),
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Links = reactModule.createElement(view, { tag = "size-full-0 auto-y col wraps", LayoutOrder = 1 }, reactModule.useMemo(function() --[[ line: 37 ]]
			-- upvalues: p0 (ref), fFlagChangeWebViewReportButtonToText (copy), reactModule (copy), webViewLinkModule (copy), button (copy), buttonVariant (copy), httpService (copy), guiService (copy), notificationType (copy)
			if not p0.component.paragraph.links then
				return {}
			end
			local t = {}
			
			for i, v in p0.component.paragraph.links do
				if fFlagChangeWebViewReportButtonToText then
					table.insert(t, reactModule.createElement(webViewLinkModule, {
						component = {
							componentType = "link",
							isOptional = true,
							formDataKey = nil,
							link = v
						}
					}))
				else
					table.insert(t, reactModule.createElement(button, {
						text = v.linkButtonLabel,
						variant = buttonVariant.Text,
						onActivated = function() --[[ line: 62 ]]
							-- upvalues: httpService (copy), v (ref), guiService (copy), notificationType (copy)
							local ok, status = pcall(function() --[[ line: 63 ]]
								-- upvalues: httpService (copy), v (copy)
								return httpService:JSONEncode({
									presentationStyle = nil,
									visible = true,
									title = v.label,
									url = v.url
								})
							end)
							
							if ok then
								guiService:BroadcastNotification(status, notificationType.OpenCustomWebView)
								
								return
							end
							warn("Failed to encode notification data for bedui paragraph")
						end
					}))
				end
			end
			return t
		end, { p0.component }))
	})
end)