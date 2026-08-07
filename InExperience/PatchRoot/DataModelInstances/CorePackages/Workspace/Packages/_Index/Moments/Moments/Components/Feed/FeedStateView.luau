local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useLocalization = localizationModule.Hooks.useLocalization
local _ = require(script.Parent.FeedTypes)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local t = {
	failedTitle = "Feature.Moments.Label.FeedFailedToLoad",
	failedMessage = "Feature.Moments.Label.Error",
	retryLabel = "Feature.Moments.Action.Retry"
}

local function CenteredOverlay(p0) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref)
	return reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		frameProps = if p0.zIndex ~= nil then nil else { ZIndex = p0.zIndex }
	}, {
		Content = reactModule.createElement(view, {
			tag = "col align-x-center align-y-center gap-medium size-full padding-xlarge bg-surface-0"
		}, p0.children)
	})
end

return function(p1) --[[ line: 74 | named "FeedStateView" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), CenteredOverlay (ref), text (ref), view (ref), button (ref), foundationModule (ref)
	local var6 = useLocalization(t)
	local status = p1.status
	
	return if status == "Failed" then reactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-center content-emphasis",
			Text = var6.failedTitle
		}),
		Description = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = var6.failedMessage
		})
	}) elseif status == "Empty" then reactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
		Message = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-emphasis",
			Text = "No moments yet"
		}),
		Cta = p1.emptyContent
	}) elseif p1.loadMoreFailed then reactModule.createElement(view, {
		tag = "col align-x-center align-y-bottom size-full padding-large",
		ZIndex = p1.zIndex
	}, {
		RetryButton = reactModule.createElement(button, {
			onActivated = p1.onRetry,
			size = foundationModule.Enums.InputSize.Small,
			text = var6.retryLabel,
			variant = foundationModule.Enums.ButtonVariant.Standard
		})
	}) else nil
end