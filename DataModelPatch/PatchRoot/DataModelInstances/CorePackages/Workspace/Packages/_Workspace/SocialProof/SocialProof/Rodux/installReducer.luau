local SocialProof = script:FindFirstAncestor("SocialProof")
local RoduxModule = require(SocialProof.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialProof.Networking.myRoduxNetworking)
local ConnectionsByEntityIdModule = require(SocialProof.Rodux.ConnectionsByEntityId)

return function()
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy), ConnectionsByEntityIdModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		ConnectionsByEntityId = ConnectionsByEntityIdModule
	})
end