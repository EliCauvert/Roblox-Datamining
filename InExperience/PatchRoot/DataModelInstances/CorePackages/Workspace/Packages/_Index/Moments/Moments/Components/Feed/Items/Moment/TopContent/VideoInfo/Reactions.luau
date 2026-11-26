local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local FFlagMomentsReactionCountOpensPostInsightsModule = require(Moments.Flags.FFlagMomentsReactionCountOpensPostInsights)
local FFlagMomentsReactionCountAnalyticsModule = require(Moments.Flags.FFlagMomentsReactionCountAnalytics)
local GetFFlagMomentsCoachmarkPersistenceFunction = MomentsCommonModule.Flags.GetFFlagMomentsCoachmarkPersistence
local Text = FoundationModule.Text
local View = FoundationModule.View
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local ReactionModule = if require(Moments.Flags.FFlagMomentsUseSharedReactions) then require(Parent.Reactions.Reaction) else MomentsCommonModule.Components.Reaction
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local ReactionsSheetModule = require(Moments.Components.ReactionsSheet)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local MakeFeedActionFieldsModule = require(Moments.Analytics.makeFeedActionFields)
local GetPostInsightsPageStoreModule = require(Moments.Components.PostInsights.getPostInsightsPageStore)
local DismissPostInsightsCoachmarkModule = require(Moments.Components.PostInsights.dismissPostInsightsCoachmark)
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional

local function _(p1: number): string
	return if p1 == nil then "" elseif p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), ReactModule (copy), UseSignalBindingFunction (copy), UseSignalStateFunction (copy), GetColorStyleWithTransparencyModule (copy), FFlagMomentsReactionCountOpensPostInsightsModule (copy), UseFeedOptionalFunction (copy), FFlagMomentsCreatorAnalyticsModule (copy), GetLocalUserIdModule (copy), RecommendationSource (copy), GetFFlagMomentsCoachmarkPersistenceFunction (copy), DismissPostInsightsCoachmarkModule (copy), GetPostInsightsPageStoreModule (copy), FFlagMomentsReactionCountAnalyticsModule (copy), MakeFeedActionFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), ReactionModule (copy), ReactionSize (copy), View (copy), StateLayerAffordance (copy), Text (copy), ReactionsSheetModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSignalBindingResult = UseSignalBindingFunction(UseMomentResult.store.getReactionCount)
	local UseSignalStateResult = UseSignalStateFunction(UseMomentResult.store.getIndividualReactionCounts)
	local AnimationRatio = UseMomentResult.animationRatio
	local MapResult = AnimationRatio:map(function(p1)
		-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
		return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1)
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local Moment = Frame.moment
	local Callback = nil
	
	if FFlagMomentsReactionCountOpensPostInsightsModule then
		local UseFeedOptionalResult = UseFeedOptionalFunction()
		local IsRecommendationSourceMatch: boolean = FFlagMomentsCreatorAnalyticsModule and (Moment ~= nil and (Moment.creatorId == GetLocalUserIdModule() and (UseFeedOptionalResult ~= nil and UseFeedOptionalResult.recommendationSource == RecommendationSource.Profile)))
		local UseResult2 = ReactModule.useCallback(function()
			-- upvalues: Moment (copy), GetFFlagMomentsCoachmarkPersistenceFunction (upval), DismissPostInsightsCoachmarkModule (upval), GetPostInsightsPageStoreModule (upval), UseMomentResult (copy)
			if Moment == nil then return end
			if GetFFlagMomentsCoachmarkPersistenceFunction() then
				DismissPostInsightsCoachmarkModule()
			end
			GetPostInsightsPageStoreModule(false).open({ moment = Moment, momentStore = UseMomentResult.store })
		end, { Moment or false, UseMomentResult.store })
		Callback = if IsRecommendationSourceMatch then UseResult2 else nil
	end
	local UseResult3 = if FFlagMomentsReactionCountAnalyticsModule then ReactModule.useCallback(function()
		-- upvalues: Moment (copy), MakeFeedActionFieldsModule (upval), GetLocalUserIdModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if Moment == nil then return end
		local RecommendationMetadata = Moment.recommendationMetadata
		local ReactionCount = MakeFeedActionFieldsModule(Moment.momentId, if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId, if RecommendationMetadata == nil then nil else RecommendationMetadata.tracingId, "reaction_count")
		
		if ReactionCount ~= nil then
			ReactionCount.isOwnMoment = tostring(Moment.creatorId == GetLocalUserIdModule())
			FireAnalyticsEventFunction(EventNames.FeedReactionCountPressed, ReactionCount)
		end
	end, { Moment or false }) else nil
	local UseResult4 = if FFlagMomentsReactionCountOpensPostInsightsModule or FFlagMomentsReactionCountAnalyticsModule then ReactModule.useCallback(function()
		-- upvalues: UseResult3 (ref), Callback (ref), UseResult (copy)
		if UseResult3 ~= nil then
			UseResult3()
		end
		if Callback == nil then
			UseResult()
			
			return
		else
			Callback()
		end
	end, { UseResult3 or false, Callback or false, UseResult }) else nil
	local Elements = {}
	
	for i = 1, math.min(3, #UseSignalStateResult) do
		Elements["Reaction" .. i] = ReactModule.createElement(ReactionModule, {
			LayoutOrder = i,
			reactionType = UseSignalStateResult[i].reaction,
			size = ReactionSize.Small,
			imageStyle = MapResult
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ReactionsLine = ReactModule.createElement(View, {
			tag = "row align-x-left align-y-center gap-small auto-xy",
			LayoutOrder = Frame.LayoutOrder,
			onActivated = if FFlagMomentsReactionCountOpensPostInsightsModule or FFlagMomentsReactionCountAnalyticsModule then UseResult4 else UseResult,
			stateLayer = { affordance = StateLayerAffordance.None },
			Visible = UseSignalBindingResult:map(function(p1): boolean
				return p1 ~= nil
			end)
		}, {
			Facepile = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xxsmall auto-xy"
			}, Elements),
			Count = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center content-default",
				Text = UseSignalBindingResult:map(function(p1: number): string
					return `{if p1 == nil then "" elseif p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)} reactions`
				end),
				textStyle = AnimationRatio:map(function(p2)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
					return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Default, p2)
				end)
			})
		}),
		Modal = if UseStateResult then ReactModule.createElement(ReactionsSheetModule, {
			reactionCounts = UseSignalStateResult,
			onClose = UseResult1
		}) else nil
	})
end)