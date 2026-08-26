local parent = script.Parent
local roduxNetworkingModule = require(parent.RoduxNetworking)
local dashModule = require(parent.Dash)
local networkingGamesModule = require(parent.NetworkingGames)
local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	config = function(p1)
		-- upvalues: dashModule (ref), networkingGamesModule (ref), roduxNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = dashModule.join(p1, {
			networkingGames = networkingGamesModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
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