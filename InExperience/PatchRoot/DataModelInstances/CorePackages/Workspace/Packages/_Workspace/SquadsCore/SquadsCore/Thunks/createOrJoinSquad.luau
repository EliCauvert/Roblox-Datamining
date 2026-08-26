local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local fFlagEnableSquadCoplayAnalytic = require(parent.SharedFlags).FFlagEnableSquadCoplayAnalytic

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), squadPromptTypeModule (ref)
	return function(p8)
		-- upvalues: networkingSquadsModule (copy), p1 (ref), fFlagEnableSquadCoplayAnalytic (copy), p4 (ref), p5 (ref), p7 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), p3 (ref), p2 (ref), squadPromptTypeModule (copy), p6 (ref)
		local var1 = p8:dispatch(networkingSquadsModule.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = p1,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then p4 else nil,
			partyAttemptId = p5,
			scheduledSquadId = p7
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var1 = var1:andThen(function(p9)
				-- upvalues: logInExpCoplayTelemetryModule (copy), p4 (copy), squadCoplayJoinModule (copy), p3 (copy)
				local groupUpId = p9.responseBody.groupUp.groupUpId
				local members = p9.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, p4, squadCoplayJoinModule.PartyJoin, p3)
				end
			end)
		end
		return var1:catch(function(_)
			-- upvalues: p2 (copy), p8 (ref), squadPromptTypeModule (copy), p6 (copy)
			p2(p8, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error,
				onConfirm = p6
			})
		end)
	end
end