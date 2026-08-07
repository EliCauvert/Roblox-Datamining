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

return {
	["jest.config"] = script["jest.config"],
	config = function(p0) --[[ line: 21 ]]
		-- upvalues: cryoModule (ref), networkingSquadsModule (ref), roduxNetworkingModule (ref), reducersModule (ref), roduxModule (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			NetworkingSquads = networkingSquadsModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		local var11, var12, var13 = reducersModule.currentSquad(p0)
		
		return {
			installReducer = function() --[[ line: 30 ]]
				-- upvalues: roduxModule (copy), var11 (ref), var12 (ref), reducersModule (copy), p0 (write)
				return roduxModule.combineReducers({
					currentSquad = var11,
					currentSquadPersist = var12,
					currentExperienceInvite = reducersModule.currentExperienceInvite(p0),
					currentExperienceInviteStatus = reducersModule.currentExperienceInviteStatus(),
					partialSquads = reducersModule.partialSquads()
				})
			end,
			PersistManagers = { currentSquadPersistManager = var13 },
			Actions = actionsModule,
			Models = modelsModule,
			Enums = enumsModule
		}
	end,
	Hooks = hooksModule,
	Logger = loggerModule,
	RoduxSquadsTypes = roduxSquadsTypesModule
}