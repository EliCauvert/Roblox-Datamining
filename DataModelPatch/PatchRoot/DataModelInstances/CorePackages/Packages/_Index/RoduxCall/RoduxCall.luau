local ActionsModule = require(script.Actions)
local EnumsModule = require(script.Enums)
local ReducersModule = require(script.Reducers)
local ModelsModule = require(script.Models)
local Parent = script.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local NetworkingCallModule = require(Parent.NetworkingCall)

return {
	config = function(p1)
		-- upvalues: CryoModule (copy), NetworkingCallModule (copy), RoduxNetworkingModule (copy), ReducersModule (copy), ActionsModule (copy), EnumsModule (copy), ModelsModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			NetworkingCall = NetworkingCallModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: ReducersModule (upval), JoinResult (ref)
				return ReducersModule(JoinResult)
			end,
			Actions = ActionsModule,
			Enums = EnumsModule,
			Models = ModelsModule
		}
	end
}