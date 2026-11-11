local Parent = script:FindFirstAncestor("PageLoadTracker").Parent
local ReactModule = require(Parent.React)
local PageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local _ = require(script.Parent.Parent.createPageTracker)
local Signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local FFlagLuaAppEnableChatMilestones = require(Parent.SharedFlags).FFlagLuaAppEnableChatMilestones

local function createNoOpTracker()
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
		start = function() end,
		logMilestone = function() end,
		stop = function() end,
		onComponentAdded = function() end,
		complete = function() end,
		sendMilestone = function() end
	}
end

return function()
	-- upvalues: ReactModule (copy), PageTrackerContextModule (copy), FFlagLuaAppEnableChatMilestones (copy), createNoOpTracker (copy)
	local UseContextResult = ReactModule.useContext(PageTrackerContextModule)
	
	if UseContextResult == nil then
		if FFlagLuaAppEnableChatMilestones then
			return ReactModule.useMemo(function()
				-- upvalues: createNoOpTracker (upval)
				return (createNoOpTracker())
			end, {})
		end
		error("usePageTracker must be used within a PageTrackerContext.Provider")
	end
	return UseContextResult
end