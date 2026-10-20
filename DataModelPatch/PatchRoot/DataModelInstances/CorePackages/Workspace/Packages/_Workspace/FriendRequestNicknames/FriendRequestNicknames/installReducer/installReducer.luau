local Parent = script.Parent.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local RoduxNetworkingModule = require(Parent.Networking.RoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), RoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = RoduxNetworkingModule.installReducer() })
end