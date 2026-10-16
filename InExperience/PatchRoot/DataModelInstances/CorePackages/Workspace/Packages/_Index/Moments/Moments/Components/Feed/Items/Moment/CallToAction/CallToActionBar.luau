local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseExperienceDetailsModule = require(Moments.Hooks.useExperienceDetails)
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagMomentsAndroidTvEnabledModule = require(Moments.Flags.GetFFlagMomentsAndroidTvEnabled)
local ImageWithSkeletonModule = require(Moments.Components.ImageWithSkeleton)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local JoinButtonModule = require(Moments.ExperienceDetailsSheet.Join.JoinButton)
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local MomentsFixExperienceHandleVerifiedSpacing = game:DefineFastFlag("MomentsFixExperienceHandleVerifiedSpacing", false)
local FFlagMomentsFixRecommendationImpressionLifecycleModule = require(Moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local FFlagMomentsUpdateExperienceActionLabelTextModule = require(Moments.Flags.FFlagMomentsUpdateExperienceActionLabelText)
local FFlagMomentsJoinImpressionModule = require(Moments.Flags.FFlagMomentsJoinImpression)
local VerifiedBadgeModule = if MomentsFixExperienceHandleVerifiedSpacing then require(Parent.VerifiedBadges.VerifiedBadge) else nil
local config = {
	join = if FFlagMomentsUpdateExperienceActionLabelTextModule then "Feature.Moments.Action.Play" else "Feature.Moments.Action.Join"
}
local Character = utf8.char(57344)

return ReactModule.memo(function(Frame) --[[ Line: 73 | Named "CallToActionBar" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), MomentContextModule (copy), UseSignalStateFunction (copy), GetMomentsPreferencesStoreModule (copy), GetFFlagMomentsAndroidTvEnabledModule (copy), UseIsTvRemoteDeviceFunction (copy), UseExperienceDetailsModule (copy), FFlagMomentsServeEDPVideos (copy), UseScaledValueFunction (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (copy), FeedContextModule (copy), GetRbxThumbFunction (copy), FoundationModule (copy), MomentsFixExperienceHandleVerifiedSpacing (copy), Character (copy), ReactModule (copy), ImageWithSkeletonModule (copy), Radius (copy), View (copy), Text (copy), Skeleton (copy), VerifiedBadgeModule (copy), IconSize (copy), GetExperienceDetailsSheetStoreModule (copy), Button (copy), JoinButtonModule (copy), FFlagMomentsJoinImpressionModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTokensResult = UseTokensFunction()
	local Store = MomentContextModule.useMoment().store
	local Data = Store.getData(false)
	local IsAd = Data.kind == "ad"
	local Advertiser = if Data.kind == "ad" then Data.advertiser else nil
	local PlaceId = if Data.kind == "experience" then Data.placeId else 0
	local UniverseId = if Data.kind == "experience" then Data.universeId else 0
	local UseSignalStateResult = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	local UseSignalStateResult1 = UseSignalStateFunction(Store.getIsModerated)
	local FFlagMomentsAndroidTvEnabledModule = GetFFlagMomentsAndroidTvEnabledModule()
	local UseIsTvRemoteDeviceResult = UseIsTvRemoteDeviceFunction()
	local UseExperienceDetailsModuleResult = UseExperienceDetailsModule(if IsAd then nil else UniverseId)
	local RootPlaceId = if FFlagMomentsServeEDPVideos and PlaceId == 0 and UseExperienceDetailsModuleResult.rootPlaceId ~= nil then UseExperienceDetailsModuleResult.rootPlaceId else PlaceId
	local IsRootPlaceIdMatch: boolean = FFlagMomentsServeEDPVideos and (not IsAd and (UniverseId ~= 0 and RootPlaceId == 0))
	local UseScaledValueResult = UseScaledValueFunction(160)
	local UseFeedOptionalResult = if FFlagMomentsFixRecommendationImpressionLifecycleModule then FeedContextModule.useFeedOptional() else nil
	local IconImage = if IsAd then if Advertiser then Advertiser.iconImage else nil elseif UniverseId == 0 then GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.Asset, RootPlaceId) else GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.GameIcon, UniverseId)
	
	if IsAd or RootPlaceId ~= 0 or IsRootPlaceIdMatch then
		local Title = if FFlagMomentsServeEDPVideos and IsRootPlaceIdMatch then nil elseif IsAd then if Advertiser then Advertiser.title else nil else UseExperienceDetailsModuleResult.name
		local Subtitle = if FFlagMomentsServeEDPVideos and IsRootPlaceIdMatch then nil elseif IsAd then if Advertiser then Advertiser.subtitle else nil else UseExperienceDetailsModuleResult.creatorName
		local IsVerified = if IsAd then Advertiser ~= nil and Advertiser.isVerified else UseExperienceDetailsModuleResult.isCreatorVerified == true
		local CtaText = if IsAd and Advertiser then Advertiser.ctaText else UseLocalizationResult.join
		local Subtitle1 = if MomentsFixExperienceHandleVerifiedSpacing or not Subtitle or not IsVerified then Subtitle else `{Subtitle} {Character}`
		local Size1000 = UseTokensResult.Size.Size_1000
		
		return ReactModule.createElement(View, {
			tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder
		}, {
			MediaAndMetadata = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center grow gap-medium auto-y",
				testId = "moments-experience-row",
				onActivated = if IsAd or UseSignalStateResult1 or FFlagMomentsServeEDPVideos and RootPlaceId == 0 then nil else function() --[[ Line: 203 ]]
					-- upvalues: GetExperienceDetailsSheetStoreModule (upval), RootPlaceId (copy), UniverseId (copy), Data (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (upval), UseFeedOptionalResult (ref)
					GetExperienceDetailsSheetStoreModule(false).open({
						placeId = RootPlaceId,
						universeId = UniverseId,
						feedItemId = Data.feedItemId,
						tracingId = Data.feedSessionId,
						onBeforeJoin = if FFlagMomentsFixRecommendationImpressionLifecycleModule and UseFeedOptionalResult ~= nil then UseFeedOptionalResult.flushView else nil
					})
				end,
				stateLayer = if IsAd or UseSignalStateResult1 or FFlagMomentsServeEDPVideos and RootPlaceId == 0 then nil else {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				selection = if FFlagMomentsAndroidTvEnabledModule and UseIsTvRemoteDeviceResult then { Selectable = false } else nil
			}, {
				Thumbnail = ReactModule.createElement(ImageWithSkeletonModule, {
					LayoutOrder = 1,
					Image = IconImage,
					Size = UDim2.fromOffset(Size1000, Size1000),
					radius = Radius.Medium,
					backgroundStyle = UseTokensResult.Color.Shift.Shift_300
				}),
				Metadata = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col align-x-left align-y-center grow gap-xsmall auto-y"
				}, {
					Title = if Title then ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-medium text-align-x-left text-align-y-top text-truncate-end content-emphasis",
						Text = Title
					}) else ReactModule.createElement(Skeleton, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(UseScaledValueResult, UseTokensResult.Size.Size_400),
						testId = if FFlagMomentsServeEDPVideos then "moments-experience-title-skeleton" else nil
					}),
					Subtitle = if MomentsFixExperienceHandleVerifiedSpacing and Subtitle1 then ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-x-left align-y-center gap-xsmall size-full-0 auto-y",
						testId = "moments-experience-handle"
					}, {
						Handle = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "shrink auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
							Text = Subtitle1
						}),
						VerifiedBadge = if IsVerified then ReactModule.createElement(VerifiedBadgeModule, {
							LayoutOrder = 2,
							testId = "moments-experience-verified-badge",
							size = IconSize.XSmall
						}) else nil
					}) elseif Subtitle1 then ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
						Text = Subtitle1
					}) else nil
				})
			}),
			CtaButton = if FFlagMomentsAndroidTvEnabledModule and UseIsTvRemoteDeviceResult then nil elseif IsAd then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				isDisabled = UseSignalStateResult or UseSignalStateResult1,
				onActivated = function() --[[ Line: 238 ]] end,
				size = FoundationModule.Enums.InputSize.Medium,
				text = CtaText,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis
			}) elseif FFlagMomentsServeEDPVideos and RootPlaceId == 0 then nil else ReactModule.createElement(JoinButtonModule, {
				LayoutOrder = 2,
				context = {
					placeId = RootPlaceId,
					universeId = UniverseId,
					feedItemId = Data.feedItemId,
					tracingId = Data.feedSessionId
				},
				text = CtaText,
				isDisabled = UseSignalStateResult1 or not FFlagMomentsServeEDPVideos and RootPlaceId == 0,
				reportsImpression = FFlagMomentsJoinImpressionModule
			})
		})
	else
		return nil
	end
end)