local runService = game:GetService("RunService")
local signalsModule = require(script:FindFirstAncestor("SignalsUtils").Parent.Signals)
local tbl = setmetatable({}, { __mode = "v" })
local var3 = nil

local function _() --[[ line: 18 | named "maybeDisconnect" ]]
	-- upvalues: tbl (ref), var3 (write)
	if next(tbl) == nil and var3 then
		var3:Disconnect()
		var3 = nil
	end
end

local function onHeartbeat() --[[ line: 25 ]]
	-- upvalues: tbl (ref), var3 (write)
	if next(tbl) == nil and var3 then
		var3:Disconnect()
		var3 = nil
	end
	if not var3 then return end
	local processTime = os.clock()
	
	for i, v in tbl do
		if i <= processTime - v.lastTick then
			v.lastTick = processTime
			v.setter(DateTime.now().UnixTimestamp)
		end
	end
end

local _ = function() --[[ line: 40 | named "ensureConnection" ]]
	-- upvalues: var3 (write), runService (ref), onHeartbeat (ref)
	if not var3 then
		var3 = runService.Heartbeat:Connect(onHeartbeat)
	end
end

return function(value) --[[ line: 46 | named "createCurrentTimeSignal" ]]
	-- upvalues: tbl (ref), signalsModule (ref), var3 (write), runService (ref), onHeartbeat (ref)
	local value_1 = value or 30
	
	if not tbl[value_1] then
		local var7, var8 = signalsModule.createSignal(DateTime.now().UnixTimestamp)
		tbl[value_1] = { getter = var7, setter = var8, lastTick = os.clock() }
		
		if not var3 then
			var3 = runService.Heartbeat:Connect(onHeartbeat)
		end
	end
	local var9 = tbl[value_1]
	
	return function(p0) --[[ line: 63 ]]
		-- upvalues: var9 (ref)
		return var9.getter(p0)
	end
end