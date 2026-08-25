local _script = script
local parent = _script.Parent
local cryoModule = require(parent.Cryo)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local userBlockingNetworkingModule = require(parent.UserBlockingNetworking)
local userBlockingReducerModule = require(_script.Reducers.UserBlockingReducer)

return {
	["jest.config"] = script["jest.config"],
	config = function(p0)
		-- upvalues: cryoModule (ref), userBlockingNetworkingModule (ref), roduxNetworkingModule (ref), userBlockingReducerModule (ref)
		p0 = cryoModule.Dictionary.join(p0, {
			userBlockingNetworking = userBlockingNetworkingModule.config({ roduxNetworking = roduxNetworkingModule.mock() })
		})
		
		return {
			installReducer = function()
				-- upvalues: userBlockingReducerModule (copy), p0 (write)
				return userBlockingReducerModule(p0)
			end
		}
	end
}