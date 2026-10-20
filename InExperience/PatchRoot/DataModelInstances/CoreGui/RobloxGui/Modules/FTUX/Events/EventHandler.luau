local Parent = script.Parent.Parent
local EventsModule = require(Parent.Events.Events)
local config = {
	[require(Parent.Enums.PlatformEnum).QuestVR] = require(Parent.Events.VR.VRFTUXEventHandler)
}

return {
	StartEvents = function(p1, p2, p3)
		-- upvalues: config (copy), EventsModule (copy)
		local Entry = config[p1]
		local EventsModuleEntry = EventsModule[p1][p2]
		
		if EventsModuleEntry then
			for _, value in pairs(EventsModuleEntry) do
				Entry.StartEvent(value, p3)
			end
		end
	end,
	StopEvents = function(p4, p5)
		-- upvalues: config (copy), EventsModule (copy)
		local Entry = config[p4]
		local EventsModuleEntry = EventsModule[p4][p5]
		
		if EventsModuleEntry then
			for _, value in pairs(EventsModuleEntry) do
				Entry.StopEvent(value)
			end
		end
	end
}