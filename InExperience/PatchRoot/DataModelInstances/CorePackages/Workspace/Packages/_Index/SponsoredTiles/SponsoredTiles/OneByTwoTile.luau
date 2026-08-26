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
local var1 = luaAppOneByTwoTileLogoWidthPercentLandscape / 100
local var2 = luaAppOneByTwoTileLogoWidthPercentSquare / 100
local var3 = luaAppOneByTwoTileGradientBottomTransparencyPercent / 100
local var4 = luaAppOneByTwoTileGradientTopTransparencyPercent / 100
local var5 = luaAppOneByTwoTileGradientBottomHeightPercent / 100

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), omniRecommendationsContentType (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), gameCollectionItemTypes (ref), useTagAsSponsoredAdViewabilityCandidate (ref), videoPlaybackCoordinator (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useNavigation (ref), useLocalization (ref), discoveryAnalyticsModule (ref), sponsoredGamesRecordClick (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), oneByTwoTileTelemetryModule (ref), videoEndReason (ref), appPage (ref), impressionsTagUtility (ref), useValidTileBadges (ref), var1 (ref), var2 (ref), buttonSize (ref), videoDisplay (ref), var4 (ref), var5 (ref), var3 (ref), gameTileThumbnailBadges (ref), image (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), playButton (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local var6 = useTokens()
	local var7 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local hoverKey = p1.hoverKey
	local var10 = responsiveModule.useLastInput() ~= responsiveModule.Input.Touch
	local var11 = useIsHoveredTile(var8, hoverKey, var10)
	local var12 = responsiveModule.usePreferredInput()
	local var13 = p1.adId ~= nil and p1.adId ~= ""
	local var14 = p1.contentType == omniRecommendationsContentType.AdLink
	
	if var14 then
		assert(p1.clickoutUrl ~= nil and p1.clickoutUrl ~= "", "OneByTwoTile AdLink requires clickoutUrl")
	else
		assert(p1.universeId ~= nil and p1.universeId ~= "", "OneByTwoTile Game requires universeId")
	end
	local var15, var16 = reactModule.useState(false)
	local var17 = useOverflowMenuOpen(hoverKey)
	local var18 = useTriggerFeedback()
	local var19 = reactModule.useRef(false)
	useTagAsViewportAutoplayCandidate(var8, p1.videoPlaybackContext, true, nil)
	local var20 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useRef(nil) else nil
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var8, if var13 then {
			mediaType = "video",
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
			videoPlaybackStateRef = var20,
			videoSource = `rbxassetid://{p1.primaryVideoAssetId}`
		} else nil)
	end
	local large, headingMedium, bodyMedium, size800, size500, xSmall, medium, size1000, titleMedium
	local var21 = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	local var22 = reactModule.useMemo(function()
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), var13 (ref), p1 (ref), var14 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = var13,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableExplicitFeedback = if var14 then nil else p1.enableExplicitFeedback
		})
	end, {
		var13,
		var14,
		p1.enableSponsoredFeedback,
		p1.enableReportAd,
		p1.enableExplicitFeedback
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19.current = false
	end, {})
	local onSelectionGained = p1.onSelectionGained
	local var24 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), onSelectionGained (ref)
		var16(true)
		
		if onSelectionGained then
			onSelectionGained()
		end
	end, { onSelectionGained })
	local onSelectionLost = p1.onSelectionLost
	local var25 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), onSelectionLost (ref)
		var16(false)
		
		if onSelectionLost then
			onSelectionLost()
		end
	end, { onSelectionLost })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var22 (ref), var18 (ref), var17 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), p1 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var19.current
		var19.current = true
		
		if current == false and next(var22) ~= nil then
			if var18 and not var17 then
				var18("OneByTwoTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = tostring(p1.universeId or ""),
					sortId = p1.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, p1.universeId, var18, var17, var22
	})
	local var27 = reactModule.useRef(0)
	local var28 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var27 (ref), p1 (ref), var21 (ref)
		var27.current = 0
		
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoad(p1.index, var21.currentPlaybackSessionId, p2, p3)
		end
	end, { p1.videoAnalytics, var21, p1.index })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), p1 (ref), var21 (ref)
		var27.current = 0
		
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoop(p1.index, var21.currentPlaybackSessionId)
		end
	end, { p1.videoAnalytics, var21, p1.index })
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref)
		var27.current = p2
	end, {})
	local var31, var32 = reactModule.useState(false)
	local var33 = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
	reactModule.useEffect(function()
		-- upvalues: var33 (ref), var32 (ref)
		if var33 then
			var32(false)
		end
	end, { var33 })
	local var34, var35 = reactModule.useState(false)
	local var36 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p1.universeId or "", p1.pageContext or "")
	local var37 = reactModule.useCallback(function()
		-- upvalues: var35 (ref), var36 (ref)
		var35(var36())
	end, { var36 })
	local var38 = useRoactService(roactNetworking)
	local var39 = useRoactService(appSessionService)
	local var40 = useNavigation()
	local var41 = if var14 then p1.ctaText elseif p1.ctaText ~= "" then useLocalization({ joinButtonText = "Common.VisitGame.Label.Play" }).joinButtonText else p1.ctaText
	local var42 = var14 and (p1.clickoutUrl ~= nil and (p1.clickoutUrl ~= "" and var41 ~= ""))
	local launchExperienceEventContext = p1.launchExperienceEventContext or discoveryAnalyticsModule.Constants.Context.ExperienceTile
	local var43 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sponsoredGamesRecordClick (copy), var38 (ref)
		if p1.adId then
			sponsoredGamesRecordClick(var38, p1.adId)
		end
	end, { var38, p1.adId })
	local var44 = reactModule.useCallback(function(p2)
		-- upvalues: var39 (ref), setGamePlaySession (copy), sessionType (copy), var11 (ref), hoverTileCoordinator (copy), p1 (ref), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var39 then
			setGamePlaySession(var39, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var11 then
			hoverTileCoordinator.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = p1.placeId,
				universeId = p1.universeId,
				adId = p1.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.referralSource, "OneByTwoTile", launchExperienceEventContext, p1.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end
	end, {
		var39, p1.reportExperienceLaunched, p1.placeId, p1.universeId, p1.adId,
		p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		launchExperienceEventContext, p1.index, var11
	})
	local var45 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var11 (ref), hoverTileCoordinator (copy), oneByTwoTileTelemetryModule (copy), var27 (ref), var21 (ref), videoEndReason (copy), p1 (ref), var40 (ref), appPage (copy), gameCollectionItemTypes (copy), launchExperienceEventContext (ref)
		if var19.current then
			var19.current = false
			
			return
		elseif var11 then
			hoverTileCoordinator.default:reset()
		end
		oneByTwoTileTelemetryModule.logOneByTwoTileActivated()
		local current = var27.current
		var21:reset(videoEndReason.TileClicked, nil, p1.universeId, nil)
		var40.navigate(appPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p1.primaryVideoAssetId,
				imageAssetId = p1.primaryImageAssetId,
				startPlaybackProgress = current,
				attributionThumbnailAssetId = p1.attributionThumbnailAssetId,
				videoPlaybackContext = p1.videoPlaybackContext,
				title = p1.headline,
				subtitle = p1.subtitle,
				contentType = p1.contentType,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				adId = p1.adId,
				enableReportAd = p1.enableReportAd,
				clickoutUrl = p1.clickoutUrl,
				ctaText = p1.ctaText,
				universeId = p1.universeId,
				index = p1.index,
				placeId = p1.placeId,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride,
				referralSource = p1.referralSource,
				source = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				launchExperienceEventContext = launchExperienceEventContext,
				reportGameDetailOpened = p1.reportGameDetailOpened,
				reportExperienceLaunched = p1.reportExperienceLaunched
			}
		})
	end, {
		var11, var40, var21, p1.universeId, p1.primaryVideoAssetId,
		p1.primaryImageAssetId, p1.attributionThumbnailAssetId,
		p1.videoPlaybackContext, p1.headline, p1.subtitle, p1.contentType,
		p1.payerName, p1.sponsoredUserCohort, p1.adId, p1.enableReportAd,
		p1.clickoutUrl, p1.ctaText, p1.placeId, p1.placeIdOverride,
		p1.launchDataOverride, p1.referralSource, launchExperienceEventContext,
		p1.index, p1.reportGameDetailOpened, p1.reportExperienceLaunched
	})
	local var46 = reactModule.useCallback(function()
		-- upvalues: oneByTwoTileTelemetryModule (copy), var43 (ref)
		oneByTwoTileTelemetryModule.logOneByTwoTileGameJoinInitiated()
		oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.GameJoin)
		var43()
	end, { var43 })
	local var47 = reactModule.useCallback(function()
		-- upvalues: var42 (ref), oneByTwoTileTelemetryModule (copy), var43 (ref), var40 (ref), appPage (copy), p1 (ref)
		if var42 then
			oneByTwoTileTelemetryModule.logOneByTwoTileCtaActivated(oneByTwoTileTelemetryModule.CtaType.Clickout)
			var43()
			var40.navigate(appPage.GenericWebPage, {
				detail = p1.clickoutUrl,
				extraProps = { showDomainAsTitle = true }
			})
			
			return
		end
	end, { var42, var40, p1.clickoutUrl, var43 })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var9 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var9, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var9 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var9, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var48 = useValidTileBadges(p1.universeId or "", p1.topicId, p1.badgeOverride)
	local var49 = tonumber(p1.logoAspectRatio)
	local var50 = if var49 and var49 > 0 then var49 else 1
	local var51 = if var50 == 3 then var1 else var2
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var7 then
		large = var6.Padding.Medium
		headingMedium = var6.Typography.TitleLarge
		bodyMedium = var6.Typography.BodySmall
		size800 = var6.Size.Size_600
		size500 = var6.Size.Size_500
		xSmall = var6.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var6.Size.Size_800
		titleMedium = var6.Typography.TitleSmall
	else
		large = var6.Padding.Large
		headingMedium = var6.Typography.HeadingMedium
		bodyMedium = var6.Typography.BodyMedium
		size800 = var6.Size.Size_800
		size500 = var6.Size.Size_500
		xSmall = var6.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var6.Size.Size_1000
		titleMedium = var6.Typography.TitleMedium
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Tile = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.index,
			ZIndex = p1.zIndex,
			ref = var9
		}, {
			Container = reactModule.createElement("TextButton", {
				ref = var8,
				Size = p1.size or UDim2.fromScale(1, 1),
				BackgroundColor3 = var6.Color.Surface.Surface_100.Color3,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Text = "",
				AutoButtonColor = false,
				SelectionOrder = p1.SelectionOrder,
				[reactModule.Event.Activated] = var45,
				[reactModule.Event.TouchLongPress] = var26,
				[reactModule.Event.SelectionGained] = var24,
				[reactModule.Event.SelectionLost] = var25,
				[reactModule.Change.GuiState] = var23
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) }),
				Video = reactModule.createElement(videoDisplay, {
					muted = true,
					looped = true,
					ZIndex = 0,
					video = `rbxassetid://{p1.primaryVideoAssetId}`,
					thumbnail = `rbxassetid://{p1.primaryImageAssetId}`,
					shouldStartPlayback = var31,
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = var6.Radius.Medium,
					onVideoLoaded = var28,
					onVideoLooped = var29,
					onVideoProgressChanged = var30,
					videoPlaybackStateRef = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var13 then var20 else nil
				}),
				GradientOverlayBottom = reactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = var6.Color.Extended.Black.Black_100.Color3
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) }),
					UIGradientBottom = reactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, var4),
							NumberSequenceKeypoint.new(1 - var5, var4),
							NumberSequenceKeypoint.new(1, var3)
						})
					})
				}),
				TileBadge = if var48 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var48 })
				}) else nil,
				Logo = if p1.logoImageAssetId then reactModule.createElement(image, {
					tag = "anchor-top-right",
					ZIndex = 2,
					Image = `rbxassetid://{p1.logoImageAssetId}`,
					Position = UDim2.new(1, -var6.Padding.Medium, 0, var6.Padding.Medium),
					Size = UDim2.new(var51, 0, 1, 0),
					aspectRatio = var50
				}) else nil,
				OverflowMenu = reactModule.createElement(spanTileOverflowMenuModule, {
					zIndex = 4,
					hoverKey = hoverKey,
					parentRef = var8,
					universeId = p1.universeId,
					placeId = if fFlagLuaAppNotInterestedReportPlaceId then p1.placeId else nil,
					adId = p1.adId,
					payerName = p1.payerName,
					sponsoredUserCohort = p1.sponsoredUserCohort,
					appPage = p1.appPage,
					topicId = p1.topicId,
					isSponsored = var13,
					contentType = p1.contentType,
					setGameHidden = p1.setGameHidden,
					isHovered = var11,
					isSelected = var15,
					availableMenuItems = var22
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
						Headline = if p1.headline then reactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Size = UDim2.new(1, 0, 0, 2 * size800),
							Text = p1.headline,
							Font = headingMedium.Font,
							LineHeight = headingMedium.LineHeight,
							TextSize = headingMedium.FontSize,
							TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil,
						Subtitle = if p1.subtitle then reactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = false,
							Size = UDim2.new(1, 0, 0, size500),
							Text = p1.subtitle,
							Font = bodyMedium.Font,
							LineHeight = bodyMedium.LineHeight,
							TextSize = bodyMedium.FontSize,
							TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil
					}),
					CtaButton = if var14 then if var42 then reactModule.createElement("TextButton", {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(0, size1000),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = var6.Color.Extended.White.White_20.Color3,
						BackgroundTransparency = var6.Color.Extended.White.White_20.Transparency,
						BorderSizePixel = 0,
						Text = var41,
						TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
						Font = titleMedium.Font,
						TextSize = titleMedium.FontSize,
						[reactModule.Event.Activated] = var47
					}, {
						UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) }),
						UIPadding = reactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, var6.Padding.Large),
							PaddingRight = UDim.new(0, var6.Padding.Large)
						})
					}) else nil elseif p1.universeId then reactModule.createElement(playButton, {
						LayoutOrder = 2,
						launchSource = "OneByTwoTile",
						hidePlayableIcon = true,
						preferSecondaryPlayButton = true,
						universeId = p1.universeId,
						placeId = if p1.placeIdOverride then p1.placeIdOverride else p1.placeId,
						referralSource = p1.referralSource,
						eventContext = launchExperienceEventContext,
						playableText = var41,
						buttonSize = medium,
						onActivated = var46,
						reportExperienceLaunched = var44,
						experienceJoinData = {
							launchData = p1.launchDataOverride,
							tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
							nativeAdData = p1.adId
						}
					}) else nil
				})
			})
		}),
		VideoPlaybackDetector = if not var33 then reactModule.createElement(videoPlaybackDetector, {
			videoKey = hoverKey,
			itemIndex = p1.index,
			itemFrameRef = var8,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(var12, var10) else nil else nil,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var10,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else true,
			isHovered = var11,
			onPlaybackChange = var32,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = var21,
			viewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = var34,
			onPlaybackCandidate = var37
		}) else nil
	})
end)