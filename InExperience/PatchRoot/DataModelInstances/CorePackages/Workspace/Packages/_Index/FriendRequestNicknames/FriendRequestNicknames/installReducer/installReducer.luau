local parent = script.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local roduxNetworkingModule = require(parent.Networking.RoduxNetworking)

return function() --[[ line: 6 ]]
	-- upvalues: roduxModule (ref), roduxNetworkingModule (ref)
	return roduxModule.combineReducers({ NetworkStatus = roduxNetworkingModule.installReducer() })
end