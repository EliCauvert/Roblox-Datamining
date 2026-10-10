local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local usePageSideMargin = collectionViewsModule.usePageSideMargin
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useLocalization = localizationModule.Hooks.useLocalization
local tileComponentsModule = require(socialCarousel.Common.TileComponents)
local enumsModule = require(socialCarousel.Common.Enums)
local tile = enumsModule.Tile
local marqueePlayStatus = enumsModule.MarqueePlayStatus
local constantsModule = require(socialCarousel.Common.Constants)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local useColdStartLayoutReadyModule = require(socialCarousel.Hooks.useColdStartLayoutReady)
local useTokens = foundationModule.Hooks.useTokens
local useTilesSeenCollectionModule = require(socialCarousel.Analytics.useTilesSeenCollection)
local fFlagSocialCarouselShowLoadingSkeletonModule = require(socialCarousel.Flags.FFlagSocialCarouselShowLoadingSkeleton)
local fFlagSocialCarouselFixColdStartJitterModule = require(socialCarousel.Flags.FFlagSocialCarouselFixColdStartJitter)
local fixCarouselTileSizeScaling = game:DefineFastFlag("FixCarouselTileSizeScaling", false)
local fFlagFlyoutHideFriendsHeaderModule = require(socialCarousel.Flags.FFlagFlyoutHideFriendsHeader)
local flyoutSidePanelIXP = require(parent.SharedExperimentDefinition).FlyoutSidePanelIXP
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagEnableFlyoutFriendsHeaderFix = sharedFlagsModule.FFlagEnableFlyoutFriendsHeaderFix
local fFlagLuaAppCompositionAlways = require(parent.SharedFlags).FFlagLuaAppCompositionAlways
local fFlagLuaAppFriendsSortHeaderByPosition = sharedFlagsModule.FFlagLuaAppFriendsSortHeaderByPosition
local fFlagSocialCarouselInGameTitleMarquee = require(parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local useMarqueeActiveTiles = nil
local marqueeTextMotionModule = nil
local robloxAppEnumsModule = nil
local useNavigationFocus = nil

if fFlagSocialCarouselInGameTitleMarquee then
	useMarqueeActiveTiles = require(socialCarousel.Components.Carousel.useMarqueeActiveTiles).useMarqueeActiveTiles
	marqueeTextMotionModule = require(socialCarousel.Components.MarqueeText.MarqueeTextMotion)
	robloxAppEnumsModule = require(parent.RobloxAppEnums)
	useNavigationFocus = require(parent.Navigation).useNavigationFocus
end
local function _(p1, p2)
	return if p1 == true then p2 ~= nil else true
end

local t = {}

return function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), fFlagSocialCarouselFixColdStartJitterModule (ref), robloxAppHooksModule (ref), useColdStartLayoutReadyModule (ref), fFlagSocialCarouselInGameTitleMarquee (ref), foundationModule (ref), robloxAppEnumsModule (write), useNavigationFocus (write), tile (ref), marqueeTextMotionModule (write), collectionViewsModule (ref), useMarqueeActiveTiles (write), marqueePlayStatus (ref), tileComponentsModule (ref), t (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
	local var1
	local fFlagLuaAppCompositionAlways_1 = fFlagLuaAppCompositionAlways or p1.appCompositionEnabled
	local var2 = if fixCarouselTileSizeScaling then useTokens() else nil
	local var3 = useSocialCarouselContextModule()
	local var4 = useTilesSeenCollectionModule()
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef({ startIndex = 1, endIndex = 1 })
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	
	if fFlagSocialCarouselShowLoadingSkeletonModule then
		var1 = not var3.isLoading
		
		if var1 then
			var1 = var3.friendCount > 0
			var1 = nil
		end
	else
		var1 = var3.friendCount > 0
	end
	local var12 = useLocalization({
		friendsLabel = if not fFlagConnectionsToFriendsRename then if not var1 then constantsModule.LOCALIZATION.CONNECTIONS_LABEL else {
			constantsModule.LOCALIZATION.CONNECTIONS_LABEL_WITH_COUNT,
			connectionCount = var3.friendCount
		} elseif not var1 then constantsModule.LOCALIZATION.FRIENDS_LABEL else {
			constantsModule.LOCALIZATION.FRIENDS_LABEL_WITH_COUNT,
			friendCount = var3.friendCount
		}
	})
	local var13 = useCollectionLayoutParams(collectionItemSize.XSmall, var5, true, {
		sideMargin = if fFlagLuaAppCompositionAlways_1 then nil elseif not fFlagLuaAppCompositionAlways then usePageSideMargin(var5) else nil
	})
	local var14 = useCollectionLayout(collectionItemSize.XSmall)
	local var15 = if fFlagLuaAppCompositionAlways_1 then var14.itemsPerRow else var13.numColumns
	local var16 = false
	local var17 = nil
	
	if fFlagSocialCarouselFixColdStartJitterModule then
		local var18, var19 = reactModule.useState(Vector2.zero)
		var16 = useColdStartLayoutReadyModule(robloxAppHooksModule.useDeviceOrientation() ~= nil, robloxAppHooksModule.useScreenSize(), var18.X, var15)
		var17 = reactModule.useCallback(function(p2)
			-- upvalues: var19 (ref)
			var19(p2)
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var10 (ref), var9 (ref), var11 (ref)
		if var15 ~= var10.current then
			var10.current = var15
			var9.current = false
			
			if var11.current then
				pcall(task.cancel, var11.current)
			end
			var11.current = task.delay(0.2, function()
				-- upvalues: var9 (copy), var11 (copy)
				var9.current = true
				var11.current = nil
			end)
		end
	end, { var15 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			if var11.current then
				pcall(task.cancel, var11.current)
			end
		end
	end, {})
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: fixCarouselTileSizeScaling (copy), constantsModule (copy), var2 (ref)
		return p2 + (if fixCarouselTileSizeScaling then constantsModule.TILE_TEXT_HEIGHT * var2.Config.UI.Scale else constantsModule.TILE_TEXT_HEIGHT)
	end, {})
	local selectionOrderBase = var3.selectionOrderBase
	local isLoading = fFlagSocialCarouselShowLoadingSkeletonModule and var3.isLoading
	local activeByIndex = nil
	local isPaused = false
	local onMarqueeFinished = nil
	local marqueeRunId = nil
	
	if fFlagSocialCarouselInGameTitleMarquee then
		local var21 = robloxAppHooksModule.useDeviceType()
		local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion
		local var22 = if var21 ~= robloxAppEnumsModule.DeviceType.Phone then var21 == robloxAppEnumsModule.DeviceType.Tablet else true
		local var23 = if useNavigationFocus() == true then var3.openGameJoinCardUserId ~= nil else true
		local tiles = var3.tiles
		local var24 = reactModule.useMemo(function()
			-- upvalues: tiles (ref), tile (copy)
			local t = {}
			
			if tiles == nil then
				return t
			end
			for i, v in ipairs(tiles) do
				local presence = v.presence
				table.insert(t, {
					id = if v.id ~= nil then "" else v.id,
					tileType = v.tileType,
					subtitle = if v.tileType == tile.Friend and presence ~= nil and presence.userPresenceType == "InGame" then presence.lastLocation else nil,
					presence = if presence ~= nil then nil else {
						userPresenceType = presence.userPresenceType,
						lastLocation = presence.lastLocation
					}
				})
			end
			return t
		end, { tiles })
		local var25 = marqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId)
		local var26 = if var5 then var5.AbsoluteSize.X else 0
		local var27 = if fFlagLuaAppCompositionAlways_1 then var14.gutter else var13.columnGap
		local var28 = if fFlagLuaAppCompositionAlways_1 then 0 else var13.sideMargin
		local var29 = if fFlagSocialCarouselFixColdStartJitterModule and not var16 then 0 elseif isLoading then (var15 or 5) + 1 elseif var3.tiles then #var3.tiles else 0
		local var30 = useMarqueeActiveTiles(var7, {
			tileCount = if isLoading or not var3.tiles then 0 else #var3.tiles,
			containerWidth = math.max(0, var26 - 2 * (var28 or 0)),
			tileWidth = if var15 > 0 and var26 > 0 then collectionViewsModule.calculateItemWidth(var15, var27 or 0, var28 or 0, var26, (if (var15 or 0) < math.min(var13.maxTilesToShow or var29, var29) then if fFlagLuaAppCompositionAlways_1 then 0 else var13.fractionalItemAmount or 0 else 0) or 0, (if fFlagLuaAppCompositionAlways_1 then var14.carouselPeek else 0) or 0) else 0,
			columnGap = var27 or 0,
			tiles = var24,
			direction = var25,
			reducedMotion = reducedMotion,
			idleSequenceEnabled = var22
		})
		activeByIndex = var30.activeByIndex
		isPaused = var30.isPaused or var23
		onMarqueeFinished = var30.onMarqueeFinished
		marqueeRunId = var30.marqueeRunId
	end
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var6,
			scrollingFrameRef = var7,
			onContainerSizeChanged = if fFlagSocialCarouselFixColdStartJitterModule then var17 else nil,
			title = var12.friendsLabel,
			items = if fFlagSocialCarouselFixColdStartJitterModule and not var16 then t elseif isLoading then reactModule.useMemo(function()
				-- upvalues: fFlagSocialCarouselShowLoadingSkeletonModule (copy), var15 (ref), tile (copy)
				local t = {}
				
				if not fFlagSocialCarouselShowLoadingSkeletonModule then
					return t
				end
				for i = 1, (var15 or 5) + 1 do
					t[i] = { id = "skeleton_" .. i, tileType = tile.Skeleton }
				end
				return t
			end, { var15 }) else var3.tiles,
			renderItem = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: selectionOrderBase (ref), fFlagSocialCarouselInGameTitleMarquee (copy), tile (copy), activeByIndex (write), marqueePlayStatus (copy), isPaused (write), onMarqueeFinished (write), marqueeRunId (write), tileComponentsModule (copy), p1 (ref)
				local var25 = if selectionOrderBase then selectionOrderBase + p3 else nil
				local var26 = nil
				local var27 = nil
				local var28 = nil
				
				if fFlagSocialCarouselInGameTitleMarquee and p2.tileType == tile.Friend and activeByIndex then
					var26 = if activeByIndex[p3] ~= true then if isPaused then marqueePlayStatus.Paused else marqueePlayStatus.Playing else marqueePlayStatus.Idle
					var27 = onMarqueeFinished
					var28 = marqueeRunId
				end
				return tileComponentsModule[p2.tileType](p2, p3, p4, var25, function(p5, p6)
					-- upvalues: p1 (copy), p2 (ref)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p5, p6, p2)
					end
				end, var26, var27, var28), p2.tileType
			end, {
				selectionOrderBase, p1.onTileContentChanged,
				if fFlagSocialCarouselInGameTitleMarquee then activeByIndex else nil,
				if fFlagSocialCarouselInGameTitleMarquee then isPaused else nil,
				if fFlagSocialCarouselInGameTitleMarquee then onMarqueeFinished else nil,
				if fFlagSocialCarouselInGameTitleMarquee then marqueeRunId else nil
			}),
			getItemHeight = var20,
			collectionItemSize = if fFlagLuaAppCompositionAlways_1 then collectionItemSize.XSmall else nil,
			numColumns = if fFlagLuaAppCompositionAlways_1 then nil else var13.numColumns,
			fractionalItemAmount = if fFlagLuaAppCompositionAlways_1 then nil else var13.fractionalItemAmount,
			columnGap = if fFlagLuaAppCompositionAlways_1 then nil else var13.columnGap,
			sideMargin = if fFlagLuaAppCompositionAlways_1 then nil else var13.sideMargin,
			maxItemsToShow = var13.maxTilesToShow,
			thresholdFromEnd = var13.loadMoreThreshold,
			onViewableItemsChanged = if isLoading or fFlagSocialCarouselFixColdStartJitterModule and not var16 then nil else reactModule.useCallback(function(p2, p3)
				-- upvalues: var3 (ref), var5 (ref), var7 (ref), var9 (ref), var15 (ref), var8 (ref), var4 (ref)
				if var3.unifiedLogging then
					var3.unifiedLogging.onCollectionViewabilityChanged(p2, p3)
				end
				if var3.tiles and var5 and (var7.current and var9.current) then
					local absoluteSize = var5.AbsoluteSize
					local var25 = absoluteSize.X / var15
					local x = var7.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var25) + 1)
					local minValue = math.min(#var3.tiles, math.ceil((x + absoluteSize.X) / var25))
					var8.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var26 = var3.tiles[i]
						
						if var26 and var26.id then
							var4.addTileToCollection(var26.id, i, var26)
						end
					end
				end
			end, {
				p1.onViewableItemsChanged, var3.tiles, var5, var7, var15, var4
			}),
			onChangeCanvasPosition = if var3.unifiedLogging and not isLoading and (not fFlagSocialCarouselFixColdStartJitterModule or var16) then var3.unifiedLogging.onCollectionViewabilityChanged else nil,
			onActivateHeader = p1.onActivateHeader,
			headerComponent = if fFlagLuaAppFriendsSortHeaderByPosition then if var3.hideCarouselHeader then reactModule.createElement(reactModule.Fragment, nil, {}) else nil elseif var3.hideCarouselHeader or fFlagFlyoutHideFriendsHeaderModule and (if fFlagEnableFlyoutFriendsHeaderFix then flyoutSidePanelIXP.isFriendsSortHeaderHiddenInFlyoutIxp() else flyoutSidePanelIXP.isFlyoutSidePanelEnabled()) then reactModule.createElement(reactModule.Fragment, nil, {}) else nil
		}),
		ScreenSizeImpressionsTracker = if var3.unifiedLogging and (not fFlagSocialCarouselFixColdStartJitterModule or var16) then var3.unifiedLogging.renderImpressionsTrackerComponent(var7) else nil
	})
end