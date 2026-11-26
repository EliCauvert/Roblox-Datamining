local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local config = {
	mid = MessageBus.getMessageId("CoplaySession", "statusChanged"),
	validateParams = TModule.strictInterface({
		universeId = TModule.string,
		isCoplaySession = TModule.boolean
	})
}

return function(UniverseId): boolean
	-- upvalues: MessageBus (copy), config (copy)
	local Success, Result = pcall(MessageBus.getLast, config)
	
	if Success and Result ~= nil and Result.isCoplaySession == true then
		MessageBus.publish(config, { isCoplaySession = false, universeId = Result.universeId })
		
		return Result.universeId == UniverseId
	else
		return false
	end
end