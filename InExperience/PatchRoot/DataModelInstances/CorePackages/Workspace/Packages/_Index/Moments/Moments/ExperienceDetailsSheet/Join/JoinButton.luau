local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(Moments.ExperienceDetailsSheet.Types)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local UseJoinExperienceModule = require(script.Parent.useJoinExperience)
local UseJoinCtaImpressionModule = require(script.Parent.useJoinCtaImpression)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local FFlagMomentsFixRecommendationImpressionLifecycleModule = require(Moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local FFlagMomentsPlayEventModule = require(Moments.Flags.FFlagMomentsPlayEvent)

return ReactModule.memo(function(Frame) --[[ Line: 42 | Named "JoinButton" ]]
	-- upvalues: UseJoinExperienceModule (copy), UseSignalStateFunction (copy), GetMomentsPreferencesStoreModule (copy), UseJoinCtaImpressionModule (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (copy), FeedContextModule (copy), ReactModule (copy), Button (copy), FoundationModule (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), FFlagMomentsPlayEventModule (copy)
	local UseJoinExperienceModuleResult = UseJoinExperienceModule()
	local UseSignalStateResult = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	UseJoinCtaImpressionModule(Frame.isDisabled == true, Frame.reportsImpression == true)
	local UseFeedOptionalResult = if FFlagMomentsFixRecommendationImpressionLifecycleModule then FeedContextModule.useFeedOptional() else nil
	local Context = Frame.context
	
	return ReactModule.createElement(Button, {
		LayoutOrder = Frame.LayoutOrder,
		text = Frame.text,
		size = FoundationModule.Enums.InputSize.Medium,
		variant = FoundationModule.Enums.ButtonVariant.Emphasis,
		isDisabled = Frame.isDisabled == true or UseSignalStateResult,
		testId = Frame.testId,
		onActivated = function() --[[ Line: 64 ]]
			-- upvalues: FFlagMomentsFixRecommendationImpressionLifecycleModule (upval), UseFeedOptionalResult (ref), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval), UseJoinExperienceModuleResult (copy), Context (copy), FFlagMomentsPlayEventModule (upval)
			local FlushViewResult = if FFlagMomentsFixRecommendationImpressionLifecycleModule and UseFeedOptionalResult ~= nil then UseFeedOptionalResult.flushView(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.ExperienceJoin else nil) else nil
			UseJoinExperienceModuleResult(Context, nil, if FFlagMomentsPlayEventModule then FlushViewResult else nil)
		end
	})
end)