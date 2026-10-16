local WebViewService = game:GetService("WebViewService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AdDisclosureTelemetryModule = require(Parent.AdDisclosureTelemetry)
local FStringLuaAppAdPreferencesUrl = require(Parent1.SharedFlags).FStringLuaAppAdPreferencesUrl
local GetFFlagEnableUnifiedWebViewsFunction = require(Parent1.SharedFlags).GetFFlagEnableUnifiedWebViews
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "WhyThisAdModal" ]]
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), Dialog (copy), View (copy), Text (copy), AdDisclosureTelemetryModule (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), FStringLuaAppAdPreferencesUrl (copy), HttpService (copy), BrowserService (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		whyThisAd = "Feature.GameDetails.Label.WhyThisAd",
		adPreferences = "Feature.GameDetails.Message.AdPreferences"
	})
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		onClose = p1.onClose
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.whyThisAd }),
		DialogContent = ReactModule.createElement(Dialog.Content, {}, {
			ContentView = ReactModule.createElement(View, { tag = "col auto-xy gap-small" }, {
				DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = p1.adDisclosureBody }),
				AdPreferences = if p1.showAdPreferencesUrl then ReactModule.createElement(Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = UseLocalizationResult.adPreferences,
					textStyle = UseTokensResult.Color.Content.Link,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					onActivated = function() --[[ Line: 57 ]]
						-- upvalues: AdDisclosureTelemetryModule (upval), GetFFlagEnableUnifiedWebViewsFunction (upval), WebViewService (upval), FStringLuaAppAdPreferencesUrl (upval), UseLocalizationResult (copy), HttpService (upval), BrowserService (upval)
						AdDisclosureTelemetryModule.logAdPreferencesLinkClicked()
						
						if GetFFlagEnableUnifiedWebViewsFunction() then
							local Connection = nil
							Connection = WebViewService.OnWindowClosed:Connect(function() --[[ Line: 62 ]]
								-- upvalues: WebViewService (upval), Connection (ref)
								WebViewService:CloseWindow()
								
								if Connection then
									Connection:Disconnect()
									Connection = nil
								end
							end)
							WebViewService:OpenWindow(FStringLuaAppAdPreferencesUrl, UseLocalizationResult.adPreferences, true)
							
							return
						else
							local Connection = HttpService
							Connection = Connection:JSONEncode({
								command = "open",
								visible = true,
								isGenericWebview = true,
								url = FStringLuaAppAdPreferencesUrl,
								title = UseLocalizationResult.adPreferences
							})
							BrowserService:SendCommand(Connection)
						end
					end
				}) else nil
			})
		})
	})
end)