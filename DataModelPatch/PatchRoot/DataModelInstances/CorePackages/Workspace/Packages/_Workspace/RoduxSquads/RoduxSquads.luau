local ReducersModule = require(script.Reducers)
local ActionsModule = require(script.Actions)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)
local Parent = script.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingSquadsModule = require(Parent.NetworkingSquads)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: CryoModule (copy), NetworkingSquadsModule (copy), RoduxNetworkingModule (copy), ReducersModule (copy), RoduxModule (copy), ActionsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			NetworkingSquads = NetworkingSquadsModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		local CurrentSquadResult, CurrentSquadResult2, CurrentSquadResult3 = ReducersModule.currentSquad(JoinResult)
		
		return {
			installReducer = function()
				-- upvalues: RoduxModule (upval), CurrentSquadResult (copy), CurrentSquadResult2 (copy), ReducersModule (upval), JoinResult (ref)
				return RoduxModule.combineReducers({
					currentSquad = CurrentSquadResult,
					currentSquadPersist = CurrentSquadResult2,
					currentExperienceInvite = ReducersModule.currentExperienceInvite(JoinResult),
					currentExperienceInviteStatus = ReducersModule.currentExperienceInviteStatus(),
					partialSquads = ReducersModule.partialSquads()
				})
			end,
			PersistManagers = { currentSquadPersistManager = CurrentSquadResult3 },
			Actions = ActionsModule,
			Models = ModelsModule,
			Enums = EnumsModule
		}
	end,
	Hooks = require(script.Hooks),
	Logger = require(script.Logger),
	RoduxSquadsTypes = require(script.RoduxSquadsTypes)
}