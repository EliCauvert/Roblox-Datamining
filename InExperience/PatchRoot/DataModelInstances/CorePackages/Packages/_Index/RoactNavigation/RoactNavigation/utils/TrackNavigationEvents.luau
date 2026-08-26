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

function t.new()
	-- upvalues: t (ref)
	local t_1 = { navigationEvents = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:getNavigationEvents()
	return self.navigationEvents
end

function t:printNavigationEvents()
	print("Total Events: ", #self.navigationEvents)
	
	for i, v in self.navigationEvents do
		print(v)
	end
end

function t:waitForNumberEventsMaxWaitTime(b, p1)
	-- upvalues: reactRobloxModule (ref)
	local var1 = 0
	while #self.navigationEvents < b and var1 <= p1 do
		reactRobloxModule.act(function()
			-- upvalues: var1 (write)
			var1 += task.wait()
		end)
	end
end

function t:resetNavigationEvents()
	self.navigationEvents = {}
end

local t_1 = {
	onWillFocus = eventsModule.WillFocus,
	onDidFocus = eventsModule.DidFocus,
	onWillBlur = eventsModule.WillBlur,
	onDidBlur = eventsModule.DidBlur
}

function t.createNavigationAdapter(p2, p3)
	-- upvalues: t_1 (ref), pageNavigationEventModule (ref), reactModule (ref), navigationEventsModule (ref)
	local t = {}
	
	for i, v in t_1 do
		t[i] = function()
			-- upvalues: pageNavigationEventModule (copy), p3 (ref), v (ref), p2 (ref)
			pageNavigationEventModule.new(p3, v)
			table.insert(p2.navigationEvents, pageNavigationEventModule.new(p3, v))
		end
	end
	return reactModule.createElement(navigationEventsModule, t)
end

function t:equalTo(p4)
	-- upvalues: invariantModule (ref)
	invariantModule(type(p4) == "table", "should be a list")
	local navigationEventsCount = #self.navigationEvents
	
	if navigationEventsCount ~= #p4 then
		return false, "different amount of events"
	end
	for i = 1, navigationEventsCount do
		if self.navigationEvents[i]:equalTo(p4[i]) then
			continue
		end
		return false, ("events at position %d do not match"):format(i)
	end
	return true
end

function t:expect(p5)
	-- upvalues: array (ref)
	local var2, var3 = self:equalTo(p5)
	
	if not var2 then
		local var4 = "{}"
		local var5 = "{}"
		
		if #self.navigationEvents > 0 then
			var4 = ("{\n  %s,\n}"):format(table.concat(array.map(self.navigationEvents, tostring), ",\n  "))
		end
		if #p5 > 0 then
			var5 = ("{\n  %s,\n}"):format(table.concat(array.map(p5, tostring), ",\n  "))
		end
		error(("%s\nGot events: %s\n\nExpected events: %s"):format(var3, var4, var5))
	end
end

return t