local HttpService = game:GetService("HttpService")
local SessionType = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.RobloxAppSessionization).SessionType

return {
	generateUuid = function()
		-- upvalues: HttpService (copy)
		return HttpService:GenerateGUID(true)
	end,
	create = function(SessionService, Metadata, p1, p2, p3, p4)
		-- upvalues: SessionType (copy)
		if not SessionService:SessionExists(SessionType.StructuralIdentifier.OmniSearch) or SessionService:GetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.OmniSearchUuid) ~= Metadata then
			SessionService:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.OmniSearch, SessionType.StructuralIdentifier.OmniSearch)
			SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.OmniSearchUuid, Metadata)
		end
		SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchKeyword, p1)
		SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchType, p2)
		SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchTabUuid, p3)
		SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchSourceEvent, p4)
	end,
	updateSearchType = function(SessionService, p1, p2, p3)
		-- upvalues: SessionType (copy)
		if SessionService:SessionExists(SessionType.StructuralIdentifier.OmniSearch) then
			SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchType, p1)
			
			if p2 then
				SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchTabUuid, p2)
			end
			SessionService:SetMetadata(SessionType.StructuralIdentifier.OmniSearch, SessionType.Metadata.OmniSearch.SearchSourceEvent, p3)
		end
	end
}