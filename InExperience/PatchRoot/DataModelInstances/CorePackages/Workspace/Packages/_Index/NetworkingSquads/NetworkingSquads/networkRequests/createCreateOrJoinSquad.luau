local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: SQUADURLModule (copy)
	local Config = nil
	local CreateOrJoinSquad = p1.roduxNetworking.POST("CreateOrJoinSquad", function(Callback, p2) --[[ Line: 11 ]]
		-- upvalues: p1 (copy), Config (ref), SQUADURLModule (upval)
		if p1.useMockedResponse then
			Config = {
				responseBody = {
					groupUp = {
						groupUpId = "20000000-0000-0000-0000-000000000000",
						initiatorId = 3447631062,
						createdAtTime = tostring(os.clock() * 1000),
						updatedAtTime = tostring(os.clock() * 1000),
						parentChannelId = p2.parentChannelId,
						members = {
							{ userId = 3447631062, rank = 0 },
							{ userId = 2591622000, rank = 1 },
							{ userId = 3447649029, rank = 2 },
							{ userId = 3447641701, rank = 3 },
							{ userId = 3447635964, rank = 4 },
							{ userId = 3447642362, rank = 5 }
						}
					}
				}
			}
		end
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("join-or-create-for-channel"):body({
			parentChannelId = p2.parentChannelId,
			leaveExisting = p2.leaveExisting,
			squadLocation = p2.squadLocation,
			partyAttemptId = p2.partyAttemptId,
			scheduledGroupUpId = p2.scheduledSquadId
		})
	end)
	
	if p1.useMockedResponse then
		CreateOrJoinSquad.Mock.clear()
		CreateOrJoinSquad.Mock.reply(function() --[[ Line: 64 ]]
			-- upvalues: Config (ref)
			return Config
		end)
	end
	return CreateOrJoinSquad
end