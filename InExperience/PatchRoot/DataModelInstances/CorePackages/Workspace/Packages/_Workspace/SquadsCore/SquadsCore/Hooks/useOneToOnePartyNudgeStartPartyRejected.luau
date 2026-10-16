local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local Players = game:GetService("Players")
local ConstantsModule = require(SquadsCore.Common.Constants)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local FFlagEnablePartyNudgeAfterJoin = require(Parent.SharedFlags).FFlagEnablePartyNudgeAfterJoin

return function(Callback) --[[ Line: 13 | Named "useOneToOnePartyNudgeStartPartyRejected" ]]
	-- upvalues: FFlagEnablePartyNudgeAfterJoin (copy), RealtimeDeliveryModule (copy), ConstantsModule (copy), Players (copy)
	if FFlagEnablePartyNudgeAfterJoin then
		RealtimeDeliveryModule.useRealtimeNamespace(ConstantsModule.PARTY_NUDGE_RTN_NAMESPACE, function(p1) --[[ Line: 15 ]]
			-- upvalues: Players (upval), ConstantsModule (upval), Callback (copy)
			if Players.LocalPlayer and p1.nudgeType == ConstantsModule.ONE_TO_ONE_NUDGE_IN_EXPERIENCE_TYPE and p1.inviteeId == Players.LocalPlayer.UserId and p1.status == ConstantsModule.START_PARTY_REJECTED_STATUS then
				Callback(p1)
			end
		end, { Callback })
	end
end