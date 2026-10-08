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
local textKeysModule = require(profilePlatform.Common.TextKeys)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local contentProviderService = game:GetService("ContentProvider")
local fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromNameAndThumbnail)
local fFlagProfileCurrentlyPlayingEDPFromCardModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingEDPFromCard)
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor

return function(p1)
	-- upvalues: useTokens (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), fFlagProfileCurrentlyPlayingEDPFromCardModule (ref), fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule (ref), useNavigation (ref), useProfileWrapperContextModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), fFlagJoinabilityCTARefactor (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValueModule (ref), appPage (ref), openGameDetails (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), horizontalPageMargin (ref), view (ref), stateLayerAffordance (ref), image (ref), skeleton (ref), radius (ref), text (ref)
	local var1 = useTokens()
	local var2 = useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)
	local var3 = useDispatch()
	local var4 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useNavigation() else nil
	local var5 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then useProfileWrapperContextModule() else nil
	local profileId = var5 and var5.profileId
	local var6 = if fFlagProfilePlatformImproveGameDetailsAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var7 = if fFlagJoinabilityCTARefactor then useLocalization({
		playTogether = textKeysModule.PlayTogether,
		playTogetherSoon = textKeysModule.PlayTogetherSoon
	}) else nil
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
	local var8 = useSelector(function(p2)
		-- upvalues: getDeepValueModule (copy), universeId (ref)
		return getDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(universeId)}`)
	end)
	local rootPlaceId = var8 and var8.rootPlaceId
	local var9 = if var8 then var8.name else ""
	local var10 = if fFlagProfileCurrentlyPlayingEDPFromCardModule or fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function(p2)
		-- upvalues: rootPlaceId (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), var6 (ref), universeId (ref), appPage (copy), profileId (ref), var3 (ref), openGameDetails (copy), var4 (ref)
		if rootPlaceId == nil then return end
		if fFlagProfilePlatformImproveGameDetailsAnalytics then
			var6.reportOpenGameDetailFromProfileContext(rootPlaceId, tostring(universeId), appPage.ProfilePlatform, profileId, p2)
		end
		var3(openGameDetails(tostring(universeId), var4, { mountAsFullView = true, showBackButton = true }))
	end, {
		universeId, rootPlaceId, profileId, var6, var3, var4
	}) else nil
	local var11 = if fFlagProfileCurrentlyPlayingEDPFromCardModule then reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10("ProfilePlatformCurrentlyPlayingCard")
	end, { var10 }) else nil
	local var12 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10("ProfilePlatformCurrentlyPlayingThumbnail")
	end, { var10 }) else nil
	local var13 = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10("ProfilePlatformCurrentlyPlayingGameName")
	end, { var10 }) else nil
	local var14 = if universeId then getRbxThumb(thumbnailType.GameIcon, universeId, thumbnailSize.Small) else nil
	local var15, var16 = reactModule.useState(if var14 then contentProviderService:GetAssetFetchStatus(var14) else Enum.AssetFetchStatus.None)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), contentProviderService (copy), var16 (ref)
		if var14 then
			local var17 = contentProviderService:GetAssetFetchStatusChangedSignal(var14):Connect(var16)
			
			return function()
				-- upvalues: var17 (ref)
				var17:Disconnect()
			end
		end
	end, { var14 })
	local var17 = getDeepValueModule(var2, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local var18 = if var9 ~= "" then var15 == Enum.AssetFetchStatus.Loading else true
	local var19 = if fFlagJoinabilityCTARefactor and not var18 then if var2.joinability == "Joinable" then var7.playTogether elseif var2.joinability == "NotJoinable" then var7.playTogetherSoon else nil else nil
	
	return if universeId then reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100",
			onActivated = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var18 then var11 else nil,
			stateLayer = if fFlagProfileCurrentlyPlayingEDPFromCardModule and not var18 then { affordance = stateLayerAffordance.None } else nil
		}, {
			GameThumbnail = if not var18 then reactModule.createElement(image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = var14,
				onActivated = if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then var12 else nil,
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
				GameTitle = if not var18 then if fFlagProfileCurrentlyPlayingEDPFromNameAndThumbnailModule then reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					LayoutOrder = 1,
					onActivated = var13,
					stateLayer = { affordance = stateLayerAffordance.None }
				}, {
					Label = reactModule.createElement(text, {
						tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
						Text = var9
					})
				}) else reactModule.createElement(text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = var9
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, var1.Typography.TitleMedium.FontSize),
					Radius = radius.Small
				}),
				AgeRecommendationText = if not var18 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = var17
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, var1.Typography.BodyMedium.FontSize),
					Radius = radius.Small
				}),
				JoinabilityStatusText = if var19 ~= nil then nil else reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 3,
					Text = var19
				})
			})
		})
	}) else nil
end