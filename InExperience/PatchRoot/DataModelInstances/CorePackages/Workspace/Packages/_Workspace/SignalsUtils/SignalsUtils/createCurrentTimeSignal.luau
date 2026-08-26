local runService = game:GetService("RunService")
local signalsModule = require(script:FindFirstAncestor("SignalsUtils").Parent.Signals)
local tbl = setmetatable({}, { __mode = "v" })
local var1 = nil

local function _()
	-- upvalues: tbl (ref), var1 (write)
	if next(tbl) == nil and var1 then
		var1:Disconnect()
		var1 = nil
	end
end

local function onHeartbeat()
	-- upvalues: tbl (ref), var1 (write)
	if next(tbl) == nil and var1 then
		var1:Disconnect()
		var1 = nil
	end
	if not var1 then return end
	local processTime = os.clock()
	
	for i, v in tbl do
		if i <= processTime - v.lastTick then
			v.lastTick = processTime
			v.setter(DateTime.now().UnixTimestamp)
		end
	end
end

local _ = function()
	-- upvalues: var1 (write), runService (ref), onHeartbeat (ref)
	if not var1 then
		var1 = runService.Heartbeat:Connect(onHeartbeat)
	end
end

return function(value)
	-- upvalues: tbl (ref), signalsModule (ref), var1 (write), runService (ref), onHeartbeat (ref)
	local value_1 = value or 30
	
	if not tbl[value_1] then
		local var2, var3 = signalsModule.createSignal(DateTime.now().UnixTimestamp)
		tbl[value_1] = { getter = var2, setter = var3, lastTick = os.clock() }
		
		if not var1 then
			var1 = runService.Heartbeat:Connect(onHeartbeat)
		end
	end
	local var4 = tbl[value_1]
	
	return function(p1)
		-- upvalues: var4 (ref)
		return var4.getter(p1)
	end
end