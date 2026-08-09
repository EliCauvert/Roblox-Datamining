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
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local enumsModule = require(profilePlatform.Common.Enums)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local IXPService = game:GetService("IXPService")
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local contentProviderService = game:GetService("ContentProvider")
local fStringSocialProfileCurrentlyPlayingLayerModule = require(profilePlatform.Flags.FStringSocialProfileCurrentlyPlayingLayer)
local fFlagProfileCurrentlyPlayingIXPEnabledModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingIXPEnabled)

return function(p0) --[[ line: 41 | named "CurrentlyPlaying" ]]
	-- upvalues: useTokens (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useDispatch (ref), reactModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValueModule (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), contentProviderService (ref), fFlagProfileCurrentlyPlayingIXPEnabledModule (ref), IXPService (ref), fStringSocialProfileCurrentlyPlayingLayerModule (ref), horizontalPageMargin (ref), view (ref), image (ref), skeleton (ref), radius (ref), text (ref)
	local var12 = useTokens()
	local var13 = useProfileJsonComponentModule(enumsModule.Components.CurrentlyPlaying)
	local var14 = useDispatch()
	local universeId = var13.universeId
	reactModule.useEffect(function() --[[ line: 47 ]]
		-- upvalues: universeId (ref), var14 (ref), networkingGamesModule (copy)
		if universeId then
			var14(networkingGamesModule.GetExperiencesDetails.API({ tostring(universeId) })):catch(function(p1) --[[ line: 51 ]]
				-- upvalues: universeId (copy)
				warn("CurrentlyPlaying: failed to fetch experience details for universeId", universeId, p1)
			end)
			
			return
		end
	end, { universeId, var14 })
	local var15 = useSelector(function(p2) --[[ line: 56 ]]
		-- upvalues: getDeepValueModule (copy), universeId (ref)
		return getDeepValueModule(p2, `ProfilePlatform.Games.byGameId.{tostring(universeId)}`)
	end)
	local var16 = if var15 then var15.name else ""
	local var17 = if universeId then getRbxThumb(thumbnailType.GameIcon, universeId, thumbnailSize.Small) else nil
	local var18, var19 = reactModule.useState(if var17 then contentProviderService:GetAssetFetchStatus(var17) else Enum.AssetFetchStatus.None)
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var17 (ref), contentProviderService (copy), var19 (ref)
		if var17 then
			local var22 = contentProviderService:GetAssetFetchStatusChangedSignal(var17):Connect(var19)
			
			return function() --[[ line: 73 ]]
				-- upvalues: var22 (ref)
				var22:Disconnect()
			end
		end
	end, { var17 })
	local var20 = getDeepValueModule(var13, "ageRecommendation.ageRecommendationSummary.ageRecommendation.displayNameWithHeaderShort")
	local var21 = if var16 ~= nil then if var16 ~= "" then var18 == Enum.AssetFetchStatus.Loading else true else true
	reactModule.useEffect(function() --[[ line: 86 ]]
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
			tag = "row align-y-center gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-medium bg-shift-100"
		}, {
			GameThumbnail = if not var21 then reactModule.createElement(image, {
				tag = "radius-small aspect-1-1 size-1000-1000 auto-xy align-y-center",
				LayoutOrder = 1,
				Image = var17
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var12.Size.Size_1000, var12.Size.Size_1000),
				Radius = radius.Small
			}),
			TextStack = reactModule.createElement(view, {
				tag = "col align-y-center fill gap-xsmall auto-y content-default",
				LayoutOrder = 2
			}, {
				GameTitle = if not var21 then reactModule.createElement(text, {
					tag = "emphasis size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end",
					LayoutOrder = 1,
					Text = var16
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.new(0.7, 0, 0, var12.Typography.TitleMedium.FontSize),
					Radius = radius.Small
				}),
				AgeRecommendationText = if not var21 then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = var20
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.new(0.5, 0, 0, var12.Typography.BodyMedium.FontSize),
					Radius = radius.Small
				})
			})
		})
	}) else nil
end