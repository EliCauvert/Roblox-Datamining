local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fetchGamePlayButtonData = require(parent.GamePlayButton).FetchGamePlayButtonData
local _ = require(parent.SduiSharedUtilities)
local milestone = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone
local pageGateModule = require(parent.PageGate)

return function(p1, p2)
	-- upvalues: useSelector (ref), fetchGamePlayButtonData (ref), pageGateModule (ref), reactModule (ref), milestone (ref)
	local var1 = useSelector(function(p3)
		-- upvalues: p2 (ref), fetchGamePlayButtonData (copy)
		return if p2 then fetchGamePlayButtonData.IsLoading(p3, p2) else true
	end)
	local var2 = if pageGateModule.FFlagEnablePLTPrefetchCallbacks then reactModule.useRef(false) else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref), p1 (ref), milestone (copy), pageGateModule (copy), var2 (write)
		if not var1 and p2 and p1.trackOnce then
			p1.trackOnce(milestone.FunctionallyReady)
			
			if pageGateModule.FFlagEnablePLTPrefetchCallbacks and var2 and not var2.current then
				var2.current = true
				pageGateModule.signal(pageGateModule.Page.ExperienceDetail, pageGateModule.Milestone.FunctionallyReady)
			end
		end
	end, { var1, p2, p1 })
end