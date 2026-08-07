local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local addRawValueMethodToEnumModule = require(parent.Utility.addRawValueMethodToEnum)
local t = {
	None = "None",
	PurchaseModal = "PurchaseModal",
	Error = "Error",
	PurchaseVPCModal = "PurchaseVPCModal"
}
local var2 = require(parent_1.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var2, t)

return var2