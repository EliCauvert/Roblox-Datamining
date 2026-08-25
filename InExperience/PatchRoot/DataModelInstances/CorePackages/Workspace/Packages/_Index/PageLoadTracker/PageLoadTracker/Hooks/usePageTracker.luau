local parent = script:FindFirstAncestor("PageLoadTracker").Parent
local reactModule = require(parent.React)
local pageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local _ = require(script.Parent.Parent.createPageTracker)
local signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local fFlagLuaAppEnableChatMilestones = require(parent.SharedFlags).FFlagLuaAppEnableChatMilestones

local function createNoOpTracker()
	-- upvalues: signal (ref)
	return {
		pageName = "",
		startTime = 0,
		lastActivityTime = 0,
		timeoutThread = nil,
		isActive = false,
		numLoads = 0,
		onCompleteSignal = signal.new(),
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
	-- upvalues: reactModule (ref), pageTrackerContextModule (ref), fFlagLuaAppEnableChatMilestones (ref), createNoOpTracker (ref)
	local var3 = reactModule.useContext(pageTrackerContextModule)
	
	if var3 == nil then
		if fFlagLuaAppEnableChatMilestones then
			return reactModule.useMemo(function()
				-- upvalues: createNoOpTracker (copy)
				return createNoOpTracker()
			end, {})
		end
		error("usePageTracker must be used within a PageTrackerContext.Provider")
	end
	return var3
end