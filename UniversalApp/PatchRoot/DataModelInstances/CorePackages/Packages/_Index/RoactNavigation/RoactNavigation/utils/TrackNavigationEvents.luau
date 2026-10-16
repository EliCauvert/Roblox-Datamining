local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Array = require(Parent1.LuauPolyfill).Array
local ReactModule = require(Parent1.React)
local ReactRobloxModule = require(Parent1.Dev.ReactRoblox)
local NavigationEventsModule = require(Parent.views.NavigationEvents)
local EventsModule = require(Parent.Events)
local InvariantModule = require(script.Parent.invariant)
local PageNavigationEventModule = require(script.Parent.PageNavigationEvent)
local TrackNavigationEventsModule = {}
TrackNavigationEventsModule.__index = TrackNavigationEventsModule

function TrackNavigationEventsModule.new() --[[ Line: 16 ]]
	-- upvalues: TrackNavigationEventsModule (copy)
	local config = { navigationEvents = {} }
	setmetatable(config, TrackNavigationEventsModule)
	
	return config
end

function TrackNavigationEventsModule:getNavigationEvents() --[[ Line: 26 ]]
	return self.navigationEvents
end

function TrackNavigationEventsModule:printNavigationEvents() --[[ Line: 30 ]]
	print("Total Events: ", #self.navigationEvents)
	
	for _, navigationEvent in self.navigationEvents do
		print(navigationEvent)
	end
end

function TrackNavigationEventsModule.waitForNumberEventsMaxWaitTime(p1, p2, p3) --[[ Line: 37 ]]
	-- upvalues: ReactRobloxModule (copy)
	local NewElapsed = 0
	while #p1.navigationEvents < p2 and NewElapsed <= p3 do
		ReactRobloxModule.act(function() --[[ Line: 40 ]]
			-- upvalues: NewElapsed (ref)
			NewElapsed += task.wait()
		end)
	end
end

function TrackNavigationEventsModule:resetNavigationEvents() --[[ Line: 46 ]]
	self.navigationEvents = {}
end

local config = {
	onWillFocus = EventsModule.WillFocus,
	onDidFocus = EventsModule.DidFocus,
	onWillBlur = EventsModule.WillBlur,
	onDidBlur = EventsModule.DidBlur
}

function TrackNavigationEventsModule.createNavigationAdapter(p4, p5) --[[ Line: 57 ]]
	-- upvalues: config (copy), PageNavigationEventModule (copy), ReactModule (copy), NavigationEventsModule (copy)
	local t = {}
	
	for i, value in config do
		t[i] = function() --[[ Line: 60 ]]
			-- upvalues: PageNavigationEventModule (upval), p5 (copy), value (copy), p4 (copy)
			PageNavigationEventModule.new(p5, value)
			table.insert(p4.navigationEvents, PageNavigationEventModule.new(p5, value))
		end
	end
	return ReactModule.createElement(NavigationEventsModule, t)
end

function TrackNavigationEventsModule:equalTo(p6) --[[ Line: 69 ]]
	-- upvalues: InvariantModule (copy)
	InvariantModule(type(p6) == "table", "should be a list")
	local CountNavigationEvents = #self.navigationEvents
	
	if CountNavigationEvents ~= #p6 then
		return false, "different amount of events"
	end
	for i = 1, CountNavigationEvents do
		if not self.navigationEvents[i]:equalTo(p6[i]) then
			return false, ("events at position %d do not match"):format(i)
		end
	end
	return true
end

function TrackNavigationEventsModule:expect(p7) --[[ Line: 86 ]]
	-- upvalues: Array (copy)
	local EqualToResult, EqualToResult2 = self:equalTo(p7)
	
	if not EqualToResult then
		local v1 = "{}"
		local v2 = "{}"
		
		if #self.navigationEvents > 0 then
			v1 = ("{\n  %s,\n}"):format(table.concat(Array.map(self.navigationEvents, tostring), ",\n  "))
		end
		if #p7 > 0 then
			v2 = ("{\n  %s,\n}"):format(table.concat(Array.map(p7, tostring), ",\n  "))
		end
		error(("%s\nGot events: %s\n\nExpected events: %s"):format(EqualToResult2, v1, v2))
	end
end

return TrackNavigationEventsModule