local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local promiseModule = require(parent.Promise)
local squadsCore_1 = require(parent.Loggers).Logger:new("SquadsCore")

return function(p1, p2)
	-- upvalues: networkingSquadsModule (ref), squadsCore_1 (ref), squadPromptTypeModule (ref), promiseModule (ref)
	return function(p3)
		-- upvalues: networkingSquadsModule (copy), p1 (ref), squadsCore_1 (copy), p2 (ref), squadPromptTypeModule (copy), promiseModule (copy)
		return p3:dispatch(networkingSquadsModule.ReinviteToSquad.API({ squadId = p1 })):catch(function(p4)
			-- upvalues: squadsCore_1 (copy), p2 (copy), p3 (ref), squadPromptTypeModule (copy), promiseModule (copy)
			squadsCore_1:warning("Error reinviting parent channel participants to squad: {}", if p4.StatusCode then p4.StatusCode else -1)
			p2(p3, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error
			})
			
			return promiseModule.reject(p4)
		end)
	end
end