local Parent = script.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingPresenceModule = require(Parent.NetworkingPresence)
local ReducerModule = require(script.Reducer)
local ActionsModule = require(script.Actions)
local SelectorsModule = require(script.Selectors)
local ModelsModule = require(script.Models)
local EnumsModule = require(script.Enums)

return {
	config = function(p1)
		-- upvalues: CryoModule (copy), NetworkingPresenceModule (copy), RoduxNetworkingModule (copy), ReducerModule (copy), ActionsModule (copy), SelectorsModule (copy), ModelsModule (copy), EnumsModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			presenceNetworking = NetworkingPresenceModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: ReducerModule (upval), JoinResult (ref)
				return ReducerModule(JoinResult)
			end,
			Actions = ActionsModule(JoinResult),
			Selectors = SelectorsModule(JoinResult),
			Models = ModelsModule,
			Enums = EnumsModule
		}
	end
}