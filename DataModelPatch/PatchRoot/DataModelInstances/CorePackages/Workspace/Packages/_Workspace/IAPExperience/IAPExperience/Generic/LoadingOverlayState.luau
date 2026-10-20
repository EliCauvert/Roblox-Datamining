local Parent = script.Parent.Parent
local config = {
	None = "None",
	Loading = "Loading",
	PurchasingItem = "PurchasingItem",
	PurchasingRobux = "PurchasingRobux",
	WaitingForPurchase = "WaitingForPurchase",
	WaitingForRobux = "WaitingForRobux"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1