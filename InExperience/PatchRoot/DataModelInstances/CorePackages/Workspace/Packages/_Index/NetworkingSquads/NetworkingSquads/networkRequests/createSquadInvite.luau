local httpService = game:GetService("HttpService")
local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUAD_URLModule (ref), httpService (ref)
	local var1 = nil
	local squadInvite = p1.roduxNetworking.POST("SquadInvite", function(p2, p3)
		-- upvalues: p1 (ref), var1 (write), SQUAD_URLModule (copy), httpService (copy)
		if p1.useMockedResponse then
			var1 = {
				responseBody = {
					channelUpgraded = false,
					parentChannelId = p3.parentChannelId,
					results = {
						{
							userId = 3447631062,
							resultStatus = { resultType = "success", message = "message" }
						}
					}
				}
			}
		end
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("invite"):body({
			groupUpId = p3.squadId,
			invitedUserIds = p3.invitedUserIds,
			parentChannelId = p3.parentChannelId,
			isReparented = p3.isReparented,
			requestId = httpService:GenerateGUID()
		})
	end)
	
	if p1.useMockedResponse then
		squadInvite.Mock.clear()
		squadInvite.Mock.reply(function()
			-- upvalues: var1 (write)
			return var1
		end)
	end
	return squadInvite
end