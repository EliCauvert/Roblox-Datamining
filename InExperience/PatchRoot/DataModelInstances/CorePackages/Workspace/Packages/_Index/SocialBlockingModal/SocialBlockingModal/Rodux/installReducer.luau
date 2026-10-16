local SocialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local RoduxModule = require(SocialBlockingModal.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialBlockingModal.Networking.myRoduxNetworking)

return function() --[[ Line: 8 ]]
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = MyRoduxNetworkingModule.installReducer() })
end