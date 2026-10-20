local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FetchGamePlayButtonData = require(Parent.GamePlayButton).FetchGamePlayButtonData
local _ = require(Parent.SduiSharedUtilities)
local Milestone = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone
local PageGateModule = require(Parent.PageGate)
local FFlagEDPTTIParityDefinitions = require(Parent.SharedFlags).FFlagEDPTTIParityDefinitions

return function(p1, p2)
	-- upvalues: UseSelectorFunction (copy), FetchGamePlayButtonData (copy), PageGateModule (copy), ReactModule (copy), Milestone (copy), FFlagEDPTTIParityDefinitions (copy)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: p2 (copy), FetchGamePlayButtonData (upval)
		return not p2 or FetchGamePlayButtonData.IsLoading(p3, p2)
	end)
	local UseRefResult = if PageGateModule.FFlagEnablePLTPrefetchCallbacks then ReactModule.useRef(false) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), p2 (copy), p1 (copy), Milestone (upval), FFlagEDPTTIParityDefinitions (upval), PageGateModule (upval), UseRefResult (ref)
		if not UseSelectorResult and p2 and p1.trackOnce then
			p1.trackOnce(Milestone.FunctionallyReady)
			
			if FFlagEDPTTIParityDefinitions then
				local MarkPlayButtonReadyFunction: () -> () = p1.markPlayButtonReady
				
				if MarkPlayButtonReadyFunction then
					MarkPlayButtonReadyFunction()
				end
			end
			if PageGateModule.FFlagEnablePLTPrefetchCallbacks and UseRefResult and not UseRefResult.current then
				UseRefResult.current = true
				PageGateModule.signal(PageGateModule.Page.ExperienceDetail, PageGateModule.Milestone.FunctionallyReady)
			end
		end
	end, { UseSelectorResult, p2, p1 })
end