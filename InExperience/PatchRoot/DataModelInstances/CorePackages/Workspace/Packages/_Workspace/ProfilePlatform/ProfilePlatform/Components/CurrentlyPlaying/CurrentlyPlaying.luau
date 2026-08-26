local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useTokens = foundationModule.Hooks.useTokens
local radius = foundationModule.Enums.Radius
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local thumbnailType = foundationModule.Enums.ThumbnailType
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local enumsModule = require(profilePlatform.Common.Enums)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local IXPService = game:GetService("IXPService")
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local contentProviderService = game:GetService("ContentProvider")
local fStringSocialProfileCurrentlyPlayingLayerModule = require(profilePlatform.Flags.FStringSocialProfileCurrentlyPlayingLayer)
local fFlagProfileCurrentlyPlayingIXPEnabledModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingIXPEnabled)
local fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnail)
local fFlagProfileCurrentlyPlayingEDPFromCardModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromCard)
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics

return function(p1)
	-- upvalues: useTokens (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), fFlagProfileCurrentlyPlayingEDPFromCardModule (ref), fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule (ref), useNavigation (ref), useProfileWrapperContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), reactModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValueModule (ref), appPage (ref), openGameDetails (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagProfileCurrentlyPlayingIXPEnabledModule (ref), IXPService (ref), fStringSocialProfileCurrentlyPlayingLayerModule (ref), horizontalPageMargin (ref), view (ref), stateLayerAffordance (ref), image (ref), skeleton (ref), radius (ref), text (ref)
	local var1 = useTokens()
	local var2 = useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)
	local var3 = useDispatch()
	local var4 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useNavigation() else nil
	local var5 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useProfileWrapperContextModule() else nil
	local profileId = var5 and var5.profileId
	local var6 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local universeId = var2.universeId
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var3 (ref), networkingGamesModule (copy)
		if universeId then
			var3(networkingGamesModule.GetExperiencesDetails.API({ tostring(universeId) })):catch(function(p2)
				-- upvalues: universeId (copy)
				warn("CurrentlyPlaying: failed to fetch experience details for universeId", universeId, p2)
			end)
			
			return
		end
	end, { universeId, var3 })
	local var7 = useSelector(function(p2)
		-- upvalues: getDeepValueModule (copy), universeId (ref)
		return getDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(universeId)}`)
	end)
	local rootPlaceId = var7 and var7.rootPlaceId
	local var8 = if var7 then var7.name else ""
	local var9 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: rootPlaceId (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var6 (ref), universeId (ref), appPage (copy), profileId (ref), var3 (ref), openGameDetails (copy), var4 (ref)
		if rootPlaceId == nil then return end
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var6.reportOpenGameDetailFromProfileContext(rootPlaceId, tostring(universeId), appPage.ProfilePlatform, profileId, p2)
		end
		var3(openGameDetails(tostring(universeId), var4, { mountAsFullView = true, showBackButton = true }))
	end, {
		universeId, rootPlaceId, profileId, var6, var3, var4
	}) else nil
	local var10 = if fFlagProfileCurrentlyPlayingEDPFromCardModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9("ProfilePlatformCurrentlyPlayingCard")
	end, { var9 }) else nil
	local var11 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9("ProfilePlatformCurrentlyPlayingThumbnail")
	end, { var9 }) else nil
	local var12 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9("ProfilePlatformCurrentlyPlayingGameName")
	end, { var9 }) else nil
	local var13 = if universeId then getRbxThumb(thumbnailType.GameIcon, universeId, thumbnailSize.Small) else nil
	local var14, var15 = reactModule.useState(if var13 then contentProviderService:GetAssetFetchStatus(var13) else Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), contentProviderService (copy), var15 (ref)
		if var13 then
			local var16 = contentProviderService:GetAssetFetchStatusChangedSignal(var13):Connect(var15)
			
			return function()
				-- upvalues: var16 (ref)
				var16:Disconnect()
			end
		end
	end, { var13 })
	local var16 = getDeepValueModule(var2, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local var17 = if var8 ~= "" then var14 == Enum.AssetFetchStatus.Loading else true
	reactModule.useEffect(function()
		-- upvalues: fFlagProfileCurrentlyPlayingIXPEnabledModule (copy), universeId (ref), IXPService (copy), fStringSocialProfileCurrentlyPlayingLayerModule (copy)
		if fFlagProfileCurrentlyPlayingIXPEnabledModule and universeId then
			IXPService:LogFlagLinkedUserLayerExposure(fStringSocialProfileCurrentlyPlayingLayerModule)
		end
	end, { universeId })
	
	return if universeId then reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100",
			onActivated = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var17 then var10 else nil,
			stateLayer = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var17 then { affordance = stateLayerAffordance.None } else nil
		}, {
			GameThumbnail = if not var17 then reactModule.createElement(image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = var13,
				onActivated = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then var11 else nil,
				stateLayer = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then { affordance = stateLayerAffordance.None } else nil
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var1.Size.Size_1000, var1.Size.Size_1000),
				Radius = radius.Small
			}),
			TextStack = reactModule.createElement(view, {
				tag = "col align-y-center fill gap-xsmall auto-y content-default",
				LayoutOrder = 2
			}, {
				GameTitle = if not var17 then if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					LayoutOrder = 1,
					onActivated = var12,
					stateLayer = { affordance = stateLayerAffordance.None }
				}, {
					Label = reactModule.createElement(text, {
						tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
						Text = var8
					})
				}) else reactModule.createElement(text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = var8
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, var1.Typography.TitleMedium.FontSize),
					Radius = radius.Small
				}),
				AgeRecommendationText = if not var17 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = var16
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, var1.Typography.BodyMedium.FontSize),
					Radius = radius.Small
				})
			})
		})
	}) else nil
end