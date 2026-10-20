local HttpService = game:GetService("HttpService")
local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)

return function(p1)
	-- upvalues: SQUADURLModule (copy), HttpService (copy)
	local Config = nil
	local SquadInvite = p1.roduxNetworking.POST("SquadInvite", function(Callback, p2)
		-- upvalues: p1 (copy), Config (ref), SQUADURLModule (upval), HttpService (upval)
		if p1.useMockedResponse then
			Config = {
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
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("invite"):body({
			groupUpId = p2.squadId,
			invitedUserIds = p2.invitedUserIds,
			parentChannelId = p2.parentChannelId,
			isReparented = p2.isReparented,
			requestId = HttpService:GenerateGUID()
		})
	end)
	
	if p1.useMockedResponse then
		SquadInvite.Mock.clear()
		SquadInvite.Mock.reply(function()
			-- upvalues: Config (ref)
			return Config
		end)
	end
	return SquadInvite
end