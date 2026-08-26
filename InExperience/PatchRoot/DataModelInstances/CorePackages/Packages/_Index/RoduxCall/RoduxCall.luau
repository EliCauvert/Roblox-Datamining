local actionsModule = require(script.Actions)
local enumsModule = require(script.Enums)
local reducersModule = require(script.Reducers)
local modelsModule = require(script.Models)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingCallModule = require(parent.NetworkingCall)

return {
	config = function(p1)
		-- upvalues: cryoModule (ref), networkingCallModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), enumsModule (ref), modelsModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			NetworkingCall = networkingCallModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: reducersModule (copy), p1 (write)
				return reducersModule(p1)
			end,
			Actions = actionsModule,
			Enums = enumsModule,
			Models = modelsModule
		}
	end
}