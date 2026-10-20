local FocusNavigationUtilsModule = require(script.Parent.Parent.FocusNavigationUtils)
local GetAncestorsFunction = FocusNavigationUtilsModule.getAncestors
local MockableWarnFunction = FocusNavigationUtilsModule.mockableWarn
local EventPropagationEventModule = require(script.Parent.eventPropagationEvent)
local DEBUGEVENTPROPAGATION = _G.__DEBUG_EVENT_PROPAGATION__

local function describeFunction(EventHandlerEntry): string
	return table.concat(table.pack(debug.info(EventHandlerEntry, "sln")), " ")
end

local function _(p1, p2)
	return p1[p2]
end

local _ = function(p1, p2, p3)
	local v1 = p1[p2]
	
	return if v1 then v1[p3] else nil
end

local _ = function(p1, p2, p3, p4)
	local v1 = p1[p2]
	local v2 = if v1 then v1[p3] else nil
	
	return if v2 == nil then nil else v2[p4]
end

local EventPropagationService = {}
EventPropagationService.__index = EventPropagationService

function EventPropagationService:registerEventHandler(p1, p2, Handler, Phase)
	-- upvalues: DEBUGEVENTPROPAGATION (copy), MockableWarnFunction (copy), describeFunction (copy)
	if DEBUGEVENTPROPAGATION then
		print("+++ register handler", p2, tostring(p1), Phase or "Bubble")
	end
	local Phase1 = Phase or "Bubble"
	self.eventHandlerRegistry[p1] = self.eventHandlerRegistry[p1] or {}
	self.eventHandlerRegistry[p1][p2] = self.eventHandlerRegistry[p1][p2] or {}
	
	if _G.__DEV__ then
		local EventHandlerEntry = self.eventHandlerRegistry[p1][p2][Phase1]
		
		if EventHandlerEntry then
			MockableWarnFunction(string.format("New handler bound to the %s phase of '%s' will override an existing handler:\n\tprevious handler: %s\n\t     new handler: %s", Phase1, p2, table.concat(table.pack(debug.info(Handler, "sln")), " "), describeFunction(EventHandlerEntry)))
		end
	end
	self.eventHandlerRegistry[p1][p2][Phase1] = Handler
end

function EventPropagationService:registerEventHandlers(p1, List)
	if not self.eventHandlerRegistry[p1] then
		self.eventHandlerRegistry[p1] = {}
	end
	for i, value in List do
		self:registerEventHandler(p1, i, value.handler, value.phase)
	end
end

function EventPropagationService:deregisterEventHandlers(p2, List)
	if not self.eventHandlerRegistry[p2] then return end
	for i, value in List do
		self:deregisterEventHandler(p2, i, value.handler, value.phase)
	end
end

function EventPropagationService:deregisterEventHandler(p3, p4, Callback, Phase)
	-- upvalues: DEBUGEVENTPROPAGATION (copy), MockableWarnFunction (copy)
	if DEBUGEVENTPROPAGATION then
		print("--- deregister handler", p4, tostring(p3), Phase or "Bubble")
	end
	local Phase1 = Phase or "Bubble"
	local EventHandler = self.eventHandlerRegistry[p3]
	local EventHandlerEntry = if EventHandler then EventHandler[p4] else nil
	
	if EventHandlerEntry and EventHandlerEntry[Phase1] then
		if _G.__DEV__ then
			local Callback1 = EventHandlerEntry[Phase1]
			
			if Callback1 ~= Callback then
				MockableWarnFunction(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':\n\tprevious handler: %s\n\t     new handler: %s", Phase1, p4, if type(Callback) == "function" then table.concat(table.pack(debug.info(Callback, "sln")), " ") else tostring(Callback), if type(Callback1) == "function" then table.concat(table.pack(debug.info(Callback1, "sln")), " ") else tostring(Callback1)))
			end
		end
		EventHandlerEntry[Phase1] = nil
		
		return
	elseif _G.__DEV__ then
		MockableWarnFunction(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", Phase1, p4))
	end
end

function EventPropagationService:getRegisteredEventHandlers(p3)
	local EventHandler = self.eventHandlerRegistry[p3]
	
	if not EventHandler then
		return nil
	end
	local t = {}
	
	for i, value in EventHandler do
		t[i] = next(value) ~= nil
	end
	return t
end

function EventPropagationService:propagateEvent(p4, p5, p6, p7)
	-- upvalues: EventPropagationEventModule (copy), GetAncestorsFunction (copy), DEBUGEVENTPROPAGATION (copy)
	local P31 = p7 or {}
	local Synthetic = P31.synthetic or false
	
	local function _(p8, p9)
		-- upvalues: self (copy), p5 (copy), EventPropagationEventModule (upval), p4 (copy), Synthetic (copy), p6 (copy)
		local EventHandler = self.eventHandlerRegistry[p8]
		local EventHandlerEntry = if EventHandler then EventHandler[p5] else nil
		local Callback: (any) -> () = if EventHandlerEntry == nil then nil else EventHandlerEntry[p9]
		
		if Callback then
			local NewEventPropagationEvent = EventPropagationEventModule.new(p4, p8, p5, p9, Synthetic, p6)
			Callback(NewEventPropagationEvent)
			
			return NewEventPropagationEvent.cancelled
		else
			return false
		end
	end
	
	local List = if P31.silent or false then { p4 } else GetAncestorsFunction(p4)
	
	if DEBUGEVENTPROPAGATION then
		print(">>> capture event", p5, "for", (tostring(p4)))
	end
	for i = #List, 1, -1 do
		local Entry = List[i]
		local EventHandler = self.eventHandlerRegistry[Entry]
		local EventHandlerEntry = if EventHandler then EventHandler[p5] else nil
		local Capture: (any) -> () = if EventHandlerEntry == nil then nil else EventHandlerEntry.Capture
		local Cancelled = nil
		
		if Capture then
			local Capture1 = EventPropagationEventModule.new(p4, Entry, p5, "Capture", Synthetic, p6)
			Capture(Capture1)
			Cancelled = Capture1.cancelled
		else
			Cancelled = false
		end
		if Cancelled then return end
	end
	local EventHandler = self.eventHandlerRegistry[p4]
	local EventHandlerEntry = if EventHandler then EventHandler[p5] else nil
	local Target: (any) -> () = if EventHandlerEntry == nil then nil else EventHandlerEntry.Target
	local Cancelled = nil
	
	if Target then
		local Target1 = EventPropagationEventModule.new(p4, p4, p5, "Target", Synthetic, p6)
		Target(Target1)
		Cancelled = Target1.cancelled
	else
		Cancelled = false
	end
	if Cancelled then return end
	if DEBUGEVENTPROPAGATION then
		print("<<< bubble event", p5, "from", (tostring(p4)))
	end
	for i1 = 1, #List do
		local Entry = List[i1]
		local EventHandler1 = self.eventHandlerRegistry[Entry]
		local EventHandlerEntry1 = if EventHandler1 then EventHandler1[p5] else nil
		local Bubble: (any) -> () = if EventHandlerEntry1 == nil then nil else EventHandlerEntry1.Bubble
		local Cancelled1 = nil
		
		if Bubble then
			local Bubble1 = EventPropagationEventModule.new(p4, Entry, p5, "Bubble", Synthetic, p6)
			Bubble(Bubble1)
			Cancelled1 = Bubble1.cancelled
		else
			Cancelled1 = false
		end
		if Cancelled1 then break end
	end
end

function EventPropagationService.new()
	-- upvalues: EventPropagationService (copy)
	local config = {
		eventHandlerRegistry = setmetatable({}, { __mode = "k" })
	}
	setmetatable(config, EventPropagationService)
	
	return config
end

return EventPropagationService