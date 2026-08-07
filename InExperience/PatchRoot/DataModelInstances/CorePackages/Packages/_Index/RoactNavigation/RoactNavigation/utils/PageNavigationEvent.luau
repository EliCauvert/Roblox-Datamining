local invariantModule = require(script.Parent.invariant)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 6 ]]
	-- upvalues: invariantModule (ref), t (ref)
	invariantModule(type(p0) == "string", "pageName should be string")
	invariantModule(typeof(p1) == "userdata", "event should be RoactNavigation.Event")
	local t_1 = { event = p1, pageName = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.isPageNavigationEvent(p2) --[[ line: 19 ]]
	-- upvalues: t (ref)
	return getmetatable(p2).__index == t
end

function t:__tostring() --[[ line: 23 ]]
	return string.format("%-15s - %s", tostring(self.event), self.pageName)
end

function t:equalTo(p3) --[[ line: 27 ]]
	-- upvalues: invariantModule (ref), t (ref)
	invariantModule(t.isPageNavigationEvent(p3), "should be PageNavigationEvent")
	
	return self.pageName == p3.pageName and self.event == p3.event
end

return t