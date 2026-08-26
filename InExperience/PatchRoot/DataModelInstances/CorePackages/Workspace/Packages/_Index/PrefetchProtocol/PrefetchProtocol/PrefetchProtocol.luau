local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local _ = require(script.Parent.PrefetchProtocolTypes)
local t = {
	POP_GUID_DESCRIPTOR = {
		fid = messageBus.getMessageId("Prefetch", "popPendingPrefetchGuid"),
		validateParams = require(parent.t).table
	}
}
t.__index = t

function t.new(p1)
	-- upvalues: messageBus (ref), t (ref)
	local t_1 = { messageBus = p1 or messageBus }
	setmetatable(t_1, t)
	
	return t_1
end

function t:popPendingPrefetchGuid()
	return self.messageBus.call(self.POP_GUID_DESCRIPTOR, {})
end

t.default = t.new()

return t