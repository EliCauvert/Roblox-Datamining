local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fetchGamePlayButtonData = require(parent.GamePlayButton).FetchGamePlayButtonData
local _ = require(parent.SduiSharedUtilities)
local milestone = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone

return function(p0, p1) --[[ line: 16 | named "useEdpFunctionallyReadyLogger" ]]
	-- upvalues: useSelector (ref), fetchGamePlayButtonData (ref), reactModule (ref), milestone (ref)
	local var1 = useSelector(function(p2) --[[ line: 17 ]]
		-- upvalues: p1 (ref), fetchGamePlayButtonData (copy)
		return if p1 then fetchGamePlayButtonData.IsLoading(p2, p1) else true
	end)
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var1 (ref), p1 (ref), p0 (ref), milestone (copy)
		if not var1 and p1 and p0.trackOnce then
			p0.trackOnce(milestone.FunctionallyReady)
		end
	end, { var1, p1, p0 })
end