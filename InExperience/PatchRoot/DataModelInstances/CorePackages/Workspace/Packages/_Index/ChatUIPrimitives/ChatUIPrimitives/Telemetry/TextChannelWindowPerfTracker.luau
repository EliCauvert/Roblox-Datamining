local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local list = { "duration", "averageFPS", "longestFrameTime" }
local textChannelWindowPerfTrackingEnabled = game:DefineFastFlag("TextChannelWindowPerfTrackingEnabled", false)
local var1 = nil
local t = {}
local t_1 = {}
local t_2 = {
	withTrackers = function(p1, p2)
		-- upvalues: timeToInteractiveTracker (write), intervalPerformanceTracker (write)
		timeToInteractiveTracker = p1
		intervalPerformanceTracker = p2
	end,
	_setEnabledForTesting = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	startMountTTI = function(p1)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), timeToInteractiveTracker (write)
		if if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1 then
			timeToInteractiveTracker.trackStart("TextChannelWindow_MountTTI_" .. p2)
			
			return
		end
	end,
	finishMountTTI = function(p1)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), timeToInteractiveTracker (write)
		if if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1 then
			timeToInteractiveTracker.trackEnd("TextChannelWindow_MountTTI_" .. p3)
			
			return
		end
	end,
	startSendInterval = function(p1, p2)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), list (ref)
		if not (if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1) then return end
		local var2 = t[p2]
		
		if var2 == nil or var2.id == nil or os.clock() >= (if var2 ~= nil then 0 else var2.timestamp or 0) + 5 then
			t[p2] = { id = p1, timestamp = os.clock() }
			local text = "TextChannelWindow_MessageSendToRenderInterval_" .. p5
			intervalPerformanceTracker:cancelTracking(text)
			intervalPerformanceTracker:startTracking(text, nil, list, true, true)
			
			return
		end
	end,
	startReceiveInterval = function(p1, p2)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), t_1 (write), intervalPerformanceTracker (write), list (ref)
		if not (if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1) then return end
		local var2 = t_1[p2]
		
		if var2 == nil or var2.id == nil or os.clock() >= (if var2 ~= nil then 0 else var2.timestamp or 0) + 5 then
			t_1[p2] = { id = p1, timestamp = os.clock() }
			local text = "TextChannelWindow_MessageReceiveToRenderInterval_" .. p7
			intervalPerformanceTracker:cancelTracking(text)
			intervalPerformanceTracker:startTracking(text, nil, list, true, true)
			
			return
		end
	end,
	finishMessageIntervals = function(p1)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), t_1 (write)
		if not (if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1) then return end
		for i, v in t do
			if v.id == p1 then
				t[i] = {}
				intervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageSendToRenderInterval_" .. i)
			end
		end
		for i_1, v_1 in t_1 do
			if v_1.id == p1 then
				t_1[i_1] = {}
				intervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. i_1)
			end
		end
	end,
	cancelForChannel = function(p2)
		-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref), t (write), intervalPerformanceTracker (write), t_1 (write)
		if not (if var1 ~= nil then textChannelWindowPerfTrackingEnabled else var1) then return end
		if t[p2] then
			t[p2] = {}
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageSendToRenderInterval_" .. p9)
		end
		if t_1[p2] then
			t_1[p2] = {}
			intervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. p9)
		end
	end,
	cancelAll = function()
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

local function _()
	-- upvalues: var1 (write), textChannelWindowPerfTrackingEnabled (ref)
	return if var1 == nil then textChannelWindowPerfTrackingEnabled else var1
end

local _ = function(p2)
	return "TextChannelWindow_MessageSendToRenderInterval_" .. p10
end

local _ = function(p2)
	return "TextChannelWindow_MessageReceiveToRenderInterval_" .. p11
end

return t_2