local parent = script.Parent
local llamaModule = require(parent.llama)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local friendsNetworkingModule = require(parent.FriendsNetworking)
local networkingBlockingModule = require(parent.NetworkingBlocking)
local friendsReducerModule = require(script.Reducers.FriendsReducer)
local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	config = function(p1)
		-- upvalues: llamaModule (ref), friendsNetworkingModule (ref), roduxNetworkingModule (ref), networkingBlockingModule (ref), friendsReducerModule (ref), actionsModule (ref), selectorsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = llamaModule.Dictionary.join(p1, {
			friendsNetworking = friendsNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			networkingBlocking = networkingBlockingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: friendsReducerModule (copy), p1 (write)
				return friendsReducerModule(p1)
			end,
			Actions = actionsModule(p1),
			Selectors = selectorsModule(p1),
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}