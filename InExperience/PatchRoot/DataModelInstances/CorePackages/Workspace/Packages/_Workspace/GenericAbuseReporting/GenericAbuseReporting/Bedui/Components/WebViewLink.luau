local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ControlState = FoundationModule.Enums.ControlState
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local NotificationType = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).NotificationType

return ReactModule.memo(function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLinking (copy), UseAppPolicyFunction (copy), ReactModule (copy), HttpService (copy), GuiService (copy), NotificationType (copy), GetIconRichTextFunction (copy), IconName (copy), ControlState (copy), View (copy), Text (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyResult (copy), UseRoactServiceResult (copy), p1 (copy), HttpService (upval), GuiService (upval), NotificationType (upval)
		if not UseAppPolicyResult then
			UseRoactServiceResult:openURL(p1.component.link.url)
			
			return
		end
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), p1 (upval)
			return HttpService:JSONEncode({
				presentationStyle = nil,
				visible = true,
				title = p1.component.link.label,
				url = p1.component.link.url
			})
		end)
		
		if Success then
			GuiService:BroadcastNotification(Result, NotificationType.OpenCustomWebView)
			
			return
		else
			warn("Failed to encode notification data for bedui webview link")
		end
	end, { p1.component.link.label, p1.component.link.url })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: p1 (copy), GetIconRichTextFunction (upval), IconName (upval)
		return p1.component.link.linkButtonLabel .. ` {GetIconRichTextFunction(IconName.ArrowUpRightFromSquare)}`
	end, { p1.component.link.linkButtonLabel })
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, ReactModule.createElement(Text, {
		RichText = true,
		tag = "auto-xy padding-xsmall text-body-small text-wrap text-align-x-left radius-medium",
		Text = UseBindingResult:map(function(p2)
			-- upvalues: UseMemoResult (copy)
			return if p2 then `<u>{UseMemoResult}</u>` else UseMemoResult
		end),
		onActivated = UseResult,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: ControlState (upval), UseBindingResult2 (copy)
			if Hover == ControlState.Hover then
				UseBindingResult2(true)
				
				return
			else
				UseBindingResult2(false)
			end
		end, {})
	}))
end)