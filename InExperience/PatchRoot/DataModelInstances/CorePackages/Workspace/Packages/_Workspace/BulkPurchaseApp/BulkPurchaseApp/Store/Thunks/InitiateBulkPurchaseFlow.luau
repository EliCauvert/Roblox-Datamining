local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local PromiseModule = require(BulkPurchaseApp.Parent.Promise)
local BulkPurchaseRequestedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseRequested)
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local BulkPurchaseStartedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseStarted)
local BulkPurchaseCountersEnumModule = require(BulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local GetAccountModule = require(BulkPurchaseApp.NetworkRequests.getAccount)
local ReportBulkPurchaseRequestCountersModule = require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestCounters)
local _ = require(BulkPurchaseApp.Store.Types)
local FFlagBulkPurchaseRemoveStartedActionModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseRemoveStartedAction)
local FFlagBulkPurchaseReportCountersModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportCounters)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ Line: 24 | Named "InitiateBulkPurchaseFlow" ]]
	-- upvalues: FFlagAXAddOffersToBulkPurchaseModule (copy), BulkPurchaseRequestedModule (copy), FFlagBulkPurchaseReportCountersModule (copy), ReportBulkPurchaseRequestCountersModule (copy), BulkPurchaseCountersEnumModule (copy), FFlagBulkPurchaseRemoveStartedActionModule (copy), GetAccountModule (copy), PromiseModule (copy), BulkPurchaseStartedModule (copy), BulkPurchaseFailedModule (copy), ErrorCodeEnumModule (copy)
	return function(p9) --[[ Line: 34 ]]
		-- upvalues: FFlagAXAddOffersToBulkPurchaseModule (upval), BulkPurchaseRequestedModule (upval), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), FFlagBulkPurchaseRemoveStartedActionModule (upval), GetAccountModule (upval), p1 (copy), PromiseModule (upval), BulkPurchaseStartedModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
		if FFlagAXAddOffersToBulkPurchaseModule then
			p9:dispatch(BulkPurchaseRequestedModule(p2, p3, p4, p5, p6, p7, p8))
		else
			p9:dispatch(BulkPurchaseRequestedModule(p2, p3, p4, p5, p6, p7))
		end
		if FFlagBulkPurchaseReportCountersModule then
			ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter)
		end
		if FFlagBulkPurchaseRemoveStartedActionModule then return end
		local AccountModule, _ = GetAccountModule(p1)
		
		return PromiseModule.all({ AccountModule }):andThen(function(_) --[[ Line: 67 ]]
			-- upvalues: p9 (copy), BulkPurchaseStartedModule (upval), p4 (upval)
			p9:dispatch(BulkPurchaseStartedModule(p4))
		end):catch(function(_) --[[ Line: 75 ]]
			-- upvalues: p9 (copy), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
			p9:dispatch(BulkPurchaseFailedModule(ErrorCodeEnumModule.Generic))
		end)
	end
end