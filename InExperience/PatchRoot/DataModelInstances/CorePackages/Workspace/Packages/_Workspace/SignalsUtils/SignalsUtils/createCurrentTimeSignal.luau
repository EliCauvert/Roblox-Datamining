local RunService = game:GetService("RunService")
local SignalsModule = require(script:FindFirstAncestor("SignalsUtils").Parent.Signals)
local self = setmetatable({}, { __mode = "v" })
local HeartbeatConnection = nil

local function _() --[[ Line: 18 | Named "maybeDisconnect" ]]
	-- upvalues: self (copy), HeartbeatConnection (ref)
	if next(self) == nil and HeartbeatConnection then
		HeartbeatConnection:Disconnect()
		HeartbeatConnection = nil
	end
end

local function onHeartbeat() --[[ Line: 25 ]]
	-- upvalues: self (copy), HeartbeatConnection (ref)
	if next(self) == nil and HeartbeatConnection then
		HeartbeatConnection:Disconnect()
		HeartbeatConnection = nil
	end
	if not HeartbeatConnection then return end
	local ClockTime = os.clock()
	
	for i, value in self do
		if i <= ClockTime - value.lastTick then
			value.lastTick = ClockTime
			value.setter(DateTime.now().UnixTimestamp)
		end
	end
end

local _ = function() --[[ Line: 40 | Named "ensureConnection" ]]
	-- upvalues: HeartbeatConnection (ref), RunService (copy), onHeartbeat (copy)
	if not HeartbeatConnection then
		HeartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

return function(p1) --[[ Line: 46 | Named "createCurrentTimeSignal" ]]
	-- upvalues: self (copy), SignalsModule (copy), HeartbeatConnection (ref), RunService (copy), onHeartbeat (copy)
	local P0 = p1 or 30
	
	if not self[P0] then
		local Signal, Signal2 = SignalsModule.createSignal(DateTime.now().UnixTimestamp)
		self[P0] = { getter = Signal, setter = Signal2, lastTick = os.clock() }
		
		if not HeartbeatConnection then
			HeartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
		end
	end
	local SelfEntry = self[P0]
	
	return function(p2) --[[ Line: 63 ]]
		-- upvalues: SelfEntry (copy)
		return SelfEntry.getter(p2)
	end
end