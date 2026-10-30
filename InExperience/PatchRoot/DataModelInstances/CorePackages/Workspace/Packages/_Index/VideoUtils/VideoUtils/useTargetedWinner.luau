local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local _ = require(VideoUtils.VideoPlaybackCoordinator)
local _ = require(VideoUtils.ViewportVideoAutoplayController)
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local Frozen = table.freeze({ isWinner = false, shouldUseDwell = false })
local Signal = SignalsModule.createSignal(Frozen)

local function verdictEquals(p1, p2): boolean
	return p1.isWinner == p2.isWinner and p1.shouldUseDwell == p2.shouldUseDwell and p1.isUserIntentWinner == p2.isUserIntentWinner
end

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), SignalsModule (copy), Signal (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), Frozen (copy), verdictEquals (copy), SignalsReactModule (copy), VideoEndReason (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), p1 (copy)
		if UseMemoResult.get(false) ~= p1.itemFrameRef.current then
			UseMemoResult.set(p1.itemFrameRef.current)
		end
	end)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Signal (upval), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (upval), SignalsModule (upval), UseMemoResult (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), Frozen (upval), verdictEquals (upval)
		local ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if ViewportVideoAutoplayController then
			local WinnerStateForCoordinator = if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then ViewportVideoAutoplayController:getWinnerStateForCoordinator(p1.videoPlaybackCoordinator) else ViewportVideoAutoplayController.getWinnerState
			
			return SignalsModule.createComputed(function(p4)
				-- upvalues: WinnerStateForCoordinator (copy), UseMemoResult (upval), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), Frozen (upval)
				local WinnerStateForCoordinatorResult = WinnerStateForCoordinator(p4)
				local GetResult = UseMemoResult.get(p4)
				
				return if GetResult == nil or WinnerStateForCoordinatorResult.instance ~= GetResult then Frozen else {
					isWinner = true,
					shouldUseDwell = WinnerStateForCoordinatorResult.shouldUseDwell,
					isUserIntentWinner = if FFlagLuaAppOneByTwoHoverIdleAutoplay then WinnerStateForCoordinatorResult.isUserIntentWinner else nil
				}
			end, verdictEquals)
		else
			return Signal
		end
	end, {
		p1.viewportVideoAutoplayController,
		UseMemoResult,
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then p1.videoPlaybackCoordinator else nil,
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then p3 else nil
	})))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseSignalStateResult (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (upval), VideoEndReason (upval), p2 (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (upval), p3 (copy), UseMemoResult (copy)
		local ViewportVideoAutoplayController = p1.viewportVideoAutoplayController
		
		if not ViewportVideoAutoplayController then return end
		if UseSignalStateResult.isWinner then
			if not p1.videoPlaybackCoordinator:isPlaybackAllowed(p2, if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil) then
				p1.cancelVideoPlayback(VideoEndReason.ExitViewport)
				
				return
			end
			if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and p3 then
				p1.requestVideoPlayback(UseSignalStateResult.shouldUseDwell)
				
				return
			end
			if FFlagLuaAppOneByTwoHoverIdleAutoplay then
				ViewportVideoAutoplayController:requestWinnerPlayback(UseMemoResult.get(false), p1.requestVideoPlayback)
				
				return
			else
				p1.requestVideoPlayback(UseSignalStateResult.shouldUseDwell)
				
				return
			end
		elseif FFlagLuaAppOneByTwoHoverIdleAutoplay and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay() and p1.videoPlaybackCoordinator.playingVideoKey == p1.videoKey then
			p1.cancelVideoPlayback(VideoEndReason.ExitViewport)
		end
	end, {
		p1.viewportVideoAutoplayController, p1.videoPlaybackCoordinator,
		p1.requestVideoPlayback, p1.cancelVideoPlayback,
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then p3 else nil,
		if FFlagLuaAppOneByTwoHoverIdleAutoplay then p1.videoKey else nil,
		UseMemoResult, p2, UseSignalStateResult,
		if FFlagLuaAppEdpMediaGalleryFullScreen then p1.isItemOccluded else nil
	})
end