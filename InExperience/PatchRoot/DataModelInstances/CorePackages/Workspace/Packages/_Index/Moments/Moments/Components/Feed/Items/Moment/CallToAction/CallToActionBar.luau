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
local momentContextModule = require(script.Parent.Parent.MomentContext)
local getExperienceDetailsSheetStoreModule = require(moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local joinButtonModule = require(moments.ExperienceDetailsSheet.Join.JoinButton)
local t = { join = "Feature.Moments.Action.Join" }
local char = utf8.char(57344)

return reactModule.memo(function(p0) --[[ line: 57 | named "CallToActionBar" ]]
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), momentContextModule (ref), useSignalState (ref), getMomentsPreferencesStoreModule (ref), getFFlagMomentsAndroidTvEnabledModule (ref), useIsTvRemoteDevice (ref), useExperienceDetailsModule (ref), useScaledValue (ref), getRbxThumb (ref), foundationModule (ref), char (ref), reactModule (ref), imageWithSkeletonModule (ref), radius (ref), view (ref), text (ref), skeleton (ref), getExperienceDetailsSheetStoreModule (ref), button (ref), joinButtonModule (ref)
	local var14 = useLocalization(t)
	local var15 = useTokens()
	local store = momentContextModule.useMoment().store
	local data = store.getData(false)
	local isAd = data.kind == "ad"
	local var18 = if data.kind == "ad" then data.advertiser else nil
	local var19 = if data.kind == "experience" then data.placeId else 0
	local var20 = if data.kind == "experience" then data.universeId else 0
	local var21 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local var22 = useSignalState(store.getIsModerated)
	local var23 = getFFlagMomentsAndroidTvEnabledModule()
	local var24 = useIsTvRemoteDevice()
	local var25 = useExperienceDetailsModule(if isAd then nil else var20)
	local var26 = useScaledValue(160)
	local var27 = if isAd then if var18 then var18.iconImage else nil elseif var20 ~= 0 then getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, var19) else getRbxThumb(foundationModule.Enums.ThumbnailType.GameIcon, var20)
	
	if not isAd and var19 == 0 then
		return nil
	end
	local var28 = if isAd then if var18 then var18.title else nil else var25.name
	local var29 = if isAd then if var18 then var18.subtitle else nil else var25.creatorName
	local var30 = if isAd and var18 then var18.ctaText else var14.join
	local var31 = if var29 and (if isAd then var18 ~= nil and var18.isVerified else var25.isCreatorVerified == true) then `{var29} {char}` else var29
	local size1000 = var15.Size.Size_1000
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		LayoutOrder = 1,
		tag = "row align-x-left align-y-center grow gap-medium auto-y",
		testId = "moments-experience-row",
		onActivated = if isAd or var22 then nil else function() --[[ line: 145 ]]
			-- upvalues: getExperienceDetailsSheetStoreModule (copy), var19 (ref), var20 (ref), data (ref)
			getExperienceDetailsSheetStoreModule(false).open({
				placeId = var19,
				universeId = var20,
				itemId = data.feedItemId or data.momentId,
				tracingId = data.feedSessionId
			})
		end,
		stateLayer = if isAd or var22 then nil else {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selection = if var23 and var24 then { Selectable = false } else nil
	}, {
		Thumbnail = reactModule.createElement(imageWithSkeletonModule, {
			LayoutOrder = 1,
			Image = var27,
			Size = UDim2.fromOffset(size1000, size1000),
			radius = radius.Medium,
			backgroundStyle = var15.Color.Shift.Shift_300
		}),
		Metadata = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
		}, {
			Title = if var28 then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
				Text = var28
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var26, var15.Size.Size_400)
			}),
			Subtitle = if var31 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
				Text = var31
			}) else nil
		})
	})
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		MediaAndMetadata = createElement,
		CtaButton = if var23 and var24 then nil elseif isAd then reactModule.createElement(button, {
			LayoutOrder = 2,
			isDisabled = var21 or var22,
			onActivated = function() --[[ line: 175 ]] end,
			size = foundationModule.Enums.InputSize.Medium,
			text = var30,
			variant = foundationModule.Enums.ButtonVariant.Emphasis
		}) else reactModule.createElement(joinButtonModule, {
			LayoutOrder = 2,
			context = {
				placeId = var19,
				universeId = var20,
				itemId = data.feedItemId or data.momentId,
				tracingId = data.feedSessionId
			},
			text = var30,
			isDisabled = var22
		})
	})
end)