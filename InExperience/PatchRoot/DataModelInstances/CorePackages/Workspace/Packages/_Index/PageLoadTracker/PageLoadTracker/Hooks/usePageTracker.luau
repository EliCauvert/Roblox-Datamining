local Parent = script:FindFirstAncestor("PageLoadTracker").Parent
local ReactModule = require(Parent.React)
local PageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local _ = require(script.Parent.Parent.createPageTracker)
local Signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local FFlagLuaAppEnableChatMilestones = require(Parent.SharedFlags).FFlagLuaAppEnableChatMilestones

local function createNoOpTracker() --[[ Line: 11 ]]
	-- upvalues: Signal (copy)
	return {
		pageName = "",
		startTime = 0,
		lastActivityTime = 0,
		timeoutThread = nil,
		isActive = false,
		numLoads = 0,
		onCompleteSignal = Signal.new(),
		sentMilestones = {},
		start = function() --[[ Line: 22 ]] end,
		logMilestone = function() --[[ Line: 23 ]] end,
		stop = function() --[[ Line: 24 ]] end,
		onComponentAdded = function() --[[ Line: 25 ]] end,
		complete = function() --[[ Line: 26 ]] end,
		sendMilestone = function() --[[ Line: 27 ]] end
	}
end

return function() --[[ Line: 31 | Named "usePageTracker" ]]
	-- upvalues: ReactModule (copy), PageTrackerContextModule (copy), FFlagLuaAppEnableChatMilestones (copy), createNoOpTracker (copy)
	local UseContextResult = ReactModule.useContext(PageTrackerContextModule)
	
	if UseContextResult == nil then
		if FFlagLuaAppEnableChatMilestones then
			return ReactModule.useMemo(function() --[[ Line: 36 ]]
				-- upvalues: createNoOpTracker (upval)
				return (createNoOpTracker())
			end, {})
		end
		error("usePageTracker must be used within a PageTrackerContext.Provider")
	end
	return UseContextResult
end