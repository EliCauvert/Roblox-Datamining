local EventPropagationEventModule = {}
EventPropagationEventModule.__index = EventPropagationEventModule

function EventPropagationEventModule.new(TargetInstance, CurrentInstance, EventName, Phase, p1, Tbl) --[[ Line: 18 ]]
	-- upvalues: EventPropagationEventModule (copy)
	local config = {
		cancelled = false,
		phase = Phase,
		currentInstance = CurrentInstance,
		targetInstance = TargetInstance,
		eventName = EventName,
		synthetic = p1 or false,
		eventData = if type(Tbl) == "table" and not table.isfrozen(Tbl) then table.freeze(Tbl) else Tbl
	}
	setmetatable(config, EventPropagationEventModule)
	
	return config
end

function EventPropagationEventModule:cancel() --[[ Line: 41 ]]
	self.cancelled = true
end

return EventPropagationEventModule