local SignalModule = require(script.Parent.Parent.Parent.Signal)
local VoiceChatService = game:GetService("VoiceChatService")
local VoiceChatDataModule = {}
VoiceChatDataModule.__index = VoiceChatDataModule

function VoiceChatDataModule.new()
	-- upvalues: VoiceChatDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, VoiceChatDataModule)
	t._statsUpdated = SignalModule.new()
	t._statsData = {}
	t._isRunning = false
	
	return t
end

function VoiceChatDataModule:Signal()
	return self._statsUpdated
end

function VoiceChatDataModule:getCurrentData()
	return self._statsData
end

function VoiceChatDataModule:isRunning()
	return self._isRunning
end

function VoiceChatDataModule:start()
	-- upvalues: VoiceChatService (copy)
	if VoiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = VoiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (copy), VoiceChatService (upval)
			self._statsData = VoiceChatService:lastVoiceChatStats()
			self._statsUpdated:Fire(self._statsData)
		end)
		self._isRunning = true
	end
end

function VoiceChatDataModule:stop()
	self._isRunning = false
	
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
	end
end

return VoiceChatDataModule