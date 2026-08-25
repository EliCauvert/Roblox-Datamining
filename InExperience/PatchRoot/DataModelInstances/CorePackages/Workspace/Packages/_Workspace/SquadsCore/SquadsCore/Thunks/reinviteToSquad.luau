local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local squadPromptTypeModule = require(squadsCore.Enums.SquadPromptType)
local promiseModule = require(parent.Promise)
local squadsCore_1 = require(parent.Loggers).Logger:new("SquadsCore")

return function(p0, p1)
	-- upvalues: networkingSquadsModule (ref), squadsCore_1 (ref), squadPromptTypeModule (ref), promiseModule (ref)
	return function(p2)
		-- upvalues: networkingSquadsModule (copy), p0 (ref), squadsCore_1 (copy), p1 (ref), squadPromptTypeModule (copy), promiseModule (copy)
		return p2:dispatch(networkingSquadsModule.ReinviteToSquad.API({ squadId = p0 })):catch(function(p3)
			-- upvalues: squadsCore_1 (copy), p1 (copy), p2 (ref), squadPromptTypeModule (copy), promiseModule (copy)
			squadsCore_1:warning("Error reinviting parent channel participants to squad: {}", if p3.StatusCode then p3.StatusCode else -1)
			p1(p2, {
				hideCancelButton = true,
				promptType = squadPromptTypeModule.Error
			})
			
			return promiseModule.reject(p3)
		end)
	end
end