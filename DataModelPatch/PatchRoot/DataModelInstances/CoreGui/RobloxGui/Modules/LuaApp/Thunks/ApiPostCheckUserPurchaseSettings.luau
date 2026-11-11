local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PromiseModule = require(Modules.LuaApp.Promise)
local CheckUserPurchaseSettingsModule = require(Modules.LuaApp.Http.Requests.PaymentsGatewayApi.CheckUserPurchaseSettings)
local config = {
	None = "None",
	PurchaseNotEnabled = "PurchaseNotEnabled",
	SpendLimitExceeded = "SpendLimitExceeded"
}
local ApiPostCheckUserPurchaseSettingsModule = {
	FailureReason = require(CorePackages.Packages.enumerate)(script.Name, config)
}
require(Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(ApiPostCheckUserPurchaseSettingsModule.FailureReason, config)

function ApiPostCheckUserPurchaseSettingsModule.Post(p1)
	-- upvalues: PerformFetch (copy), CheckUserPurchaseSettingsModule (copy), PromiseModule (copy)
	return PerformFetch.Single("PostCheckUserPurchaseSettings", function(_)
		-- upvalues: CheckUserPurchaseSettingsModule (upval), p1 (copy), PromiseModule (upval)
		return CheckUserPurchaseSettingsModule(p1):andThen(function(Entry)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Entry[1])
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end

return ApiPostCheckUserPurchaseSettingsModule