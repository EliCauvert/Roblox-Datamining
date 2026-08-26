local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local useSwipeLatencyModule = require(script.Parent.useSwipeLatency)
local _ = require(moments.Components.VerticalPager)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider

return function(p1)
	-- upvalues: mediaPreloadProvider (ref), reactModule (ref), useSwipeLatencyModule (ref)
	local pager = p1.pager
	local var1 = mediaPreloadProvider.useMediaControllerProvider()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return function(p2, p3)
			-- upvalues: var1 (copy)
			return if var1 == nil then nil elseif p3 == nil or p3.kind ~= "moment" then nil else var1.getControllerMap(p2)[p3.moment.momentId]
		end
	end, { var1 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return function(p2, p3)
			-- upvalues: var2 (copy)
			local var4 = var2(p2, p3)
			
			return if var4 == nil then false elseif p3 ~= nil and (p3.kind == "moment" and p3.moment.metadata.captureType == Enum.CaptureType.Video) then var4.getPosition(p2) > 0 else var4.getState(p2).readiness == "Ready"
		end
	end, { var2 })
	local var4 = useSwipeLatencyModule({
		getIsSettled = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return function(p2)
				-- upvalues: p1 (copy)
				local current = p1.controllerRef.current
				
				return current == nil or current.getScrollState(p2) == "Idle"
			end
		end, { p1.controllerRef }),
		getHasPresentedFrame = reactModule.useMemo(function()
			-- upvalues: var3 (ref), pager (ref)
			return function(p2)
				-- upvalues: var3 (copy), pager (copy)
				return var3(p2, pager.getCurrentItem(p2))
			end
		end, { pager, var3 }),
		getTargetHasPresentedFrame = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref)
			return var3(false, p2)
		end, { var3 }),
		getCaptureType = reactModule.useCallback(function(p2)
			if p2 == nil or p2.kind ~= "moment" then
				return "unknown"
			end
			local captureType = p2.moment.metadata.captureType
			
			return if captureType == Enum.CaptureType.Video then "video" elseif captureType == Enum.CaptureType.Screenshot then "screenshot" else "unknown"
		end, {})
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		p1.onTargetCommittedRef.current = var4
		
		return function()
			-- upvalues: p1 (copy), var4 (copy)
			if p1.onTargetCommittedRef.current == var4 then
				p1.onTargetCommittedRef.current = nil
			end
		end
	end, { p1.onTargetCommittedRef, var4 })
	
	return nil
end