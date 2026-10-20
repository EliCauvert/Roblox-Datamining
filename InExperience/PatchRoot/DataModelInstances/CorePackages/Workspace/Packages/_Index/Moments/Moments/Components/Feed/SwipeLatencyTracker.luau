local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.FeedTypes)
local UseSwipeLatencyModule = require(script.Parent.useSwipeLatency)
local _ = require(Moments.Components.VerticalPager)
local MediaPreloadProvider = require(Parent.MomentsCommon).Media.MediaPreloadProvider

return function(p1)
	-- upvalues: MediaPreloadProvider (copy), ReactModule (copy), UseSwipeLatencyModule (copy)
	local Pager = p1.pager
	local UseMediaControllerProviderResult = MediaPreloadProvider.useMediaControllerProvider()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseMediaControllerProviderResult (copy)
		return function(p2, p3)
			-- upvalues: UseMediaControllerProviderResult (upval)
			return if UseMediaControllerProviderResult == nil then nil elseif p3 == nil or p3.kind ~= "moment" then nil else UseMediaControllerProviderResult.getControllerMap(p2)[p3.moment.momentId]
		end
	end, { UseMediaControllerProviderResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		return function(p2, p3): boolean
			-- upvalues: UseMemoResult (upval)
			local UseMemoResultResult = UseMemoResult(p2, p3)
			
			if UseMemoResultResult == nil then
				return false
			else
				local IsCaptureTypeMatch: boolean = p3 ~= nil and (p3.kind == "moment" and p3.moment.metadata.captureType == Enum.CaptureType.Video)
				
				return if IsCaptureTypeMatch then UseMemoResultResult.getPosition(p2) > 0 else UseMemoResultResult.getState(p2).readiness == "Ready"
			end
		end
	end, { UseMemoResult })
	local UseSwipeLatencyModuleResult = UseSwipeLatencyModule({
		getIsSettled = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return function(p2): boolean
				-- upvalues: p1 (upval)
				local Current = p1.controllerRef.current
				
				return Current == nil or Current.getScrollState(p2) == "Idle"
			end
		end, { p1.controllerRef }),
		getHasPresentedFrame = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy), Pager (copy)
			return function(p2)
				-- upvalues: UseMemoResult1 (upval), Pager (upval)
				return UseMemoResult1(p2, Pager.getCurrentItem(p2))
			end
		end, { Pager, UseMemoResult1 }),
		getTargetHasPresentedFrame = ReactModule.useCallback(function(p2)
			-- upvalues: UseMemoResult1 (copy)
			return UseMemoResult1(false, p2)
		end, { UseMemoResult1 }),
		getCaptureType = ReactModule.useCallback(function(p2): string
			if p2 == nil or p2.kind ~= "moment" then
				return "unknown"
			else
				local CaptureType = p2.moment.metadata.captureType
				
				return if CaptureType == Enum.CaptureType.Video then "video" elseif CaptureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown"
			end
		end, {})
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseSwipeLatencyModuleResult (copy)
		p1.onTargetCommittedRef.current = UseSwipeLatencyModuleResult
		
		return function()
			-- upvalues: p1 (upval), UseSwipeLatencyModuleResult (upval)
			if p1.onTargetCommittedRef.current == UseSwipeLatencyModuleResult then
				p1.onTargetCommittedRef.current = nil
			end
		end
	end, { p1.onTargetCommittedRef, UseSwipeLatencyModuleResult })
	
	return nil
end