local SquadsCore = script:FindFirstAncestor("SquadsCore")
local LogInExpCoplayTelemetryModule = require(SquadsCore.Analytics.logInExpCoplayTelemetry)
local SquadCoplayJoinModule = require(SquadsCore.Enums.SquadCoplayJoin)
local _ = require(SquadsCore.Enums.SquadLocationEnum)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local SharedFlagsModule = require(SquadsCore.Parent.SharedFlags)
local FFlagEnableSquadCoplayAnalytic = SharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local FFlagEnableScheduledSquads = SharedFlagsModule.FFlagEnableScheduledSquads

return function(ParentChannelId, Callback, p1, p2, PartyAttemptId, OnConfirm, p3)
	-- upvalues: NetworkingSquadsModule (copy), FFlagEnableSquadCoplayAnalytic (copy), FFlagEnableScheduledSquads (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoinModule (copy), SquadPromptTypeModule (copy)
	return function(p4)
		-- upvalues: NetworkingSquadsModule (upval), ParentChannelId (copy), FFlagEnableSquadCoplayAnalytic (upval), p2 (copy), PartyAttemptId (copy), FFlagEnableScheduledSquads (upval), p3 (copy), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), p1 (copy), Callback (copy), SquadPromptTypeModule (upval), OnConfirm (copy)
		local DispatchResult = p4:dispatch(NetworkingSquadsModule.CreateOrJoinSquad.API({
			leaveExisting = true,
			parentChannelId = ParentChannelId,
			squadLocation = if FFlagEnableSquadCoplayAnalytic then p2 else nil,
			partyAttemptId = PartyAttemptId,
			scheduledSquadId = if FFlagEnableScheduledSquads then p3 else nil
		}))
		
		if FFlagEnableSquadCoplayAnalytic then
			DispatchResult = DispatchResult:andThen(function(Result)
				-- upvalues: LogInExpCoplayTelemetryModule (upval), p2 (upval), SquadCoplayJoinModule (upval), p1 (upval)
				local GroupUpId = Result.responseBody.groupUp.groupUpId
				local Members = Result.responseBody.groupUp.members
				
				if GroupUpId and Members then
					LogInExpCoplayTelemetryModule(GroupUpId, Members, p2, SquadCoplayJoinModule.PartyJoin, p1)
				end
			end)
		end
		return DispatchResult:catch(function(_)
			-- upvalues: Callback (upval), p4 (copy), SquadPromptTypeModule (upval), OnConfirm (upval)
			Callback(p4, {
				hideCancelButton = true,
				promptType = SquadPromptTypeModule.Error,
				onConfirm = OnConfirm
			})
		end)
	end
end