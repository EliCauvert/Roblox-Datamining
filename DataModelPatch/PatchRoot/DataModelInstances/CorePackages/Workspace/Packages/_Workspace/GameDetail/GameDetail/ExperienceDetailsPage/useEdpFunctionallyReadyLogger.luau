local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FetchGamePlayButtonData = require(Parent.GamePlayButton).FetchGamePlayButtonData
local _ = require(Parent.SduiSharedUtilities)
local Milestone = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone

return function(p1, p2)
	-- upvalues: UseSelectorFunction (copy), FetchGamePlayButtonData (copy), ReactModule (copy), Milestone (copy)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: p2 (copy), FetchGamePlayButtonData (upval)
		return not p2 or FetchGamePlayButtonData.IsLoading(p3, p2)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), p2 (copy), p1 (copy), Milestone (upval)
		if not UseSelectorResult and p2 and p1.trackOnce then
			p1.trackOnce(Milestone.FunctionallyReady)
		end
	end, { UseSelectorResult, p2, p1 })
end