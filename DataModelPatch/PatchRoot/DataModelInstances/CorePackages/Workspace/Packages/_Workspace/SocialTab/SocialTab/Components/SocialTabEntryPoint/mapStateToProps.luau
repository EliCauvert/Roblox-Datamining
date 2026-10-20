local AppChatNetworkingModule = require(script:FindFirstAncestor("SocialTab").Parent.AppChatNetworking)

return function(p1, _)
	-- upvalues: AppChatNetworkingModule (copy)
	return {
		retrievalStatus = AppChatNetworkingModule.rodux.GetMetadata.getStatus(p1)
	}
end