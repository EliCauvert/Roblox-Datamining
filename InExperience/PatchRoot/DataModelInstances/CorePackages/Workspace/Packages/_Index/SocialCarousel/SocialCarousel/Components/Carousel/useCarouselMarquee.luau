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
local Tile = require(SocialCarousel.Common.Enums).Tile
local FFlagSocialCarouselFixColdStartJitterModule = require(SocialCarousel.Flags.FFlagSocialCarouselFixColdStartJitter)

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
	useCarouselMarquee = function(p1, p2, p3, p4)
		-- upvalues: RobloxAppHooksModule (copy), FoundationModule (copy), RobloxAppEnumsModule (copy), UseNavigationFocusFunction (copy), ReactModule (copy), CreateMarqueeSessionStoreModule (copy), Tile (copy), MarqueeTextMotionModule (copy), FFlagSocialCarouselFixColdStartJitterModule (copy), CollectionViewsModule (copy), UseMarqueeActiveTilesFunction (copy)
		local UseDeviceTypeResult = RobloxAppHooksModule.useDeviceType()
		local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
		local IsUseDeviceTypeResultMatch: boolean = UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Phone or UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Tablet
		local UseNavigationFocusResult = UseNavigationFocusFunction()
		local IsNotUseNavigationFocusResult: boolean = UseNavigationFocusResult ~= true or p3 ~= nil
		local DesktopEnabled: boolean = UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Desktop and UseNavigationFocusResult == true and p3 == nil
		local ConsoleEnabled: boolean = UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Console and UseNavigationFocusResult == true and p3 == nil
		local DesktopEnabled1: boolean = DesktopEnabled or ConsoleEnabled
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CreateMarqueeSessionStoreModule (upval)
			return CreateMarqueeSessionStoreModule()
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseNavigationFocusResult (copy), UseMemoResult (copy)
			if UseNavigationFocusResult == true then
				UseMemoResult.notifyHomeFocused()
			end
		end, { UseNavigationFocusResult, UseMemoResult })
		local X = if p4.containerFrame then p4.containerFrame.AbsoluteSize.X else 0
		local Gutter = if p4.appCompositionEnabled then p4.gutter else p4.columnGap
		local SideMargin = if p4.appCompositionEnabled then 0 else p4.sideMargin
		local CountP7: number = if FFlagSocialCarouselFixColdStartJitterModule and not p4.isColdStartLayoutReady then 0 elseif p4.showSkeleton then (p4.itemsPerRow or p4.defaultSkeletonCount) + 1 elseif p2 then #p2 else 0
		local Smallest = math.min(p4.maxTilesToShow or CountP7, CountP7)
		local FractionalItemAmount = if p4.appCompositionEnabled then 0 else p4.fractionalItemAmount or 0
		local FractionalItemAmount1 = if (p4.itemsPerRow or 0) < Smallest then FractionalItemAmount else 0
		local CarouselPeek = if p4.appCompositionEnabled then p4.carouselPeek else 0
		local UseMarqueeActiveTilesResult = UseMarqueeActiveTilesFunction(p1, {
			tileCount = if p4.showSkeleton or not p2 then 0 else #p2,
			containerWidth = math.max(0, X - 2 * (SideMargin or 0)),
			tileWidth = if p4.itemsPerRow > 0 and X > 0 then CollectionViewsModule.calculateItemWidth(p4.itemsPerRow, Gutter or 0, SideMargin or 0, X, FractionalItemAmount1 or 0, CarouselPeek or 0) else 0,
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
			manualMarqueeEnabled = DesktopEnabled1,
			loopsRemainingStore = UseMemoResult
		})
		
		return {
			activeByIndex = UseMarqueeActiveTilesResult.activeByIndex,
			isPaused = UseMarqueeActiveTilesResult.isPaused or IsNotUseNavigationFocusResult,
			onMarqueeFinished = UseMarqueeActiveTilesResult.onMarqueeFinished,
			onManualMarqueeStart = UseMarqueeActiveTilesResult.onManualMarqueeStart,
			onManualMarqueeEnd = UseMarqueeActiveTilesResult.onManualMarqueeEnd,
			marqueeRunId = UseMarqueeActiveTilesResult.marqueeRunId,
			handsOff = IsUseDeviceTypeResultMatch,
			desktopEnabled = DesktopEnabled,
			consoleEnabled = ConsoleEnabled
		}
	end
}