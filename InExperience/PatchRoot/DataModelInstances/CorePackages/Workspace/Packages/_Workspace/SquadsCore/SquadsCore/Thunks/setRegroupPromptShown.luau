local SquadsCore = script:FindFirstAncestor("SquadsCore")
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local RoduxSquadsModule = require(SquadsCore.RoduxSquads)
local LoggerModule = require(SquadsCore.Logger)
local FFlagEnableSquadRegroupExperimentation = require(SquadsCore.Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation

return function(GroupUpId) --[[ Line: 10 ]]
	-- upvalues: FFlagEnableSquadRegroupExperimentation (copy), NetworkingSquadsModule (copy), RoduxSquadsModule (copy), LoggerModule (copy)
	return function(p1) --[[ Line: 11 ]]
		-- upvalues: FFlagEnableSquadRegroupExperimentation (upval), NetworkingSquadsModule (upval), GroupUpId (copy), RoduxSquadsModule (upval), LoggerModule (upval)
		if FFlagEnableSquadRegroupExperimentation then
			p1:dispatch(NetworkingSquadsModule.SetRegroupPromptShown.API({ groupUpId = GroupUpId })):andThen(function(Result) --[[ Line: 18 ]]
				-- upvalues: p1 (copy), RoduxSquadsModule (upval)
				if Result.success then
					p1:dispatch(RoduxSquadsModule.Actions.SelfPermissionUpdated({ canSeeRegroupPromptToast = false }))
				end
			end):catch(function(Err) --[[ Line: 25 ]]
				-- upvalues: LoggerModule (upval)
				LoggerModule:error("Error occured with NetworkingSquads.SetRegroupPromptShown: {}", (tostring(Err)))
			end)
			
			return
		end
	end
end