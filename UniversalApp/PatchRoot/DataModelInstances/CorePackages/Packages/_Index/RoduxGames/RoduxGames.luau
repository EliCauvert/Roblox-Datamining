local Parent = script.Parent
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local DashModule = require(Parent.Dash)
local NetworkingGamesModule = require(Parent.NetworkingGames)
local ReducersModule = require(script.Reducers)
local ActionsModule = require(script.Actions)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)

return {
	config = function(p1) --[[ Line: 12 ]]
		-- upvalues: DashModule (copy), NetworkingGamesModule (copy), RoduxNetworkingModule (copy), ReducersModule (copy), ActionsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = DashModule.join(p1, {
			networkingGames = NetworkingGamesModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 20 ]]
				-- upvalues: ReducersModule (upval), JoinResult (ref)
				return ReducersModule(JoinResult)
			end,
			Actions = ActionsModule,
			Models = ModelsModule,
			Enums = EnumsModule
		}
	end
}