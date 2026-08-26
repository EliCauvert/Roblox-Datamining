local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local leaveSquadModule = require(script.Parent.leaveSquad)
local logInExpCoplayTelemetryModule = require(squadsCore.Analytics.logInExpCoplayTelemetry)
local squadCoplayJoinModule = require(squadsCore.Enums.SquadCoplayJoin)
local _ = require(squadsCore.Enums.SquadLocationEnum)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableSquadCoplayAnalytic = sharedFlagsModule.FFlagEnableSquadCoplayAnalytic
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

local _ = function(p1, p2, p3, p4)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), squadPromptTypeModule (ref)
	return function(p5)
		-- upvalues: networkingSquadsModule (copy), p1 (ref), fFlagEnableSquadCoplayAnalytic (copy), p4 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), p3 (ref), p2 (ref), squadPromptTypeModule (copy)
		local var1 = p5:dispatch(networkingSquadsModule.JoinSquad.API({
			leaveExisting = true,
			squadId = p1,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then p4 else nil
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var1 = var1:andThen(function(p6)
				-- upvalues: logInExpCoplayTelemetryModule (copy), p4 (copy), squadCoplayJoinModule (copy), p3 (copy)
				local groupUpId = p6.responseBody.groupUp.groupUpId
				local members = p6.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, p4, squadCoplayJoinModule.PartyJoin, p3)
				end
			end)
		end
		return var1:catch(function(_)
			-- upvalues: p2 (copy), p5 (ref), squadPromptTypeModule (copy)
			p2(p5, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error
			})
		end)
	end
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: squadPromptTypeModule (ref), promiseModule (ref), fFlagEnableSquadCoplayAnalytic (ref), networkingSquadsModule (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), leaveSquadModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	return function(p6)
		-- upvalues: p1 (ref), p2 (ref), squadPromptTypeModule (copy), promiseModule (copy), fFlagEnableSquadCoplayAnalytic (copy), p3 (ref), p4 (ref), networkingSquadsModule (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), leaveSquadModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p5 (ref)
		local state = p6:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if squadId == p1 then
			p2(p6, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.AlreadyJoined
			})
			
			return promiseModule.resolve({})
		elseif squadId then
			return p6:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p2, function()
				-- upvalues: p6 (ref), p1 (copy), p2 (copy), fFlagEnableSquadCoplayAnalytic (copy), p3 (copy), p4 (copy), networkingSquadsModule (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), squadPromptTypeModule (copy)
				local var1 = if fFlagEnableSquadCoplayAnalytic then p3 else nil
				local var2 = if fFlagEnableSquadCoplayAnalytic then p4 else nil
				p6:dispatch(function(p7)
					-- upvalues: networkingSquadsModule (copy), p1 (ref), fFlagEnableSquadCoplayAnalytic (copy), var2 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), var1 (ref), p2 (ref), squadPromptTypeModule (copy)
					local var3 = p7:dispatch(networkingSquadsModule.JoinSquad.API({
						leaveExisting = true,
						squadId = p1,
						squadLocation = if fFlagEnableSquadCoplayAnalytic then var2 else nil
					}))
					
					if fFlagEnableSquadCoplayAnalytic then
						var3 = var3:andThen(function(p8)
							-- upvalues: logInExpCoplayTelemetryModule (copy), var2 (copy), squadCoplayJoinModule (copy), var1 (copy)
							local groupUpId = p8.responseBody.groupUp.groupUpId
							local members = p8.responseBody.groupUp.members
							
							if groupUpId and members then
								logInExpCoplayTelemetryModule(groupUpId, members, var2, squadCoplayJoinModule.PartyJoin, var1)
							end
						end)
					end
					return var3:catch(function(_)
						-- upvalues: p2 (copy), p7 (ref), squadPromptTypeModule (copy)
						p2(p7, {
							hideCancelButton = true,
							promptType = squadPromptTypeModule.Error
						})
					end)
				end)
			end, p4, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p5 else true))
		end
		local var1 = p1
		local var2 = p2
		local var3 = if fFlagEnableSquadCoplayAnalytic then p3 else nil
		local var4 = if fFlagEnableSquadCoplayAnalytic then p4 else nil
		
		return p6:dispatch(function(p7)
			-- upvalues: networkingSquadsModule (copy), var1 (ref), fFlagEnableSquadCoplayAnalytic (copy), var4 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), var3 (ref), var2 (ref), squadPromptTypeModule (copy)
			local var5 = p7:dispatch(networkingSquadsModule.JoinSquad.API({
				leaveExisting = true,
				squadId = var1,
				squadLocation = if fFlagEnableSquadCoplayAnalytic then var4 else nil
			}))
			
			if fFlagEnableSquadCoplayAnalytic then
				var5 = var5:andThen(function(p8)
					-- upvalues: logInExpCoplayTelemetryModule (copy), var4 (copy), squadCoplayJoinModule (copy), var3 (copy)
					local groupUpId = p8.responseBody.groupUp.groupUpId
					local members = p8.responseBody.groupUp.members
					
					if groupUpId and members then
						logInExpCoplayTelemetryModule(groupUpId, members, var4, squadCoplayJoinModule.PartyJoin, var3)
					end
				end)
			end
			return var5:catch(function(_)
				-- upvalues: var2 (copy), p7 (ref), squadPromptTypeModule (copy)
				var2(p7, {
					hideCancelButton = true,
					promptType = squadPromptTypeModule.Error
				})
			end)
		end)
	end
end