local Parent = script.Parent
local LlamaModule = require(Parent.llama)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingBlocking = require(Parent.LuaSocialLibrariesDeps).NetworkingBlocking
local UserBlockingNetworkingModule = require(Parent.UserBlockingNetworking)
local FriendsReducerModule = require(script.Reducers.FriendsReducer)
local ActionsModule = require(script.Actions)
local SelectorsModule = require(script.Selectors)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1) --[[ Line: 16 ]]
		-- upvalues: LlamaModule (copy), Parent (copy), RoduxNetworkingModule (copy), NetworkingBlocking (copy), UserBlockingNetworkingModule (copy), FriendsReducerModule (copy), ActionsModule (copy), SelectorsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = LlamaModule.Dictionary.join(p1, {
			friendsNetworking = require(Parent.FriendsNetworking).config({ roduxNetworking = RoduxNetworkingModule.mock() }),
			networkingBlocking = NetworkingBlocking.config({ roduxNetworking = RoduxNetworkingModule.mock() }),
			userBlockingNetworking = UserBlockingNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 30 ]]
				-- upvalues: FriendsReducerModule (upval), JoinResult (ref)
				return FriendsReducerModule(JoinResult)
			end,
			Actions = ActionsModule(JoinResult),
			Selectors = SelectorsModule(JoinResult),
			Models = ModelsModule,
			Enums = EnumsModule
		}
	end
}