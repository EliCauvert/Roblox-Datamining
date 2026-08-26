local squadsCore = script:FindFirstAncestor("SquadsCore")
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local roduxSquadsModule = require(squadsCore.RoduxSquads)
local loggerModule = require(squadsCore.Logger)
local fFlagEnableSquadRegroupExperimentation = require(squadsCore.Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation

return function(p1)
	-- upvalues: fFlagEnableSquadRegroupExperimentation (ref), networkingSquadsModule (ref), roduxSquadsModule (ref), loggerModule (ref)
	return function(p2)
		-- upvalues: fFlagEnableSquadRegroupExperimentation (copy), networkingSquadsModule (copy), p1 (ref), roduxSquadsModule (copy), loggerModule (copy)
		if fFlagEnableSquadRegroupExperimentation then
			p2:dispatch(networkingSquadsModule.SetRegroupPromptShown.API({ groupUpId = p1 })):andThen(function(p3)
				-- upvalues: p2 (ref), roduxSquadsModule (copy)
				if p3.success then
					p2:dispatch(roduxSquadsModule.Actions.SelfPermissionUpdated({ canSeeRegroupPromptToast = false }))
				end
			end):catch(function(p3)
				-- upvalues: loggerModule (copy)
				loggerModule:error("Error occured with NetworkingSquads.SetRegroupPromptShown: {}", tostring(p3))
			end)
			
			return
		end
	end
end