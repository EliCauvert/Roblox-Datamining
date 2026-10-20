local EventPropagationEventModule = {}
EventPropagationEventModule.__index = EventPropagationEventModule

function EventPropagationEventModule.new(TargetInstance, CurrentInstance, EventName, Phase, p1, Tbl)
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

function EventPropagationEventModule:cancel()
	self.cancelled = true
end

return EventPropagationEventModule