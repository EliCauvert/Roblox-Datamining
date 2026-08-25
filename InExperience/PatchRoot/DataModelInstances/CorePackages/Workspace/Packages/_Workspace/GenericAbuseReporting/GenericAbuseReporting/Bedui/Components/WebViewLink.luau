local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local appLinking = require(parent.RoactServiceTags).AppLinking
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local controlState = foundationModule.Enums.ControlState
local getIconRichText = foundationModule.Utility.getIconRichText
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local notificationType = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).NotificationType
local fixWebViewLinkCutOff = game:DefineFastFlag("FixWebViewLinkCutOff", false)

return reactModule.memo(function(p0)
	-- upvalues: useRoactService (ref), appLinking (ref), useAppPolicy (ref), reactModule (ref), httpService (ref), guiService (ref), notificationType (ref), fixWebViewLinkCutOff (ref), getIconRichText (ref), iconName (ref), controlState (ref), view (ref), text (ref), button (ref), buttonVariant (ref)
	local var6 = useRoactService(appLinking)
	local var7 = useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var6 (ref), p0 (ref), httpService (copy), guiService (copy), notificationType (copy)
		if not var7 then
			var6:openURL(p0.component.link.url)
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p0 (copy)
			return httpService:JSONEncode({
				presentationStyle = nil,
				visible = true,
				title = p0.component.link.label,
				url = p0.component.link.url
			})
		end)
		
		if ok then
			guiService:BroadcastNotification(status, notificationType.OpenCustomWebView)
			
			return
		end
		warn("Failed to encode notification data for bedui webview link")
	end, { p0.component.link.label, p0.component.link.url })
	local var9, var10 = reactModule.useBinding(false)
	local var11 = if fixWebViewLinkCutOff then reactModule.useMemo(function()
		-- upvalues: p0 (ref), getIconRichText (copy), iconName (copy)
		return p0.component.link.linkButtonLabel .. ` {getIconRichText(iconName.ArrowUpRightFromSquare)}`
	end, { p0.component.link.linkButtonLabel }) else nil
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p0.layoutOrder }, if fixWebViewLinkCutOff then reactModule.createElement(text, {
		RichText = true,
		tag = "auto-xy padding-xsmall text-body-small text-wrap text-align-x-left radius-medium",
		Text = var9:map(function(p2)
			-- upvalues: var11 (ref)
			return if p2 then `<u>{var11}</u>` else var11
		end),
		onActivated = var8,
		onStateChanged = if fixWebViewLinkCutOff then reactModule.useCallback(function(p3)
			-- upvalues: controlState (copy), var10 (ref)
			if p3 == controlState.Hover then
				var10(true)
				
				return
			end
			var10(false)
		end, {}) else nil
	}) else reactModule.createElement(button, {
		text = p0.component.link.linkButtonLabel,
		variant = buttonVariant.Text,
		onActivated = var8
	}))
end)