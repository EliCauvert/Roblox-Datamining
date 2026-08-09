local parent = script:FindFirstAncestor("NetworkingSquads").Parent
local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)
local fFlagEnableScheduledSquads = require(parent.SharedFlags).FFlagEnableScheduledSquads

return function(p0) --[[ line: 10 ]]
	-- upvalues: SQUAD_URLModule (ref), fFlagEnableScheduledSquads (ref)
	local var1 = nil
	local var2 = p0.roduxNetworking.POST({ Name = "CreateOrJoinSquad" }, function(p1, p2) --[[ line: 16 ]]
		-- upvalues: p0 (ref), var1 (write), SQUAD_URLModule (copy), fFlagEnableScheduledSquads (copy)
		if p0.useMockedResponse then
			var1 = {
				responseBody = {
					groupUp = {
						groupUpId = "20000000-0000-0000-0000-000000000000",
						initiatorId = 3447631062,
						createdAtTime = tostring(os.clock() * 1000),
						updatedAtTime = tostring(os.clock() * 1000),
						parentChannelId = p2.parentChannelId,
						members = {
							{ userId = 3447631062, rank = 0 }, { userId = 2591622000, rank = 1 },
							{ userId = 3447649029, rank = 2 }, { userId = 3447641701, rank = 3 },
							{ userId = 3447635964, rank = 4 }, { userId = 3447642362, rank = 5 }
						}
					}
				}
			}
		end
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("join-or-create-for-channel"):body({
			parentChannelId = p2.parentChannelId,
			leaveExisting = p2.leaveExisting,
			squadLocation = p2.squadLocation,
			partyAttemptId = p2.partyAttemptId,
			scheduledGroupUpId = if fFlagEnableScheduledSquads then p2.scheduledSquadId else nil
		})
	end)
	
	if p0.useMockedResponse then
		var2.Mock.clear()
		var2.Mock.reply(function() --[[ line: 69 ]]
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return var2
end