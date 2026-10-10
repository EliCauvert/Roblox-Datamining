local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(moments.ExperienceDetailsSheet.Types)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local useJoinExperienceModule = require(script.Parent.useJoinExperience)
local useJoinCtaImpressionModule = require(script.Parent.useJoinCtaImpression)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local navigationDestinationTypeModule = require(moments.Enums.NavigationDestinationType)
local fFlagMomentsNavigationEventModule = require(moments.Flags.FFlagMomentsNavigationEvent)
local fFlagMomentsPlayEventModule = require(moments.Flags.FFlagMomentsPlayEvent)

return reactModule.memo(function(p1)
	-- upvalues: useJoinExperienceModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), useJoinCtaImpressionModule (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), reactModule (ref), button (ref), foundationModule (ref), fFlagMomentsNavigationEventModule (ref), navigationDestinationTypeModule (ref), fFlagMomentsPlayEventModule (ref)
	local var1 = useJoinExperienceModule()
	local var2 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	useJoinCtaImpressionModule(p1.isDisabled == true, p1.reportsImpression == true)
	local var3 = if fFlagMomentsFixRecommendationImpressionLifecycleModule then feedContextModule.useFeedOptional() else nil
	local context = p1.context
	
	return reactModule.createElement(button, {
		LayoutOrder = p1.LayoutOrder,
		text = p1.text,
		size = foundationModule.Enums.InputSize.Medium,
		variant = foundationModule.Enums.ButtonVariant.Emphasis,
		isDisabled = if p1.isDisabled ~= true then var2 else true,
		testId = p1.testId,
		onActivated = function()
			-- upvalues: fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var3 (write), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy), var1 (ref), context (ref), fFlagMomentsPlayEventModule (copy)
			var1(context, nil, if fFlagMomentsPlayEventModule then if fFlagMomentsFixRecommendationImpressionLifecycleModule and var3 ~= nil then var3.flushView(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.ExperienceJoin else nil) else nil else nil)
		end
	})
end)