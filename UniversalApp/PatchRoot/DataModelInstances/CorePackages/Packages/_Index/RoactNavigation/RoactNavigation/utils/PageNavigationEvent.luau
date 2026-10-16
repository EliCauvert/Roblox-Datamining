local InvariantModule = require(script.Parent.invariant)
local PageNavigationEventModule = {}
PageNavigationEventModule.__index = PageNavigationEventModule

function PageNavigationEventModule.new(PageName, Event) --[[ Line: 6 ]]
	-- upvalues: InvariantModule (copy), PageNavigationEventModule (copy)
	InvariantModule(type(PageName) == "string", "pageName should be string")
	InvariantModule(typeof(Event) == "userdata", "event should be RoactNavigation.Event")
	local config = { event = Event, pageName = PageName }
	setmetatable(config, PageNavigationEventModule)
	
	return config
end

function PageNavigationEventModule.isPageNavigationEvent(p1): boolean --[[ Line: 19 ]]
	-- upvalues: PageNavigationEventModule (copy)
	return getmetatable(p1).__index == PageNavigationEventModule
end

function PageNavigationEventModule:__tostring(): string --[[ Line: 23 ]]
	return string.format("%-15s - %s", tostring(self.event), self.pageName)
end

function PageNavigationEventModule:equalTo(p1): boolean --[[ Line: 27 ]]
	-- upvalues: InvariantModule (copy), PageNavigationEventModule (copy)
	InvariantModule(PageNavigationEventModule.isPageNavigationEvent(p1), "should be PageNavigationEvent")
	
	return self.pageName == p1.pageName and self.event == p1.event
end

return PageNavigationEventModule