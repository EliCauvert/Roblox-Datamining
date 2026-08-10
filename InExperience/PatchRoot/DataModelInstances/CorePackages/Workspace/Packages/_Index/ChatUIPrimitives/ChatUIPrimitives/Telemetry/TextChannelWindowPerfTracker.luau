local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local list = { "duration", "averageFPS", "longestFrameTime" }
local textChannelWindowPerfTrackingEnabled = game:DefineFastFlag("TextChannelWindowPerfTrackingEnabled", false)
local var2 = nil
local t = {}
local t_1 = {}
local t_2 = {
	withTrackers = function(p0, p1) --[[ line: 39 ]]
		-- upvalues: timeToInteractiveTracker (write), intervalPerformanceTracker (write)
		timeToInteractiveTracker = p0
		intervalPerformanceTracker = p1
	end,
	_setEnabledForTesting = function(value) --[[ line: 44 ]]
		-- upvalues: var2 (write)
		var2 = value
	end,
	startMountTTI = function(p2) --[[ line: 50 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), timeToInteractiveTracker (write)
		if if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2 then
			timeToInteractiveTracker.trackStart("TextChannelWindow_MountTTI_" .. p2)
			
			return
		end
	end,
	finishMountTTI = function(p3) --[[ line: 57 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), timeToInteractiveTracker (write)
		if if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2 then
			timeToInteractiveTracker.trackEnd("TextChannelWindow_MountTTI_" .. p3)
			
			return
		end
	end,
	startSendInterval = function(p4, p5) --[[ line: 72 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), list (ref)
		if not (if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2) then return end
		local var6 = t[p5]
		
		if var6 == nil or var6.id == nil or os.clock() >= (if var6 ~= nil then 0 else var6.timestamp or 0) + 5 then
			t[p5] = { id = p4, timestamp = os.clock() }
			local text = "TextChannelWindow_MessageSendToRenderInterval_" .. p5
			intervalPerformanceTracker:cancelTracking(text)
			intervalPerformanceTracker:startTracking(text, nil, list, true, true)
			
			return
		end
	end,
	startReceiveInterval = function(p6, p7) --[[ line: 87 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), t_1 (write), intervalPerformanceTracker (write), list (ref)
		if not (if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2) then return end
		local var8 = t_1[p7]
		
		if var8 == nil or var8.id == nil or os.clock() >= (if var8 ~= nil then 0 else var8.timestamp or 0) + 5 then
			t_1[p7] = { id = p6, timestamp = os.clock() }
			local text = "TextChannelWindow_MessageReceiveToRenderInterval_" .. p7
			intervalPerformanceTracker:cancelTracking(text)
			intervalPerformanceTracker:startTracking(text, nil, list, true, true)
			
			return
		end
	end,
	finishMessageIntervals = function(p8) --[[ line: 104 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), t_1 (write)
		if not (if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2) then return end
		for i, v in t do
			if v.id == p8 then
				t[i] = {}
				intervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageSendToRenderInterval_" .. i)
			end
		end
		for i_1, v_1 in t_1 do
			if v_1.id == p8 then
				t_1[i_1] = {}
				intervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. i_1)
			end
		end
	end,
	cancelForChannel = function(p9) --[[ line: 123 ]]
		-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), t_1 (write)
		if not (if var2 ~= nil then textChannelWindowPerfTrackingEnabled else var2) then return end
		if t[p9] then
			t[p9] = {}
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageSendToRenderInterval_" .. p9)
		end
		if t_1[p9] then
			t_1[p9] = {}
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. p9)
		end
	end,
	cancelAll = function() --[[ line: 138 ]]
		-- upvalues: t (write), intervalPerformanceTracker (write), t_1 (write)
		for i in t do
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageSendToRenderInterval_" .. i)
		end
		for i_1 in t_1 do
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. i_1)
		end
		t = {}
		t_1 = {}
	end
}

local function _() --[[ line: 31 | named "isEnabled" ]]
	-- upvalues: var2 (write), textChannelWindowPerfTrackingEnabled (ref)
	return if var2 == nil then textChannelWindowPerfTrackingEnabled else var2
end

local _ = function(p10) --[[ line: 64 | named "sendIntervalName" ]]
	return "TextChannelWindow_MessageSendToRenderInterval_" .. p10
end

local _ = function(p11) --[[ line: 68 | named "receiveIntervalName" ]]
	return "TextChannelWindow_MessageReceiveToRenderInterval_" .. p11
end

return t_2