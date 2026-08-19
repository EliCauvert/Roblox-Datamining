local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: SQUAD_URLModule (ref)
	local var1 = nil
	local joinSquad = p0.roduxNetworking.POST("JoinSquad", function(p1, p2) --[[ line: 11 ]]
		-- upvalues: p0 (ref), var1 (write), SQUAD_URLModule (copy)
		if p0.useMockedResponse then
			var1 = {
				responseBody = {
					groupUp = {
						initiatorId = 3447631062,
						groupUpId = p2.squadId,
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
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("join"):body({
			groupUpId = p2.squadId,
			leaveExisting = p2.leaveExisting,
			squadLocation = p2.squadLocation
		})
	end)
	
	if p0.useMockedResponse then
		joinSquad.Mock.clear()
		joinSquad.Mock.reply(function() --[[ line: 62 ]]
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return joinSquad
end