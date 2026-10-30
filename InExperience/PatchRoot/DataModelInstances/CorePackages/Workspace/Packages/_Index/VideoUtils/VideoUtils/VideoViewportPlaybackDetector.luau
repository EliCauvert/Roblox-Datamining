local ExperienceService = game:GetService("ExperienceService")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local _ = require(VideoUtils.VideoPlaybackCoordinator)
local _ = require(VideoUtils.ViewportVideoAutoplayController)
local UseTargetedWinnerModule = require(VideoUtils.useTargetedWinner)
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local FFlagVideoPlaybackDetectorCancelPendingScanTask = require(Parent.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask
local FIntVideoPlaybackDetectorScanDebounceInMilliseconds: number = require(Parent.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local UseIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(Parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local FFlagLuaAppVideoViewportTargetedWinnerSubscription = require(Parent.SharedFlags).FFlagLuaAppVideoViewportTargetedWinnerSubscription
local Signal = require(Parent.Signals).createSignal({
	instance = nil,
	shouldUseDwell = true,
	isUserIntentWinner = not FFlagLuaAppOneByTwoHoverIdleAutoplay and nil
})
local FIntVideoPlaybackDetectorScanDebounceInMillisecondsRatio = if FFlagVideoPlaybackDetectorCancelPendingScanTask then FIntVideoPlaybackDetectorScanDebounceInMilliseconds / 1000 else 0.5

return function(p1)
	-- upvalues: FFlagEnableOnScreenAPIIntegration (copy), UseIsRouteOnScreen (copy), UseNavigationFocusFunction (copy), UseSelectorFunction (copy), ReactModule (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), FFlagLuaAppVideoViewportTargetedWinnerSubscription (copy), UseTargetedWinnerModule (copy), SignalsReactModule (copy), Signal (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), VideoEndReason (copy), AppLifecycleObserverService (copy), ExperienceService (copy), FIntVideoPlaybackDetectorScanDebounceInMillisecondsRatio (copy), FFlagVideoPlaybackDetectorCancelPendingScanTask (copy)
	local UseIsRouteOnScreenResult = if FFlagEnableOnScreenAPIIntegration then UseIsRouteOnScreen() else UseNavigationFocusFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.GlobalGuiInset
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), UseSelectorResult (copy), UseSelectorResult2 (copy)
		return {
			min = Vector2.new(0, UseSelectorResult1),
			max = Vector2.new(UseSelectorResult.X, UseSelectorResult.Y - UseSelectorResult2.bottom)
		}
	end, {
		UseSelectorResult1,
		UseSelectorResult,
		UseSelectorResult2
	})
	local IsAdsPlaybackCoordinatorMatch = if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then p1.viewportVideoAutoplayController ~= nil and p1.viewportVideoAutoplayController:getAdsPlaybackCoordinator() == p1.videoPlaybackCoordinator else nil
	
	if FFlagLuaAppVideoViewportTargetedWinnerSubscription then
		UseTargetedWinnerModule(p1, UseIsRouteOnScreenResult, IsAdsPlaybackCoordinatorMatch)
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState(if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and p1.viewportVideoAutoplayController and not FFlagLuaAppVideoViewportTargetedWinnerSubscription then p1.viewportVideoAutoplayController:getWinnerStateForCoordinator(p1.videoPlaybackCoordinator) elseif p1.viewportVideoAutoplayController and not FFlagLuaAppVideoViewportTargetedWinnerSubscription then p1.viewportVideoAutoplayController.getWinnerState else Signal)
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy)
			local ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
			local Current = p1.itemFrameRef.current
			
			if not ViewportVideoAutoplayController or not ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() or not Current then return end
			ViewportVideoAutoplayController:setCandidateUserIntent(Current, p1.hasVideoPlaybackUserIntent == true)
			
			return function()
				-- upvalues: ViewportVideoAutoplayController (copy), Current (copy)
				ViewportVideoAutoplayController:setCandidateUserIntent(Current, false)
			end
		end, {
			p1.viewportVideoAutoplayController,
			p1.itemFrameRef,
			p1.hasVideoPlaybackUserIntent
		})
	end
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagLuaAppVideoViewportTargetedWinnerSubscription (upval), UseSignalStateResult (copy), UseIsRouteOnScreenResult (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (upval), IsAdsPlaybackCoordinatorMatch (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), VideoEndReason (upval)
		local ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if FFlagLuaAppVideoViewportTargetedWinnerSubscription or not ViewportVideoAutoplayController then return end
		local Current = p1.itemFrameRef.current
		
		if Current ~= nil and UseSignalStateResult.instance == Current then
			if not p1.videoPlaybackCoordinator:isPlaybackAllowed(UseIsRouteOnScreenResult, if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil) then
				p1.cancelVideoPlayback(VideoEndReason.ExitViewport)
				
				return
			end
			if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and IsAdsPlaybackCoordinatorMatch then
				p1.requestVideoPlayback(UseSignalStateResult.shouldUseDwell)
				
				return
			end
			if FFlagLuaAppOneByTwoHoverIdleAutoplay then
				ViewportVideoAutoplayController:requestWinnerPlayback(Current, p1.requestVideoPlayback)
				
				return
			else
				p1.requestVideoPlayback(UseSignalStateResult.shouldUseDwell)
				
				return
			end
		elseif FFlagLuaAppOneByTwoHoverIdleAutoplay and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() and p1.videoPlaybackCoordinator.playingVideoKey == p1.videoKey then
			p1.cancelVideoPlayback(VideoEndReason.ExitViewport)
		end
	end, {
		p1.viewportVideoAutoplayController, p1.itemFrameRef, p1.requestVideoPlayback,
		p1.cancelVideoPlayback, p1.videoPlaybackCoordinator,
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then IsAdsPlaybackCoordinatorMatch else nil,
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then p1.videoKey else nil,
		UseIsRouteOnScreenResult, UseSignalStateResult,
		if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), AppLifecycleObserverService (upval), ExperienceService (upval)
		local ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if not ViewportVideoAutoplayController then return end
		local OnUnhideConnection = AppLifecycleObserverService.OnUnhide:Connect(function()
			-- upvalues: ViewportVideoAutoplayController (copy)
			ViewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
		end)
		local RegisterForExperienceLeaveResult = ExperienceService:RegisterForExperienceLeave(function()
			-- upvalues: ViewportVideoAutoplayController (copy)
			ViewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
		end)
		
		return function()
			-- upvalues: OnUnhideConnection (copy), RegisterForExperienceLeaveResult (copy)
			OnUnhideConnection:Disconnect()
			RegisterForExperienceLeaveResult:Disconnect()
		end
	end, { p1.viewportVideoAutoplayController })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseIsRouteOnScreenResult (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), UseMemoResult (copy), VideoEndReason (upval), FIntVideoPlaybackDetectorScanDebounceInMillisecondsRatio (upval), FFlagVideoPlaybackDetectorCancelPendingScanTask (upval), AppLifecycleObserverService (upval), ExperienceService (upval)
		if p1.viewportVideoAutoplayController ~= nil then return end
		local List = {}
		local v1 = nil
		
		if p1.itemFrameRef.current ~= nil then
			local Current = p1.itemFrameRef.current
			local CurrentTime = nil
			local v2 = nil
			
			local function requestPlaybackIfEligible()
				-- upvalues: CurrentTime (ref), p1 (upval), UseIsRouteOnScreenResult (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), UseMemoResult (upval), VideoEndReason (upval)
				CurrentTime = tick()
				
				if p1.videoPlaybackCoordinator:isPlaybackCandidate(UseIsRouteOnScreenResult, if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil, p1.itemFrameRef, UseMemoResult, p1.videoVisiblePercent) then
					p1.requestVideoPlayback(true)
					
					return
				else
					p1.cancelVideoPlayback(VideoEndReason.ExitViewport)
				end
			end
			
			local function onItemFrameLayoutChange()
				-- upvalues: v2 (ref), CurrentTime (ref), FIntVideoPlaybackDetectorScanDebounceInMillisecondsRatio (upval), requestPlaybackIfEligible (copy), FFlagVideoPlaybackDetectorCancelPendingScanTask (upval), v1 (ref)
				if v2 ~= nil then return end
				local Delay = 0
				
				if CurrentTime ~= nil then
					v2 = CurrentTime + FIntVideoPlaybackDetectorScanDebounceInMillisecondsRatio
					Delay = v2 - tick()
				end
				if Delay > 0 then
					local DelayedThread = task.delay(Delay, function()
						-- upvalues: v2 (upval), requestPlaybackIfEligible (upval)
						v2 = nil
						requestPlaybackIfEligible()
					end)
					
					if FFlagVideoPlaybackDetectorCancelPendingScanTask then
						v1 = DelayedThread
						
						return
					end
				else
					v2 = nil
					requestPlaybackIfEligible()
				end
			end
			
			requestPlaybackIfEligible()
			local RegisterForExperienceLeaveResult = ExperienceService:RegisterForExperienceLeave(function()
				-- upvalues: requestPlaybackIfEligible (copy)
				requestPlaybackIfEligible()
			end)
			List = {
				Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onItemFrameLayoutChange),
				Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onItemFrameLayoutChange)
			}
			table.insert(List, (AppLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: requestPlaybackIfEligible (copy)
				requestPlaybackIfEligible()
			end)))
			table.insert(List, RegisterForExperienceLeaveResult)
		end
		return function()
			-- upvalues: FFlagVideoPlaybackDetectorCancelPendingScanTask (upval), v1 (ref), List (ref)
			if FFlagVideoPlaybackDetectorCancelPendingScanTask and v1 then
				task.cancel(v1)
				v1 = nil
			end
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil,
		p1.itemFrameRef, p1.videoVisiblePercent, UseIsRouteOnScreenResult,
		UseMemoResult, p1.videoPlaybackCoordinator, p1.requestVideoPlayback,
		p1.cancelVideoPlayback, p1.viewportVideoAutoplayController
	})
	
	return nil
end