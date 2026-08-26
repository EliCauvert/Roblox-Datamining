local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local shareLinksNetworkingModule = require(parent.ShareLinksNetworking)

return {
	config = function(p1)
		-- upvalues: cryoModule (ref), shareLinksNetworkingModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			shareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: reducersModule (copy), p1 (write)
				return reducersModule(p1)
			end,
			Actions = actionsModule,
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}