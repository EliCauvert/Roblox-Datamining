local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local useSwipeLatencyModule = require(script.Parent.useSwipeLatency)
local _ = require(moments.Components.VerticalPager)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider

return function(p0)
	-- upvalues: mediaPreloadProvider (ref), reactModule (ref), useSwipeLatencyModule (ref)
	local pager = p0.pager
	local var4 = mediaPreloadProvider.useMediaControllerProvider()
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return function(p1, p2)
			-- upvalues: var4 (copy)
			return if var4 == nil then nil elseif p2 == nil or p2.kind ~= "moment" then nil else var4.getControllerMap(p1)[p2.moment.momentId]
		end
	end, { var4 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return function(p3, p4)
			-- upvalues: var5 (copy)
			local var8 = var5(p3, p4)
			
			return if var8 == nil then false elseif p4 ~= nil and (p4.kind == "moment" and p4.moment.metadata.captureType == Enum.CaptureType.Video) then var8.getPosition(p3) > 0 else var8.getState(p3).readiness == "Ready"
		end
	end, { var5 })
	local var7 = useSwipeLatencyModule({
		getIsSettled = reactModule.useMemo(function()
			-- upvalues: p0 (ref)
			return function(p5)
				-- upvalues: p0 (copy)
				local current = p0.controllerRef.current
				
				return current == nil or current.getScrollState(p5) == "Idle"
			end
		end, { p0.controllerRef }),
		getHasPresentedFrame = reactModule.useMemo(function()
			-- upvalues: var6 (ref), pager (ref)
			return function(p6)
				-- upvalues: var6 (copy), pager (copy)
				return var6(p6, pager.getCurrentItem(p6))
			end
		end, { pager, var6 }),
		getTargetHasPresentedFrame = reactModule.useCallback(function(p7)
			-- upvalues: var6 (ref)
			return var6(false, p7)
		end, { var6 }),
		getCaptureType = reactModule.useCallback(function(p8)
			if p8 == nil or p8.kind ~= "moment" then
				return "unknown"
			end
			local captureType = p8.moment.metadata.captureType
			
			return if captureType == Enum.CaptureType.Video then "video" elseif captureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown"
		end, {})
	})
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var7 (ref)
		p0.onTargetCommittedRef.current = var7
		
		return function()
			-- upvalues: p0 (copy), var7 (copy)
			if p0.onTargetCommittedRef.current == var7 then
				p0.onTargetCommittedRef.current = nil
			end
		end
	end, { p0.onTargetCommittedRef, var7 })
	
	return nil
end