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
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local fFlagMomentsJoinImpressionModule = require(moments.Flags.FFlagMomentsJoinImpression)
local t = {
	join = if require(moments.Flags.FFlagMomentsUpdateExperienceActionLabelText) then "Feature.Moments.Action.Play" else "Feature.Moments.Action.Join"
}
local char = utf8.char(57344)

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), momentContextModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsAndroidTvEnabledModule (ref), useIsTvRemoteDevice (ref), useExperienceDetailsModule (ref), useScaledValue (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), getRbxThumb (ref), foundationModule (ref), char (ref), reactModule (ref), imageWithSkeletonModule (ref), radius (ref), view (ref), text (ref), skeleton (ref), getExperienceDetailsSheetStoreModule (ref), button (ref), joinButtonModule (ref), fFlagMomentsJoinImpressionModule (ref)
	local var1 = useLocalization(t)
	local var2 = useTokens()
	local store = momentContextModule.useMoment().store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var3 = if data.kind == "ad" then data.advertiser else nil
	local var4 = if data.kind == "experience" then data.placeId else 0
	local var5 = if data.kind == "experience" then data.universeId else 0
	local var6 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local var7 = useSignalState(store.getIsModerated)
	local var8 = getFFlagMomentsAndroidTvEnabledModule()
	local var9 = useIsTvRemoteDevice()
	local var10 = useExperienceDetailsModule(if isAd then nil else var5)
	local var11 = useScaledValue(160)
	local var12 = if fFlagMomentsFixRecommendationImpressionLifecycleModule then feedContextModule.useFeedOptional() else nil
	local var13 = if isAd then if var3 then var3.iconImage else nil elseif var5 ~= 0 then getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, var4) else getRbxThumb(foundationModule.Enums.ThumbnailType.GameIcon, var5)
	
	if not isAd and var4 == 0 then
		return nil
	end
	local var14 = if isAd then if var3 then var3.title else nil else var10.name
	local var15 = if isAd then if var3 then var3.subtitle else nil else var10.creatorName
	local var16 = if isAd and var3 then var3.ctaText else var1.join
	local var17 = if var15 and (if isAd then var3 ~= nil and var3.isVerified else var10.isCreatorVerified == true) then `{var15} {char}` else var15
	local size1000 = var2.Size.Size_1000
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		LayoutOrder = 1,
		tag = "row align-x-left align-y-center grow gap-medium auto-y",
		testId = "moments-experience-row",
		onActivated = if isAd or var7 then nil else function()
			-- upvalues: getExperienceDetailsSheetStoreModule (copy), var4 (ref), var5 (ref), data (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var12 (write)
			getExperienceDetailsSheetStoreModule(false).open({
				placeId = var4,
				universeId = var5,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId,
				onBeforeJoin = if fFlagMomentsFixRecommendationImpressionLifecycleModule and var12 ~= nil then var12.flushView else nil
			})
		end,
		stateLayer = if isAd or var7 then nil else {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = if var8 and var9 then { Selectable = false } else nil
	}, {
		Thumbnail = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = var13,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium,
			backgroundStyle = var2.Color.Shift.Shift_300
		}),
		Metadata = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
		}, {
			Title = if var14 then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = var14
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var11, var2.Size.Size_400)
			}),
			Subtitle = if var17 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
				Text = var17
			}) else nil
		})
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		MediaAndMetadata = createElement,
		CtaButton = if var8 and var9 then nil elseif isAd then reactModule.createElement(button, {
			LayoutOrder = 2,
			isDisabled = var6 or var7,
			onActivated = function() end,
			size = foundationModule.Enums.InputSize.Medium,
			text = var16,
			variant = foundationModule.Enums.ButtonVariant.Emphasis
		}) else reactModule.createElement(joinButtonModule, {
			LayoutOrder = 2,
			context = {
				placeId = var4,
				universeId = var5,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId
			},
			text = var16,
			isDisabled = var7,
			reportsImpression = fFlagMomentsJoinImpressionModule
		})
	})
end)