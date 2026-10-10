local experienceService = game:GetService("ExperienceService")
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local _ = require(videoUtils.VideoPlaybackCoordinator)
local _ = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagVideoPlaybackDetectorCancelPendingScanTask = require(parent.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask
local fIntVideoPlaybackDetectorScanDebounceInMilliseconds = require(parent.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds
local fFlagEnableOnScreenAPIIntegration = require(parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local var1 = if fFlagEnableOnScreenAPIIntegration then require(parent.RobloxAppNavigation).useIsRouteOnScreen else nil
local var2 = signalsModule.createSignal({
	instance = nil,
	shouldUseDwell = true,
	isUserIntentWinner = if fFlagLuaAppOneByTwoHoverIdleAutoplay then false else nil
})
local var3 = if fFlagVideoPlaybackDetectorCancelPendingScanTask then fIntVideoPlaybackDetectorScanDebounceInMilliseconds / 1000 else 0.5

return function(p1)
	-- upvalues: fFlagEnableOnScreenAPIIntegration (ref), var1 (ref), useNavigationFocus (ref), useSelector (ref), reactModule (ref), signalsReactModule (ref), var2 (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), videoEndReason (ref), appLifecycleObserverService (ref), experienceService (ref), var3 (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (ref)
	local var4 = if fFlagEnableOnScreenAPIIntegration then var1() else useNavigationFocus()
	local var5 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var6 = useSelector(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local var7 = useSelector(function(p2)
		return p2.GlobalGuiInset
	end)
	local var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var5 (ref), var7 (ref)
		return {
			min = Vector2.new(0, var6),
			max = Vector2.new(var5.X, var5.Y - var7.bottom)
		}
	end, { var6, var5, var7 })
	local var9 = signalsReactModule.useSignalState(if p1.viewportVideoAutoplayController then p1.viewportVideoAutoplayController.getWinnerState else var2)
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref)
			local viewportVideoAutoplayController = p1.viewportVideoAutoplayController
			local current = p1.itemFrameRef.current
			
			if viewportVideoAutoplayController and viewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() and current then
				viewportVideoAutoplayController:setCandidateUserIntent(current, p1.hasVideoPlaybackUserIntent == true)
				
				return function()
					-- upvalues: viewportVideoAutoplayController (ref), current (ref)
					viewportVideoAutoplayController:setCandidateUserIntent(current, false)
				end
			end
		end, {
			p1.viewportVideoAutoplayController,
			p1.itemFrameRef,
			p1.hasVideoPlaybackUserIntent
		})
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var9 (ref), var4 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), fFlagLuaAppOneByTwoHoverIdleAutoplay (copy), videoEndReason (copy)
		local viewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if not viewportVideoAutoplayController then return end
		local current = p1.itemFrameRef.current
		
		if current ~= nil and var9.instance == current then
			if not p1.videoPlaybackCoordinator:isPlaybackAllowed(var4, if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil) then
				p1.cancelVideoPlayback(videoEndReason.ExitViewport)
				
				return
			elseif fFlagLuaAppOneByTwoHoverIdleAutoplay then
				viewportVideoAutoplayController:requestWinnerPlayback(current, p1.requestVideoPlayback)
				
				return
			end
			p1.requestVideoPlayback(var9.shouldUseDwell)
			
			return
		elseif fFlagLuaAppOneByTwoHoverIdleAutoplay and viewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() and p1.videoPlaybackCoordinator.playingVideoKey == p1.videoKey then
			p1.cancelVideoPlayback(videoEndReason.ExitViewport)
		end
	end, {
		p1.viewportVideoAutoplayController, p1.itemFrameRef, p1.requestVideoPlayback,
		p1.cancelVideoPlayback, p1.videoPlaybackCoordinator,
		if fFlagLuaAppOneByTwoHoverIdleAutoplay then p1.videoKey else nil, var4, var9,
		if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), appLifecycleObserverService (copy), experienceService (copy)
		local viewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if viewportVideoAutoplayController then
			local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: viewportVideoAutoplayController (ref)
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end)
			local var10 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: viewportVideoAutoplayController (ref)
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end)
			
			return function()
				-- upvalues: onUnhideConnection (ref), var10 (ref)
				onUnhideConnection:Disconnect()
				var10:Disconnect()
			end
		end
	end, { p1.viewportVideoAutoplayController })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var8 (ref), videoEndReason (copy), var3 (copy), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), appLifecycleObserverService (copy), experienceService (copy)
		if p1.viewportVideoAutoplayController ~= nil then return end
		local t = {}
		local var10 = nil
		
		if p1.itemFrameRef.current ~= nil then
			local current = p1.itemFrameRef.current
			local var11 = nil
			local var12 = nil
			
			local function requestPlaybackIfEligible()
				-- upvalues: var11 (write), p1 (copy), var4 (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var8 (copy), videoEndReason (copy)
				var11 = tick()
				
				if p1.videoPlaybackCoordinator:isPlaybackCandidate(var4, if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil, p1.itemFrameRef, var8, p1.videoVisiblePercent) then
					p1.requestVideoPlayback(true)
					
					return
				end
				p1.cancelVideoPlayback(videoEndReason.ExitViewport)
			end
			
			local function onItemFrameLayoutChange()
				-- upvalues: var12 (write), var11 (write), var3 (copy), requestPlaybackIfEligible (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var10 (write)
				if var12 ~= nil then return end
				local var13 = 0
				
				if var11 ~= nil then
					var12 = var11 + var3
					var13 = var12 - tick()
				end
				if var13 > 0 then
					local delayedThread = task.delay(var13, function()
						-- upvalues: var12 (copy), requestPlaybackIfEligible (copy)
						var12 = nil
						requestPlaybackIfEligible()
					end)
					
					if fFlagVideoPlaybackDetectorCancelPendingScanTask then
						var10 = delayedThread
						
						return
					end
				else
					var12 = nil
					requestPlaybackIfEligible()
				end
			end
			
			requestPlaybackIfEligible()
			local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			local var13 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			t = {
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onItemFrameLayoutChange),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onItemFrameLayoutChange)
			}
			table.insert(t, onUnhideConnection)
			table.insert(t, var13)
		end
		return function()
			-- upvalues: fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var10 (write), t (write)
			if fFlagVideoPlaybackDetectorCancelPendingScanTask and var10 then
				task.cancel(var10)
				var10 = nil
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil,
		p1.itemFrameRef, p1.videoVisiblePercent, var4, var8,
		p1.videoPlaybackCoordinator, p1.requestVideoPlayback, p1.cancelVideoPlayback,
		p1.viewportVideoAutoplayController
	})
	
	return nil
end