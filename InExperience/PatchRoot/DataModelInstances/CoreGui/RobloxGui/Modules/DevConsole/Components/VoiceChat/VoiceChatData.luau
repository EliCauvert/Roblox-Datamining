local signalModule = require(script.Parent.Parent.Parent.Signal)
local voiceChatService = game:GetService("VoiceChatService")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref), signalModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._statsUpdated = signalModule.new()
	t_1._statsData = {}
	t_1._isRunning = false
	
	return t_1
end

function t:Signal()
	return self._statsUpdated
end

function t:getCurrentData()
	return self._statsData
end

function t:isRunning()
	return self._isRunning
end

function t:start()
	-- upvalues: voiceChatService (ref)
	if voiceChatService and not self._statsListenerConnection then
		self._statsListenerConnection = voiceChatService.VoiceChatStatsCollected:Connect(function()
			-- upvalues: self (ref), voiceChatService (copy)
			self._statsData = voiceChatService:lastVoiceChatStats()
			self._statsUpdated:Fire(self._statsData)
		end)
		self._isRunning = true
	end
end

function t:stop()
	self._isRunning = false
	
	if self._statsListenerConnection then
		self._statsListenerConnection:Disconnect()
	end
end

return t