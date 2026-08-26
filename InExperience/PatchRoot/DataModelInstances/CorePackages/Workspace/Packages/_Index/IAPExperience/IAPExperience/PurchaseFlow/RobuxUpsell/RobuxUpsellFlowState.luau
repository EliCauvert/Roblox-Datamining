local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local addRawValueMethodToEnumModule = require(parent.Utility.addRawValueMethodToEnum)
local t = {
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
local var1 = require(parent_1.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1