local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local shareLinksNetworkingModule = require(parent.ShareLinksNetworking)

return {
	["jest.config"] = script["jest.config"],
	config = function(p0)
		-- upvalues: cryoModule (ref), shareLinksNetworkingModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			shareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: reducersModule (copy), p0 (write)
				return reducersModule(p0)
			end,
			Actions = actionsModule,
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}