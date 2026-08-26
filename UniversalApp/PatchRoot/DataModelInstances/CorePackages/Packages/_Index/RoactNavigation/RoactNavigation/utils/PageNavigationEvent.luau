local invariantModule = require(script.Parent.invariant)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: invariantModule (ref), t (ref)
	invariantModule(type(p1) == "string", "pageName should be string")
	invariantModule(typeof(p2) == "userdata", "event should be RoactNavigation.Event")
	local t_1 = { event = p2, pageName = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.isPageNavigationEvent(p1)
	-- upvalues: t (ref)
	return getmetatable(p1).__index == t
end

function t:__tostring()
	return string.format("%-15s - %s", tostring(self.event), self.pageName)
end

function t:equalTo(p1)
	-- upvalues: invariantModule (ref), t (ref)
	invariantModule(t.isPageNavigationEvent(p1), "should be PageNavigationEvent")
	
	return self.pageName == p1.pageName and self.event == p1.event
end

return t