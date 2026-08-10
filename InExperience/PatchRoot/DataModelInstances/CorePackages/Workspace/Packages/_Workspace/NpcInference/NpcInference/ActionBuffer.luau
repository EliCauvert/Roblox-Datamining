local timeGridModule = require(script.Parent.TimeGrid)
local INTERVAL = timeGridModule.INTERVAL
local userInputService = game:GetService("UserInputService")
local t = {}
t.__index = t
t.DT = INTERVAL

function t.new(p0) --[[ line: 51 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl._future = {}
	tbl._observedEvents = {}
	tbl._bufferDuration = p0
	tbl._connections = {}
	tbl._lastResponseClientTime = nil
	tbl._lastAppliedAction = nil
	tbl._lastGridSlot = nil
	
	return tbl
end

local function trimFront(p1, p2, p3) --[[ line: 64 ]]
	local var5 = 0
	
	if p3 then
		while var5 < #p1 and p1[var5 + 1].time <= p2 do
			var5 += 1
		end
	while var5 < #p1 and p1[var5 + 1].time < p2 do
		var5 += 1
	end
	if var5 > 0 then
		table.move(p1, var5 + 1, #p1, 1)
		
		for i = #p1, #p1 - var5 + 1, -1 do
			table.remove(p1, i)
		end
	end
end

local function _(p4) --[[ line: 87 | named "mouseButtonIndex" ]]
	return if p4 == Enum.UserInputType.MouseButton1 then 0 elseif p4 == Enum.UserInputType.MouseButton2 then 1 elseif p4 == Enum.UserInputType.MouseButton3 then 2 else nil
end

function t:startListening() --[[ line: 98 ]]
	-- upvalues: userInputService (ref)
	self:stopListening()
	table.insert(self._connections, userInputService.InputBegan:Connect(function(p5, _) --[[ line: 103 ]]
		-- upvalues: self (ref)
		if p5.UserInputType == Enum.UserInputType.Keyboard then
			table.insert(self._observedEvents, {
				kind = "keyDown",
				time = os.clock(),
				key = p5.KeyCode.Value
			})
			
			return
		end
		local userInputType = p5.UserInputType
		local var6 = if userInputType == Enum.UserInputType.MouseButton1 then 0 elseif userInputType == Enum.UserInputType.MouseButton2 then 1 elseif userInputType == Enum.UserInputType.MouseButton3 then 2 else nil
		
		if var6 ~= nil then
			table.insert(self._observedEvents, {
				kind = "mouseButton",
				down = true,
				time = os.clock(),
				button = var6
			})
		end
	end))
	table.insert(self._connections, userInputService.InputEnded:Connect(function(p6, _) --[[ line: 126 ]]
		-- upvalues: self (ref)
		if p6.UserInputType == Enum.UserInputType.Keyboard then
			table.insert(self._observedEvents, {
				kind = "keyUp",
				time = os.clock(),
				key = p6.KeyCode.Value
			})
			
			return
		end
		local userInputType = p6.UserInputType
		local var7 = if userInputType == Enum.UserInputType.MouseButton1 then 0 elseif userInputType == Enum.UserInputType.MouseButton2 then 1 elseif userInputType == Enum.UserInputType.MouseButton3 then 2 else nil
		
		if var7 ~= nil then
			table.insert(self._observedEvents, {
				kind = "mouseButton",
				down = false,
				time = os.clock(),
				button = var7
			})
		end
	end))
	table.insert(self._connections, userInputService.InputChanged:Connect(function(p7) --[[ line: 149 ]]
		-- upvalues: self (ref)
		if p7.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = p7.Delta
			table.insert(self._observedEvents, {
				kind = "mouseMove",
				time = os.clock(),
				dx = delta.X,
				dy = delta.Y
			})
			
			return
		elseif p7.UserInputType == Enum.UserInputType.MouseWheel then
			table.insert(self._observedEvents, {
				kind = "mouseScroll",
				time = os.clock(),
				dz = p7.Position.Z
			})
		end
	end))
end

function t:stopListening() --[[ line: 169 ]]
	for i, v in ipairs(self._connections) do
		v:Disconnect()
	end
	self._connections = {}
end

function t:checkResponse(p8) --[[ line: 180 ]]
	if self._lastResponseClientTime then
		if p8 <= self._lastResponseClientTime then
			warn(string.format("[NpcInference] out-of-order: %.3f <= %.3f, skipping", p8, self._lastResponseClientTime))
			
			return false
		end
		local var8 = p8 - self._lastResponseClientTime
		
		if var8 > 0.05 then
			warn(string.format("[NpcInference] client_time gap %.1fms", var8 * 1000))
		end
	end
	self._lastResponseClientTime = p8
	
	return true
end

function t:mergePrediction(p9, p10) --[[ line: 204 ]]
	-- upvalues: timeGridModule (ref)
	local subactions = p9.subactions
	
	if not subactions or #subactions == 0 then return end
	local var9 = timeGridModule.slotAt(p10, subactions[1].time)
	local t = {}
	
	for i in self._future do
		if var9 <= i then
			table.insert(t, i)
		end
	end
	for i_1, v in t do
		self._future[v] = nil
	end
	for i_2, v_1 in ipairs(subactions) do
		local var11 = timeGridModule.slotAt(p10, v_1.time)
		
		if self._lastGridSlot == nil or self._lastGridSlot < var11 then
			self._future[var11] = v_1
		end
	end
end

function t:getFutureSubaction(p11, p12) --[[ line: 229 ]]
	-- upvalues: timeGridModule (ref)
	local var12 = timeGridModule.slotAt(p11, p12)
	local lastGridSlot = self._lastGridSlot
	local var13 = 0
	local var14 = 0
	local var15 = 0
	local keys = nil
	local mouseButtons = nil
	local time = nil
	
	if lastGridSlot == nil or lastGridSlot < var12 then
		local t = {}
		
		for i in self._future do
			if i <= var12 then
				table.insert(t, i)
			end
		end
		table.sort(t)
		
		for i_1, v in t do
			local var17 = self._future[v]
			var13 += var17.mouse_delta[1]
			var14 += var17.mouse_delta[2]
			var15 += var17.mouse_delta[3]
			keys = var17.keys
			mouseButtons = var17.mouse_buttons
			time = var17.time
			self._future[v] = nil
		end
		self._lastGridSlot = var12
	end
	local t = nil
	
	if keys ~= nil and mouseButtons ~= nil then
		t = {
			time = time,
			keys = keys,
			mouse_buttons = mouseButtons,
			mouse_delta = { var13, var14, var15 }
		}
	elseif self._lastAppliedAction ~= nil then
		t = {
			time = timeGridModule.idealTimeAt(p11, var12),
			keys = self._lastAppliedAction.keys,
			mouse_buttons = self._lastAppliedAction.mouse_buttons,
			mouse_delta = { 0, 0, 0 }
		}
	end
	if t ~= nil then
		self._lastAppliedAction = t
	end
	return t
end

function t:queryObservedEvents(p13, p14) --[[ line: 301 ]]
	-- upvalues: trimFront (ref)
	local t = {}
	
	for i, v in ipairs(self._observedEvents) do
		if p14 < v.time then break end
		if p13 < v.time then
			table.insert(t, v)
		end
	end
	trimFront(self._observedEvents, p14 - self._bufferDuration)
	
	return t
end

function t:reset() --[[ line: 322 ]]
	self:stopListening()
	self._future = {}
	self._observedEvents = {}
	self._lastResponseClientTime = nil
	self._lastAppliedAction = nil
	self._lastGridSlot = nil
end

return t