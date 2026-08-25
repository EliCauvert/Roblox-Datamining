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
local t = {
	join = if require(moments.Flags.FFlagMomentsUpdateExperienceActionLabelText) then "Feature.Moments.Action.Play" else "Feature.Moments.Action.Join"
}
local char = utf8.char(57344)

return reactModule.memo(function(p0)
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), momentContextModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsAndroidTvEnabledModule (ref), useIsTvRemoteDevice (ref), useExperienceDetailsModule (ref), useScaledValue (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), feedContextModule (ref), getRbxThumb (ref), foundationModule (ref), char (ref), reactModule (ref), imageWithSkeletonModule (ref), radius (ref), view (ref), text (ref), skeleton (ref), getExperienceDetailsSheetStoreModule (ref), button (ref), joinButtonModule (ref)
	local var16 = useLocalization(t)
	local var17 = useTokens()
	local store = momentContextModule.useMoment().store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var20 = if data.kind == "ad" then data.advertiser else nil
	local var21 = if data.kind == "experience" then data.placeId else 0
	local var22 = if data.kind == "experience" then data.universeId else 0
	local var23 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local var24 = useSignalState(store.getIsModerated)
	local var25 = getFFlagMomentsAndroidTvEnabledModule()
	local var26 = useIsTvRemoteDevice()
	local var27 = useExperienceDetailsModule(if isAd then nil else var22)
	local var28 = useScaledValue(160)
	local var29 = if fFlagMomentsFixRecommendationImpressionLifecycleModule then feedContextModule.useFeedOptional() else nil
	local var30 = if isAd then if var20 then var20.iconImage else nil elseif var22 ~= 0 then getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, var21) else getRbxThumb(foundationModule.Enums.ThumbnailType.GameIcon, var22)
	
	if not isAd and var21 == 0 then
		return nil
	end
	local var31 = if isAd then if var20 then var20.title else nil else var27.name
	local var32 = if isAd then if var20 then var20.subtitle else nil else var27.creatorName
	local var33 = if isAd and var20 then var20.ctaText else var16.join
	local var34 = if var32 and (if isAd then var20 ~= nil and var20.isVerified else var27.isCreatorVerified == true) then `{var32} {char}` else var32
	local size1000 = var17.Size.Size_1000
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		LayoutOrder = 1,
		tag = "row align-x-left align-y-center grow gap-medium auto-y",
		testId = "moments-experience-row",
		onActivated = if isAd or var24 then nil else function()
			-- upvalues: getExperienceDetailsSheetStoreModule (copy), var21 (ref), var22 (ref), data (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var29 (write)
			getExperienceDetailsSheetStoreModule(false).open({
				placeId = var21,
				universeId = var22,
				itemId = data.feedItemId,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId,
				onBeforeJoin = if fFlagMomentsFixRecommendationImpressionLifecycleModule and var29 ~= nil then var29.flushView else nil
			})
		end,
		stateLayer = if isAd or var24 then nil else {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = if var25 and var26 then { Selectable = false } else nil
	}, {
		Thumbnail = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = var30,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium,
			backgroundStyle = var17.Color.Shift.Shift_300
		}),
		Metadata = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
		}, {
			Title = if var31 then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = var31
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var28, var17.Size.Size_400)
			}),
			Subtitle = if var34 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
				Text = var34
			}) else nil
		})
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		MediaAndMetadata = createElement,
		CtaButton = if var25 and var26 then nil elseif isAd then reactModule.createElement(button, {
			LayoutOrder = 2,
			isDisabled = var23 or var24,
			onActivated = function() end,
			size = foundationModule.Enums.InputSize.Medium,
			text = var33,
			variant = foundationModule.Enums.ButtonVariant.Emphasis
		}) else reactModule.createElement(joinButtonModule, {
			LayoutOrder = 2,
			context = {
				placeId = var21,
				universeId = var22,
				itemId = data.feedItemId,
				feedItemId = data.feedItemId,
				tracingId = data.feedSessionId
			},
			text = var33,
			isDisabled = var24
		})
	})
end)