local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local SquadPromptTypeModule = require(SquadsCore.Enums.SquadPromptType)
local Logger = require(Parent.Loggers).Logger
local PromiseModule = require(Parent.Promise)
local SquadsCore1 = Logger.new(Logger, "SquadsCore")

return function(SquadId, Callback) --[[ Line: 12 ]]
	-- upvalues: NetworkingSquadsModule (copy), SquadsCore1 (copy), SquadPromptTypeModule (copy), PromiseModule (copy)
	return function(p1) --[[ Line: 13 ]]
		-- upvalues: NetworkingSquadsModule (upval), SquadId (copy), SquadsCore1 (upval), Callback (copy), SquadPromptTypeModule (upval), PromiseModule (upval)
		return p1:dispatch(NetworkingSquadsModule.ReinviteToSquad.API({ squadId = SquadId })):catch(function(Err) --[[ Line: 14 ]]
			-- upvalues: SquadsCore1 (upval), Callback (upval), p1 (copy), SquadPromptTypeModule (upval), PromiseModule (upval)
			SquadsCore1:warning("Error reinviting parent channel participants to squad: {}", if Err.StatusCode then Err.StatusCode else -1)
			Callback(p1, {
				hideCancelButton = true,
				promptType = SquadPromptTypeModule.Error
			})
			
			return PromiseModule.reject(Err)
		end)
	end
end