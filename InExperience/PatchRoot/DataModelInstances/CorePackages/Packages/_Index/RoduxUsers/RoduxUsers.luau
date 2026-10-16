local ReducersModule = require(script.Reducers)
local ActionsModule = require(script.Actions)
local ModelsModule = require(script.Models)
local Parent = script.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local FriendsNetworkingModule = require(Parent.FriendsNetworking)
local UsersNetworkingModule = require(Parent.UsersNetworking)
local RoduxUsersTypesModule = require(script.roduxUsersTypes)

return {
	config = function(p1) --[[ Line: 13 ]]
		-- upvalues: CryoModule (copy), UsersNetworkingModule (copy), RoduxNetworkingModule (copy), FriendsNetworkingModule (copy), ReducersModule (copy), ActionsModule (copy), ModelsModule (copy), RoduxUsersTypesModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			usersNetworking = UsersNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() }),
			friendsNetworking = FriendsNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 24 ]]
				-- upvalues: ReducersModule (upval), JoinResult (ref)
				return ReducersModule(JoinResult)
			end,
			Actions = ActionsModule,
			Models = ModelsModule,
			roduxUsersTypes = RoduxUsersTypesModule
		}
	end
}