local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fetchGamePlayButtonData = require(parent.GamePlayButton).FetchGamePlayButtonData
local _ = require(parent.SduiSharedUtilities)
local milestone = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone
local pageGateModule = require(parent.PageGate)

return function(p0, p1) --[[ line: 18 | named "useEdpFunctionallyReadyLogger" ]]
	-- upvalues: useSelector (ref), fetchGamePlayButtonData (ref), pageGateModule (ref), reactModule (ref), milestone (ref)
	local var2 = useSelector(function(p2) --[[ line: 19 ]]
		-- upvalues: p1 (ref), fetchGamePlayButtonData (copy)
		return if p1 then fetchGamePlayButtonData.IsLoading(p2, p1) else true
	end)
	local var3 = if pageGateModule.FFlagEnablePLTPrefetchCallbacks then reactModule.useRef(false) else nil
	reactModule.useEffect(function() --[[ line: 36 ]]
		-- upvalues: var2 (ref), p1 (ref), p0 (ref), milestone (copy), pageGateModule (copy), var3 (write)
		if not var2 and p1 and p0.trackOnce then
			p0.trackOnce(milestone.FunctionallyReady)
			
			if pageGateModule.FFlagEnablePLTPrefetchCallbacks and var3 and not var3.current then
				var3.current = true
				pageGateModule.signal(pageGateModule.Page.ExperienceDetail, pageGateModule.Milestone.FunctionallyReady)
			end
		end
	end, { var2, p1, p0 })
end