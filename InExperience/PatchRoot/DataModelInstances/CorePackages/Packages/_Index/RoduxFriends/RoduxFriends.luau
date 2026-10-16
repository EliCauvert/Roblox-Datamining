local Parent = script.Parent
local LlamaModule = require(Parent.llama)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local FriendsNetworkingModule = require(Parent.FriendsNetworking)
local NetworkingBlockingModule = require(Parent.NetworkingBlocking)
local FriendsReducerModule = require(script.Reducers.FriendsReducer)
local ActionsModule = require(script.Actions)
local SelectorsModule = require(script.Selectors)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)

return {
	config = function(p1) --[[ Line: 14 ]]
		-- upvalues: LlamaModule (copy), FriendsNetworkingModule (copy), RoduxNetworkingModule (copy), NetworkingBlockingModule (copy), FriendsReducerModule (copy), ActionsModule (copy), SelectorsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = LlamaModule.Dictionary.join(p1, {
			friendsNetworking = FriendsNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() }),
			networkingBlocking = NetworkingBlockingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 25 ]]
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