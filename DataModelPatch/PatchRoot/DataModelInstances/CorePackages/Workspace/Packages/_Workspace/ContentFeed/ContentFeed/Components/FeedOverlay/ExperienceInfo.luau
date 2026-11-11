local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ExperienceService = require(Parent1.ExperienceService).ExperienceService
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local AppPage = require(Parent1.RobloxAppEnums).AppPage
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local FeedContextModule = require(Parent.App.FeedContext)
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetExperienceThumbnailImageModule = require(Parent.Utils.getExperienceThumbnailImage)
local LoadableImage = require(Parent1.UIBlox).App.Loading.LoadableImage
local NetworkingModule = require(Parent.App.Networking)
local PlayButtonStates = require(Parent1.GamePlayButton).PlayButtonStates
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseAnalyticsModule = require(Parent.Hooks.useAnalytics)
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UsePlayButtonStateFunction = require(Parent1.GamePlayButton).usePlayButtonState
local UseNavigationFunction = require(Parent1.Navigation).useNavigation
local UseSafeZoneOffsetsModule = require(Parent.Hooks.useSafeZoneOffsets)
local UseSelectorFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FeedContextModule (copy), UseNavigationFunction (copy), UseSafeZoneOffsetsModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), UseAnalyticsModule (copy), UsePlayButtonStateFunction (copy), NetworkingModule (copy), PlayButtonStates (copy), EventNamesModule (copy), AppPage (copy), ExperienceService (copy), ConstantsModule (copy), UseLocalizationFunction (copy), View (copy), LoadableImage (copy), GetExperienceThumbnailImageModule (copy), Text (copy), Skeleton (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(FeedContextModule)
	local UseNavigationResult = UseNavigationFunction()
	local UseSafeZoneOffsetsModuleResult = UseSafeZoneOffsetsModule()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		return GetDeepValueFunction(p2, "Games.byGameId." .. p1.universeId .. ".name")
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		return GetDeepValueFunction(p2, "Games.byGameId." .. p1.universeId .. ".rootPlaceId")
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		local DeepValue: number = GetDeepValueFunction(p2, "GameVotes." .. p1.universeId .. ".upVotes")
		local DeepValue1: number = GetDeepValueFunction(p2, "GameVotes." .. p1.universeId .. ".downVotes")
		
		return if DeepValue and DeepValue1 then math.round(100 * DeepValue / (DeepValue + DeepValue1)) else nil
	end)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(NetworkingModule.ContentFeedNetworkImpl, (tostring(p1.universeId)))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseContextResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy), UsePlayButtonStateResult (copy), PlayButtonStates (upval), UseNavigationResult (copy), AppPage (upval), ExperienceService (upval), UseSelectorResult1 (copy), ConstantsModule (upval)
		if UseContextResult.isZooming then return end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.ContentFeedPlayButtonPressed, { postId = p1.postId })
		
		if UsePlayButtonStateResult.playButtonState == PlayButtonStates.PaidAccess then
			UseNavigationResult.goBack()
			UseNavigationResult.navigate(AppPage.GameDetail, {
				detail = tostring(p1.universeId),
				extraProps = { mountAsFullView = true }
			})
		end
		if UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable then
			ExperienceService:LaunchExperience({
				placeId = if UseSelectorResult1 then UseSelectorResult1 else p1.placeId
			}, ConstantsModule.LaunchExperienceSource)
		end
	end, {
		UseContextResult.isZooming, UseNavigationResult,
		UsePlayButtonStateResult.playButtonState, p1.placeId, p1.postId, p1.universeId,
		UseSelectorResult1
	})
	local UseLocalizationResult = UseLocalizationFunction({
		notRated = "Feature.ContentFeed.Label.NotRated",
		ratingPercentage = {
			"Feature.ContentFeed.Label.Rating",
			rating = tostring(UseSelectorResult2)
		}
	})
	local IsNotUseSelectorResultMatch = UseSelectorResult2 ~= UseSelectorResult2
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-100 auto-y size-full-0 row align-x-left align-y-center gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 20 + UseSafeZoneOffsetsModuleResult.bottom),
			PaddingLeft = UDim.new(0, 20),
			PaddingRight = UDim.new(0, 20),
			PaddingTop = UDim.new(0, 20)
		}),
		ExperienceThumbnail = ReactModule.createElement(LoadableImage, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			useShimmerAnimationWhileLoading = true,
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
			Image = GetExperienceThumbnailImageModule(p1.universeId, 150),
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(40, 40)
		}),
		ExperienceMetadata = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "auto-y bg-action-subtle grow col align-x-left align-y-center gap-xsmall"
		}, {
			ExperienceName = if UseSelectorResult then ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-title-large content-action-emphasis text-truncate-end text-align-x-left text-align-y-top size-full-0 auto-y",
				Text = UseSelectorResult
			}) else nil,
			ExperienceNameShimmerPanel = if UseSelectorResult then nil else ReactModule.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.fromOffset(160, 15) }),
			ExperienceRating = if UseSelectorResult2 then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy content-default size-full-0 text-align-x-left text-align-y-top text-body-medium text-truncate-end",
				Text = if IsNotUseSelectorResultMatch then UseLocalizationResult.notRated else UseLocalizationResult.ratingPercentage
			}) else nil,
			ExperienceRatingShimmerPanel = if UseSelectorResult2 then nil else ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.fromOffset(160, 15) })
		}),
		JoinCTA = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "bg-action-emphasis size-2000-1000 radius-medium",
			isDisabled = UsePlayButtonStateResult.playButtonState ~= PlayButtonStates.Loading and (UsePlayButtonStateResult.playButtonState ~= PlayButtonStates.PaidAccess and UsePlayButtonStateResult.playButtonState ~= PlayButtonStates.Playable),
			onActivated = UseResult
		}, {
			PlayIcon = ReactModule.createElement(Icon, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				name = if UsePlayButtonStateResult.playButtonState == PlayButtonStates.PaidAccess then "icons/common/robux" elseif UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable then "icons/common/play" else "icons/actions/block",
				Position = UDim2.fromScale(0.5, 0.5),
				style = UseTokensResult.Color.ActionEmphasis.Foreground
			})
		})
	})
end