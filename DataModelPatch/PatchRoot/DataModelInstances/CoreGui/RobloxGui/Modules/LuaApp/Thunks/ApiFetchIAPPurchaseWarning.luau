local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local GetPurchaseWarningModule = require(Modules.LuaApp.Http.Requests.PurchaseWarningApi.GetPurchaseWarning)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local _ = require(CorePackages.Workspace.Packages.Http)
local GetFFlagUADesktopPurchaseWarningsModule = require(Modules.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings)
local config = {
	None = "None",
	U13PaymentModal = "U13PaymentModal",
	U13MonthlyThreshold1Modal = "U13MonthlyThreshold1Modal",
	U13MonthlyThreshold2Modal = "U13MonthlyThreshold2Modal",
	ParentalConsentWarningPaymentModal13To17 = "ParentalConsentWarningPaymentModal13To17"
}
local ApiFetchIAPPurchaseWarningModule = {
	ResponseType = require(CorePackages.Packages.enumerate)(script.Name, config)
}
require(Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(ApiFetchIAPPurchaseWarningModule.ResponseType, config)

function ApiFetchIAPPurchaseWarningModule.Fetch(p1, p2, p3, p4)
	-- upvalues: GetPaymentPlatformModule (copy), GetFFlagUADesktopPurchaseWarningsModule (copy), PaymentPlatformModule (copy), PromiseModule (copy), ApiFetchIAPPurchaseWarningModule (copy), GetPurchaseWarningModule (copy)
	return function(_)
		-- upvalues: GetPaymentPlatformModule (upval), GetFFlagUADesktopPurchaseWarningsModule (upval), PaymentPlatformModule (upval), p2 (ref), p3 (ref), PromiseModule (upval), ApiFetchIAPPurchaseWarningModule (upval), GetPurchaseWarningModule (upval), p1 (copy), p4 (copy)
		local PaymentPlatformModule1 = GetPaymentPlatformModule()
		
		if GetFFlagUADesktopPurchaseWarningsModule() then
			if PaymentPlatformModule1 == PaymentPlatformModule.Web then
				p2 = nil
			else
				p3 = nil
			end
		elseif PaymentPlatformModule1 == PaymentPlatformModule.Web then
			return PromiseModule.resolve(ApiFetchIAPPurchaseWarningModule.ResponseType.None)
		end
		return GetPurchaseWarningModule(p1, p2, p3, p4):andThen(function(Entry)
			-- upvalues: PromiseModule (upval), ApiFetchIAPPurchaseWarningModule (upval)
			if Entry == nil or Entry[1] == nil then
				return PromiseModule.resolve(ApiFetchIAPPurchaseWarningModule.ResponseType.None)
			end
			local Entry1 = Entry[1]
			local None = ApiFetchIAPPurchaseWarningModule.ResponseType.None
			
			if Entry1 then
				if Entry1.action == "U13PaymentModal" then
					None = ApiFetchIAPPurchaseWarningModule.ResponseType.U13PaymentModal
				elseif Entry1.action == "U13MonthlyThreshold1Modal" then
					None = ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold1Modal
				elseif Entry1.action == "U13MonthlyThreshold2Modal" then
					None = ApiFetchIAPPurchaseWarningModule.ResponseType.U13MonthlyThreshold2Modal
				elseif Entry1.action == "ParentalConsentWarningPaymentModal13To17" then
					None = ApiFetchIAPPurchaseWarningModule.ResponseType.ParentalConsentWarningPaymentModal13To17
				end
			end
			return PromiseModule.resolve(None)
		end, function()
			-- upvalues: PromiseModule (upval), ApiFetchIAPPurchaseWarningModule (upval)
			return PromiseModule.resolve(ApiFetchIAPPurchaseWarningModule.ResponseType.None)
		end)
	end
end

return ApiFetchIAPPurchaseWarningModule