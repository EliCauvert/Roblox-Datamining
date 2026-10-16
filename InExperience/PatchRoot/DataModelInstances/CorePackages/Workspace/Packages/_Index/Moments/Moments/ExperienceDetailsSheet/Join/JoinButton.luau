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

return reactModule.memo(function(p1)
	-- upvalues: useJoinExperienceModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), useJoinCtaImpressionModule (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), reactModule (ref), button (ref), foundationModule (ref)
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
			-- upvalues: fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var3 (write), var1 (ref), context (ref)
			if fFlagMomentsFixRecommendationImpressionLifecycleModule and var3 ~= nil then
				var3.flushView()
			end
			var1(context)
		end
	})
end)