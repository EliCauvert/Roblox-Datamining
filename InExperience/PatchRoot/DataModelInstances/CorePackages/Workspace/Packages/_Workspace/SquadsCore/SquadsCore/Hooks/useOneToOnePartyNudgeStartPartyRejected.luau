local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local playersService = game:GetService("Players")
local constantsModule = require(squadsCore.Common.Constants)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local fFlagEnablePartyNudgeAfterJoin = require(parent.SharedFlags).FFlagEnablePartyNudgeAfterJoin

return function(p0)
	-- upvalues: fFlagEnablePartyNudgeAfterJoin (ref), realtimeDeliveryModule (ref), constantsModule (ref), playersService (ref)
	if fFlagEnablePartyNudgeAfterJoin then
		realtimeDeliveryModule.useRealtimeNamespace(constantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p1)
			-- upvalues: playersService (copy), constantsModule (copy), p0 (ref)
			if playersService.LocalPlayer and p1.nudgeType == constantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and (p1.inviteeId == playersService.LocalPlayer.UserId and p1.status == constantsModule.START_PARTY_REJECTED_STATUS) then
				p0(p1)
			end
		end, { p0 })
	end
end