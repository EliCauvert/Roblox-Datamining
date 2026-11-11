local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.FeedTypes)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local config = {
	failedTitle = "Feature.Moments.Label.FeedFailedToLoad",
	failedMessage = "Feature.Moments.Label.Error",
	retryLabel = "Feature.Moments.Action.Retry"
}

local function CenteredOverlay(p1)
	-- upvalues: ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), View (copy)
	return ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		frameProps = if p1.zIndex == nil then nil else { ZIndex = p1.zIndex }
	}, {
		Content = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center gap-medium size-full padding-xlarge bg-surface-0"
		}, p1.children)
	})
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), CenteredOverlay (copy), Text (copy), View (copy), Button (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Status = p1.status
	
	return if Status == "Failed" then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-center content-emphasis",
			Text = UseLocalizationResult.failedTitle
		}),
		Description = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = UseLocalizationResult.failedMessage
		})
	}) elseif Status == "Empty" then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
		Message = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-emphasis",
			Text = "No moments yet"
		}),
		Cta = p1.emptyContent
	}) elseif p1.loadMoreFailed then ReactModule.createElement(View, {
		tag = "col align-x-center align-y-bottom size-full padding-large",
		ZIndex = p1.zIndex
	}, {
		RetryButton = ReactModule.createElement(Button, {
			onActivated = p1.onRetry,
			size = FoundationModule.Enums.InputSize.Small,
			text = UseLocalizationResult.retryLabel,
			variant = FoundationModule.Enums.ButtonVariant.Standard
		})
	}) else nil
end