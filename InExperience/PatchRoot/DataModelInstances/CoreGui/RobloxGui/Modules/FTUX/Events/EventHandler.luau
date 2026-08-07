local parent = script.Parent.Parent
local eventsModule = require(parent.Events.Events)
local t = {
	[require(parent.Enums.PlatformEnum).QuestVR] = require(parent.Events.VR.VRFTUXEventHandler)
}

return {
	StartEvents = function(p0, p1, p2) --[[ line: 14 ]]
		-- upvalues: t (ref), eventsModule (ref)
		local var2 = t[p0]
		local var3 = eventsModule[p0][p1]
		
		if var3 then
			for i, v in pairs(var3) do
				var2.StartEvent(v, p2)
			end
		end
	end,
	StopEvents = function(p3, p4) --[[ line: 25 ]]
		-- upvalues: t (ref), eventsModule (ref)
		local var4 = t[p3]
		local var5 = eventsModule[p3][p4]
		
		if var5 then
			for i, v in pairs(var5) do
				var4.StopEvent(v)
			end
		end
	end
}