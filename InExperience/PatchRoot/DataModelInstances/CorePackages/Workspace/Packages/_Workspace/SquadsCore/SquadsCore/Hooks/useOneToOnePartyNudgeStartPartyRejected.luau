local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local playersService = game:GetService("Players")
local constantsModule = require(squadsCore.Common.Constants)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local fFlagEnablePartyNudgeAfterJoin = require(parent.SharedFlags).FFlagEnablePartyNudgeAfterJoin

return function(p1)
	-- upvalues: fFlagEnablePartyNudgeAfterJoin (ref), realtimeDeliveryModule (ref), constantsModule (ref), playersService (ref)
	if fFlagEnablePartyNudgeAfterJoin then
		realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p2)
			-- upvalues: playersService (copy), constantsModule (copy), p1 (ref)
			if playersService.LocalPlayer and p2.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and (p2.inviteeId == playersService.LocalPlayer.UserId and p2.status == constantsModule.START_PARTY_REJECTED_STATUS) then
				p1(p2)
			end
		end, { p1 })
	end
end