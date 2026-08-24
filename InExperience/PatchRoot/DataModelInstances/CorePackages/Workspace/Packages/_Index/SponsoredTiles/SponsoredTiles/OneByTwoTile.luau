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
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
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
local luaAppOneByTwoTileLogoWidthPercentLandscape = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40)
local luaAppOneByTwoTileLogoWidthPercentSquare = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25)
local luaAppOneByTwoTileGradientBottomTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomTransparencyPercent", 25)
local luaAppOneByTwoTileGradientTopTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientTopTransparencyPercent", 100)
local luaAppOneByTwoTileGradientBottomHeightPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomHeightPercent", 50)
local var19 = luaAppOneByTwoTileLogoWidthPercentLandscape / 100
local var20 = luaAppOneByTwoTileLogoWidthPercentSquare / 100
local var21 = luaAppOneByTwoTileGradientBottomTransparencyPercent / 100
local var22 = luaAppOneByTwoTileGradientTopTransparencyPercent / 100
local var23 = luaAppOneByTwoTileGradientBottomHeightPercent / 100

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), omniRecommendationsContentType (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), gameCollectionItemTypes (ref), useTagAsSponsoredAdViewabilityCandidate (ref), videoPlaybackCoordinator (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useNavigation (ref), useLocalization (ref), discoveryAnalyticsModule (ref), sponsoredGamesRecordClick (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), oneByTwoTileTelemetryModule (ref), videoEndReason (ref), appPage (ref), impressionsTagUtility (ref), useValidTileBadges (ref), var19 (ref), var20 (ref), buttonSize (ref), videoDisplay (ref), var22 (ref), var23 (ref), var21 (ref), gameTileThumbnailBadges (ref), image (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), playButton (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local var24 = useTokens()
	local var25 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local hoverKey = p0.hoverKey
	local var28 = responsiveModule.useLastInput() ~= responsiveModule.Input.Touch
	local var29 = useIsHoveredTile(var26, hoverKey, var28)
	local var30 = responsiveModule.usePreferredInput()
	local var31 = p0.adId ~= nil and p0.adId ~= ""
	local var32 = p0.contentType == omniRecommendationsContentType.AdLink
	
	if var32 then
		assert(p0.clickoutUrl ~= nil and p0.clickoutUrl ~= "", "OneByTwoTile AdLink requires clickoutUrl")
	else
		assert(p0.universeId ~= nil and p0.universeId ~= "", "OneByTwoTile Game requires universeId")
	end
	local var33, var34 = reactModule.useState(false)
	local var35 = useOverflowMenuOpen(hoverKey)
	local var36 = useTriggerFeedback()
	local var37 = reactModule.useRef(false)
	useTagAsViewportAutoplayCandidate(var26, p0.videoPlaybackContext, true, nil)
	local var38 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useRef(nil) else nil
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var26, if var31 then {
			mediaType = "video",
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
			videoPlaybackStateRef = var38,
			videoSource = `rbxassetid://{p0.primaryVideoAssetId}`
		} else nil)
	end
	local large, headingMedium, bodyMedium, size800, size500, xSmall, medium, size1000, titleMedium
	local var39 = if p0.videoPlaybackContext then p0.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	local var40 = reactModule.useMemo(function()
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), var31 (ref), p0 (ref), var32 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = var31,
			enableSponsoredFeedback = p0.enableSponsoredFeedback,
			enableReportAd = p0.enableReportAd,
			enableExplicitFeedback = if var32 then nil else p0.enableExplicitFeedback
		})
	end, {
		var31,
		var32,
		p0.enableSponsoredFeedback,
		p0.enableReportAd,
		p0.enableExplicitFeedback
	})
	local var41 = reactModule.useCallback(function()
		-- upvalues: var37 (ref)
		var37.current = false
	end, {})
	local onSelectionGained = p0.onSelectionGained
	local var42 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), onSelectionGained (ref)
		var34(true)
		
		if onSelectionGained then
			onSelectionGained()
		end
	end, { onSelectionGained })
	local onSelectionLost = p0.onSelectionLost
	local var43 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), onSelectionLost (ref)
		var34(false)
		
		if onSelectionLost then
			onSelectionLost()
		end
	end, { onSelectionLost })
	local var44 = reactModule.useCallback(function()
		-- upvalues: var37 (ref), var40 (ref), var36 (ref), var35 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var37.current
		var37.current = true
		
		if current == false and next(var40) ~= nil then
			if var36 and not var35 then
				var36("OneByTwoTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = tostring(p0.universeId or ""),
					sortId = p0.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p0.appPage, p0.topicId, p0.universeId, var36, var35, var40
	})
	local var45 = reactModule.useRef(0)
	local var46 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var45 (ref), p0 (ref), var39 (ref)
		var45.current = 0
		
		if p0.videoAnalytics then
			p0.videoAnalytics.reportVideoLoad(p0.index, var39.currentPlaybackSessionId, p1, p2)
		end
	end, { p0.videoAnalytics, var39, p0.index })
	local var47 = reactModule.useCallback(function()
		-- upvalues: var45 (ref), p0 (ref), var39 (ref)
		var45.current = 0
		
		if p0.videoAnalytics then
			p0.videoAnalytics.reportVideoLoop(p0.index, var39.currentPlaybackSessionId)
		end
	end, { p0.videoAnalytics, var39, p0.index })
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var45 (ref)
		var45.current = p3
	end, {})
	local var49, var50 = reactModule.useState(false)
	local var51 = p0.videoPlaybackContext ~= nil and p0.videoPlaybackContext.disablePlayback == true
	reactModule.useEffect(function()
		-- upvalues: var51 (ref), var50 (ref)
		if var51 then
			var50(false)
		end
	end, { var51 })
	local var52, var53 = reactModule.useState(false)
	local var54 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p0.universeId or "", p0.pageContext or "")
	local var55 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var54 (ref)
		var53(var54())
	end, { var54 })
	local var56 = useRoactService(roactNetworking)
	local var57 = useRoactService(appSessionService)
	local var58 = useNavigation()
	local var59 = if var32 then p0.ctaText elseif p0.ctaText ~= "" then useLocalization({ joinButtonText = "Common.VisitGame.Label.Play" }).joinButtonText else p0.ctaText
	local var60 = var32 and (p0.clickoutUrl ~= nil and (p0.clickoutUrl ~= "" and var59 ~= ""))
	local launchExperienceEventContext = p0.launchExperienceEventContext or discoveryAnalyticsModule.Constants.Context.ExperienceTile
	local var62 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy), var56 (ref)
		if p0.adId then
			sponsoredGamesRecordClick(var56, p0.adId)
		end
	end, { var56, p0.adId })
	local var63 = reactModule.useCallback(function(p4)
		-- upvalues: var57 (ref), setGamePlaySession (copy), sessionType (copy), var29 (ref), hoverTileCoordinator (copy), p0 (ref), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var57 then
			setGamePlaySession(var57, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var29 then
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
			}, p0.referralSource, "OneByTwoTile", launchExperienceEventContext, p0.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p4 else nil)
		end
	end, {
		var57, p0.reportExperienceLaunched, p0.placeId, p0.universeId, p0.adId,
		p0.placeIdOverride, p0.launchDataOverride, p0.referralSource,
		launchExperienceEventContext, p0.index, var29
	})
	local var64 = reactModule.useCallback(function()
		-- upvalues: var37 (ref), var29 (ref), hoverTileCoordinator (copy), oneByTwoTileTelemetryModule (copy), var45 (ref), var39 (ref), videoEndReason (copy), p0 (ref), var58 (ref), appPage (copy), gameCollectionItemTypes (copy), launchExperienceEventContext (ref)
		if var37.current then
			var37.current = false
			
			return
		elseif var29 then
			hoverTileCoordinator.default:reset()
		end
		oneByTwoTileTelemetryModule.logOneByTwoTileActivated()
		local current = var45.current
		var39:reset(videoEndReason.TileClicked, nil, p0.universeId, nil)
		var58.navigate(appPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p0.primaryVideoAssetId,
				imageAssetId = p0.primaryImageAssetId,
				startPlaybackProgress = current,
				attributionThumbnailAssetId = p0.attributionThumbnailAssetId,
				videoPlaybackContext = p0.videoPlaybackContext,
				title = p0.headline,
				subtitle = p0.subtitle,
				contentType = p0.contentType,
				payerName = p0.payerName,
				sponsoredUserCohort = p0.sponsoredUserCohort,
				adId = p0.adId,
				enableReportAd = p0.enableReportAd,
				clickoutUrl = p0.clickoutUrl,
				ctaText = p0.ctaText,
				universeId = p0.universeId,
				index = p0.index,
				placeId = p0.placeId,
				placeIdOverride = p0.placeIdOverride,
				launchDataOverride = p0.launchDataOverride,
				referralSource = p0.referralSource,
				source = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				launchExperienceEventContext = launchExperienceEventContext,
				reportGameDetailOpened = p0.reportGameDetailOpened,
				reportExperienceLaunched = p0.reportExperienceLaunched
			}
		})
	end, {
		var29, var58, var39, p0.universeId, p0.primaryVideoAssetId,
		p0.primaryImageAssetId, p0.attributionThumbnailAssetId,
		p0.videoPlaybackContext, p0.headline, p0.subtitle, p0.contentType,
		p0.payerName, p0.sponsoredUserCohort, p0.adId, p0.enableReportAd,
		p0.clickoutUrl, p0.ctaText, p0.placeId, p0.placeIdOverride,
		p0.launchDataOverride, p0.referralSource, launchExperienceEventContext,
		p0.index, p0.reportGameDetailOpened, p0.reportExperienceLaunched
	})
	local var65 = reactModule.useCallback(function()
		-- upvalues: oneByTwoTileTelemetryModule (copy), var62 (ref)
		oneByTwoTileTelemetryModule.logOneByTwoTileGameJoinInitiated()
		oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.GameJoin)
		var62()
	end, { var62 })
	local var66 = reactModule.useCallback(function()
		-- upvalues: var60 (ref), oneByTwoTileTelemetryModule (copy), var62 (ref), var58 (ref), appPage (copy), p0 (ref)
		if var60 then
			oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.Clickout)
			var62()
			var58.navigate(appPage.GenericWebPage, {
				detail = p0.clickoutUrl,
				extraProps = { showDomainAsTitle = true }
			})
			
			return
		end
	end, { var60, var58, p0.clickoutUrl, var62 })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var27 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var27, p0.impressionsTag, p0.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var27 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var27, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var67 = useValidTileBadges(p0.universeId or "", p0.topicId, p0.badgeOverride)
	local var68 = tonumber(p0.logoAspectRatio)
	local var69 = if var68 and var68 > 0 then var68 else 1
	local var70 = if var69 == 3 then var19 else var20
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var25 then
		large = var24.Padding.Medium
		headingMedium = var24.Typography.TitleLarge
		bodyMedium = var24.Typography.BodySmall
		size800 = var24.Size.Size_600
		size500 = var24.Size.Size_500
		xSmall = var24.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var24.Size.Size_800
		titleMedium = var24.Typography.TitleSmall
	else
		large = var24.Padding.Large
		headingMedium = var24.Typography.HeadingMedium
		bodyMedium = var24.Typography.BodyMedium
		size800 = var24.Size.Size_800
		size500 = var24.Size.Size_500
		xSmall = var24.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var24.Size.Size_1000
		titleMedium = var24.Typography.TitleMedium
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Tile = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.index,
			ZIndex = p0.zIndex,
			ref = var27
		}, {
			Container = reactModule.createElement("TextButton", {
				ref = var26,
				Size = p0.size or UDim2.fromScale(1, 1),
				BackgroundColor3 = var24.Color.Surface.Surface_100.Color3,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Text = "",
				AutoButtonColor = false,
				SelectionOrder = p0.SelectionOrder,
				[reactModule.Event.Activated] = var64,
				[reactModule.Event.TouchLongPress] = var44,
				[reactModule.Event.SelectionGained] = var42,
				[reactModule.Event.SelectionLost] = var43,
				[reactModule.Change.GuiState] = var41
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var24.Radius.Medium) }),
				Video = reactModule.createElement(videoDisplay, {
					muted = true,
					looped = true,
					ZIndex = 0,
					video = `rbxassetid://{p0.primaryVideoAssetId}`,
					thumbnail = `rbxassetid://{p0.primaryImageAssetId}`,
					shouldStartPlayback = var49,
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = var24.Radius.Medium,
					onVideoLoaded = var46,
					onVideoLooped = var47,
					onVideoProgressChanged = var48,
					videoPlaybackStateRef = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var31 then var38 else nil
				}),
				GradientOverlayBottom = reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = var24.Color.Extended.Black.Black_100.Color3
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var24.Radius.Medium) }),
					UIGradientBottom = reactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, var22),
							NumberSequenceKeypoint.new(1 - var23, var22),
							NumberSequenceKeypoint.new(1, var21)
						})
					})
				}),
				TileBadge = if var67 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var67 })
				}) else nil,
				Logo = if p0.logoImageAssetId then reactModule.createElement(image, {
					tag = "anchor-top-right",
					ZIndex = 2,
					Image = `rbxassetid://{p0.logoImageAssetId}`,
					Position = UDim2.new(1, -var24.Padding.Medium, 0, var24.Padding.Medium),
					Size = UDim2.new(var70, 0, 1, 0),
					aspectRatio = var69
				}) else nil,
				OverflowMenu = reactModule.createElement(spanTileOverflowMenuModule, {
					zIndex = 4,
					hoverKey = hoverKey,
					parentRef = var26,
					universeId = p0.universeId,
					placeId = if fFlagLuaAppNotInterestedReportPlaceId then p0.placeId else nil,
					adId = p0.adId,
					payerName = p0.payerName,
					sponsoredUserCohort = p0.sponsoredUserCohort,
					appPage = p0.appPage,
					topicId = p0.topicId,
					isSponsored = var31,
					contentType = p0.contentType,
					setGameHidden = p0.setGameHidden,
					isHovered = var29,
					isSelected = var33,
					availableMenuItems = var40
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
							Size = UDim2.new(1, 0, 0, 2 * size800),
							Text = p0.headline,
							Font = headingMedium.Font,
							LineHeight = headingMedium.LineHeight,
							TextSize = headingMedium.FontSize,
							TextColor3 = var24.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil,
						Subtitle = if p0.subtitle then reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = false,
							Size = UDim2.new(1, 0, 0, size500),
							Text = p0.subtitle,
							Font = bodyMedium.Font,
							LineHeight = bodyMedium.LineHeight,
							TextSize = bodyMedium.FontSize,
							TextColor3 = var24.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil
					}),
					CtaButton = if var32 then if var60 then reactModule.createElement("TextButton", {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(0, size1000),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = var24.Color.Extended.White.White_20.Color3,
						BackgroundTransparency = var24.Color.Extended.White.White_20.Transparency,
						BorderSizePixel = 0,
						Text = var59,
						TextColor3 = var24.LightMode.ActionOverMedia.Foreground.Color3,
						Font = titleMedium.Font,
						TextSize = titleMedium.FontSize,
						[reactModule.Event.Activated] = var66
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var24.Radius.Medium) }),
						UIPadding = reactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, var24.Padding.Large),
							PaddingRight = UDim.new(0, var24.Padding.Large)
						})
					}) else nil elseif p0.universeId then reactModule.createElement(playButton, {
						LayoutOrder = 2,
						launchSource = "OneByTwoTile",
						hidePlayableIcon = true,
						universeId = p0.universeId,
						placeId = if p0.placeIdOverride then p0.placeIdOverride else p0.placeId,
						referralSource = p0.referralSource,
						eventContext = launchExperienceEventContext,
						playableText = var59,
						buttonSize = medium,
						preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
						onActivated = var65,
						reportExperienceLaunched = var63,
						experienceJoinData = {
							launchData = p0.launchDataOverride,
							tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
							nativeAdData = p0.adId
						}
					}) else nil
				})
			})
		}),
		VideoPlaybackDetector = if not var51 then reactModule.createElement(videoPlaybackDetector, {
			videoKey = hoverKey,
			itemIndex = p0.index,
			itemFrameRef = var26,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(var30, var28) else nil else nil,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var28,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else true,
			isHovered = var29,
			onPlaybackChange = var50,
			videoAnalytics = p0.videoAnalytics,
			videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = var39,
			viewportVideoAutoplayController = if p0.videoPlaybackContext then p0.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = var52,
			onPlaybackCandidate = var55
		}) else nil
	})
end)