local _ = game:GetService("ScriptContext")
local HttpService = game:GetService("HttpService")
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local LuauHeapDataModule = {}
LuauHeapDataModule.__index = LuauHeapDataModule

function LuauHeapDataModule.new()
	-- upvalues: LuauHeapDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, LuauHeapDataModule)
	t._serverStatsUpdated = SignalModule.new()
	t._serverStatsData = {}
	t._isRunning = false
	
	return t
end

function LuauHeapDataModule:Signal()
	return self._serverStatsUpdated
end

function LuauHeapDataModule:getCurrentData()
	return self._serverStatsData
end

function LuauHeapDataModule:isRunning()
	return self._isRunning
end

function LuauHeapDataModule:start()
	-- upvalues: GetClientReplicatorModule (copy), HttpService (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule and not self._statsListenerConnection then
		self._statsListenerConnection = ClientReplicatorModule.StatsReceived:connect(function(Stats)
			-- upvalues: self (copy), HttpService (upval)
			if Stats and Stats.ServerLuauHeapData and #Stats.ServerLuauHeapData > 0 then
				self._serverStatsData = HttpService:JSONDecode(Stats.ServerLuauHeapData)
				self._serverStatsUpdated:Fire(self._serverStatsData)
			end
		end)
		ClientReplicatorModule:RequestServerStats(true)
		self._isRunning = true
	end
end

function LuauHeapDataModule:stop()
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
		self._statsListenerConnection = nil
	end
	self._isRunning = false
end

return LuauHeapDataModule