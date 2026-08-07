local webViewService = game:GetService("WebViewService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local dialog = foundationModule.Dialog
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local adDisclosureTelemetryModule = require(parent.AdDisclosureTelemetry)
local fStringLuaAppAdPreferencesUrl = require(parent_1.SharedFlags).FStringLuaAppAdPreferencesUrl
local getFFlagEnableUnifiedWebViews = require(parent_1.SharedFlags).GetFFlagEnableUnifiedWebViews
local useLocalization = localizationModule.Hooks.useLocalization

return reactModule.memo(function(p0) --[[ line: 26 | named "WhyThisAdModal" ]]
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), dialog (ref), view (ref), text (ref), adDisclosureTelemetryModule (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), fStringLuaAppAdPreferencesUrl (ref), httpService (ref), browserService (ref)
	local var7 = useLocalization({
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences"
	})
	local var8 = useTokens()
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		onClose = p0.onClose
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var7.whyThisAd }),
		DialogContent = reactModule.createElement(dialog.Content, {}, {
			ContentView = reactModule.createElement(view, { tag = "col auto-xy gap-small" }, {
				DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = p0.adDisclosureBody }),
				AdPreferences = if p0.showAdPreferencesUrl then reactModule.createElement(text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = var7.adPreferences,
					textStyle = var8.Color.Content.Link,
					fontStyle = var8.Typography.BodyMedium,
					onActivated = function() --[[ line: 57 ]]
						-- upvalues: adDisclosureTelemetryModule (copy), getFFlagEnableUnifiedWebViews (copy), webViewService (copy), fStringLuaAppAdPreferencesUrl (copy), var7 (ref), httpService (copy), browserService (copy)
						adDisclosureTelemetryModule.logAdPreferencesLinkClicked()
						
						if getFFlagEnableUnifiedWebViews() then
							local onWindowClosedConnection = nil
							onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function() --[[ line: 62 ]]
								-- upvalues: webViewService (copy), onWindowClosedConnection (write)
								webViewService:CloseWindow()
								
								if onWindowClosedConnection then
									onWindowClosedConnection:Disconnect()
									onWindowClosedConnection = nil
								end
							end)
							webViewService:OpenWindow(fStringLuaAppAdPreferencesUrl, var7.adPreferences, true)
							
							return
						end
						browserService:SendCommand(httpService:JSONEncode({
							command = "open",
							visible = true,
							isGenericWebview = true,
							url = fStringLuaAppAdPreferencesUrl,
							title = var7.adPreferences
						}))
					end
				}) else nil
			})
		})
	})
end)