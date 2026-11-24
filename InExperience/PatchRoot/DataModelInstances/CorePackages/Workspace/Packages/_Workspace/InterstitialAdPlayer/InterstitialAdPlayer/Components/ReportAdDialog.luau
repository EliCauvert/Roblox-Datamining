local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local DefaultTwoStepReportFlowModule = require(Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local UIBloxModule = require(Parent.UIBlox)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ColorMode = FoundationModule.Enums.ColorMode
local InputSize = FoundationModule.Enums.InputSize
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local ReportCategories = {
	{
		localizationKey = "CoreScripts.Ads.Label.InappropriateAd",
		value = "ABUSE_CATEGORY_INAPPROPRIATE_AD"
	}
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), AppStyleProvider (copy), ColorMode (copy), DefaultTwoStepReportFlowModule (copy), ReportCategories (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		IllegalContent = "CoreScripts.Ads.Label.IllegalContentReportingLink"
	})
	local IllegalContentReportingUrl = p1.illegalContentReportingUrl
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IllegalContentReportingUrl (copy), ReactModule (upval), View (upval), Button (upval), UseLocalizationResult (copy), ButtonVariant (upval), InputSize (upval), p1 (copy)
		return if IllegalContentReportingUrl == nil then nil else ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y margin-x-medium padding-top-medium"
		}, {
			IllegalContent = ReactModule.createElement(Button, {
				text = UseLocalizationResult.IllegalContent,
				variant = ButtonVariant.Link,
				size = InputSize.Small,
				onActivated = function()
					-- upvalues: p1 (upval), IllegalContentReportingUrl (copy)
					p1.onOpenExternally(IllegalContentReportingUrl)
				end
			})
		})
	end, {
		UseLocalizationResult.IllegalContent,
		IllegalContentReportingUrl,
		p1.onOpenExternally
	})
	
	return ReactModule.createElement(AppStyleProvider, { style = { themeName = ColorMode.Dark } }, {
		Flow = ReactModule.createElement(DefaultTwoStepReportFlowModule, {
			analyticsContext = "Ad",
			isReportCategoryReadonly = true,
			onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onClose },
			onSubmitProps = { hasNextSteps = false, onSubmit = p1.reportAbuse },
			onComplete = p1.onClose,
			reportCategories = ReportCategories,
			reportCategoryDefaultKey = ReportCategories[1].value,
			localizationKeys = {
				formTitle = "CoreScripts.Ads.Label.ReportAd",
				completeTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
				completeDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete"
			},
			footerContent = if IllegalContentReportingUrl then UseResult else nil
		})
	})
end