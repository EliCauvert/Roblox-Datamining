local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local createCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)
local debugModule = require(script.Parent.debug)
local getDefaultAuthHeadersModule = require(script.Parent.Acp.getDefaultAuthHeaders)
local resolveAcpUrlModule = require(script.Parent.Env.resolveAcpUrl)
local _ = require(script.Parent.types)
local wireCapDeliveryModule = require(script.Parent.Acp.wireCapDelivery)

return signalsModule.createComputed(function() --[[ line: 19 | named "createDefaultStore" ]]
	-- upvalues: resolveAcpUrlModule (ref), debugModule (ref), acpProtocolModule (ref), createCreatorAgentChatStoreModule (ref), getDefaultAuthHeadersModule (ref), wireCapDeliveryModule (ref)
	local var7 = resolveAcpUrlModule.resolveCreatorAgentAcp()
	debugModule.log("info", "creating CreatorAgentChatStore", {
		acpUrl = var7.url,
		gateway = var7.gateway,
		sitetestNumber = var7.sitetestNumber,
		capRtnNamespace = acpProtocolModule.CapRtnNamespace
	})
	local var8 = createCreatorAgentChatStoreModule({
		baseUrl = var7.url,
		getAuthHeaders = getDefaultAuthHeadersModule
	})
	wireCapDeliveryModule(var8)
	
	return var8
end)