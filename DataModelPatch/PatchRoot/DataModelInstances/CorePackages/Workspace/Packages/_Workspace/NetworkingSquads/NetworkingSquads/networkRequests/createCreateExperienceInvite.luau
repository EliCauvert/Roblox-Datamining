local HttpService = game:GetService("HttpService")
local SQUADURLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)
local Packages = script:FindFirstAncestor("Packages")
local FFlagEnableSquadRegroupExperimentation = require(Packages.SharedFlags).FFlagEnableSquadRegroupExperimentation
local FFlagEnablePrivatePartyStartJoin = require(Packages.SharedFlags).FFlagEnablePrivatePartyStartJoin

return function(p1)
	-- upvalues: SQUADURLModule (copy), HttpService (copy), FFlagEnableSquadRegroupExperimentation (copy), FFlagEnablePrivatePartyStartJoin (copy)
	return (p1.roduxNetworking.POST({ Name = "CreateExperienceInvite" }, function(Callback, p2)
		-- upvalues: SQUADURLModule (upval), HttpService (upval), FFlagEnableSquadRegroupExperimentation (upval), FFlagEnablePrivatePartyStartJoin (upval)
		return Callback(SQUADURLModule):path("group-up"):path("v1"):path("invite-to-experience"):body({
			membershipEntityId = p2.membershipEntityId,
			placeId = p2.placeId,
			requestId = HttpService:GenerateGUID(false),
			voteIdentifier = p2.voteIdentifier,
			source = if FFlagEnableSquadRegroupExperimentation then p2.source else nil,
			inviteType = if FFlagEnablePrivatePartyStartJoin then p2.inviteType else nil
		})
	end))
end