local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local button = foundationModule.Button
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(moments.ExperienceDetailsSheet.Types)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local useJoinExperienceModule = require(script.Parent.useJoinExperience)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)

return reactModule.memo(function(p0)
	-- upvalues: useJoinExperienceModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), reactModule (ref), button (ref), foundationModule (ref)
	local var7 = useJoinExperienceModule()
	local var8 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local var9 = if fFlagMomentsFixRecommendationImpressionLifecycleModule then feedContextModule.useFeedOptional() else nil
	local context = p0.context
	
	return reactModule.createElement(button, {
		LayoutOrder = p0.LayoutOrder,
		text = p0.text,
		size = foundationModule.Enums.InputSize.Medium,
		variant = foundationModule.Enums.ButtonVariant.Emphasis,
		isDisabled = if p0.isDisabled ~= true then var8 else true,
		testId = p0.testId,
		onActivated = function()
			-- upvalues: fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var9 (write), var7 (ref), context (ref)
			if fFlagMomentsFixRecommendationImpressionLifecycleModule and var9 ~= nil then
				var9.flushView()
			end
			var7(context)
		end
	})
end)