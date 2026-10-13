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
local tile = require(socialCarousel.Common.Enums).Tile
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

local _ = function(p1)
	-- upvalues: robloxAppEnumsModule (write)
	return if robloxAppEnumsModule == nil then false elseif p1 ~= robloxAppEnumsModule.DeviceType.Phone then p1 == robloxAppEnumsModule.DeviceType.Tablet else true
end

local _ = function(p1, p2, p3)
	-- upvalues: robloxAppEnumsModule (write)
	return if robloxAppEnumsModule == nil then false else p1 == robloxAppEnumsModule.DeviceType.Desktop and (p2 == true and p3 == nil)
end

local _ = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: tile (ref)
	if p1 == tile.Friend and p3 ~= nil then
		return if p3[p2] ~= true then if p4 then "Paused" else "Playing" else "Idle", if p9 then p6 else nil, p5, if p10 then p7 else nil, if p10 then p8 else nil
	end
	return nil, nil, nil, nil, nil
end

local _ = function(p1)
	-- upvalues: fFlagSocialCarouselInGameTitleMarquee (ref)
	return if fFlagSocialCarouselInGameTitleMarquee then p1 else nil
end

local t = {}

return function(p1)
	-- upvalues: fFlagLuaAppCompositionAlways (ref), fixCarouselTileSizeScaling (ref), useTokens (ref), useSocialCarouselContextModule (ref), useTilesSeenCollectionModule (ref), reactModule (ref), fFlagSocialCarouselShowLoadingSkeletonModule (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), useLocalization (ref), usePageSideMargin (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), useCollectionLayout (ref), fFlagSocialCarouselFixColdStartJitterModule (ref), robloxAppHooksModule (ref), useColdStartLayoutReadyModule (ref), fFlagSocialCarouselInGameTitleMarquee (ref), foundationModule (ref), robloxAppEnumsModule (write), useNavigationFocus (write), tile (ref), marqueeTextMotionModule (write), collectionViewsModule (ref), useMarqueeActiveTiles (write), tileComponentsModule (ref), t (ref), collectionCarousel (ref), fFlagLuaAppFriendsSortHeaderByPosition (ref), fFlagFlyoutHideFriendsHeaderModule (ref), fFlagEnableFlyoutFriendsHeaderFix (ref), flyoutSidePanelIXP (ref)
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
	local onMarqueeHover = nil
	local onMarqueeHoverEnd = nil
	local marqueeRunId = nil
	local var21 = false
	local var22 = false
	
	if fFlagSocialCarouselInGameTitleMarquee then
		local var23 = robloxAppHooksModule.useDeviceType()
		local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion
		local var24 = if robloxAppEnumsModule == nil then false elseif var23 ~= robloxAppEnumsModule.DeviceType.Phone then var23 == robloxAppEnumsModule.DeviceType.Tablet else true
		local var25 = useNavigationFocus()
		local var26 = if var25 == true then var3.openGameJoinCardUserId ~= nil else true
		local var27 = if robloxAppEnumsModule == nil then false else var23 == robloxAppEnumsModule.DeviceType.Desktop and (var25 == true and var3.openGameJoinCardUserId == nil)
		local tiles = var3.tiles
		local var28 = reactModule.useMemo(function()
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
		local var29 = marqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId)
		local var30 = if var5 then var5.AbsoluteSize.X else 0
		local var31 = if fFlagLuaAppCompositionAlways_1 then var14.gutter else var13.columnGap
		local var32 = if fFlagLuaAppCompositionAlways_1 then 0 else var13.sideMargin
		local var33 = if fFlagSocialCarouselFixColdStartJitterModule and not var16 then 0 elseif isLoading then (var15 or 5) + 1 elseif var3.tiles then #var3.tiles else 0
		local var34 = useMarqueeActiveTiles(var7, {
			tileCount = if isLoading or not var3.tiles then 0 else #var3.tiles,
			containerWidth = math.max(0, var30 - 2 * (var32 or 0)),
			tileWidth = if var15 > 0 and var30 > 0 then collectionViewsModule.calculateItemWidth(var15, var31 or 0, var32 or 0, var30, (if (var15 or 0) < math.min(var13.maxTilesToShow or var33, var33) then if fFlagLuaAppCompositionAlways_1 then 0 else var13.fractionalItemAmount or 0 else 0) or 0, (if fFlagLuaAppCompositionAlways_1 then var14.carouselPeek else 0) or 0) else 0,
			columnGap = var31 or 0,
			tiles = var28,
			direction = var29,
			reducedMotion = reducedMotion,
			idleSequenceEnabled = var24,
			hoverEnabled = var27
		})
		activeByIndex = var34.activeByIndex
		isPaused = var34.isPaused or var26
		onMarqueeFinished = var34.onMarqueeFinished
		onMarqueeHover = var34.onMarqueeHover
		onMarqueeHoverEnd = var34.onMarqueeHoverEnd
		marqueeRunId = var34.marqueeRunId
		var21 = var24
		var22 = var27
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
				-- upvalues: selectionOrderBase (ref), fFlagSocialCarouselInGameTitleMarquee (copy), activeByIndex (write), isPaused (write), marqueeRunId (write), onMarqueeFinished (write), onMarqueeHover (write), onMarqueeHoverEnd (write), var21 (write), var22 (write), tile (copy), tileComponentsModule (copy), p1 (ref)
				local var29 = if selectionOrderBase then selectionOrderBase + p3 else nil
				local var30 = nil
				local var31 = nil
				local var32 = nil
				local var33 = nil
				local var34 = nil
				
				if fFlagSocialCarouselInGameTitleMarquee then
					local var35, var36, var37, var38, var39
					local tileType = p2.tileType
					local var40 = activeByIndex
					local var41 = isPaused
					local var42 = marqueeRunId
					local var43 = onMarqueeFinished
					local var44 = onMarqueeHover
					local var45 = onMarqueeHoverEnd
					local var46 = var21
					local var47 = var22
					
					if tileType == tile.Friend and var40 ~= nil then
						local var48 = if var40[p3] ~= true then if var41 then "Paused" else "Playing" else "Idle"
						local var49 = if var46 then var43 else nil
						local var50 = if var47 then var44 else nil
						local var51 = if var47 then var45 else nil
						var35 = var48
						var36 = var49
						var37 = var42
						var38 = var50
						var39 = var51
					else
						var35 = nil
						var36 = nil
						var37 = nil
						var38 = nil
						var39 = nil
					end
					var30 = var35
					var31 = var36
					var32 = var37
					var33 = var38
					var34 = var39
				end
				return tileComponentsModule[p2.tileType](p2, p3, p4, var29, function(p5, p6)
					-- upvalues: p1 (copy), p2 (ref)
					if p1.onTileContentChanged then
						p1.onTileContentChanged(p5, p6, p2)
					end
				end, if fFlagSocialCarouselInGameTitleMarquee then var30 else nil, if fFlagSocialCarouselInGameTitleMarquee then var31 else nil, if fFlagSocialCarouselInGameTitleMarquee then var32 else nil, if fFlagSocialCarouselInGameTitleMarquee then var33 else nil, if fFlagSocialCarouselInGameTitleMarquee then var34 else nil), p2.tileType
			end, {
				selectionOrderBase, p1.onTileContentChanged,
				if fFlagSocialCarouselInGameTitleMarquee then activeByIndex else nil,
				if fFlagSocialCarouselInGameTitleMarquee then isPaused else nil,
				if fFlagSocialCarouselInGameTitleMarquee then onMarqueeFinished else nil,
				if fFlagSocialCarouselInGameTitleMarquee then marqueeRunId else nil,
				if fFlagSocialCarouselInGameTitleMarquee then onMarqueeHover else nil,
				if fFlagSocialCarouselInGameTitleMarquee then onMarqueeHoverEnd else nil,
				if fFlagSocialCarouselInGameTitleMarquee then var21 else nil,
				if fFlagSocialCarouselInGameTitleMarquee then var22 else nil
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
					local var29 = absoluteSize.X / var15
					local x = var7.current.CanvasPosition.X
					local maxValue = math.max(1, math.floor(x / var29) + 1)
					local minValue = math.min(#var3.tiles, math.ceil((x + absoluteSize.X) / var29))
					var8.current = { startIndex = maxValue, endIndex = minValue }
					
					for i = maxValue, minValue do
						local var30 = var3.tiles[i]
						
						if var30 and var30.id then
							var4.addTileToCollection(var30.id, i, var30)
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