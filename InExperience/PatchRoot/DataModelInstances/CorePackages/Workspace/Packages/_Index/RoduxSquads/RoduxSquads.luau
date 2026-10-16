local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)
local hooksModule = require(script.Hooks)
local loggerModule = require(script.Logger)
local roduxSquadsTypesModule = require(script.RoduxSquadsTypes)
local parent = script.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingSquadsModule = require(parent.NetworkingSquads)
local fFlagUseSignalsForSquadExperienceInviteStatus = require(parent.SharedFlags).FFlagUseSignalsForSquadExperienceInviteStatus

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: cryoModule (ref), networkingSquadsModule (ref), roduxNetworkingModule (ref), reducersModule (ref), roduxModule (ref), fFlagUseSignalsForSquadExperienceInviteStatus (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			NetworkingSquads = networkingSquadsModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		local var1, var2, var3 = reducersModule.currentSquad(p1)
		
		return {
			installReducer = function()
				-- upvalues: roduxModule (copy), var1 (ref), var2 (ref), reducersModule (copy), p1 (write), fFlagUseSignalsForSquadExperienceInviteStatus (copy)
				return roduxModule.combineReducers({
					currentSquad = var1,
					currentSquadPersist = var2,
					currentExperienceInvite = reducersModule.currentExperienceInvite(p1),
					currentExperienceInviteStatus = if fFlagUseSignalsForSquadExperienceInviteStatus then nil else reducersModule.currentExperienceInviteStatus()
				})
			end,
			PersistManagers = { currentSquadPersistManager = var3 },
			Actions = actionsModule,
			Models = modelsModule,
			Enums = enumsModule
		}
	end,
	Hooks = hooksModule,
	Logger = loggerModule,
	RoduxSquadsTypes = roduxSquadsTypesModule
}