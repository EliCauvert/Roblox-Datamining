local SignalModule = require(script.Parent.Parent.Parent.Signal)
local VoiceChatService = game:GetService("VoiceChatService")
local VoiceChatDataModule = {}
VoiceChatDataModule.__index = VoiceChatDataModule

function VoiceChatDataModule.new() --[[ Line: 9 ]]
	-- upvalues: VoiceChatDataModule (copy), SignalModule (copy)
	local t = {}
	setmetatable(t, VoiceChatDataModule)
	t._statsUpdated = SignalModule.new()
	t._statsData = {}
	t._isRunning = false
	
	return t
end

function VoiceChatDataModule:Signal() --[[ Line: 19 ]]
	return self._statsUpdated
end

function VoiceChatDataModule:getCurrentData() --[[ Line: 23 ]]
	return self._statsData
end

function VoiceChatDataModule:isRunning() --[[ Line: 27 ]]
	return self._isRunning
end

function VoiceChatDataModule:start() --[[ Line: 31 ]]
	-- upvalues: VoiceChatService (copy)
	if VoiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = VoiceChatService.VoiceChatStatsCollected:Connect(function() --[[ Line: 33 ]]
			-- upvalues: self (copy), VoiceChatService (upval)
			self._statsData = VoiceChatService:lastVoiceChatStats()
			self._statsUpdated:Fire(self._statsData)
		end)
		self._isRunning = true
	end
end

function VoiceChatDataModule:stop() --[[ Line: 41 ]]
	self._isRunning = false
	
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
	end
end

return VoiceChatDataModule