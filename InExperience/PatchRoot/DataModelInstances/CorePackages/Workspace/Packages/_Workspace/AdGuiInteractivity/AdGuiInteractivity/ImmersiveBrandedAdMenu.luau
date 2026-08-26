local guiService = game:GetService("GuiService")
local adGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local parent = adGuiInteractivity.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local immersiveBrandedAdWhyThisAdDialogModule = require(adGuiInteractivity.ImmersiveBrandedAdWhyThisAdDialog)
local immersiveBrandedAdReportAdDialogModule = require(adGuiInteractivity.ImmersiveBrandedAdReportAdDialog)
local adsInteractivityTelemetryModule = require(adGuiInteractivity.AdsInteractivityTelemetry)
local menu = foundationModule.Menu
local inputSize = foundationModule.Enums.InputSize
local popoverSide = foundationModule.Enums.PopoverSide
local useLocalization = localizationModule.Hooks.useLocalization
local useMeasurableRef = foundationModule.Hooks.useMeasurableRef
local _ = { WhyThisAd = "whyThisAd", ReportAd = "reportAd" }

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), useMeasurableRef (ref), guiService (ref), adsInteractivityTelemetryModule (ref), immersiveBrandedAdWhyThisAdDialogModule (ref), immersiveBrandedAdReportAdDialogModule (ref), menu (ref), inputSize (ref), popoverSide (ref)
	local screenPosition = p1.screenPosition
	local var1 = useLocalization({
		WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd",
		ReportAdText = "CoreScripts.Ads.Label.ReportAd"
	})
	local var2, var3 = reactModule.useState(nil)
	local var4 = useMeasurableRef(screenPosition)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), p1 (ref)
		local menuOpenedConnection = guiService.MenuOpened:Connect(function()
			-- upvalues: p1 (copy)
			p1.onDismiss()
		end)
		
		return function()
			-- upvalues: menuOpenedConnection (ref)
			menuOpenedConnection:Disconnect()
		end
	end, { p1.onDismiss })
	
	return if var2 == "whyThisAd" then reactModule.createElement(immersiveBrandedAdWhyThisAdDialogModule, {
		advertiserName = p1.advertiserName,
		onDismiss = p1.onDismiss
	}) elseif var2 == "reportAd" then reactModule.createElement(immersiveBrandedAdReportAdDialogModule, {
		immersiveBrandedAdId = p1.immersiveBrandedAdId,
		onDismiss = p1.onDismiss
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		menu = reactModule.createElement(menu, {
			isOpen = true,
			items = reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return {
					{
						id = "whyThisAd",
						icon = "icons/actions/info_small",
						text = var1.WhyThisAdText
					},
					{
						id = "reportAd",
						icon = "icons/actions/feedback",
						text = var1.ReportAdText
					}
				}
			end, { var1.WhyThisAdText, var1.ReportAdText }),
			size = inputSize.Small,
			side = popoverSide.Right,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: adsInteractivityTelemetryModule (copy), var3 (ref)
				if p2 == "whyThisAd" then
					adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("whyThisAd")
					var3("whyThisAd")
					
					return
				elseif p2 == "reportAd" then
					adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("reportAd")
					var3("reportAd")
				end
			end, {}),
			onPressedOutside = p1.onDismiss,
			anchorRef = var4
		}),
		modal = reactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		})
	})
end