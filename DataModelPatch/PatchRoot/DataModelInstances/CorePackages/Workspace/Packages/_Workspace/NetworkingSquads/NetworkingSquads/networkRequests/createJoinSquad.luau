local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy)
	local Config = nil
	local JoinSquad = p1.roduxNetworking.POST({ Name = "JoinSquad" }, function(Callback, p2)
		-- upvalues: p1 (copy), Config (ref), SQUADURLModule (upval)
		if p1.useMockedResponse then
			Config = {
				responseBody = {
					groupUp = {
						initiatorId = 3447631062,
						groupUpId = p2.squadId,
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
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("join"):body({
			groupUpId = p2.squadId,
			leaveExisting = p2.leaveExisting,
			squadLocation = p2.squadLocation
		})
	end)
	
	if p1.useMockedResponse then
		JoinSquad.Mock.clear()
		JoinSquad.Mock.reply(function()
			-- upvalues: Config (ref)
			return Config
		end)
	end
	return JoinSquad
end