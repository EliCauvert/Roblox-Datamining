local httpService = game:GetService("HttpService")
local SQUAD_URLModule = require(script.Parent.Parent.SQUAD_URL)
local _ = require(script.Parent.Parent.networkingSquadTypes)
local packages = script:FindFirstAncestor("Packages")
local fFlagEnableSquadRegroupExperimentation = require(packages.SharedFlags).FFlagEnableSquadRegroupExperimentation
local fFlagEnablePrivatePartyStartJoin = require(packages.SharedFlags).FFlagEnablePrivatePartyStartJoin

return function(p1)
	-- upvalues: SQUAD_URLModule (ref), httpService (ref), fFlagEnableSquadRegroupExperimentation (ref), fFlagEnablePrivatePartyStartJoin (ref)
	return p1.roduxNetworking.POST("CreateExperienceInvite", function(p2, p3)
		-- upvalues: SQUAD_URLModule (copy), httpService (copy), fFlagEnableSquadRegroupExperimentation (copy), fFlagEnablePrivatePartyStartJoin (copy)
		return p2(SQUAD_URLModule):path("group-up"):path("v1"):path("invite-to-experience"):body({
			membershipEntityId = p3.membershipEntityId,
			placeId = p3.placeId,
			requestId = httpService:GenerateGUID(false),
			voteIdentifier = p3.voteIdentifier,
			source = if fFlagEnableSquadRegroupExperimentation then p3.source else nil,
			inviteType = if fFlagEnablePrivatePartyStartJoin then p3.inviteType else nil
		})
	end)
end