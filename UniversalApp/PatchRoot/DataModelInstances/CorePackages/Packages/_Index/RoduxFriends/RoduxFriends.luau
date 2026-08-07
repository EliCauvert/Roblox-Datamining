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
	config = function(p0) --[[ line: 14 ]]
		-- upvalues: llamaModule (ref), friendsNetworkingModule (ref), roduxNetworkingModule (ref), networkingBlockingModule (ref), friendsReducerModule (ref), actionsModule (ref), selectorsModule (ref), modelsModule (ref), enumsModule (ref)
		p0 = llamaModule.Dictionary.join(p0, {
			friendsNetworking = friendsNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			networkingBlocking = networkingBlockingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ line: 25 ]]
				-- upvalues: friendsReducerModule (copy), p0 (write)
				return friendsReducerModule(p0)
			end,
			Actions = actionsModule(p0),
			Selectors = selectorsModule(p0),
			Models = modelsModule,
			Enums = enumsModule
		}
	end
}