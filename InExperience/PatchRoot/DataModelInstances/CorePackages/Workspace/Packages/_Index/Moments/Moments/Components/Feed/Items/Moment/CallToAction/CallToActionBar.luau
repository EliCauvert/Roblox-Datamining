local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local button = foundationModule.Button
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local useLocalization = localizationModule.Hooks.useLocalization
local useSignalState = signalsReactModule.useSignalState
local useExperienceDetailsModule = require(moments.Hooks.useExperienceDetails)
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagMomentsAndroidTvEnabledModule = require(moments.Flags.GetFFlagMomentsAndroidTvEnabled)
local imageWithSkeletonModule = require(moments.Components.ImageWithSkeleton)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local getExperienceDetailsSheetStoreModule = require(moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local joinButtonModule = require(moments.ExperienceDetailsSheet.Join.JoinButton)
local momentsFixExperienceHandleVerifiedSpacing = game:DefineFastFlag("MomentsFixExperienceHandleVerifiedSpacing", false)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local fFlagMomentsUpdateExperienceActionLabelTextModule = require(moments.Flags.FFlagMomentsUpdateExperienceActionLabelText)
local fFlagMomentsJoinImpressionModule = require(moments.Flags.FFlagMomentsJoinImpression)
local var1 = if momentsFixExperienceHandleVerifiedSpacing then require(parent.VerifiedBadges.VerifiedBadge) else nil
local t = {
	join = if fFlagMomentsUpdateExperienceActionLabelTextModule then "Feature.Moments.Action.Play" else "Feature.Moments.Action.Join"
}
local char = utf8.char(57344)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), momentContextModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsAndroidTvEnabledModule (ref), useIsTvRemoteDevice (ref), useExperienceDetailsModule (ref), useScaledValue (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), getRbxThumb (ref), foundationModule (ref), momentsFixExperienceHandleVerifiedSpacing (ref), char (ref), reactModule (ref), imageWithSkeletonModule (ref), radius (ref), view (ref), text (ref), skeleton (ref), var1 (ref), iconSize (ref), getExperienceDetailsSheetStoreModule (ref), button (ref), joinButtonModule (ref), fFlagMomentsJoinImpressionModule (ref)
	local var2 = useLocalization(t)
	local var3 = useTokens()
	local store = momentContextModule.useMoment().store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var4 = if data.kind == "ad" then data.advertiser else nil
	local var5 = if data.kind == "experience" then data.placeId else 0
	local var6 = if data.kind == "experience" then data.universeId else 0
	local var7 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local var8 = useSignalState(store.getIsModerated)
	local var9 = getFFlagMomentsAndroidTvEnabledModule()
	local var10 = useIsTvRemoteDevice()
	local var11 = useExperienceDetailsModule(if isAd then nil else var6)
	local var12 = useScaledValue(160)
	local var13 = if fFlagMomentsFixRecommendationImpressionLifecycleModule then feedContextModule.useFeedOptional() else nil
	local var14 = if isAd then if var4 then var4.iconImage else nil elseif var6 ~= 0 then getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, var5) else getRbxThumb(foundationModule.Enums.ThumbnailType.GameIcon, var6)
	
	if not isAd and var5 == 0 then
		return nil
	end
	local var15 = if isAd then if var4 then var4.title else nil else var11.name
	local var16 = if isAd then if var4 then var4.subtitle else nil else var11.creatorName
	local var17 = if isAd then var4 ~= nil and var4.isVerified else var11.isCreatorVerified == true
	local var18 = if isAd and var4 then var4.ctaText else var2.join
	local var19 = if momentsFixExperienceHandleVerifiedSpacing or not var16 or not var17 then var16 else `{var16} {char}`
	local size1000 = var3.Size.Size_1000
	local var20 = reactModule.createElement(imageWithSkeletonModule, {
		LayoutOrder = 1,
		Image = var14,
		Size = UDim2.fromOffset(size1000, size1000),
		radius = radius.Medium,
		backgroundStyle = var3.Color.Shift.Shift_300
	})
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		LayoutOrder = 2,
		tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
	}, {
		Title = if var15 then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
			Text = var15
		}) else reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var12, var3.Size.Size_400)
		}),
		Subtitle = if momentsFixExperienceHandleVerifiedSpacing and var19 then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-left align-y-center gap-xsmall size-full-0 auto-y",
			testId = "moments-experience-handle"
		}, {
			Handle = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "shrink auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
				Text = var19
			}),
			VerifiedBadge = if var17 then reactModule.createElement(var1, {
				LayoutOrder = 2,
				testId = "moments-experience-verified-badge",
				size = iconSize.XSmall
			}) else nil
		}) elseif var19 then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
			Text = var19
		}) else nil
	})
	local createElement_1 = reactModule.createElement
	createElement_1 = createElement_1(view, {
		LayoutOrder = 1,
		tag = "row align-x-left align-y-center grow gap-medium auto-y",
		testId = "moments-experience-row",
		onActivated = if isAd or var8 then nil else function()
			-- upvalues: getExperienceDetailsSheetStoreModule (copy), var5 (ref), var6 (ref), data (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var13 (write)
			getExperienceDetailsSheetStoreModule(false).open({
				placeId = var5,
				universeId = var6,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId,
				onBeforeJoin = if fFlagMomentsFixRecommendationImpressionLifecycleModule and var13 ~= nil then var13.flushView else nil
			})
		end,
		stateLayer = if isAd or var8 then nil else {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = if var9 and var10 then { Selectable = false } else nil
	}, { Thumbnail = var20, Metadata = createElement })
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		MediaAndMetadata = createElement_1,
		CtaButton = if var9 and var10 then nil elseif isAd then reactModule.createElement(button, {
			LayoutOrder = 2,
			isDisabled = var7 or var8,
			onActivated = function() end,
			size = foundationModule.Enums.InputSize.Medium,
			text = var18,
			variant = foundationModule.Enums.ButtonVariant.Emphasis
		}) else reactModule.createElement(joinButtonModule, {
			LayoutOrder = 2,
			context = {
				placeId = var5,
				universeId = var6,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId
			},
			text = var18,
			isDisabled = var8,
			reportsImpression = fFlagMomentsJoinImpressionModule
		})
	})
end)