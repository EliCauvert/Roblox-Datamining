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

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), useMeasurableRef (ref), guiService (ref), adsInteractivityTelemetryModule (ref), immersiveBrandedAdWhyThisAdDialogModule (ref), immersiveBrandedAdReportAdDialogModule (ref), menu (ref), inputSize (ref), popoverSide (ref)
	local screenPosition = p0.screenPosition
	local var8 = useLocalization({
		WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd",
		ReportAdText = "CoreScripts.Ads.Label.ReportAd"
	})
	local var9, var10 = reactModule.useState(nil)
	local var11 = useMeasurableRef(screenPosition)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), p0 (ref)
		local menuOpenedConnection = guiService.MenuOpened:Connect(function()
			-- upvalues: p0 (copy)
			p0.onDismiss()
		end)
		
		return function()
			-- upvalues: menuOpenedConnection (ref)
			menuOpenedConnection:Disconnect()
		end
	end, { p0.onDismiss })
	
	return if var9 == "whyThisAd" then reactModule.createElement(immersiveBrandedAdWhyThisAdDialogModule, {
		advertiserName = p0.advertiserName,
		onDismiss = p0.onDismiss
	}) elseif var9 == "reportAd" then reactModule.createElement(immersiveBrandedAdReportAdDialogModule, {
		immersiveBrandedAdId = p0.immersiveBrandedAdId,
		onDismiss = p0.onDismiss
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		menu = reactModule.createElement(menu, {
			isOpen = true,
			items = reactModule.useMemo(function()
				-- upvalues: var8 (ref)
				return {
					{
						id = "whyThisAd",
						icon = "icons/actions/info_small",
						text = var8.WhyThisAdText
					},
					{
						id = "reportAd",
						icon = "icons/actions/feedback",
						text = var8.ReportAdText
					}
				}
			end, { var8.WhyThisAdText, var8.ReportAdText }),
			size = inputSize.Small,
			side = popoverSide.Right,
			onActivated = reactModule.useCallback(function(p1)
				-- upvalues: adsInteractivityTelemetryModule (copy), var10 (ref)
				if p1 == "whyThisAd" then
					adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("whyThisAd")
					var10("whyThisAd")
					
					return
				elseif p1 == "reportAd" then
					adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("reportAd")
					var10("reportAd")
				end
			end, {}),
			onPressedOutside = p0.onDismiss,
			anchorRef = var11
		}),
		modal = reactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		})
	})
end