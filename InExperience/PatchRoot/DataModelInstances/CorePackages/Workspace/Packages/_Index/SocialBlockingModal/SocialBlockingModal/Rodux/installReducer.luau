local socialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local roduxModule = require(socialBlockingModal.Parent.Rodux)
local myRoduxNetworkingModule = require(socialBlockingModal.Networking.myRoduxNetworking)

return function()
	-- upvalues: roduxModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({ NetworkStatus = myRoduxNetworkingModule.installReducer() })
end