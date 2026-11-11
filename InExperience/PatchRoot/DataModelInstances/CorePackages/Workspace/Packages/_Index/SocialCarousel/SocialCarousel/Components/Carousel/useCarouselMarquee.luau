local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local FoundationModule = require(Parent.Foundation)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseMarqueeActiveTilesFunction = require(script.Parent.useMarqueeActiveTiles).useMarqueeActiveTiles
local MarqueeTextMotionModule = require(SocialCarousel.Components.MarqueeText.MarqueeTextMotion)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local CreateMarqueeSessionStoreModule = require(SocialCarousel.Stores.MarqueeSession.createMarqueeSessionStore)
local GetMarqueeSessionStoreFunction = require(SocialCarousel.Stores.MarqueeSession.getMarqueeSessionStore).getMarqueeSessionStore
local _ = require(SocialCarousel.Stores.MarqueeSession.MarqueeScrollContext)
local Tile = require(SocialCarousel.Common.Enums).Tile
local FFlagSocialCarouselFixColdStartJitterModule = require(SocialCarousel.Flags.FFlagSocialCarouselFixColdStartJitter)
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local t = {}

local function _(Enabled, p1): boolean
	return Enabled ~= true or p1 ~= nil
end

local _ = function(Phone): boolean
	-- upvalues: RobloxAppEnumsModule (copy)
	return Phone == RobloxAppEnumsModule.DeviceType.Phone or Phone == RobloxAppEnumsModule.DeviceType.Tablet
end

local _ = function(Desktop, Enabled, p1): boolean
	-- upvalues: RobloxAppEnumsModule (copy)
	return Desktop == RobloxAppEnumsModule.DeviceType.Desktop and Enabled == true and p1 == nil
end

local _ = function(Console, Enabled, p1): boolean
	-- upvalues: RobloxAppEnumsModule (copy)
	return Console == RobloxAppEnumsModule.DeviceType.Console and Enabled == true and p1 == nil
end

return {
	useCarouselMarquee = function(p1, p2, JoinPopoverUserId, p3, JoinPopoverUserIdRef, JoinSheetUserIdRef, p4, Enabled)
		-- upvalues: RobloxAppHooksModule (copy), FoundationModule (copy), UseNavigationFocusFunction (copy), RobloxAppEnumsModule (copy), ReactModule (copy), CreateMarqueeSessionStoreModule (copy), GetMarqueeSessionStoreFunction (copy), FFlagSocialCarouselInGameTitleMarquee (copy), Tile (copy), MarqueeTextMotionModule (copy), FFlagSocialCarouselFixColdStartJitterModule (copy), CollectionViewsModule (copy), UseMarqueeActiveTilesFunction (copy), t (copy)
		local UseDeviceTypeResult = RobloxAppHooksModule.useDeviceType()
		local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
		local UseNavigationFocusResult = UseNavigationFocusFunction()
		local IsNotUseNavigationFocusResult: boolean = UseNavigationFocusResult ~= true or JoinPopoverUserId ~= nil
		local IsEnabled = Enabled == true
		local IsUseDeviceTypeResultMatch: boolean = IsEnabled and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Phone or UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Tablet)
		local NoJoinPopoverUserId: boolean = IsEnabled and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Desktop and UseNavigationFocusResult == true and JoinPopoverUserId == nil)
		local NoJoinPopoverUserId1: boolean = IsEnabled and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Console and UseNavigationFocusResult == true and JoinPopoverUserId == nil)
		local NoJoinPopoverUserId2: boolean = NoJoinPopoverUserId or NoJoinPopoverUserId1
		local IsUseDeviceTypeResultMatch1: boolean = IsEnabled and (UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Phone or UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Tablet)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CreateMarqueeSessionStoreModule (upval)
			return CreateMarqueeSessionStoreModule()
		end, {})
		local MarqueeSessionStore = if IsEnabled and p4 ~= nil then GetMarqueeSessionStoreFunction(p4) else UseMemoResult
		local UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(false)
		local UseRefResult2 = ReactModule.useRef(0)
		
		if not UseRefResult1.current then
			UseRefResult1.current = true
			
			if IsEnabled then
				UseRefResult2.current = MarqueeSessionStore.beginMount()
				local CurrentScroll = MarqueeSessionStore.getCurrentScroll()
				local HeldScroll = MarqueeSessionStore.getHeldScroll()
				
				if IsNotUseNavigationFocusResult and CurrentScroll ~= nil then
					UseRefResult.current = CurrentScroll
					MarqueeSessionStore.holdCurrentScroll()
				elseif HeldScroll ~= nil then
					UseRefResult.current = HeldScroll
					MarqueeSessionStore.discardHeldScroll()
				end
			end
		end
		local UseRefResult3 = ReactModule.useRef(MarqueeSessionStore)
		UseRefResult3.current = MarqueeSessionStore
		local UseRefResult4 = ReactModule.useRef(IsNotUseNavigationFocusResult)
		UseRefResult4.current = IsNotUseNavigationFocusResult
		local UseRefResult5 = ReactModule.useRef(IsEnabled)
		UseRefResult5.current = IsEnabled
		ReactModule.useEffect(function()
			-- upvalues: UseNavigationFocusResult (copy), FFlagSocialCarouselInGameTitleMarquee (upval), JoinSheetUserIdRef (copy), MarqueeSessionStore (copy)
			if UseNavigationFocusResult == true then
				if FFlagSocialCarouselInGameTitleMarquee and JoinSheetUserIdRef ~= nil then
					JoinSheetUserIdRef.current = nil
				end
				MarqueeSessionStore.notifyHomeFocused()
			end
		end, {
			UseNavigationFocusResult,
			MarqueeSessionStore,
			if FFlagSocialCarouselInGameTitleMarquee then JoinSheetUserIdRef else nil
		})
		ReactModule.useEffect(function()
			-- upvalues: IsEnabled (copy), IsNotUseNavigationFocusResult (copy), MarqueeSessionStore (copy), UseRefResult2 (copy)
			if not IsEnabled then return end
			if IsNotUseNavigationFocusResult then
				MarqueeSessionStore.holdCurrentScroll()
				
				return
			end
			if MarqueeSessionStore.isCurrentMount(UseRefResult2.current) then
				MarqueeSessionStore.discardHeldScroll()
			end
		end, {
			IsNotUseNavigationFocusResult,
			MarqueeSessionStore,
			IsEnabled,
			UseRefResult2
		})
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult5 (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseRefResult2 (copy)
			return function()
				-- upvalues: UseRefResult5 (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseRefResult2 (upval)
				if UseRefResult5.current ~= true or not UseRefResult4.current then return end
				if UseRefResult3.current.isCurrentMount(UseRefResult2.current) then
					UseRefResult3.current.holdCurrentScroll()
				end
			end
		end, {})
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: IsEnabled (copy), UseRefResult (copy), UseRefResult3 (copy)
			return if IsEnabled then {
				initialOffsetFor = function(TileId)
					-- upvalues: UseRefResult (upval)
					local Current = UseRefResult.current
					
					return if Current == nil or Current.tileId ~= TileId then nil else Current.offset
				end,
				saveOffset = function(p5, p6)
					-- upvalues: UseRefResult3 (upval)
					UseRefResult3.current.setCurrentScroll(p5, p6)
				end,
				clearCurrentScroll = function(TileId)
					-- upvalues: UseRefResult (upval), UseRefResult3 (upval)
					local Current = UseRefResult.current
					
					if Current ~= nil and Current.tileId == TileId then
						UseRefResult.current = nil
					end
					UseRefResult3.current.clearCurrentScroll(TileId)
				end
			} else nil
		end, { IsEnabled, UseRefResult, UseRefResult3 })
		local X = if p3.containerFrame then p3.containerFrame.AbsoluteSize.X else 0
		local Gutter = if p3.appCompositionEnabled then p3.gutter else p3.columnGap
		local SideMargin = if p3.appCompositionEnabled then 0 else p3.sideMargin
		local CountP7: number = if FFlagSocialCarouselFixColdStartJitterModule and not p3.isColdStartLayoutReady then 0 elseif p3.showSkeleton then (p3.itemsPerRow or p3.defaultSkeletonCount) + 1 elseif p2 then #p2 else 0
		local Smallest = math.min(p3.maxTilesToShow or CountP7, CountP7)
		local FractionalItemAmount = if p3.appCompositionEnabled then 0 else p3.fractionalItemAmount or 0
		local FractionalItemAmount1 = if (p3.itemsPerRow or 0) < Smallest then FractionalItemAmount else 0
		local CarouselPeek = if p3.appCompositionEnabled then p3.carouselPeek else 0
		local UseMarqueeActiveTilesResult = UseMarqueeActiveTilesFunction(p1, {
			tileCount = if p3.showSkeleton or not p2 then 0 else #p2,
			containerWidth = math.max(0, X - 2 * (SideMargin or 0)),
			tileWidth = if p3.itemsPerRow > 0 and X > 0 then CollectionViewsModule.calculateItemWidth(p3.itemsPerRow, Gutter or 0, SideMargin or 0, X, FractionalItemAmount1 or 0, CarouselPeek or 0) else 0,
			columnGap = Gutter or 0,
			tiles = ReactModule.useMemo(function()
				-- upvalues: p2 (copy), Tile (upval)
				local List = {}
				
				if p2 == nil then
					return List
				end
				for _, value in ipairs(p2) do
					local Presence = value.presence
					table.insert(List, {
						id = if value.id == nil then "" else value.id,
						tileType = value.tileType,
						subtitle = if value.tileType == Tile.Friend and Presence ~= nil and Presence.userPresenceType == "InGame" then Presence.lastLocation else nil,
						presence = if Presence == nil then nil else {
							userPresenceType = Presence.userPresenceType,
							lastLocation = Presence.lastLocation
						}
					})
				end
				return List
			end, { p2 }),
			direction = MarqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId),
			reducedMotion = ReducedMotion,
			idleSequenceEnabled = IsUseDeviceTypeResultMatch,
			manualMarqueeEnabled = NoJoinPopoverUserId2,
			homeBlurredOrJoinCardOpen = IsNotUseNavigationFocusResult,
			joinPopoverUserId = JoinPopoverUserId,
			joinPopoverUserIdRef = JoinPopoverUserIdRef,
			joinSheetUserIdRef = JoinSheetUserIdRef,
			isDesktop = UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Desktop,
			loopsRemainingStore = MarqueeSessionStore,
			restoredTileId = if UseRefResult.current == nil then nil else UseRefResult.current.tileId,
			marqueeEnabled = IsEnabled
		})
		
		return {
			activeByIndex = if IsEnabled then UseMarqueeActiveTilesResult.activeByIndex else t,
			isPaused = UseMarqueeActiveTilesResult.isPaused or IsNotUseNavigationFocusResult,
			onMarqueeFinished = if IsEnabled then UseMarqueeActiveTilesResult.onMarqueeFinished else nil,
			onManualMarqueeStart = if IsEnabled then UseMarqueeActiveTilesResult.onManualMarqueeStart else nil,
			onManualMarqueeEnd = if IsEnabled then UseMarqueeActiveTilesResult.onManualMarqueeEnd else nil,
			marqueeRunId = if IsEnabled then UseMarqueeActiveTilesResult.marqueeRunId else nil,
			handsOff = IsUseDeviceTypeResultMatch,
			desktopEnabled = NoJoinPopoverUserId,
			consoleEnabled = NoJoinPopoverUserId1,
			marqueeShortTitlesEnabled = IsUseDeviceTypeResultMatch1,
			scrollContext = UseMemoResult1
		}
	end
}