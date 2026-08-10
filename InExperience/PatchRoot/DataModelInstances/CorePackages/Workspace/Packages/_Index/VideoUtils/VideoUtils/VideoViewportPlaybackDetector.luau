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
local var6 = signalsModule.createSignal({ instance = nil, shouldUseDwell = true })
local var7 = if fFlagVideoPlaybackDetectorCancelPendingScanTask then require(parent.SharedFlags).FIntVideoPlaybackDetectorScanDebounceInMilliseconds / 1000 else 0.5

return function(p0) --[[ line: 56 | named "VideoViewportPlaybackDetector" ]]
	-- upvalues: useNavigationFocus (ref), useSelector (ref), reactModule (ref), signalsReactModule (ref), var6 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (ref), videoEndReason (ref), appLifecycleObserverService (ref), experienceService (ref), var7 (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (ref)
	local var8 = useNavigationFocus()
	local var9 = useSelector(function(p1) --[[ line: 59 ]]
		return p1.ScreenSize
	end)
	local var10 = useSelector(function(p2) --[[ line: 63 ]]
		return p2.TopBar.topBarHeight
	end)
	local var11 = useSelector(function(p3) --[[ line: 67 ]]
		return p3.GlobalGuiInset
	end)
	local var12 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: var10 (ref), var9 (ref), var11 (ref)
		return {
			min = Vector2.new(0, var10),
			max = Vector2.new(var9.X, var9.Y - var11.bottom)
		}
	end, { var10, var9, var11 })
	local var13 = signalsReactModule.useSignalState(if p0.viewportVideoAutoplayController then p0.viewportVideoAutoplayController.getWinnerState else var6)
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: p0 (ref), var13 (ref), var8 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), videoEndReason (copy)
		if not p0.viewportVideoAutoplayController then return end
		if p0.itemFrameRef.current ~= nil and var13.instance == p0.itemFrameRef.current then
			if p0.videoPlaybackCoordinator:isPlaybackAllowed(var8, if fFlagLuaAppEdpMediaGalleryFullScreen then p0.isItemOccluded else nil) then
				p0.requestVideoPlayback(var13.shouldUseDwell)
				
				return
			end
			p0.cancelVideoPlayback(videoEndReason.ExitViewport)
		end
	end, {
		p0.viewportVideoAutoplayController, p0.itemFrameRef, p0.requestVideoPlayback,
		p0.cancelVideoPlayback, p0.videoPlaybackCoordinator, var8, var13,
		if fFlagLuaAppEdpMediaGalleryFullScreen then p0.isItemOccluded else nil
	})
	reactModule.useEffect(function() --[[ line: 118 ]]
		-- upvalues: p0 (ref), appLifecycleObserverService (copy), experienceService (copy)
		local viewportVideoAutoplayController = p0.viewportVideoAutoplayController
		
		if viewportVideoAutoplayController then
			local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(function() --[[ line: 124 ]]
				-- upvalues: viewportVideoAutoplayController (ref)
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end)
			local var15 = experienceService:RegisterForExperienceLeave(function() --[[ line: 129 ]]
				-- upvalues: viewportVideoAutoplayController (ref)
				viewportVideoAutoplayController:scheduleUpdateWinner("Y", nil, true)
			end)
			
			return function() --[[ line: 134 ]]
				-- upvalues: onUnhideConnection (ref), var15 (ref)
				onUnhideConnection:Disconnect()
				var15:Disconnect()
			end
		end
	end, { p0.viewportVideoAutoplayController })
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: p0 (ref), var8 (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var12 (ref), videoEndReason (copy), var7 (copy), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), appLifecycleObserverService (copy), experienceService (copy)
		if p0.viewportVideoAutoplayController ~= nil then return end
		local t = {}
		local var17 = nil
		
		if p0.itemFrameRef.current ~= nil then
			local current = p0.itemFrameRef.current
			local var18 = nil
			local var19 = nil
			
			local function requestPlaybackIfEligible() --[[ line: 156 ]]
				-- upvalues: var18 (write), p0 (copy), var8 (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var12 (copy), videoEndReason (copy)
				var18 = tick()
				
				if p0.videoPlaybackCoordinator:isPlaybackCandidate(var8, if fFlagLuaAppEdpMediaGalleryFullScreen then p0.isItemOccluded else nil, p0.itemFrameRef, var12, p0.videoVisiblePercent) then
					p0.requestVideoPlayback(true)
					
					return
				end
				p0.cancelVideoPlayback(videoEndReason.ExitViewport)
			end
			
			local function onItemFrameLayoutChange() --[[ line: 174 ]]
				-- upvalues: var19 (write), var18 (write), var7 (copy), requestPlaybackIfEligible (ref), fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var17 (write)
				if var19 ~= nil then return end
				local var24 = 0
				
				if var18 ~= nil then
					var19 = var18 + var7
					var24 = var19 - tick()
				end
				if var24 > 0 then
					local delayedThread = task.delay(var24, function() --[[ line: 187 ]]
						-- upvalues: var19 (copy), requestPlaybackIfEligible (copy)
						var19 = nil
						requestPlaybackIfEligible()
					end)
					
					if fFlagVideoPlaybackDetectorCancelPendingScanTask then
						var17 = delayedThread
						
						return
					end
				else
					var19 = nil
					requestPlaybackIfEligible()
				end
			end
			
			requestPlaybackIfEligible()
			local onUnhideConnection = appLifecycleObserverService.OnUnhide:Connect(function() --[[ line: 204 ]]
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			local var23 = experienceService:RegisterForExperienceLeave(function() --[[ line: 210 ]]
				-- upvalues: requestPlaybackIfEligible (ref)
				requestPlaybackIfEligible()
			end)
			t = {
				current:GetPropertyChangedSignal("AbsolutePosition"):Connect(onItemFrameLayoutChange),
				current:GetPropertyChangedSignal("AbsoluteSize"):Connect(onItemFrameLayoutChange)
			}
			table.insert(t, onUnhideConnection)
			table.insert(t, var23)
		end
		return function() --[[ line: 223 ]]
			-- upvalues: fFlagVideoPlaybackDetectorCancelPendingScanTask (copy), var17 (write), t (write)
			if fFlagVideoPlaybackDetectorCancelPendingScanTask and var17 then
				task.cancel(var17)
				var17 = nil
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		if fFlagLuaAppEdpMediaGalleryFullScreen then p0.isItemOccluded else nil,
		p0.itemFrameRef, p0.videoVisiblePercent, var8, var12,
		p0.videoPlaybackCoordinator, p0.requestVideoPlayback, p0.cancelVideoPlayback,
		p0.viewportVideoAutoplayController
	})
	
	return nil
end