local httpService = game:GetService("HttpService")
local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)
local packages = script:FindFirstAncestor("Packages")
local fFlagEnableSquadRegroupExperimentation = require(packages.SharedFlags).FFlagEnableSquadRegroupExperimentation
local fFlagEnablePrivatePartyStartJoin = require(packages.SharedFlags).FFlagEnablePrivatePartyStartJoin

return function(p0)
	-- upvalues: SQUAD_URLModule (ref), httpService (ref), fFlagEnableSquadRegroupExperimentation (ref), fFlagEnablePrivatePartyStartJoin (ref)
	return p0.roduxNetworking.POST("CreateExperienceInvite", function(p1, p2)
		-- upvalues: SQUAD_URLModule (copy), httpService (copy), fFlagEnableSquadRegroupExperimentation (copy), fFlagEnablePrivatePartyStartJoin (copy)
		return p1(SQUAD_URLModule):path("group-up"):path("v1"):path("invite-to-experience"):body({
			membershipEntityId = p2.membershipEntityId,
			placeId = p2.placeId,
			requestId = httpService:GenerateGUID(false),
			voteIdentifier = p2.voteIdentifier,
			source = if fFlagEnableSquadRegroupExperimentation then p2.source else nil,
			inviteType = if fFlagEnablePrivatePartyStartJoin then p2.inviteType else nil
		})
	end)
end