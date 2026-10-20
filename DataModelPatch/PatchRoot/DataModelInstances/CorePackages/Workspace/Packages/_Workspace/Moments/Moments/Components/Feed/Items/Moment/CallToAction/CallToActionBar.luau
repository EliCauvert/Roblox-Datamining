local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
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
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local JoinButtonModule = require(Moments.ExperienceDetailsSheet.Join.JoinButton)
local config = { join = "Feature.Moments.Action.Join" }
local Character = utf8.char(57344)

return ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), MomentContextModule (copy), UseSignalStateFunction (copy), GetMomentsPreferencesStoreModule (copy), GetFFlagMomentsAndroidTvEnabledModule (copy), UseIsTvRemoteDeviceFunction (copy), UseExperienceDetailsModule (copy), UseScaledValueFunction (copy), GetRbxThumbFunction (copy), FoundationModule (copy), Character (copy), ReactModule (copy), ImageWithSkeletonModule (copy), Radius (copy), View (copy), Text (copy), Skeleton (copy), GetExperienceDetailsSheetStoreModule (copy), Button (copy), JoinButtonModule (copy)
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
	local UseScaledValueResult = UseScaledValueFunction(160)
	local IconImage = if IsAd then if Advertiser then Advertiser.iconImage else nil elseif UniverseId == 0 then GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.Asset, PlaceId) else GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.GameIcon, UniverseId)
	
	if IsAd or PlaceId ~= 0 then
		local Title = if IsAd then if Advertiser then Advertiser.title else nil else UseExperienceDetailsModuleResult.name
		local Subtitle = if IsAd then if Advertiser then Advertiser.subtitle else nil else UseExperienceDetailsModuleResult.creatorName
		local IsVerified = if IsAd then Advertiser ~= nil and Advertiser.isVerified else UseExperienceDetailsModuleResult.isCreatorVerified == true
		local CtaText = if IsAd and Advertiser then Advertiser.ctaText else UseLocalizationResult.join
		local Text1 = if Subtitle and IsVerified then `{Subtitle} {Character}` else Subtitle
		local Size1000 = UseTokensResult.Size.Size_1000
		
		return ReactModule.createElement(View, {
			tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder
		}, {
			MediaAndMetadata = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center grow gap-medium auto-y",
				testId = "moments-experience-row",
				onActivated = if IsAd or UseSignalStateResult1 then nil else function()
					-- upvalues: GetExperienceDetailsSheetStoreModule (upval), PlaceId (copy), UniverseId (copy), Data (copy)
					GetExperienceDetailsSheetStoreModule(false).open({
						placeId = PlaceId,
						universeId = UniverseId,
						itemId = Data.feedItemId or Data.momentId,
						feedItemId = Data.feedItemIdRaw,
						tracingId = Data.feedSessionId
					})
				end,
				stateLayer = if IsAd or UseSignalStateResult1 then nil else {
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
						Size = UDim2.fromOffset(UseScaledValueResult, UseTokensResult.Size.Size_400)
					}),
					Subtitle = if Text1 then ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-body-medium text-align-x-left text-align-y-center text-truncate-end content-default",
						Text = Text1
					}) else nil
				})
			}),
			CtaButton = if FFlagMomentsAndroidTvEnabledModule and UseIsTvRemoteDeviceResult then nil elseif IsAd then ReactModule.createElement(Button, {
				LayoutOrder = 2,
				isDisabled = UseSignalStateResult or UseSignalStateResult1,
				onActivated = function() end,
				size = FoundationModule.Enums.InputSize.Medium,
				text = CtaText,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis
			}) else ReactModule.createElement(JoinButtonModule, {
				LayoutOrder = 2,
				context = {
					placeId = PlaceId,
					universeId = UniverseId,
					itemId = Data.feedItemId or Data.momentId,
					feedItemId = Data.feedItemIdRaw,
					tracingId = Data.feedSessionId
				},
				text = CtaText,
				isDisabled = UseSignalStateResult1
			})
		})
	else
		return nil
	end
end)