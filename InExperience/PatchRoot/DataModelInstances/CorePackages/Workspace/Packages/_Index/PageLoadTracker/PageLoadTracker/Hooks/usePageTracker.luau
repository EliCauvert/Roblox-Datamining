local parent = script:FindFirstAncestor("PageLoadTracker").Parent
local reactModule = require(parent.React)
local pageTrackerContextModule = require(script.Parent.Parent.PageTrackerContext)
local _ = require(script.Parent.Parent.createPageTracker)
local signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local fFlagLuaAppEnableChatMilestones = require(parent.SharedFlags).FFlagLuaAppEnableChatMilestones

local function createNoOpTracker() --[[ line: 11 ]]
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
		start = function() --[[ line: 22 ]] end,
		logMilestone = function() --[[ line: 23 ]] end,
		stop = function() --[[ line: 24 ]] end,
		onComponentAdded = function() --[[ line: 25 ]] end,
		complete = function() --[[ line: 26 ]] end,
		sendMilestone = function() --[[ line: 27 ]] end
	}
end

return function() --[[ line: 31 | named "usePageTracker" ]]
	-- upvalues: reactModule (ref), pageTrackerContextModule (ref), fFlagLuaAppEnableChatMilestones (ref), createNoOpTracker (ref)
	local var3 = reactModule.useContext(pageTrackerContextModule)
	
	if var3 == nil then
		if fFlagLuaAppEnableChatMilestones then
			return reactModule.useMemo(function() --[[ line: 36 ]]
				-- upvalues: createNoOpTracker (copy)
				return createNoOpTracker()
			end, {})
		end
		error("usePageTracker must be used within a PageTrackerContext.Provider")
	end
	return var3
end