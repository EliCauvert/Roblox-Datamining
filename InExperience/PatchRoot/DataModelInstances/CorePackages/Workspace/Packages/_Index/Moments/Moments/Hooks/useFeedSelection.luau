local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Moments.Components.Feed.FeedTypes)
local CreateMockFeedSourceModule = require(Moments.Components.Feed.Sources.createMockFeedSource)
local FollowingFeedStateModule = require(Moments.Components.FollowingFeedState)
local MomentsFeedTypeModule = require(Moments.Enums.MomentsFeedType)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local CreateFollowingFeedSourceModule = require(Moments.Stores.GetMomentsStore.createFollowingFeedSource)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local GetFFlagArgusStudioMockFeedModule = require(Moments.Flags.GetFFlagArgusStudioMockFeed)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)

local function _(Trending)
	-- upvalues: FFlagMomentsNavigationEventModule (copy), MomentsFeedTypeModule (copy), NavigationDestinationTypeModule (copy)
	return if FFlagMomentsNavigationEventModule and Trending == MomentsFeedTypeModule.Trending then NavigationDestinationTypeModule.Trending else nil
end

local _ = function()
	-- upvalues: IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceModule (copy), CreateFollowingFeedSourceModule (copy)
	return if IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceModule() else CreateFollowingFeedSourceModule()
end

return function(p1)
	-- upvalues: ReactModule (copy), MomentsFeedTypeModule (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceModule (copy), CreateFollowingFeedSourceModule (copy), FollowingFeedStateModule (copy)
	local RefreshFeedFunction = p1.refreshFeed
	local FlushViewFunction = p1.flushView
	local UseStateResult, UseStateResult2 = ReactModule.useState(MomentsFeedTypeModule.Trending)
	local UseRefResult = ReactModule.useRef(UseStateResult)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), RefreshFeedFunction (copy), FFlagMomentsNavigationEventModule (upval), MomentsFeedTypeModule (upval), NavigationDestinationTypeModule (upval), FlushViewFunction (copy), UseStateResult2 (copy)
		if UseRefResult.current == Current then
			RefreshFeedFunction(if FFlagMomentsNavigationEventModule and Current == MomentsFeedTypeModule.Trending then NavigationDestinationTypeModule.Trending else nil)
			
			return
		else
			FlushViewFunction(if FFlagMomentsNavigationEventModule and Current == MomentsFeedTypeModule.Trending then NavigationDestinationTypeModule.Trending else nil)
			UseRefResult.current = Current
			UseStateResult2(Current)
		end
	end, { RefreshFeedFunction, FlushViewFunction })
	local IsUseStateResultMatch = UseStateResult == MomentsFeedTypeModule.Following
	
	if IsUseStateResultMatch and UseRefResult1.current == nil then
		UseRefResult1.current = if IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceModule() else CreateFollowingFeedSourceModule()
	end
	local Current = UseRefResult1.current
	local Current1 = if IsUseStateResultMatch and Current ~= nil then Current else p1.trendingSource
	local TrendingTelemetry = if IsUseStateResultMatch then nil else p1.trendingTelemetry
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsUseStateResultMatch (copy), UseResult1 (copy), MomentsFeedTypeModule (upval), ReactModule (upval), FollowingFeedStateModule (upval)
		if IsUseStateResultMatch then
			local function onViewRecommended()
				-- upvalues: UseResult1 (upval), MomentsFeedTypeModule (upval)
				UseResult1(MomentsFeedTypeModule.Trending)
			end
			
			return {
				emptyState = ReactModule.createElement(FollowingFeedStateModule, { variant = "empty", onViewRecommended = onViewRecommended }),
				caughtUpState = ReactModule.createElement(FollowingFeedStateModule, {
					variant = "caughtUp",
					onViewRecommended = onViewRecommended
				})
			}
		else
			return {}
		end
	end, { IsUseStateResultMatch, UseResult1 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), UseResult (copy), UseResult1 (copy), Current1 (copy), TrendingTelemetry (copy), UseMemoResult (copy)
		return {
			selected = UseStateResult,
			getSelected = UseResult,
			select = UseResult1,
			source = Current1,
			telemetry = TrendingTelemetry,
			emptyState = UseMemoResult.emptyState,
			caughtUpState = UseMemoResult.caughtUpState
		}
	end, {
		UseStateResult, UseResult, UseResult1, Current1, TrendingTelemetry,
		UseMemoResult
	})
end