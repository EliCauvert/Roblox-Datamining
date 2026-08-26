local parent = script.Parent
local llamaModule = require(parent.llama)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local networkingBlocking = require(parent.LuaSocialLibrariesDeps).NetworkingBlocking
local userBlockingNetworkingModule = require(parent.UserBlockingNetworking)
local friendsReducerModule = require(script.Reducers.FriendsReducer)
local actionsModule = require(script.Actions)
local selectorsModule = require(script.Selectors)
local modelsModule = require(script.Models)
local enumsModule = require(script.Enums)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: llamaModule (ref), parent (ref), roduxNetworkingModule (ref), networkingBlocking (ref), userBlockingNetworkingModule (ref), friendsReducerModule (ref), actionsModule (ref), selectorsModule (ref), modelsModule (ref), enumsModule (ref)
		p1 = llamaModule.Dictionary.join(p1, {
			friendsNetworking = require(parent.FriendsNetworking).config({ roduxNetworking = roduxNetworkingModule.mock() }),
			networkingBlocking = networkingBlocking.config({ roduxNetworking = roduxNetworkingModule.mock() }),
			userBlockingNetworking = userBlockingNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
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