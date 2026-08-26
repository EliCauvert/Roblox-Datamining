local _script = script
local parent = _script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local userBlockingNetworkingModule = require(parent.UserBlockingNetworking)
local userBlockingReducerModule = require(_script.Reducers.UserBlockingReducer)

return {
	["jest.config"] = script["jest.config"],
	config = function(p1)
		-- upvalues: cryoModule (ref), userBlockingNetworkingModule (ref), roduxNetworkingModule (ref), userBlockingReducerModule (ref)
		p1 = cryoModule.Dictionary.join(p1, {
			userBlockingNetworking = userBlockingNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: userBlockingReducerModule (copy), p1 (write)
				return userBlockingReducerModule(p1)
			end
		}
	end
}