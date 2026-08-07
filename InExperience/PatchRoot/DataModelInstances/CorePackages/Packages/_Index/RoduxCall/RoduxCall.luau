local actionsModule = require(script.Actions)
local enumsModule = require(script.Enums)
local reducersModule = require(script.Reducers)
local modelsModule = require(script.Models)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingCallModule = require(parent.NetworkingCall)

return {
	config = function(p0) --[[ line: 12 ]]
		-- upvalues: cryoModule (ref), networkingCallModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), enumsModule (ref), modelsModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			NetworkingCall = networkingCallModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 20 ]]
				-- upvalues: reducersModule (copy), p0 (write)
				return reducersModule(p0)
			end,
			Actions = actionsModule,
			Enums = enumsModule,
			Models = modelsModule
		}
	end
}