local SocialProof = script:FindFirstAncestor("SocialProof")
local Parent = SocialProof.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({}, {
	[require(SocialProof.Networking.NetworkingSocialProof).GetConnectionsByEntityId.Succeeded.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local t = {}
		local Connections = p2.responseBody.connections
		local TotalCount = p2.responseBody.totalCount
		local EntityId = p2.postBody.entityId
		local EntityType = p2.postBody.entityType
		local ConnectionType = p2.postBody.connectionType
		
		if not t[ConnectionType] then
			t[ConnectionType] = {}
		end
		if not t[ConnectionType][EntityType] then
			t[ConnectionType][EntityType] = {}
		end
		t[ConnectionType][EntityType][EntityId] = {
			totalConnections = TotalCount,
			userIds = if Connections then CryoModule.List.map(Connections, function(p3): string
				return (tostring(p3.id))
			end) else {}
		}
		
		return CryoModule.Dictionary.union(p1, t)
	end
})