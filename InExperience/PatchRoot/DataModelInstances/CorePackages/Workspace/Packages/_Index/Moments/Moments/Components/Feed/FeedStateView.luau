local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.FeedTypes)
local FeedMessageViewModule = require(script.Parent.FeedMessageView)
local FFlagMomentsFeedErrorStateRedesignModule = require(Moments.Flags.FFlagMomentsFeedErrorStateRedesign)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local config = {
	failedTitle = "Feature.Moments.Label.FeedFailedToLoad",
	failedMessage = "Feature.Moments.Label.Error",
	retryLabel = "Feature.Moments.Action.Retry"
}

if FFlagMomentsFeedErrorStateRedesignModule then
	config.couldNotLoadTitle = "Feature.Moments.Label.FeedCouldNotLoad"
	config.somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
end
local function _(p1, p2)
	return if p1 == nil or p1 == "" then p2 else p1
end

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

local function FeedErrorMessage(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FeedMessageViewModule (copy), IconName (copy)
	local Localized = p1.localized
	local CouldNotLoadTitle = Localized.couldNotLoadTitle
	
	return ReactModule.createElement(FeedMessageViewModule, {
		tilted = false,
		testId = "--moments-feed-error",
		iconName = IconName.TriangleExclamation,
		iconSize = UseTokensFunction().Size.Size_1600,
		title = if CouldNotLoadTitle == nil or CouldNotLoadTitle == "" then "Moments couldn't load" else CouldNotLoadTitle,
		description = Localized.somethingWentWrong,
		primaryAction = {
			testId = "--moments-feed-error--retry",
			text = Localized.retryLabel,
			onActivated = p1.onRetry
		}
	})
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), FFlagMomentsFeedErrorStateRedesignModule (copy), ReactModule (copy), CenteredOverlay (copy), FeedErrorMessage (copy), Text (copy), View (copy), Button (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local Status = p1.status
	
	return if FFlagMomentsFeedErrorStateRedesignModule and Status == "Failed" then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
		Message = ReactModule.createElement(FeedErrorMessage, { localized = UseLocalizationResult, onRetry = p1.onRetry })
	}) elseif Status == "Failed" then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
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
	}) elseif Status == "Empty" and p1.emptyState ~= nil then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, { EmptyState = p1.emptyState }) elseif Status == "Empty" then ReactModule.createElement(CenteredOverlay, { zIndex = p1.zIndex }, {
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