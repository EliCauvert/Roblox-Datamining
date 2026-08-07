local httpService = game:GetService("HttpService")
local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p0) --[[ line: 7 ]]
	-- upvalues: SQUAD_URLModule (ref), httpService (ref)
	local var2 = nil
	local var3 = p0.roduxNetworking.POST({ Name = "SquadInvite" }, function(p1, p2) --[[ line: 13 ]]
		-- upvalues: p0 (ref), var2 (write), SQUAD_URLModule (copy), httpService (copy)
		if p0.useMockedResponse then
			var2 = {
				responseBody = {
					channelUpgraded = false,
					parentChannelId = p2.parentChannelId,
					results = {
						{
							userId = 3447631062,
							resultStatus = { resultType = "success", message = "message" }
						}
					}
				}
			}
		end
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("invite"):body({
			groupUpId = p2.squadId,
			invitedUserIds = p2.invitedUserIds,
			parentChannelId = p2.parentChannelId,
			isReparented = p2.isReparented,
			requestId = httpService:GenerateGUID()
		})
	end)
	
	if p0.useMockedResponse then
		var3.Mock.clear()
		var3.Mock.reply(function() --[[ line: 44 ]]
			-- upvalues: var2 (write)
			return var2
		end)
	end
	return var3
end