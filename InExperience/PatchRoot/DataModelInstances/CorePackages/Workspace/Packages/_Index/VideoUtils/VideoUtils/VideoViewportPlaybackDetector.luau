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
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagVideoPlaybackDetectorCancelPendingScanTask = require(parent.SharedFlags).FFlagVideoPlaybackDetectorCancelPendingScanTask
local var1 = signalsModule.createSignal({ instance = nil, shouldUseDwell = true })
local var2 = if fFlagVideoPlaybackDetectorCancelPendingScanTask then require(parent.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds / 1000 else 0.5

return function(p1)
	-- upvalues: useNavigationFocus (ref), useSelector (ref), reactModule (ref), signalsReactModule (ref), var1 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), videoEndReason (ref), appLifecycleObserverService (ref), experienceService (ref), var2 (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (ref)
	local var3 = useNavigationFocus()
	local var4 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var5 = useSelector(function(p2)
		return p2.TopBar.topBarHeight
	end)
	local var6 = useSelector(function(p2)
		return p2.GlobalGuiInset
	end)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var4 (ref), var6 (ref)
		return {
			min = Vector2.new(0, var5),
			max = Vector2.new(var4.X, var4.Y - var6.bottom)
		}
	end, { var5, var4, var6 })
	local var8 = signalsReactModule.useSignalState(if p1.viewportVideoAutoplayController then p1.viewportVideoAutoplayController.getWinnerState else var1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var8 (ref), var3 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), videoEndReason (copy)
		if not p1.viewportVideoAutoplayController then return end
		if p1.itemFrameRef.current ~= nil and var8.instance == p1.itemFrameRef.current then
			if p1.videoPlaybackCoordinator:isPlaybackAllowed(var3, if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil) then
				p1.requestVideoPlayback(var8.shouldUseDwell)
				
				return
			end
			p1.cancelVideoPlayback(videoEndReason.ExitViewport)
		end
	end, {
		p1.viewportVideoAutoplayController, p1.itemFrameRef, p1.requestVideoPlayback,
		p1.cancelVideoPlayback, p1.videoPlaybackCoordinator, var3, var8,
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
			local var9 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: viewportVideoAutoplayController (ref)
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end)
			
			return function()
				-- upvalues: onUnhideConnection (ref), var9 (ref)
				onUnhideConnection:Disconnect()
				var9:Disconnect()
			end
		end
	end, { p1.viewportVideoAutoplayController })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var7 (ref), videoEndReason (copy), var2 (copy), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), appLifecycleObserverService (copy), experienceService (copy)
		if p1.viewportVideoAutoplayController ~= nil then return end
		local t = {}
		local var9 = nil
		
		if p1.itemFrameRef.current ~= nil then
			local current = p1.itemFrameRef.current
			local var10 = nil
			local var11 = nil
			
			local function requestPlaybackIfEligible()
				-- upvalues: var10 (write), p1 (copy), var3 (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var7 (copy), videoEndReason (copy)
				var10 = tick()
				
				if p1.videoPlaybackCoordinator:isPlaybackCandidate(var3, if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil, p1.itemFrameRef, var7, p1.videoVisiblePercent) then
					p1.requestVideoPlayback(true)
					
					return
				end
				p1.cancelVideoPlayback(videoEndReason.ExitViewport)
			end
			
			local function onItemFrameLayoutChange()
				-- upvalues: var11 (write), var10 (write), var2 (copy), requestPlaybackIfEligible (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var9 (write)
				if var11 ~= nil then return end
				local var12 = 0
				
				if var10 ~= nil then
					var11 = var10 + var2
					var12 = var11 - tick()
				end
				if var12 > 0 then
					local delayedThread = task.delay(var12, function()
						-- upvalues: var11 (copy), requestPlaybackIfEligible (copy)
						var11 = nil
						requestPlaybackIfEligible()
					end)
					
					if fFlagVideoPlaybackDetectorCancelPendingScanTask then
						var9 = delayedThread
						
						return
					end
				else
					var11 = nil
					requestPlaybackIfEligible()
				end
			end
			
			requestPlaybackIfEligible()
			local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			local var12 = experienceService:RegisterForExperienceLeave(function()
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			t = {
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onItemFrameLayoutChange),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onItemFrameLayoutChange)
			}
			table.insert(t, onUnhideConnection)
			table.insert(t, var12)
		end
		return function()
			-- upvalues: fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var9 (write), t (write)
			if fFlagVideoPlaybackDetectorCancelPendingScanTask and var9 then
				task.cancel(var9)
				var9 = nil
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		if fFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil,
		p1.itemFrameRef, p1.videoVisiblePercent, var3, var7,
		p1.videoPlaybackCoordinator, p1.requestVideoPlayback, p1.cancelVideoPlayback,
		p1.viewportVideoAutoplayController
	})
	
	return nil
end