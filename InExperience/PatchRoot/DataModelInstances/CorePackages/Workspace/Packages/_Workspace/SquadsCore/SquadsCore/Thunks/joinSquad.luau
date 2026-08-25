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

local _ = function(p0, p1, p2, p3)
	-- upvalues: networkingSquadsModule (ref), fFlagEnableSquadCoplayAnalytic (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), squadPromptTypeModule (ref)
	return function(p4)
		-- upvalues: networkingSquadsModule (copy), p0 (ref), fFlagEnableSquadCoplayAnalytic (copy), p3 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), p2 (ref), p1 (ref), squadPromptTypeModule (copy)
		local var8 = p4:dispatch(networkingSquadsModule.JoinSquad.API({
			leaveExisting = true,
			squadId = p0,
			squadLocation = if fFlagEnableSquadCoplayAnalytic then p3 else nil
		}))
		
		if fFlagEnableSquadCoplayAnalytic then
			var8 = var8:andThen(function(p5)
				-- upvalues: logInExpCoplayTelemetryModule (copy), p3 (copy), squadCoplayJoinModule (copy), p2 (copy)
				local groupUpId = p5.responseBody.groupUp.groupUpId
				local members = p5.responseBody.groupUp.members
				
				if groupUpId and members then
					logInExpCoplayTelemetryModule(groupUpId, members, p3, squadCoplayJoinModule.PartyJoin, p2)
				end
			end)
		end
		return var8:catch(function(_)
			-- upvalues: p1 (copy), p4 (ref), squadPromptTypeModule (copy)
			p1(p4, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error
			})
		end)
	end
end

return function(p6, p7, p8, p9, p10)
	-- upvalues: squadPromptTypeModule (ref), promiseModule (ref), fFlagEnableSquadCoplayAnalytic (ref), networkingSquadsModule (ref), logInExpCoplayTelemetryModule (ref), squadCoplayJoinModule (ref), leaveSquadModule (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	return function(p11)
		-- upvalues: p6 (ref), p7 (ref), squadPromptTypeModule (copy), promiseModule (copy), fFlagEnableSquadCoplayAnalytic (copy), p8 (ref), p9 (ref), networkingSquadsModule (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), leaveSquadModule (copy), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy), p10 (ref)
		local state = p11:getState()
		local squadId = state.Squad and (state.Squad.Squad and (state.Squad.Squad.currentSquad and state.Squad.Squad.currentSquad.squadId))
		
		if squadId == p6 then
			p7(p11, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.AlreadyJoined
			})
			
			return promiseModule.resolve({})
		elseif squadId then
			return p11:dispatch(leaveSquadModule(squadPromptTypeModule.JoinAnotherSquad, p7, function()
				-- upvalues: p11 (ref), p6 (copy), p7 (copy), fFlagEnableSquadCoplayAnalytic (copy), p8 (copy), p9 (copy), networkingSquadsModule (copy), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), squadPromptTypeModule (copy)
				local var15 = if fFlagEnableSquadCoplayAnalytic then p8 else nil
				local var16 = if fFlagEnableSquadCoplayAnalytic then p9 else nil
				p11:dispatch(function(p12)
					-- upvalues: networkingSquadsModule (copy), p6 (ref), fFlagEnableSquadCoplayAnalytic (copy), var16 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), var15 (ref), p7 (ref), squadPromptTypeModule (copy)
					local var8 = p12:dispatch(networkingSquadsModule.JoinSquad.API({
						leaveExisting = true,
						squadId = p6,
						squadLocation = if fFlagEnableSquadCoplayAnalytic then var16 else nil
					}))
					
					if fFlagEnableSquadCoplayAnalytic then
						var8 = var8:andThen(function(p13)
							-- upvalues: logInExpCoplayTelemetryModule (copy), var16 (copy), squadCoplayJoinModule (copy), var15 (copy)
							local groupUpId = p13.responseBody.groupUp.groupUpId
							local members = p13.responseBody.groupUp.members
							
							if groupUpId and members then
								logInExpCoplayTelemetryModule(groupUpId, members, var16, squadCoplayJoinModule.PartyJoin, var15)
							end
						end)
					end
					return var8:catch(function(_)
						-- upvalues: p7 (copy), p12 (ref), squadPromptTypeModule (copy)
						p7(p12, {
							hideCancelButton = true,
							promptType = squadPromptTypeModule.Error
						})
					end)
				end)
			end, p9, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then p10 else true))
		end
		local var11 = p6
		local var12 = p7
		local var13 = if fFlagEnableSquadCoplayAnalytic then p8 else nil
		local var14 = if fFlagEnableSquadCoplayAnalytic then p9 else nil
		
		return p11:dispatch(function(p14)
			-- upvalues: networkingSquadsModule (copy), var11 (ref), fFlagEnableSquadCoplayAnalytic (copy), var14 (ref), logInExpCoplayTelemetryModule (copy), squadCoplayJoinModule (copy), var13 (ref), var12 (ref), squadPromptTypeModule (copy)
			local var8 = p14:dispatch(networkingSquadsModule.JoinSquad.API({
				leaveExisting = true,
				squadId = var11,
				squadLocation = if fFlagEnableSquadCoplayAnalytic then var14 else nil
			}))
			
			if fFlagEnableSquadCoplayAnalytic then
				var8 = var8:andThen(function(p15)
					-- upvalues: logInExpCoplayTelemetryModule (copy), var14 (copy), squadCoplayJoinModule (copy), var13 (copy)
					local groupUpId = p15.responseBody.groupUp.groupUpId
					local members = p15.responseBody.groupUp.members
					
					if groupUpId and members then
						logInExpCoplayTelemetryModule(groupUpId, members, var14, squadCoplayJoinModule.PartyJoin, var13)
					end
				end)
			end
			return var8:catch(function(_)
				-- upvalues: var12 (copy), p14 (ref), squadPromptTypeModule (copy)
				var12(p14, {
					hideCancelButton = true,
					promptType = squadPromptTypeModule.Error
				})
			end)
		end)
	end
end