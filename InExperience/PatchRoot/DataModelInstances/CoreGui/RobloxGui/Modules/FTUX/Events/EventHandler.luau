local parent = script.Parent.Parent
local eventsModule = require(parent.Events.Events)
local t = {
	[require(parent.Enums.PlatformEnum).QuestVR] = require(parent.Events.VR.VRFTUXEventHandler)
}

return {
	StartEvents = function(p1, p2, p3)
		-- upvalues: t (ref), eventsModule (ref)
		local var1 = t[p1]
		local var2 = eventsModule[p1][p2]
		
		if var2 then
			for i, v in pairs(var2) do
				var1.StartEvent(v, p3)
			end
		end
	end,
	StopEvents = function(p4, p5)
		-- upvalues: t (ref), eventsModule (ref)
		local var3 = t[p4]
		local var4 = eventsModule[p4][p5]
		
		if var4 then
			for i, v in pairs(var4) do
				var3.StopEvent(v)
			end
		end
	end
}