local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local list = { "duration", "averageFPS", "longestFrameTime" }
local TextChannelWindowPerfTrackingEnabled = game:DefineFastFlag("TextChannelWindowPerfTrackingEnabled", false)
local v1 = nil
local t = {}
local t1 = {}

local function _() --[[ Line: 31 | Named "isEnabled" ]]
	-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy)
	return if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1
end

local _ = function(Text): string --[[ Line: 64 | Named "sendIntervalName" ]]
	return "TextChannelWindow_MessageSendToRenderInterval_" .. Text
end

local _ = function(Text): string --[[ Line: 68 | Named "receiveIntervalName" ]]
	return "TextChannelWindow_MessageReceiveToRenderInterval_" .. Text
end

return {
	withTrackers = function(p1, p2) --[[ Line: 39 ]]
		-- upvalues: TimeToInteractiveTracker (ref), IntervalPerformanceTracker (ref)
		TimeToInteractiveTracker = p1
		IntervalPerformanceTracker = p2
	end,
	_setEnabledForTesting = function(p1) --[[ Line: 44 ]]
		-- upvalues: v1 (ref)
		v1 = p1
	end,
	startMountTTI = function(Text) --[[ Line: 50 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), TimeToInteractiveTracker (ref)
		if if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1 then
			TimeToInteractiveTracker.trackStart("TextChannelWindow_MountTTI_" .. Text)
			
			return
		end
	end,
	finishMountTTI = function(Text) --[[ Line: 57 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), TimeToInteractiveTracker (ref)
		if if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1 then
			TimeToInteractiveTracker.trackEnd("TextChannelWindow_MountTTI_" .. Text)
			
			return
		end
	end,
	startSendInterval = function(Id, Key) --[[ Line: 72 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), t (ref), IntervalPerformanceTracker (ref), list (copy)
		if not (if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1) then return end
		local Entry = t[Key]
		local Timestamp = if Entry == nil then 0 else Entry.timestamp or 0
		
		if Entry == nil or Entry.id == nil or os.clock() >= Timestamp + 5 then
			t[Key] = { id = Id, timestamp = os.clock() }
			local Text = "TextChannelWindow_MessageSendToRenderInterval_" .. Key
			IntervalPerformanceTracker:cancelTracking(Text)
			IntervalPerformanceTracker:startTracking(Text, nil, list, true, true)
			
			return
		end
	end,
	startReceiveInterval = function(Id, Key) --[[ Line: 87 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), t1 (ref), IntervalPerformanceTracker (ref), list (copy)
		if not (if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1) then return end
		local Entry = t1[Key]
		local Timestamp = if Entry == nil then 0 else Entry.timestamp or 0
		
		if Entry == nil or Entry.id == nil or os.clock() >= Timestamp + 5 then
			t1[Key] = { id = Id, timestamp = os.clock() }
			local Text = "TextChannelWindow_MessageReceiveToRenderInterval_" .. Key
			IntervalPerformanceTracker:cancelTracking(Text)
			IntervalPerformanceTracker:startTracking(Text, nil, list, true, true)
			
			return
		end
	end,
	finishMessageIntervals = function(Id) --[[ Line: 104 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), t (ref), IntervalPerformanceTracker (ref), t1 (ref)
		if not (if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1) then return end
		for i, value in t do
			if value.id == Id then
				t[i] = {}
				IntervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageSendToRenderInterval_" .. i)
			end
		end
		for i1, value1 in t1 do
			if value1.id == Id then
				t1[i1] = {}
				IntervalPerformanceTracker:stopAndLogTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. i1)
			end
		end
	end,
	cancelForChannel = function(Key) --[[ Line: 123 ]]
		-- upvalues: v1 (ref), TextChannelWindowPerfTrackingEnabled (copy), t (ref), IntervalPerformanceTracker (ref), t1 (ref)
		if not (if v1 == nil then TextChannelWindowPerfTrackingEnabled else v1) then return end
		if t[Key] then
			t[Key] = {}
			IntervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageSendToRenderInterval_" .. Key)
		end
		if t1[Key] then
			t1[Key] = {}
			IntervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. Key)
		end
	end,
	cancelAll = function() --[[ Line: 138 ]]
		-- upvalues: t (ref), IntervalPerformanceTracker (ref), t1 (ref)
		for i in t do
			IntervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageSendToRenderInterval_" .. i)
		end
		for i1 in t1 do
			IntervalPerformanceTracker:cancelTracking("TextChannelWindow_MessageReceiveToRenderInterval_" .. i1)
		end
		t = {}
		t1 = {}
	end
}