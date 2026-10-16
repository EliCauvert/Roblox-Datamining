local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Radius = FoundationModule.Enums.Radius
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ContentProvider = game:GetService("ContentProvider")
local FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule = require(ProfilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnail)
local FFlagProfileCurrentlyPlayingEDPFromCardModule = require(ProfilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromCard)
local FFlagProfilePlatformImproveGameDetailsAnalytics = require(Parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor

return function(p1) --[[ Line: 58 | Named "CurrentlyPlaying" ]]
	-- upvalues: UseTokensFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseDispatchFunction (copy), FFlagProfileCurrentlyPlayingEDPFromCardModule (copy), FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule (copy), UseNavigationFunction (copy), UseProfileWrapperContextModule (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), FFlagJoinabilityCTARefactor (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), NetworkingGamesModule (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), AppPage (copy), OpenGameDetailsFunction (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), ContentProvider (copy), HorizontalPageMargin (copy), View (copy), StateLayerAffordance (copy), Image (copy), Skeleton (copy), Radius (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyPlaying)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = if FFlagProfileCurrentlyPlayingEDPFromCardModule or FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then UseNavigationFunction() else nil
	local UseProfileWrapperContextModuleResult = if FFlagProfileCurrentlyPlayingEDPFromCardModule or FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then UseProfileWrapperContextModule() else nil
	local ProfileId = UseProfileWrapperContextModuleResult and UseProfileWrapperContextModuleResult.profileId
	local UseRoactServiceResult = if FFlagProfilePlatformImproveGameDetailsAnalytics then UseRoactServiceFunction(RoactAnalyticsCommonGameEvents) else nil
	local UseLocalizationResult = if FFlagJoinabilityCTARefactor then UseLocalizationFunction({
		playTogether = TextKeysModule.PlayTogether,
		playTogetherSoon = TextKeysModule.PlayTogetherSoon
	}) else nil
	local UniverseId = UseProfileJsonComponentModuleResult.universeId
	ReactModule.useEffect(function() --[[ Line: 83 ]]
		-- upvalues: UniverseId (copy), UseDispatchResult (copy), NetworkingGamesModule (upval)
		if UniverseId then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ (tostring(UniverseId)) })):catch(function(Err) --[[ Line: 87 ]]
				-- upvalues: UniverseId (upval)
				warn("CurrentlyPlaying: failed to fetch experience details for universeId", UniverseId, Err)
			end)
			
			return
		end
	end, { UniverseId, UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 92 ]]
		-- upvalues: GetDeepValueModule (upval), UniverseId (copy)
		return GetDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(UniverseId)}`)
	end)
	local RootPlaceId = UseSelectorResult and UseSelectorResult.rootPlaceId
	local Name = UseSelectorResult and UseSelectorResult.name or ""
	local UseResult = if FFlagProfileCurrentlyPlayingEDPFromCardModule or FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then ReactModule.useCallback(function(p2) --[[ Line: 100 ]]
		-- upvalues: RootPlaceId (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), UseRoactServiceResult (copy), UniverseId (copy), AppPage (upval), ProfileId (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy)
		if RootPlaceId == nil then return end
		if FFlagProfilePlatformImproveGameDetailsAnalytics then
			UseRoactServiceResult.reportOpenGameDetailFromProfileContext(RootPlaceId, tostring(UniverseId), AppPage.ProfilePlatform, ProfileId, p2)
		end
		UseDispatchResult(OpenGameDetailsFunction(tostring(UniverseId), UseNavigationResult, { mountAsFullView = true, showBackButton = true }))
	end, {
		UniverseId, RootPlaceId, ProfileId, UseRoactServiceResult, UseDispatchResult,
		UseNavigationResult
	}) else nil
	local UseResult1 = if FFlagProfileCurrentlyPlayingEDPFromCardModule then ReactModule.useCallback(function() --[[ Line: 132 ]]
		-- upvalues: UseResult (copy)
		UseResult("ProfilePlatformCurrentlyPlayingCard")
	end, { UseResult }) else nil
	local UseResult2 = if FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then ReactModule.useCallback(function() --[[ Line: 138 ]]
		-- upvalues: UseResult (copy)
		UseResult("ProfilePlatformCurrentlyPlayingThumbnail")
	end, { UseResult }) else nil
	local UseResult3 = if FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then ReactModule.useCallback(function() --[[ Line: 144 ]]
		-- upvalues: UseResult (copy)
		UseResult("ProfilePlatformCurrentlyPlayingGameName")
	end, { UseResult }) else nil
	local RbxThumb = if UniverseId then GetRbxThumbFunction(ThumbnailType.GameIcon, UniverseId, ThumbnailSize.Small) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(if RbxThumb then ContentProvider:GetAssetFetchStatus(RbxThumb) else Enum.AssetFetchStatus.None)
	ReactModule.useEffect(function() --[[ Line: 155 ]]
		-- upvalues: RbxThumb (copy), ContentProvider (upval), UseStateResult2 (copy)
		if not RbxThumb then return end
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(RbxThumb):Connect(UseStateResult2)
		
		return function() --[[ Line: 161 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { RbxThumb })
	local AgeRecommendationAgeRecommendationSummaryAgeRecommendationDisplayNameWithHeaderShort = GetDeepValueModule(UseProfileJsonComponentModuleResult, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local IsNameMatch: boolean = Name == "" or UseStateResult == Enum.AssetFetchStatus.Loading
	local PlayTogether = if FFlagJoinabilityCTARefactor and not IsNameMatch then if UseProfileJsonComponentModuleResult.joinability == "Joinable" then UseLocalizationResult.playTogether elseif UseProfileJsonComponentModuleResult.joinability == "NotJoinable" then UseLocalizationResult.playTogetherSoon else nil else nil
	
	return if UniverseId then ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100",
			onActivated = if FFlagProfileCurrentlyPlayingEDPFromCardModule and not IsNameMatch then UseResult1 else nil,
			stateLayer = if FFlagProfileCurrentlyPlayingEDPFromCardModule and not IsNameMatch then { affordance = StateLayerAffordance.None } else nil
		}, {
			GameThumbnail = if IsNameMatch then ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				Radius = Radius.Small
			}) else ReactModule.createElement(Image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = RbxThumb,
				onActivated = if FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then UseResult2 else nil,
				stateLayer = if FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then { affordance = StateLayerAffordance.None } else nil
			}),
			TextStack = ReactModule.createElement(View, {
				tag = "col align-y-center fill gap-xsmall auto-y content-default",
				LayoutOrder = 2
			}, {
				GameTitle = if IsNameMatch then ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, UseTokensResult.Typography.TitleMedium.FontSize),
					Radius = Radius.Small
				}) elseif FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = 1,
					onActivated = UseResult3,
					stateLayer = { affordance = StateLayerAffordance.None }
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
						Text = Name
					})
				}) else ReactModule.createElement(Text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = Name
				}),
				AgeRecommendationText = if IsNameMatch then ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, UseTokensResult.Typography.BodyMedium.FontSize),
					Radius = Radius.Small
				}) else ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = AgeRecommendationAgeRecommendationSummaryAgeRecommendationDisplayNameWithHeaderShort
				}),
				JoinabilityStatusText = if PlayTogether == nil then nil else ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 3,
					Text = PlayTogether
				})
			})
		})
	}) else nil
end