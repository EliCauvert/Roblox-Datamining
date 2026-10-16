local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)
local CreateCreatorAgentChatStoreModule = require(script.Parent.createCreatorAgentChatStore)
local DebugModule = require(script.Parent.debug)
local GetDefaultAuthHeadersModule = require(script.Parent.Acp.getDefaultAuthHeaders)
local ResolveAcpUrlModule = require(script.Parent.Env.resolveAcpUrl)
local _ = require(script.Parent.types)
local WireCapDeliveryModule = require(script.Parent.Acp.wireCapDelivery)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function() --[[ Line: 19 | Named "createDefaultStore" ]]
	-- upvalues: ResolveAcpUrlModule (copy), DebugModule (copy), AcpProtocolModule (copy), CreateCreatorAgentChatStoreModule (copy), GetDefaultAuthHeadersModule (copy), WireCapDeliveryModule (copy)
	local ResolveCreatorAgentAcpResult = ResolveAcpUrlModule.resolveCreatorAgentAcp()
	DebugModule.log("info", "creating CreatorAgentChatStore", {
		acpUrl = ResolveCreatorAgentAcpResult.url,
		gateway = ResolveCreatorAgentAcpResult.gateway,
		sitetestNumber = ResolveCreatorAgentAcpResult.sitetestNumber,
		capRtnNamespace = AcpProtocolModule.CapRtnNamespace
	})
	local CreatorAgentChatStoreModule = CreateCreatorAgentChatStoreModule({
		baseUrl = ResolveCreatorAgentAcpResult.url,
		getAuthHeaders = GetDefaultAuthHeadersModule
	})
	WireCapDeliveryModule(CreatorAgentChatStoreModule)
	
	return CreatorAgentChatStoreModule
end)