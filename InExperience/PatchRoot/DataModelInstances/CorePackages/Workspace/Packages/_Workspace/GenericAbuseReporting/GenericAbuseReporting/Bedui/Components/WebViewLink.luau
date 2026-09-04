local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local appLinking = require(parent.RoactServiceTags).AppLinking
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local controlState = foundationModule.Enums.ControlState
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local notificationType = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).NotificationType

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), appLinking (ref), useAppPolicy (ref), reactModule (ref), httpService (ref), guiService (ref), notificationType (ref), getIconRichText (ref), iconName (ref), controlState (ref), view (ref), text (ref)
	local var1 = useRoactService(appLinking)
	local var2 = useAppPolicy(function(p2)
		return p2.getWebViewSupport()
	end)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var1 (ref), p1 (ref), httpService (copy), guiService (copy), notificationType (copy)
		if not var2 then
			var1:openURL(p1.component.link.url)
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (copy)
			return httpService:JSONEncode({
				presentationStyle = nil,
				visible = true,
				title = p1.component.link.label,
				url = p1.component.link.url
			})
		end)
		
		if ok then
			guiService:BroadcastNotification(status, notificationType.OpenCustomWebView)
			
			return
		end
		warn("Failed to encode notification data for bedui webview link")
	end, { p1.component.link.label, p1.component.link.url })
	local var4, var5 = reactModule.useBinding(false)
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), getIconRichText (copy), iconName (copy)
		return p1.component.link.linkButtonLabel .. ` {getIconRichText(iconName.ArrowUpRightFromSquare)}`
	end, { p1.component.link.linkButtonLabel })
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy padding-xsmall text-body-small text-wrap text-align-x-left radius-medium",
		Text = var4:map(function(p2)
			-- upvalues: var6 (ref)
			return if p2 then `<u>{var6}</u>` else var6
		end),
		onActivated = var3,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: controlState (copy), var5 (ref)
			if p2 == controlState.Hover then
				var5(true)
				
				return
			end
			var5(false)
		end, {})
	}))
end)