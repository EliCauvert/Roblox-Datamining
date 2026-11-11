local Parent = script.Parent.Parent.Parent
local config = {
	None = "None",
	PurchaseModal = "PurchaseModal",
	Error = "Error",
	PurchaseVPCModal = "PurchaseVPCModal"
}
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1