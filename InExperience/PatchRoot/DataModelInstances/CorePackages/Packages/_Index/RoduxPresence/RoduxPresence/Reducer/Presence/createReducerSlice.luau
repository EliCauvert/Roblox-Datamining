local RoduxPresence = script:FindFirstAncestor("RoduxPresence")
local CryoModule = require(RoduxPresence.Parent.Cryo)
local GetDeepValueModule = require(RoduxPresence.getDeepValue)
local ReceivedUserPresenceModule = require(RoduxPresence.Actions.ReceivedUserPresence)

return function(p1, p2, p3) --[[ Line: 10 ]]
	-- upvalues: GetDeepValueModule (copy), CryoModule (copy), ReceivedUserPresenceModule (copy)
	local PresenceNetworking = p3.presenceNetworking
	
	local function handlePresenceModel(p4, Payload) --[[ Line: 13 ]]
		-- upvalues: p1 (copy), GetDeepValueModule (upval), p2 (copy), CryoModule (upval)
		local JoinResult = p4[p1]
		local Text = tostring(Payload.userId)
		local DeepValueModule = GetDeepValueModule(p4, string.format("byUserId.%s.%s", Text, p2))
		
		if DeepValueModule and JoinResult[DeepValueModule] then
			local Text1 = tostring(DeepValueModule)
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				[Text1] = CryoModule.List.removeValue(JoinResult[Text1], Text)
			})
		end
		local List = JoinResult[Payload[p2]]
		
		return if List and table.find(List, Text) then JoinResult else CryoModule.Dictionary.join(JoinResult, {
			[tostring(Payload[p2])] = CryoModule.List.join(List or {}, { Text })
		})
	end
	
	return function(p4, p5) --[[ Line: 36 ]]
		-- upvalues: ReceivedUserPresenceModule (upval), handlePresenceModel (copy), PresenceNetworking (copy), p1 (copy)
		assert(p4, "state should not be nil")
		
		if p5.type == ReceivedUserPresenceModule.name then
			return handlePresenceModel(p4, p5.payload)
		end
		if p5.type ~= PresenceNetworking.GetPresencesFromUserIds.Succeeded.name then
			return p4[p1]
		end
		local v1 = p4[p1]
		
		for _, userPresence in ipairs(p5.responseBody.userPresences) do
			v1 = handlePresenceModel(p4, userPresence)
		end
		return v1
	end
end