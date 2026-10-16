local v1 = script
local Parent = v1.Parent
local CryoModule = require(Parent.Cryo)
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local UserBlockingNetworkingModule = require(Parent.UserBlockingNetworking)
local UserBlockingReducerModule = require(v1.Reducers.UserBlockingReducer)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1) --[[ Line: 11 ]]
		-- upvalues: CryoModule (copy), UserBlockingNetworkingModule (copy), RoduxNetworkingModule (copy), UserBlockingReducerModule (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, {
			userBlockingNetworking = UserBlockingNetworkingModule.config({ roduxNetworking = RoduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function() --[[ Line: 19 ]]
				-- upvalues: UserBlockingReducerModule (upval), JoinResult (ref)
				return UserBlockingReducerModule(JoinResult)
			end
		}
	end
}