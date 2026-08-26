local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingPresenceModule = require(parent.NetworkingPresence)
local reducerModule = require(script.Reducer)
local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	config = function(p1)
		-- upvalues: cryoModule (ref), networkingPresenceModule (ref), roduxNetworkingModule (ref), reducerModule (ref), actionsModule (ref), selectorsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			presenceNetworking = networkingPresenceModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: reducerModule (copy), p1 (write)
				return reducerModule(p1)
			end,
			Actions = actionsModule(p1),
			Selectors = selectorsModule(p1),
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}