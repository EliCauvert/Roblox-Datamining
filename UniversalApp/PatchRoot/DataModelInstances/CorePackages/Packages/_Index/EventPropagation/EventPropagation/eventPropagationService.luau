local focusNavigationUtilsModule = require(script.Parent.Parent.FocusNavigationUtils)
local getAncestors = focusNavigationUtilsModule.getAncestors
local mockableWarn = focusNavigationUtilsModule.mockableWarn
local eventPropagationEventModule = require(script.Parent.eventPropagationEvent)
local dEBUGEVENTPROPAGATION = _G.__DEBUG_EVENT_PROPAGATION__

local function describeFunction(p1)
	return table.concat(table.pack(debug.info(p1, "sln")), " ")
end

local function _(p1, p2)
	return p1[p2]
end

local _ = function(p1, p2, p3)
	local var1 = p1[p2]
	
	return if var1 then var1[p3] else nil
end

local _ = function(p1, p2, p3, p4)
	local var1 = p1[p2]
	local var2 = if var1 then var1[p3] else nil
	
	return if var2 == nil then nil else var2[p4]
end

local t = {}
t.__index = t

function t:registerEventHandler(p1, p2, p3, p4)
	-- upvalues: dEBUGEVENTPROPAGATION (ref), mockableWarn (ref), describeFunction (ref)
	if dEBUGEVENTPROPAGATION then
		print("+++ register handler", p2, tostring(p1), p4 or "Bubble")
	end
	p4 = p4 or "Bubble"
	self.eventHandlerRegistry[p1] = self.eventHandlerRegistry[p1] or {}
	self.eventHandlerRegistry[p1][p2] = self.eventHandlerRegistry[p1][p2] or {}
	
	if _G.__DEV__ then
		local var1 = self.eventHandlerRegistry[p1][p2][p4]
		
		if var1 then
			mockableWarn(string.format("New handler bound to the %s phase of '%s' will override an existing handler:\n\tprevious handler: %s\n\t     new handler: %s", p4, p2, table.concat(table.pack(debug.info(p3, "sln")), " "), describeFunction(var1)))
		end
	end
	self.eventHandlerRegistry[p1][p2][p4] = p3
end

function t:registerEventHandlers(p1, p2)
	if not self.eventHandlerRegistry[p1] then
		self.eventHandlerRegistry[p1] = {}
	end
	for i, v in p2 do
		self:registerEventHandler(p1, i, v.handler, v.phase)
	end
end

function t:deregisterEventHandlers(p3, p4)
	if not self.eventHandlerRegistry[p3] then return end
	for i, v in p4 do
		self:deregisterEventHandler(p3, i, v.handler, v.phase)
	end
end

function t:deregisterEventHandler(p5, p6, p7, p8)
	-- upvalues: dEBUGEVENTPROPAGATION (ref), mockableWarn (ref)
	if dEBUGEVENTPROPAGATION then
		print("--- deregister handler", p6, tostring(p5), p8 or "Bubble")
	end
	p8 = p8 or "Bubble"
	local var1 = self.eventHandlerRegistry[p5]
	local var2 = if var1 then var1[p6] else nil
	
	if var2 and var2[p8] then
		if _G.__DEV__ then
			local var3 = var2[p8]
			
			if var3 ~= p7 then
				mockableWarn(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':\n\tprevious handler: %s\n\t     new handler: %s", p8, p6, if type(p7) == "function" then table.concat(table.pack(debug.info(p7, "sln")), " ") else tostring(p7), if type(var3) == "function" then table.concat(table.pack(debug.info(var3, "sln")), " ") else tostring(var3)))
			end
		end
		var2[p8] = nil
		
		return
	elseif _G.__DEV__ then
		mockableWarn(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", p8, p6))
	end
end

function t:getRegisteredEventHandlers(p5)
	local var1 = self.eventHandlerRegistry[p5]
	
	if not var1 then
		return nil
	end
	local t = {}
	
	for i, v in var1 do
		t[i] = next(v) ~= nil
	end
	return t
end

function t:propagateEvent(p6, p7, p8, p9)
	-- upvalues: eventPropagationEventModule (ref), getAncestors (ref), dEBUGEVENTPROPAGATION (ref)
	p9 = p9 or {}
	local synthetic = p9.synthetic or false
	local silent = p9.silent or false
	
	local function _(p10, p11)
		-- upvalues: self (ref), p7 (ref), eventPropagationEventModule (copy), p6 (ref), synthetic (ref), p8 (ref)
		local var2 = self.eventHandlerRegistry[p10]
		local var3 = if var2 then var2[p7] else nil
		local var4 = if var3 ~= nil then nil else var3[p11]
		
		if var4 then
			local var5 = eventPropagationEventModule.new(p6, p10, p7, p11, synthetic, p8)
			var4(var5)
			
			return var5.cancelled
		end
		return false
	end
	
	local _ = false
	local var2 = if silent then { p6 } else getAncestors(p6)
	
	if dEBUGEVENTPROPAGATION then
		print(">>> capture event", p7, "for", tostring(p6))
	end
	local cancelled
	for i = #var2, 1, -1 do
		local var3 = var2[i]
		local var4 = self.eventHandlerRegistry[var3]
		local var5 = if var4 then var4[p7] else nil
		local var6 = if var5 ~= nil then nil else var5.Capture
		
		if var6 then
			local capture = eventPropagationEventModule.new(p6, var3, p7, "Capture", synthetic, p8)
			var6(capture)
			cancelled = capture.cancelled
		else
			cancelled = false
		end
		if not cancelled then
			continue
		end
		return
	end
	local var7 = self.eventHandlerRegistry[p6]
	local var8 = if var7 then var7[p7] else nil
	local var9 = if var8 ~= nil then nil else var8.Target
	
	if var9 then
		local target = eventPropagationEventModule.new(p6, p6, p7, "Target", synthetic, p8)
		var9(target)
		cancelled = target.cancelled
	else
		cancelled = false
	end
	if cancelled then return end
	if dEBUGEVENTPROPAGATION then
		print("<<< bubble event", p7, "from", tostring(p6))
	end
	for i_1 = 1, #var2 do
		local var10 = var2[i_1]
		local var11 = self.eventHandlerRegistry[var10]
		local var12 = if var11 then var11[p7] else nil
		local var13 = if var12 ~= nil then nil else var12.Bubble
		
		if var13 then
			local bubble = eventPropagationEventModule.new(p6, var10, p7, "Bubble", synthetic, p8)
			var13(bubble)
			cancelled = bubble.cancelled
		else
			cancelled = false
		end
		if not cancelled then
			continue
		end
		return
	end
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		eventHandlerRegistry = setmetatable({}, { __mode = "k" })
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t