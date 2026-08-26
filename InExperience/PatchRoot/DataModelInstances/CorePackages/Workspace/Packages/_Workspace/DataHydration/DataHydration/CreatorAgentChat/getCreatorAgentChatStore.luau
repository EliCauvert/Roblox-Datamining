local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local acpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local createCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)
local debugModule = require(script.Parent.debug)
local getDefaultAuthHeadersModule = require(script.Parent.Acp.getDefaultAuthHeaders)
local resolveAcpUrlModule = require(script.Parent.Env.resolveAcpUrl)
local _ = require(script.Parent.types)
local wireCapDeliveryModule = require(script.Parent.Acp.wireCapDelivery)

return signalsModule.createComputed(function()
	-- upvalues: resolveAcpUrlModule (ref), debugModule (ref), acpProtocolModule (ref), createCreatorAgentChatStoreModule (ref), getDefaultAuthHeadersModule (ref), wireCapDeliveryModule (ref)
	local var1 = resolveAcpUrlModule.resolveCreatorAgentAcp()
	debugModule.log("info", "creating CreatorAgentChatStore", {
		acpUrl = var1.url,
		gateway = var1.gateway,
		sitetestNumber = var1.sitetestNumber,
		capRtnNamespace = acpProtocolModule.CapRtnNamespace
	})
	local var2 = createCreatorAgentChatStoreModule({
		baseUrl = var1.url,
		getAuthHeaders = getDefaultAuthHeadersModule
	})
	wireCapDeliveryModule(var2)
	
	return var2
end)