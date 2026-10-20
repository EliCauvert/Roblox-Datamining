local GuiService = game:GetService("GuiService")
local AdGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local Parent = AdGuiInteractivity.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ImmersiveBrandedAdWhyThisAdDialogModule = require(AdGuiInteractivity.ImmersiveBrandedAdWhyThisAdDialog)
local ImmersiveBrandedAdReportAdDialogModule = require(AdGuiInteractivity.ImmersiveBrandedAdReportAdDialog)
local AdsInteractivityTelemetryModule = require(AdGuiInteractivity.AdsInteractivityTelemetry)
local Menu = FoundationModule.Menu
local InputSize = FoundationModule.Enums.InputSize
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseMeasurableRefFunction = FoundationModule.Hooks.useMeasurableRef

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), UseMeasurableRefFunction (copy), GuiService (copy), AdsInteractivityTelemetryModule (copy), ImmersiveBrandedAdWhyThisAdDialogModule (copy), ImmersiveBrandedAdReportAdDialogModule (copy), Menu (copy), InputSize (copy), PopoverSide (copy)
	local ScreenPosition = p1.screenPosition
	local UseLocalizationResult = UseLocalizationFunction({
		WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd",
		ReportAdText = "CoreScripts.Ads.Label.ReportAd"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseMeasurableRefResult = UseMeasurableRefFunction(ScreenPosition)
	ReactModule.useEffect(function()
		-- upvalues: GuiService (upval), p1 (copy)
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
			-- upvalues: p1 (upval)
			p1.onDismiss()
		end)
		
		return function()
			-- upvalues: MenuOpenedConnection (copy)
			MenuOpenedConnection:Disconnect()
		end
	end, { p1.onDismiss })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			{
				id = "whyThisAd",
				icon = "icons/actions/info_small",
				text = UseLocalizationResult.WhyThisAdText
			},
			{
				id = "reportAd",
				icon = "icons/actions/feedback",
				text = UseLocalizationResult.ReportAdText
			}
		}
	end, {
		UseLocalizationResult.WhyThisAdText,
		UseLocalizationResult.ReportAdText
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: AdsInteractivityTelemetryModule (upval), UseStateResult2 (copy)
		if p2 == "whyThisAd" then
			AdsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("whyThisAd")
			UseStateResult2("whyThisAd")
			
			return
		end
		if p2 == "reportAd" then
			AdsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("reportAd")
			UseStateResult2("reportAd")
		end
	end, {})
	
	return if UseStateResult == "whyThisAd" then ReactModule.createElement(ImmersiveBrandedAdWhyThisAdDialogModule, {
		advertiserName = p1.advertiserName,
		onDismiss = p1.onDismiss
	}) elseif UseStateResult == "reportAd" then ReactModule.createElement(ImmersiveBrandedAdReportAdDialogModule, {
		immersiveBrandedAdId = p1.immersiveBrandedAdId,
		onDismiss = p1.onDismiss
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		menu = ReactModule.createElement(Menu, {
			isOpen = true,
			items = UseMemoResult,
			size = InputSize.Small,
			side = PopoverSide.Right,
			onActivated = UseResult,
			onPressedOutside = p1.onDismiss,
			anchorRef = UseMeasurableRefResult
		}),
		modal = ReactModule.createElement("TextButton", {
			Text = "",
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		})
	})
end