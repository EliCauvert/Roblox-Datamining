local _ = game:GetService("ScriptContext")
local httpService = game:GetService("HttpService")
local signalModule = require(script.Parent.Parent.Parent.Signal)
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._serverStatsUpdated = signalModule.new()
	t_1._serverStatsData = {}
	t_1._isRunning = false
	
	return t_1
end

function t:Signal()
	return self._serverStatsUpdated
end

function t:getCurrentData()
	return self._serverStatsData
end

function t:isRunning()
	return self._isRunning
end

function t:start()
	-- upvalues: getClientReplicatorModule (ref), httpService (ref)
	local var1 = getClientReplicatorModule()
	
	if var1 and not self._statsListenerConnection then
		self._statsListenerConnection = var1.StatsReceived:connect(function(p1)
			-- upvalues: self (ref), httpService (copy)
			if p1 and p1.ServerLuauHeapData and #p1.ServerLuauHeapData > 0 then
				self._serverStatsData = httpService:JSONDecode(p1.ServerLuauHeapData)
				self._serverStatsUpdated:Fire(self._serverStatsData)
			end
		end)
		var1:RequestServerStats(true)
		self._isRunning = true
	end
end

function t:stop()
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return t