local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local LeaveSquadModule = require(script.Parent.leaveSquad)
local LogInExpCoplayTelemetryModule = require(SquadsCore.Analytics.logInExpCoplayTelemetry)
local SquadCoplayJoinModule = require(SquadsCore.Enums.SquadCoplayJoin)
local _ = require(SquadsCore.Enums.SquadLocationEnum)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local PromiseModule = require(Parent.Promise)
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

local function _(p1, p2, p3, p4) --[[ Line: 20 ]]
	-- upvalues: NetworkingSquadsModule (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoinModule (copy), SquadPromptTypeModule (copy)
	return function(p5) --[[ Line: 26 ]]
		-- upvalues: NetworkingSquadsModule (upval), p1 (copy), p4 (copy), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), p3 (copy), p2 (copy), SquadPromptTypeModule (upval)
		return p5:dispatch(NetworkingSquadsModule.JoinSquad.API({ leaveExisting = true, squadId = p1, squadLocation = p4 })):andThen(function(Result) --[[ Line: 32 ]]
			-- upvalues: LogInExpCoplayTelemetryModule (upval), p4 (upval), SquadCoplayJoinModule (upval), p3 (upval)
			local GroupUpId = Result.responseBody.groupUp.groupUpId
			local Members = Result.responseBody.groupUp.members
			
			if GroupUpId and Members then
				LogInExpCoplayTelemetryModule(GroupUpId, Members, p4, SquadCoplayJoinModule.PartyJoin, p3)
			end
		end):catch(function(_) --[[ Line: 47 ]]
			-- upvalues: p2 (upval), p5 (copy), SquadPromptTypeModule (upval)
			p2(p5, {
				hideCancelButton = true,
				promptType = SquadPromptTypeModule.Error
			})
		end)
	end
end

return function(SquadId, Callback, p1, SquadLocation, p2) --[[ Line: 57 ]]
	-- upvalues: SquadPromptTypeModule (copy), PromiseModule (copy), NetworkingSquadsModule (copy), LogInExpCoplayTelemetryModule (copy), SquadCoplayJoinModule (copy), LeaveSquadModule (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
	return function(p3) --[[ Line: 64 ]]
		-- upvalues: SquadId (copy), Callback (copy), SquadPromptTypeModule (upval), PromiseModule (upval), p1 (copy), SquadLocation (copy), NetworkingSquadsModule (upval), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), LeaveSquadModule (upval), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (upval), p2 (copy)
		local State = p3:getState()
		local SquadId1 = State.Squad and (State.Squad.Squad and (State.Squad.Squad.currentSquad and State.Squad.Squad.currentSquad.squadId))
		
		if SquadId1 == SquadId then
			Callback(p3, {
				hideCancelButton = true,
				promptType = SquadPromptTypeModule.AlreadyJoined
			})
			
			return PromiseModule.resolve({})
		else
			return if SquadId1 then p3:dispatch(LeaveSquadModule(SquadPromptTypeModule.JoinAnotherSquad, Callback, function() --[[ Line: 85 ]]
				-- upvalues: p3 (copy), SquadId (upval), Callback (upval), p1 (upval), SquadLocation (upval), NetworkingSquadsModule (upval), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), SquadPromptTypeModule (upval)
				p3:dispatch(function(p4) --[[ Line: 26 ]]
					-- upvalues: NetworkingSquadsModule (upval), SquadId (copy), SquadLocation (copy), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), p1 (copy), Callback (copy), SquadPromptTypeModule (upval)
					return p4:dispatch(NetworkingSquadsModule.JoinSquad.API({
						leaveExisting = true,
						squadId = SquadId,
						squadLocation = SquadLocation
					})):andThen(function(Result) --[[ Line: 32 ]]
						-- upvalues: LogInExpCoplayTelemetryModule (upval), SquadLocation (upval), SquadCoplayJoinModule (upval), p1 (upval)
						local GroupUpId = Result.responseBody.groupUp.groupUpId
						local Members = Result.responseBody.groupUp.members
						
						if GroupUpId and Members then
							LogInExpCoplayTelemetryModule(GroupUpId, Members, SquadLocation, SquadCoplayJoinModule.PartyJoin, p1)
						end
					end):catch(function(_) --[[ Line: 47 ]]
						-- upvalues: Callback (upval), p4 (copy), SquadPromptTypeModule (upval)
						Callback(p4, {
							hideCancelButton = true,
							promptType = SquadPromptTypeModule.Error
						})
					end)
				end)
			end, SquadLocation, not FFlagPartyDevAPIToRespectThirdPartySettingsEnabled or p2)) else p3:dispatch(function(p4) --[[ Line: 26 ]]
				-- upvalues: NetworkingSquadsModule (upval), SquadId (copy), SquadLocation (copy), LogInExpCoplayTelemetryModule (upval), SquadCoplayJoinModule (upval), p1 (copy), Callback (copy), SquadPromptTypeModule (upval)
				return p4:dispatch(NetworkingSquadsModule.JoinSquad.API({
					leaveExisting = true,
					squadId = SquadId,
					squadLocation = SquadLocation
				})):andThen(function(Result) --[[ Line: 32 ]]
					-- upvalues: LogInExpCoplayTelemetryModule (upval), SquadLocation (upval), SquadCoplayJoinModule (upval), p1 (upval)
					local GroupUpId = Result.responseBody.groupUp.groupUpId
					local Members = Result.responseBody.groupUp.members
					
					if GroupUpId and Members then
						LogInExpCoplayTelemetryModule(GroupUpId, Members, SquadLocation, SquadCoplayJoinModule.PartyJoin, p1)
					end
				end):catch(function(_) --[[ Line: 47 ]]
					-- upvalues: Callback (upval), p4 (copy), SquadPromptTypeModule (upval)
					Callback(p4, {
						hideCancelButton = true,
						promptType = SquadPromptTypeModule.Error
					})
				end)
			end)
		end
	end
end