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
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local IXPService = game:GetService("IXPService")
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local ContentProvider = game:GetService("ContentProvider")
local FStringSocialProfileCurrentlyPlayingLayerModule = require(ProfilePlatform.Flags.FStringSocialProfileCurrentlyPlayingLayer)
local FFlagProfileCurrentlyPlayingIXPEnabledModule = require(ProfilePlatform.Flags.FFlagProfileCurrentlyPlayingIXPEnabled)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseDispatchFunction (copy), ReactModule (copy), NetworkingGamesModule (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), ContentProvider (copy), FFlagProfileCurrentlyPlayingIXPEnabledModule (copy), IXPService (copy), FStringSocialProfileCurrentlyPlayingLayerModule (copy), HorizontalPageMargin (copy), View (copy), Image (copy), Skeleton (copy), Radius (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyPlaying)
	local UseDispatchResult = UseDispatchFunction()
	local UniverseId = UseProfileJsonComponentModuleResult.universeId
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), UseDispatchResult (copy), NetworkingGamesModule (upval)
		if UniverseId then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ (tostring(UniverseId)) })):catch(function(Err)
				-- upvalues: UniverseId (upval)
				warn("CurrentlyPlaying: failed to fetch experience details for universeId", UniverseId, Err)
			end)
			
			return
		end
	end, { UniverseId, UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueModule (upval), UniverseId (copy)
		return GetDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(UniverseId)}`)
	end)
	local Name = UseSelectorResult and UseSelectorResult.name or ""
	local RbxThumb = if UniverseId then GetRbxThumbFunction(ThumbnailType.GameIcon, UniverseId, ThumbnailSize.Small) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(if RbxThumb then ContentProvider:GetAssetFetchStatus(RbxThumb) else Enum.AssetFetchStatus.None)
	ReactModule.useEffect(function()
		-- upvalues: RbxThumb (copy), ContentProvider (upval), UseStateResult2 (copy)
		if not RbxThumb then return end
		local Connection = ContentProvider:GetAssetFetchStatusChangedSignal(RbxThumb):Connect(UseStateResult2)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { RbxThumb })
	local AgeRecommendationAgeRecommendationSummaryAgeRecommendationDisplayNameWithHeaderShort = GetDeepValueModule(UseProfileJsonComponentModuleResult, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local NoName: boolean = Name == nil or (Name == "" or UseStateResult == Enum.AssetFetchStatus.Loading)
	ReactModule.useEffect(function()
		-- upvalues: FFlagProfileCurrentlyPlayingIXPEnabledModule (upval), UniverseId (copy), IXPService (upval), FStringSocialProfileCurrentlyPlayingLayerModule (upval)
		if FFlagProfileCurrentlyPlayingIXPEnabledModule and UniverseId then
			IXPService:LogFlagLinkedUserLayerExposure(FStringSocialProfileCurrentlyPlayingLayerModule)
		end
	end, { UniverseId })
	
	return if UniverseId then ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100"
		}, {
			GameThumbnail = if NoName then ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				Radius = Radius.Small
			}) else ReactModule.createElement(Image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = RbxThumb
			}),
			TextStack = ReactModule.createElement(View, {
				tag = "col align-y-center fill gap-xsmall auto-y content-default",
				LayoutOrder = 2
			}, {
				GameTitle = if NoName then ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, UseTokensResult.Typography.TitleMedium.FontSize),
					Radius = Radius.Small
				}) else ReactModule.createElement(Text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = Name
				}),
				AgeRecommendationText = if NoName then ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, UseTokensResult.Typography.BodyMedium.FontSize),
					Radius = Radius.Small
				}) else ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = AgeRecommendationAgeRecommendationSummaryAgeRecommendationDisplayNameWithHeaderShort
				})
			})
		})
	}) else nil
end