local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local _ = require(script.Parent.PrefetchProtocolTypes)
local PrefetchProtocolModule = {
	POP_GUID_DESCRIPTOR = {
		fid = MessageBus.getMessageId("Prefetch", "popPendingPrefetchGuid"),
		validateParams = require(Parent.t).table
	}
}
PrefetchProtocolModule.__index = PrefetchProtocolModule

function PrefetchProtocolModule.new(p1) --[[ Line: 31 ]]
	-- upvalues: MessageBus (copy), PrefetchProtocolModule (copy)
	local config = { messageBus = p1 or MessageBus }
	setmetatable(config, PrefetchProtocolModule)
	
	return config
end

function PrefetchProtocolModule:popPendingPrefetchGuid() --[[ Line: 39 ]]
	return self.messageBus.call(self.POP_GUID_DESCRIPTOR, {})
end

PrefetchProtocolModule.default = PrefetchProtocolModule.new()

return PrefetchProtocolModule