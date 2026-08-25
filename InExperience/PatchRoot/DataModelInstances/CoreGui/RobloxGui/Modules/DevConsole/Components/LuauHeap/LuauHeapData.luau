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
	local var5 = getClientReplicatorModule()
	
	if var5 and not self._statsListenerConnection then
		self._statsListenerConnection = var5.StatsReceived:connect(function(p0)
			-- upvalues: self (ref), httpService (copy)
			if p0 and p0.ServerLuauHeapData and #p0.ServerLuauHeapData > 0 then
				self._serverStatsData = httpService:JSONDecode(p0.ServerLuauHeapData)
				self._serverStatsUpdated:Fire(self._serverStatsData)
			end
		end)
		var5:RequestServerStats(true)
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