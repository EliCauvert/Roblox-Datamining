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

return function(p0) --[[ line: 57 | named "CurrentlyPlaying" ]]
	-- upvalues: useTokens (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), fFlagProfileCurrentlyPlayingEDPFromCardModule (ref), fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule (ref), useNavigation (ref), useProfileWrapperContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), reactModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValueModule (ref), appPage (ref), openGameDetails (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagProfileCurrentlyPlayingIXPEnabledModule (ref), IXPService (ref), fStringSocialProfileCurrentlyPlayingLayerModule (ref), horizontalPageMargin (ref), view (ref), stateLayerAffordance (ref), image (ref), skeleton (ref), radius (ref), text (ref)
	local var15 = useTokens()
	local var16 = useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)
	local var17 = useDispatch()
	local var18 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useNavigation() else nil
	local var19 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useProfileWrapperContextModule() else nil
	local profileId = var19 and var19.profileId
	local var21 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local universeId = var16.universeId
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: universeId (ref), var17 (ref), networkingGamesModule (copy)
		if universeId then
			var17(networkingGamesModule.GetExperiencesDetails.API({ tostring(universeId) })):catch(function(p1) --[[ line: 80 ]]
				-- upvalues: universeId (copy)
				warn("CurrentlyPlaying: failed to fetch experience details for universeId", universeId, p1)
			end)
			
			return
		end
	end, { universeId, var17 })
	local var22 = useSelector(function(p2) --[[ line: 85 ]]
		-- upvalues: getDeepValueModule (copy), universeId (ref)
		return getDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(universeId)}`)
	end)
	local rootPlaceId = var22 and var22.rootPlaceId
	local var24 = if var22 then var22.name else ""
	local var25 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function(p3) --[[ line: 93 ]]
		-- upvalues: rootPlaceId (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var21 (ref), universeId (ref), appPage (copy), profileId (ref), var17 (ref), openGameDetails (copy), var18 (ref)
		if rootPlaceId == nil then return end
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var21.reportOpenGameDetailFromProfileContext(rootPlaceId, tostring(universeId), appPage.ProfilePlatform, profileId, p3)
		end
		var17(openGameDetails(tostring(universeId), var18, { mountAsFullView = true, showBackButton = true }))
	end, {
		universeId, rootPlaceId, profileId, var21, var17, var18
	}) else nil
	local var26 = if fFlagProfileCurrentlyPlayingEDPFromCardModule then reactModule.useCallback(function() --[[ line: 125 ]]
		-- upvalues: var25 (ref)
		var25("ProfilePlatformCurrentlyPlayingCard")
	end, { var25 }) else nil
	local var27 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function() --[[ line: 131 ]]
		-- upvalues: var25 (ref)
		var25("ProfilePlatformCurrentlyPlayingThumbnail")
	end, { var25 }) else nil
	local var28 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function() --[[ line: 137 ]]
		-- upvalues: var25 (ref)
		var25("ProfilePlatformCurrentlyPlayingGameName")
	end, { var25 }) else nil
	local var29 = if universeId then getRbxThumb(thumbnailType.GameIcon, universeId, thumbnailSize.Small) else nil
	local var30, var31 = reactModule.useState(if var29 then contentProviderService:GetAssetFetchStatus(var29) else Enum.AssetFetchStatus.None)
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: var29 (ref), contentProviderService (copy), var31 (ref)
		if var29 then
			local var34 = contentProviderService:GetAssetFetchStatusChangedSignal(var29):Connect(var31)
			
			return function() --[[ line: 154 ]]
				-- upvalues: var34 (ref)
				var34:Disconnect()
			end
		end
	end, { var29 })
	local var32 = getDeepValueModule(var16, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local var33 = if var24 ~= "" then var30 == Enum.AssetFetchStatus.Loading else true
	reactModule.useEffect(function() --[[ line: 165 ]]
		-- upvalues: fFlagProfileCurrentlyPlayingIXPEnabledModule (copy), universeId (ref), IXPService (copy), fStringSocialProfileCurrentlyPlayingLayerModule (copy)
		if fFlagProfileCurrentlyPlayingIXPEnabledModule and universeId then
			IXPService:LogFlagLinkedUserLayerExposure(fStringSocialProfileCurrentlyPlayingLayerModule)
		end
	end, { universeId })
	
	return if universeId then reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100",
			onActivated = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var33 then var26 else nil,
			stateLayer = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var33 then { affordance = stateLayerAffordance.None } else nil
		}, {
			GameThumbnail = if not var33 then reactModule.createElement(image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = var29,
				onActivated = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then var27 else nil,
				stateLayer = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then { affordance = stateLayerAffordance.None } else nil
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var15.Size.Size_1000, var15.Size.Size_1000),
				Radius = radius.Small
			}),
			TextStack = reactModule.createElement(view, {
				tag = "col align-y-center fill gap-xsmall auto-y content-default",
				LayoutOrder = 2
			}, {
				GameTitle = if not var33 then if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					LayoutOrder = 1,
					onActivated = var28,
					stateLayer = { affordance = stateLayerAffordance.None }
				}, {
					Label = reactModule.createElement(text, {
						tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
						Text = var24
					})
				}) else reactModule.createElement(text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = var24
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, var15.Typography.TitleMedium.FontSize),
					Radius = radius.Small
				}),
				AgeRecommendationText = if not var33 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = var32
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, var15.Typography.BodyMedium.FontSize),
					Radius = radius.Small
				})
			})
		})
	}) else nil
end