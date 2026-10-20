local Parent = script.Parent.Parent.Parent
local config = {
	None = "None",
	Loading = "Loading",
	PurchaseModal = "PurchaseModal",
	GenericPurchaseModal = "GenericPurchaseModal",
	LargeRobuxPurchaseModal = "LargeRobuxPurchaseModal",
	PurchaseWarning = "PurchaseWarning",
	TwoStepRequired = "TwoStepRequired",
	RobuxPurchasePending = "RobuxPurchasePending",
	RobuxGrantPending = "RobuxGrantPending",
	ItemPurchasePending = "ItemPurchasePending",
	Success = "Success",
	LeaveRobloxWarning = "LeaveRobloxWarning",
	Error = "Error",
	PurchaseVPCModal = "PurchaseVPCModal"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1