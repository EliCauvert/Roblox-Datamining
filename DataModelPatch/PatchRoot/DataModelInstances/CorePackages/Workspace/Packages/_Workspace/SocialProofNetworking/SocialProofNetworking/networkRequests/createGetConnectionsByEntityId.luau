local SocialProofNetworking = script:FindFirstAncestor("SocialProofNetworking")
local SOCIALPROOFURLModule = require(SocialProofNetworking.SOCIAL_PROOF_URL)
local _ = require(SocialProofNetworking.types)

return function(p1)
	-- upvalues: SOCIALPROOFURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetConnectionsByEntityId" }, function(Callback, p2)
		-- upvalues: SOCIALPROOFURLModule (upval)
		return (Callback(SOCIALPROOFURLModule):path("social-proof-api"):path("v1"):path("social-proof"):path("entity"):path("connections"):body({
			entityId = p2.entityId,
			entityType = p2.entityType,
			connectionType = p2.connectionType,
			cursor = p2.cursor
		}))
	end)
end