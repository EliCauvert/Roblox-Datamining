local ReducersModule = require(script.Reducers)
local ActionsModule = require(script.Actions)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)
local Parent = script.Parent
local RoduxModule = require(Parent.Rodux)
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingSquadsModule = require(Parent.NetworkingSquads)
local FFlagUseSignalsForSquadExperienceInviteStatus = require(Parent.SharedFlags).FFlagUseSignalsForSquadExperienceInviteStatus
local FFlagUseSignalsForSquadExperienceInvite = require(Parent.SharedFlags).FFlagUseSignalsForSquadExperienceInvite

return {
	["jest.config"] = script["jest.config"],
	config = function(p1) --[[ Line: 27 ]]
		-- upvalues: CryoModule (copy), NetworkingSquadsModule (copy), RoduxNetworkingModule (copy), ReducersModule (copy), RoduxModule (copy), FFlagUseSignalsForSquadExperienceInvite (copy), FFlagUseSignalsForSquadExperienceInviteStatus (copy), ActionsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			NetworkingSquads = NetworkingSquadsModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		local CurrentSquadResult, CurrentSquadResult2, CurrentSquadResult3 = ReducersModule.currentSquad(JoinResult)
		
		return {
			installReducer = function() --[[ Line: 36 ]]
				-- upvalues: RoduxModule (upval), CurrentSquadResult (copy), CurrentSquadResult2 (copy), FFlagUseSignalsForSquadExperienceInvite (upval), ReducersModule (upval), JoinResult (ref), FFlagUseSignalsForSquadExperienceInviteStatus (upval)
				return RoduxModule.combineReducers({
					currentSquad = CurrentSquadResult,
					currentSquadPersist = CurrentSquadResult2,
					currentExperienceInvite = if FFlagUseSignalsForSquadExperienceInvite then nil else ReducersModule.currentExperienceInvite(JoinResult),
					currentExperienceInviteStatus = if FFlagUseSignalsForSquadExperienceInviteStatus then nil else ReducersModule.currentExperienceInviteStatus()
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