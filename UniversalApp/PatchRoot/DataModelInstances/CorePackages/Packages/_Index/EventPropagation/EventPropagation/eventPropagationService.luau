local focusNavigationUtilsModule = require(script.Parent.Parent.FocusNavigationUtils)
local getAncestors = focusNavigationUtilsModule.getAncestors
local mockableWarn = focusNavigationUtilsModule.mockableWarn
local eventPropagationEventModule = require(script.Parent.eventPropagationEvent)
local dEBUGEVENTPROPAGATION = _G.__DEBUG_EVENT_PROPAGATION__

local function describeFunction(p0) --[[ line: 113 ]]
	return table.concat(table.pack(debug.info(p0, "sln")), " ")
end

local function _(p1, p2) --[[ line: 117 | named "getEventsFromRegistry" ]]
	return p1[p2]
end

local _ = function(p3, p4, p5) --[[ line: 121 | named "getEventPhasesFromRegistry" ]]
	local var4 = p3[p4]
	
	return if var4 then var4[p5] else nil
end

local _ = function(p6, p7, p8, p9) --[[ line: 130 | named "getEventHandler" ]]
	local var5 = p6[p7]
	local var6 = if var5 then var5[p8] else nil
	
	return if var6 == nil then nil else var6[p9]
end

local t = {}
t.__index = t

function t:registerEventHandler(p10, p11, p12, p13) --[[ line: 143 ]]
	-- upvalues: dEBUGEVENTPROPAGATION (ref), mockableWarn (ref), describeFunction (ref)
	if dEBUGEVENTPROPAGATION then
		print("+++ register handler", p11, tostring(p10), p13 or "Bubble")
	end
	p13 = p13 or "Bubble"
	self.eventHandlerRegistry[p10] = self.eventHandlerRegistry[p10] or {}
	self.eventHandlerRegistry[p10][p11] = self.eventHandlerRegistry[p10][p11] or {}
	
	if _G.__DEV__ then
		local var8 = self.eventHandlerRegistry[p10][p11][p13]
		
		if var8 then
			mockableWarn(string.format("New handler bound to the %s phase of '%s' will override an existing handler:\n\tprevious handler: %s\n\t     new handler: %s", p13, p11, table.concat(table.pack(debug.info(p12, "sln")), " "), describeFunction(var8)))
		end
	end
	self.eventHandlerRegistry[p10][p11][p13] = p12
end

function t:registerEventHandlers(p14, p15) --[[ line: 174 ]]
	if not self.eventHandlerRegistry[p14] then
		self.eventHandlerRegistry[p14] = {}
	end
	for i, v in p15 do
		self:registerEventHandler(p14, i, v.handler, v.phase)
	end
end

function t:deregisterEventHandlers(p16, p17) --[[ line: 183 ]]
	if not self.eventHandlerRegistry[p16] then return end
	for i, v in p17 do
		self:deregisterEventHandler(p16, i, v.handler, v.phase)
	end
end

function t:deregisterEventHandler(p18, p19, p20, p21) --[[ line: 192 ]]
	-- upvalues: dEBUGEVENTPROPAGATION (ref), mockableWarn (ref)
	if dEBUGEVENTPROPAGATION then
		print("--- deregister handler", p19, tostring(p18), p21 or "Bubble")
	end
	p21 = p21 or "Bubble"
	local var10 = self.eventHandlerRegistry[p18]
	local var11 = if var10 then var10[p19] else nil
	
	if var11 and var11[p21] then
		if _G.__DEV__ then
			local var12 = var11[p21]
			
			if var12 ~= p20 then
				mockableWarn(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':\n\tprevious handler: %s\n\t     new handler: %s", p21, p19, if type(p20) == "function" then table.concat(table.pack(debug.info(p20, "sln")), " ") else tostring(p20), if type(var12) == "function" then table.concat(table.pack(debug.info(var12, "sln")), " ") else tostring(var12)))
			end
		end
		var11[p21] = nil
		
		return
	elseif _G.__DEV__ then
		mockableWarn(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", p21, p19))
	end
end

function t:getRegisteredEventHandlers(p22) --[[ line: 233 ]]
	local var13 = self.eventHandlerRegistry[p22]
	
	if not var13 then
		return nil
	end
	local t = {}
	
	for i, v in var13 do
		t[i] = next(v) ~= nil
	end
	return t
end

function t:propagateEvent(p23, p24, p25, p26) --[[ line: 247 ]]
	-- upvalues: eventPropagationEventModule (ref), getAncestors (ref), dEBUGEVENTPROPAGATION (ref)
	p26 = p26 or {}
	local synthetic = p26.synthetic or false
	local silent = p26.silent or false
	
	local function _(p27, p28) --[[ line: 257 | named "runEventHandler" ]]
		-- upvalues: self (ref), p24 (ref), eventPropagationEventModule (copy), p23 (ref), synthetic (ref), p25 (ref)
		local var33 = self.eventHandlerRegistry[p27]
		local var34 = if var33 then var33[p24] else nil
		local var35 = if var34 ~= nil then nil else var34[p28]
		
		if var35 then
			local var36 = eventPropagationEventModule.new(p23, p27, p24, p28, synthetic, p25)
			var35(var36)
			
			return var36.cancelled
		end
		return false
	end
	
	local _ = false
	local var18 = if silent then { p23 } else getAncestors(p23)
	
	if dEBUGEVENTPROPAGATION then
		print(">>> capture event", p24, "for", tostring(p23))
	end
	local cancelled
	for i = #var18, 1, -1 do
		local var19 = var18[i]
		local var20 = self.eventHandlerRegistry[var19]
		local var21 = if var20 then var20[p24] else nil
		local var22 = if var21 ~= nil then nil else var21.Capture
		
		if var22 then
			local capture = eventPropagationEventModule.new(p23, var19, p24, "Capture", synthetic, p25)
			var22(capture)
			cancelled = capture.cancelled
		else
			cancelled = false
		end
		if not cancelled then
			continue
		end
		return
	end
	local var24 = self.eventHandlerRegistry[p23]
	local var25 = if var24 then var24[p24] else nil
	local var26 = if var25 ~= nil then nil else var25.Target
	
	if var26 then
		local target = eventPropagationEventModule.new(p23, p23, p24, "Target", synthetic, p25)
		var26(target)
		cancelled = target.cancelled
	else
		cancelled = false
	end
	if cancelled then return end
	if dEBUGEVENTPROPAGATION then
		print("<<< bubble event", p24, "from", tostring(p23))
	end
	for i_1 = 1, #var18 do
		local var28 = var18[i_1]
		local var29 = self.eventHandlerRegistry[var28]
		local var30 = if var29 then var29[p24] else nil
		local var31 = if var30 ~= nil then nil else var30.Bubble
		
		if var31 then
			local bubble = eventPropagationEventModule.new(p23, var28, p24, "Bubble", synthetic, p25)
			var31(bubble)
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

function t.new() --[[ line: 304 ]]
	-- upvalues: t (ref)
	local t_1 = {
		eventHandlerRegistry = setmetatable({}, { __mode = "k" })
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t