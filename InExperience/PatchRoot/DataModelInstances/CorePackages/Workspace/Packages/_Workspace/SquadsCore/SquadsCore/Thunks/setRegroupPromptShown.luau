local squadsCore = script:FindFirstAncestor("SquadsCore")
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local loggerModule = require(squadsCore.Logger)
local fFlagEnableSquadRegroupExperimentation = require(squadsCore.Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation

return function(p0) --[[ line: 10 ]]
	-- upvalues: fFlagEnableSquadRegroupExperimentation (ref), networkingSquadsModule (ref), roduxSquadsModule (ref), loggerModule (ref)
	return function(p1) --[[ line: 11 ]]
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), networkingSquadsModule (copy), p0 (ref), roduxSquadsModule (copy), loggerModule (copy)
		if fFlagEnableSquadRegroupExperimentation then
			p1:dispatch(networkingSquadsModule.SetRegroupPromptShown.API({ groupUpId = p0 })):andThen(function(p3) --[[ line: 18 ]]
				-- upvalues: p1 (ref), roduxSquadsModule (copy)
				if p3.success then
					p1:dispatch(roduxSquadsModule.Actions.SelfPermissionUpdated({ canSeeRegroupPromptToast = false }))
				end
			end):catch(function(p2) --[[ line: 25 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error occured with NetworkingSquads.SetRegroupPromptShown: {}", tostring(p2))
			end)
			
			return
		end
	end
end