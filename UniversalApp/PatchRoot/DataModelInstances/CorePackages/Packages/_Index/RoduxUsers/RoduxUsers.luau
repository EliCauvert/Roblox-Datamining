local reducersModule = require(script.Reducers)
local actionsModule = require(script.Actions)
local modelsModule = require(script.Models)
local parent = script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local friendsNetworkingModule = require(parent.FriendsNetworking)
local usersNetworkingModule = require(parent.UsersNetworking)
local roduxUsersTypesModule = require(script.roduxUsersTypes)

return {
	config = function(p1)
		-- upvalues: cryoModule (ref), usersNetworkingModule (ref), roduxNetworkingModule (ref), friendsNetworkingModule (ref), reducersModule (ref), actionsModule (ref), modelsModule (ref), roduxUsersTypesModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			usersNetworking = usersNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			friendsNetworking = friendsNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: reducersModule (copy), p1 (write)
				return reducersModule(p1)
			end,
			Actions = actionsModule,
			Models = modelsModule,
			roduxUsersTypes = roduxUsersTypesModule
		}
	end
}