local Parent = script.Parent.Parent.Parent
local config = {
	None = "None",
	Loading = "Loading",
	BuyRobux = "BuyRobux",
	PurchaseWarning = "PurchaseWarning",
	RobuxPurchasePending = "RobuxPurchasePending",
	RobuxGrantPending = "RobuxGrantPending",
	Error = "Error",
	Succeed = "Succeed",
	PurchaseVPC = "PurchaseVPC"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1