local parent = script:FindFirstAncestor("DsaIllegalContentReporting").Parent
local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local controlState = foundationModule.Enums.ControlState
local text = foundationModule.Text
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = { OPEN_CUSTOM_WEBVIEW = 20 }

return reactModule.memo(function()
	-- upvalues: useTokens (ref), reactModule (ref), usePreferredInput (ref), responsiveModule (ref), useLocalization (ref), httpService (ref), guiService (ref), controlState (ref), view (ref), text (ref)
	local var6 = useTokens()
	local var7, var8 = reactModule.useState(nil)
	local var9 = usePreferredInput() == responsiveModule.Input.Directional or responsiveModule.useIsSpatial()
	local var10 = useLocalization({
		HelpPageTitle = "Feature.ReportAbuse.DSAIllegal.ReportPageTitle",
		OSACopy1 = "Feature.ReportAbuse.Message.OSACopy1",
		OSACopy2 = "Feature.ReportAbuse.Message.OSACopy2",
		OSACopy3 = "Feature.ReportAbuse.Message.OSACopy3",
		OSACopy4 = "Feature.ReportAbuse.Message.OSACopy4",
		OSACopyReadOnly = "Feature.ReportAbuse.Message.OSACopyReadOnly"
	})
	
	return reactModule.createElement(view, { tag = "size-full col gap-small" }, {
		OSALink = reactModule.createElement(text, {
			RichText = true,
			TextWrapped = true,
			tag = "auto-xy radius-small padding-xsmall",
			LayoutOrder = 2,
			Text = if var9 then `<b>{var10.OSACopyReadOnly}</b>` else `<b>{var10.OSACopy4}</b>`,
			backgroundStyle = var7,
			fontStyle = var6.Typography.BodySmall,
			textStyle = var6.Color.Content.Emphasis,
			TextXAlignment = Enum.TextXAlignment.Left,
			onActivated = if var9 then nil else reactModule.useCallback(function()
				-- upvalues: httpService (copy), var10 (ref), guiService (copy)
				guiService:BroadcastNotification(httpService:JSONEncode({
					presentationStyle = nil,
					visible = true,
					url = "https://www.roblox.com/illegal-content-reporting",
					title = var10.HelpPageTitle
				}), 20)
			end, {}),
			onStateChanged = if var9 then nil else reactModule.useCallback(function(p0)
				-- upvalues: controlState (copy), var8 (ref), var6 (ref)
				if p0 == controlState.Hover then
					var8(var6.Color.State.Hover)
					
					return
				elseif p0 == controlState.Pressed then
					var8(var6.Color.State.Press)
					
					return
				end
				var8(nil)
			end, {})
		})
	})
end)