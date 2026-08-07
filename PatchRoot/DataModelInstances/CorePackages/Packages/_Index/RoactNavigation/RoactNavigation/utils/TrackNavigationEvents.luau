-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local array = require(parent_1.LuauPolyfill).Array
local reactModule = require(parent_1.React)
local reactRobloxModule = require(parent_1.Dev.ReactRoblox)
local navigationEventsModule = require(parent.views.NavigationEvents)
local eventsModule = require(parent.Events)
local invariantModule = require(script.Parent.invariant)
local pageNavigationEventModule = require(script.Parent.PageNavigationEvent)
local t = {}
t.__index = t

function t.new() --[[ line: 16 ]]
	-- upvalues: t (ref)
	local t_1 = { navigationEvents = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:getNavigationEvents() --[[ line: 26 ]]
	return self.navigationEvents
end

function t:printNavigationEvents() --[[ line: 30 ]]
	print("Total Events: ", #self.navigationEvents)
	
	for i, v in self.navigationEvents do
		print(v)
	end
end

function t:waitForNumberEventsMaxWaitTime(b, p0) --[[ line: 37 ]]
	-- upvalues: reactRobloxModule (ref)
	local var9 = 0
	while #self.navigationEvents < b and var9 <= p0 do
		reactRobloxModule.act(function() --[[ line: 40 ]]
			-- upvalues: var9 (write)
			var9 += task.wait()
		end)
	end
end

function t:resetNavigationEvents() --[[ line: 46 ]]
	self.navigationEvents = {}
end

local t_1 = {
	onWillFocus = eventsModule.WillFocus,
	onDidFocus = eventsModule.DidFocus,
	onWillBlur = eventsModule.WillBlur,
	onDidBlur = eventsModule.DidBlur
}

function t.createNavigationAdapter(p1, p2) --[[ line: 57 ]]
	-- upvalues: t_1 (ref), pageNavigationEventModule (ref), reactModule (ref), navigationEventsModule (ref)
	local t = {}
	
	for i, v in t_1 do
		t[i] = function() --[[ line: 60 ]]
			-- upvalues: pageNavigationEventModule (copy), p2 (ref), v (ref), p1 (ref)
			pageNavigationEventModule.new(p2, v)
			table.insert(p1.navigationEvents, pageNavigationEventModule.new(p2, v))
		end
	end
	return reactModule.createElement(navigationEventsModule, t)
end

function t:equalTo(p3) --[[ line: 69 ]]
	-- upvalues: invariantModule (ref)
	invariantModule(type(p3) == "table", "should be a list")
	local navigationEventsCount = #self.navigationEvents
	
	if navigationEventsCount ~= #p3 then
		return false, "different amount of events"
	end
	for i = 1, navigationEventsCount do
		if self.navigationEvents[i]:equalTo(p3[i]) then
			continue
		end
		return false, ("events at position %d do not match"):format(i)
	end
	return true
end

function t:expect(p4) --[[ line: 86 ]]
	-- upvalues: array (ref)
	local var12, var13 = self:equalTo(p4)
	
	if not var12 then
		local var14 = "{}"
		local var15 = "{}"
		
		if #self.navigationEvents > 0 then
			var14 = ("{\n  %s,\n}"):format(table.concat(array.map(self.navigationEvents, tostring), ",\n  "))
		end
		if #p4 > 0 then
			var15 = ("{\n  %s,\n}"):format(table.concat(array.map(p4, tostring), ",\n  "))
		end
		error(("%s\nGot events: %s\n\nExpected events: %s"):format(var13, var14, var15))
	end
end

return t