local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameTileModule = require(parent.GameTile)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local image = foundationModule.Image
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local playButton = require(parent.GamePlayButton).PlayButton
local useLocalization = require(parent.Localization).Hooks.useLocalization
local discoveryTypesModule = require(parent.DiscoveryTypes)
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType
local gameCollectionItemTypes = discoveryTypesModule.GameCollectionItemTypes
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactNetworking = roactServiceTagsModule.RoactNetworking
local appSessionService = roactServiceTagsModule.AppSessionService
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local sponsoredGamesRecordClick = require(parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local oneByTwoTileTelemetryModule = require(sponsoredTiles.OneByTwoTileTelemetry)
local videoDisplay = require(parent.VideoPlayer).VideoDisplay
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local useTagAsSponsoredAdViewabilityCandidate = require(parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local useIsHoveredTile = gameTileModule.useIsHoveredTile
local useValidTileBadges = gameTileModule.useValidTileBadges
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local hoverTileCoordinator = gameTileModule.HoverTileCoordinator
local tileVideoBlockingConfig = gameTileModule.TileVideoBlockingConfig
local getAvailableGameTileOverflowMenuItems = gameTileModule.getAvailableGameTileOverflowMenuItems
local spanTileOverflowMenuModule = require(sponsoredTiles.SpanTileOverflowMenu.SpanTileOverflowMenu)
local appBloxModule = require(parent.AppBlox)
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local useOverflowMenuOpen = appBloxModule.useOverflowMenuOpen
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDemoModePlayButton = sharedFlagsModule.FFlagLuaAppDemoModePlayButton
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fIntLuaAppGameTileVideoDwellTimeInSec = sharedFlagsModule.FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = sharedFlagsModule.FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppGameTileSelectionVideoPlayback = sharedFlagsModule.FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local var13 = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40) / 100
local var14 = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25) / 100
local luaAppOneByTwoTileGradientBottomTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomTransparencyPercent", 25)
local luaAppOneByTwoTileGradientTopTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientTopTransparencyPercent", 100)
local luaAppOneByTwoTileGradientBottomHeightPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomHeightPercent", 50)
local var18 = luaAppOneByTwoTileGradientBottomTransparencyPercent / 100
local var19 = luaAppOneByTwoTileGradientTopTransparencyPercent / 100
local var20 = luaAppOneByTwoTileGradientBottomHeightPercent / 100

return reactModule.memo(function(p0) --[[ line: 135 | named "OneByTwoTile" ]]
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), omniRecommendationsContentType (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), gameCollectionItemTypes (ref), useTagAsSponsoredAdViewabilityCandidate (ref), videoPlaybackCoordinator (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useNavigation (ref), sponsoredGamesRecordClick (ref), hoverTileCoordinator (ref), oneByTwoTileTelemetryModule (ref), videoEndReason (ref), appPage (ref), setGamePlaySession (ref), sessionType (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), impressionsTagUtility (ref), useValidTileBadges (ref), useLocalization (ref), var13 (ref), var14 (ref), buttonSize (ref), videoDisplay (ref), var19 (ref), var20 (ref), var18 (ref), gameTileThumbnailBadges (ref), image (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), playButton (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local var21 = useTokens()
	local var22 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local hoverKey = p0.hoverKey
	local var25 = responsiveModule.useLastInput() ~= responsiveModule.Input.Touch
	local var26 = useIsHoveredTile(var23, hoverKey, var25)
	local var27 = responsiveModule.usePreferredInput()
	local var28 = p0.adId ~= nil and p0.adId ~= ""
	local var29 = p0.contentType == omniRecommendationsContentType.AdLink
	local var30, var31 = reactModule.useState(false)
	local var32 = useOverflowMenuOpen(hoverKey)
	local var33 = useTriggerFeedback()
	local var34 = reactModule.useRef(false)
	useTagAsViewportAutoplayCandidate(var23, p0.videoPlaybackContext, true, nil)
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var23, if not (p0.adId == nil or p0.adId == "") then {
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile
		} else nil)
	end
	local large, headingMedium, bodyMedium, xSmall, medium, size1000, titleMedium
	local var35 = if p0.videoPlaybackContext then p0.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	local var36 = reactModule.useMemo(function() --[[ line: 176 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), var28 (ref), p0 (ref), var29 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = var28,
			enableSponsoredFeedback = p0.enableSponsoredFeedback,
			enableReportAd = p0.enableReportAd,
			enableExplicitFeedback = if var29 then nil else p0.enableExplicitFeedback
		})
	end, {
		var28,
		var29,
		p0.enableSponsoredFeedback,
		p0.enableReportAd,
		p0.enableExplicitFeedback
	})
	local var37 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var34 (ref)
		var34.current = false
	end, {})
	local onSelectionGained = p0.onSelectionGained
	local var38 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: var31 (ref), onSelectionGained (ref)
		var31(true)
		
		if onSelectionGained then
			onSelectionGained()
		end
	end, { onSelectionGained })
	local onSelectionLost = p0.onSelectionLost
	local var39 = reactModule.useCallback(function() --[[ line: 206 ]]
		-- upvalues: var31 (ref), onSelectionLost (ref)
		var31(false)
		
		if onSelectionLost then
			onSelectionLost()
		end
	end, { onSelectionLost })
	local var40 = reactModule.useCallback(function() --[[ line: 214 ]]
		-- upvalues: var34 (ref), var36 (ref), var33 (ref), var32 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var34.current
		var34.current = true
		
		if current == false and next(var36) ~= nil then
			if var33 and not var32 then
				var33("OneByTwoTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = tostring(p0.universeId or ""),
					sortId = p0.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p0.appPage, p0.topicId, p0.universeId, var33, var32, var36
	})
	local var41 = reactModule.useCallback(function(p1, p2) --[[ line: 246 ]]
		-- upvalues: p0 (ref), var35 (ref)
		if p0.videoAnalytics then
			p0.videoAnalytics.reportVideoLoad(p0.index, var35.currentPlaybackSessionId, p1, p2)
		end
	end, { p0.videoAnalytics, var35, p0.index })
	local var42 = reactModule.useCallback(function() --[[ line: 257 ]]
		-- upvalues: p0 (ref), var35 (ref)
		if p0.videoAnalytics then
			p0.videoAnalytics.reportVideoLoop(p0.index, var35.currentPlaybackSessionId)
		end
	end, { p0.videoAnalytics, var35, p0.index })
	local var43, var44 = reactModule.useState(false)
	local var45, var46 = reactModule.useState(false)
	local var47 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p0.universeId or "", p0.pageContext or "")
	local var48 = reactModule.useCallback(function() --[[ line: 270 ]]
		-- upvalues: var46 (ref), var47 (ref)
		var46(var47())
	end, { var47 })
	local var49 = useRoactService(roactNetworking)
	local var50 = useRoactService(appSessionService)
	local var51 = useNavigation()
	local var52 = reactModule.useCallback(function() --[[ line: 278 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy), var49 (ref)
		if p0.adId then
			sponsoredGamesRecordClick(var49, p0.adId)
		end
	end, { var49, p0.adId })
	local var53 = reactModule.useCallback(function() --[[ line: 285 ]]
		-- upvalues: var34 (ref), var26 (ref), hoverTileCoordinator (copy), oneByTwoTileTelemetryModule (copy), var52 (ref), var35 (ref), videoEndReason (copy), p0 (ref), var51 (ref), appPage (copy)
		if var34.current then
			var34.current = false
			
			return
		elseif var26 then
			hoverTileCoordinator.default:reset()
		end
		oneByTwoTileTelemetryModule.logOneByTwoTileActivated()
		var52()
		var35:reset(videoEndReason.TileClicked, nil, p0.universeId, nil)
		var51.navigate(appPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p0.primaryVideoAssetId,
				imageAssetId = p0.primaryImageAssetId,
				videoPlaybackContext = p0.videoPlaybackContext
			}
		})
	end, {
		var26, var51, var35, p0.universeId, p0.primaryVideoAssetId,
		p0.primaryImageAssetId, p0.videoPlaybackContext, var52
	})
	local var54 = reactModule.useCallback(function() --[[ line: 318 ]]
		-- upvalues: oneByTwoTileTelemetryModule (copy), var52 (ref)
		oneByTwoTileTelemetryModule.logOneByTwoTileGameJoinInitiated()
		oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.GameJoin)
		var52()
	end, { var52 })
	local var55 = reactModule.useCallback(function() --[[ line: 324 ]]
		-- upvalues: oneByTwoTileTelemetryModule (copy), var52 (ref)
		oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.Clickout)
		var52()
	end, { var52 })
	local var56 = reactModule.useCallback(function(p3) --[[ line: 330 ]]
		-- upvalues: var50 (ref), setGamePlaySession (copy), sessionType (copy), var26 (ref), hoverTileCoordinator (copy), p0 (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var50 then
			setGamePlaySession(var50, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var26 then
			hoverTileCoordinator.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched({
				placeId = p0.placeId,
				universeId = p0.universeId,
				adId = p0.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				placeIdOverride = p0.placeIdOverride,
				launchDataOverride = p0.launchDataOverride
			}, p0.referralSource, "OneByTwoTile", p0.launchExperienceEventContext or "OneByTwoTile", p0.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
		end
	end, {
		var50, p0.reportExperienceLaunched, p0.placeId, p0.universeId, p0.adId,
		p0.placeIdOverride, p0.launchDataOverride, p0.referralSource,
		p0.launchExperienceEventContext, p0.index, var26
	})
	reactModule.useEffect(function() --[[ line: 373 ]]
		-- upvalues: impressionsTagUtility (copy), var24 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var24, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 375 ]]
			-- upvalues: impressionsTagUtility (copy), var24 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var24, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var57 = useValidTileBadges(p0.universeId or "", p0.topicId, p0.badgeOverride)
	local var58 = useLocalization({
		joinButtonText = "Common.VisitGame.Label.Play",
		learnButtonText = "CommonUI.Features.Label.Learn"
	})
	local var59 = if var29 then var58.learnButtonText else var58.joinButtonText
	local var60 = tonumber(p0.logoAspectRatio)
	local var61 = if var60 and var60 > 0 then var60 else 1
	local var62 = if var61 == 3 then var13 else var14
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var22 then
		large = var21.Padding.Medium
		headingMedium = var21.Typography.TitleLarge
		bodyMedium = var21.Typography.BodySmall
		xSmall = var21.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var21.Size.Size_800
		titleMedium = var21.Typography.TitleSmall
	else
		large = var21.Padding.Large
		headingMedium = var21.Typography.HeadingMedium
		bodyMedium = var21.Typography.BodyMedium
		xSmall = var21.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var21.Size.Size_1000
		titleMedium = var21.Typography.TitleMedium
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Tile = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.index,
			ZIndex = p0.zIndex,
			ref = var24
		}, {
			Container = reactModule.createElement("TextButton", {
				ref = var23,
				Size = p0.size or UDim2.fromScale(1, 1),
				BackgroundColor3 = var21.Color.Surface.Surface_100.Color3,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Text = "",
				AutoButtonColor = false,
				SelectionOrder = p0.SelectionOrder,
				[reactModule.Event.Activated] = var53,
				[reactModule.Event.TouchLongPress] = var40,
				[reactModule.Event.SelectionGained] = var38,
				[reactModule.Event.SelectionLost] = var39,
				[reactModule.Change.GuiState] = var37
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var21.Radius.Medium) }),
				Video = reactModule.createElement(videoDisplay, {
					muted = true,
					looped = true,
					ZIndex = 0,
					video = `rbxassetid://{p0.primaryVideoAssetId}`,
					thumbnail = `rbxassetid://{p0.primaryImageAssetId}`,
					shouldStartPlayback = var43,
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = var21.Radius.Medium,
					onVideoLoaded = var41,
					onVideoLooped = var42
				}),
				GradientOverlayBottom = reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = var21.Color.Extended.Black.Black_100.Color3
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var21.Radius.Medium) }),
					UIGradientBottom = reactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, var19),
							NumberSequenceKeypoint.new(1 - var20, var19),
							NumberSequenceKeypoint.new(1, var18)
						})
					})
				}),
				TileBadge = if var57 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var57 })
				}) else nil,
				Logo = if p0.logoImageAssetId then reactModule.createElement(image, {
					ZIndex = 2,
					Image = `rbxassetid://{p0.logoImageAssetId}`,
					Position = UDim2.new(1, -var21.Padding.Medium, 0, var21.Padding.Medium),
					AnchorPoint = Vector2.new(1, 0),
					Size = UDim2.new(var62, 0, 1, 0),
					aspectRatio = var61
				}) else nil,
				OverflowMenu = reactModule.createElement(spanTileOverflowMenuModule, {
					zIndex = 4,
					hoverKey = hoverKey,
					parentRef = var23,
					universeId = p0.universeId,
					placeId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil,
					adId = p0.adId,
					payerName = p0.payerName,
					sponsoredUserCohort = p0.sponsoredUserCohort,
					appPage = p0.appPage,
					topicId = p0.topicId,
					isSponsored = var28,
					contentType = p0.contentType,
					setGameHidden = p0.setGameHidden,
					isHovered = var26,
					isSelected = var30,
					availableMenuItems = var36
				}),
				BottomStack = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, -2 * large, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, large, 1, -large),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, large)
					}),
					TextStack = reactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							Padding = UDim.new(0, xSmall)
						}),
						Headline = if p0.headline then reactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Text = p0.headline,
							Font = headingMedium.Font,
							TextSize = headingMedium.FontSize,
							TextColor3 = var21.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top
						}) else nil,
						Subtitle = if p0.subtitle then reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Text = p0.subtitle,
							Font = bodyMedium.Font,
							TextSize = bodyMedium.FontSize,
							TextColor3 = var21.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top
						}) else nil
					}),
					CtaButton = if var29 then reactModule.createElement("TextButton", {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(0, size1000),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = var21.Color.Extended.White.White_20.Color3,
						BackgroundTransparency = var21.Color.Extended.White.White_20.Transparency,
						BorderSizePixel = 0,
						Text = var59,
						TextColor3 = var21.LightMode.ActionOverMedia.Foreground.Color3,
						Font = titleMedium.Font,
						TextSize = titleMedium.FontSize,
						[reactModule.Event.Activated] = var55
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var21.Radius.Medium) }),
						UIPadding = reactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, var21.Padding.Large),
							PaddingRight = UDim.new(0, var21.Padding.Large)
						})
					}) elseif p0.universeId then reactModule.createElement(playButton, {
						LayoutOrder = 2,
						launchSource = "OneByTwoTile",
						hidePlayableIcon = true,
						universeId = p0.universeId,
						placeId = if p0.placeIdOverride then p0.placeIdOverride else p0.placeId,
						referralSource = p0.referralSource,
						eventContext = p0.launchExperienceEventContext or "OneByTwoTile",
						playableText = var59,
						buttonSize = medium,
						preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
						onActivated = var54,
						reportExperienceLaunched = var56,
						experienceJoinData = {
							launchData = p0.launchDataOverride,
							tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
							nativeAdData = p0.adId
						}
					}) else nil
				})
			})
		}),
		VideoPlaybackDetector = reactModule.createElement(videoPlaybackDetector, {
			videoKey = hoverKey,
			itemIndex = p0.index,
			itemFrameRef = var23,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(var27, var25) else nil else nil,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var25,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else true,
			isHovered = var26,
			onPlaybackChange = var44,
			videoAnalytics = p0.videoAnalytics,
			videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = var35,
			viewportVideoAutoplayController = if p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = var45,
			onPlaybackCandidate = var48
		})
	})
end)