local MessageBus = require(game:GetService("CorePackages").Workspace.Packages.MessageBus).MessageBus
local SignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Signal)
local ExperienceEventReceiverModule = {}
ExperienceEventReceiverModule.__index = ExperienceEventReceiverModule

function ExperienceEventReceiverModule:onLaunched(p1)
	-- upvalues: MessageBus (copy)
	return self.subscribe(MessageBus.getMessageId("Game", "launchSuccess"), p1)
end

function ExperienceEventReceiverModule:onLeft(p1)
	-- upvalues: MessageBus (copy)
	return self.subscribe(MessageBus.getMessageId("Game", "onGameLeave"), p1)
end

function ExperienceEventReceiverModule:UnsubscribeFromAllMessages()
	self.subscriber:unsubscribeFromAllMessages()
end

function ExperienceEventReceiverModule.new()
	-- upvalues: MessageBus (copy), SignalModule (copy), ExperienceEventReceiverModule (copy)
	local config = {
		signalTable = {},
		subscriber = MessageBus.Subscriber.new()
	}
	
	function config.subscribe(GameMessageId, Callback)
		-- upvalues: config (copy), SignalModule (upval)
		assert(type(Callback) == "function", "Expected callback to be a function")
		local Signal = config.signalTable[GameMessageId]
		
		if Signal == nil then
			Signal = SignalModule.new()
			config.signalTable[GameMessageId] = Signal
			config.subscriber:subscribe({ mid = GameMessageId }, function(p1)
				-- upvalues: Signal (ref)
				Signal:fire(p1)
			end)
		end
		return Signal:connect(Callback)
	end
	
	setmetatable(config, ExperienceEventReceiverModule)
	
	return config
end

return ExperienceEventReceiverModule