local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PromiseModule = require(Modules.LuaApp.Promise)
local PostAckPurchaseWarningModule = require(Modules.LuaApp.Http.Requests.PurchaseWarningApi.PostAckPurchaseWarning)
local config = {
	None = "None",
	ConfirmedU13PaymentModal = "ConfirmedU13PaymentModal",
	ConfirmedU13MonthlyThreshold1Modal = "ConfirmedU13MonthlyThreshold1Modal",
	ConfirmedU13MonthlyThreshold2Modal = "ConfirmedU13MonthlyThreshold2Modal",
	ConfirmParentalConsentWarningPaymentModal13To17 = "ConfirmParentalConsentWarningPaymentModal13To17"
}
local ApiPostAckPurchaseWarningModule = {
	UserActionType = require(CorePackages.Packages.enumerate)(script.Name, config)
}
require(Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(ApiPostAckPurchaseWarningModule.UserActionType, config)

function ApiPostAckPurchaseWarningModule.Post(p1, p2)
	-- upvalues: ApiPostAckPurchaseWarningModule (copy), PerformFetch (copy), PostAckPurchaseWarningModule (copy), PromiseModule (copy)
	local RawValue = ApiPostAckPurchaseWarningModule.UserActionType.toRawValue(p2)
	
	return PerformFetch.Single("purchasewarning.acknowledge", function(_)
		-- upvalues: PostAckPurchaseWarningModule (upval), p1 (copy), RawValue (copy), PromiseModule (upval)
		return PostAckPurchaseWarningModule(p1, RawValue):andThen(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end

return ApiPostAckPurchaseWarningModule