local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local promiseModule = require(bulkPurchaseApp.Parent.Promise)
local bulkPurchaseRequestedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRequested)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local bulkPurchaseStartedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseStarted)
local bulkPurchaseCountersEnumModule = require(bulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local getAccountModule = require(bulkPurchaseApp.NetworkRequests.getAccount)
local reportBulkPurchaseRequestCountersModule = require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestCounters)
local _ = require(bulkPurchaseApp.Store.Types)
local fFlagBulkPurchaseRemoveStartedActionModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseRemoveStartedAction)
local fFlagBulkPurchaseReportCountersModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportCounters)
local fFlagAXAddOffersToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: fFlagAXAddOffersToBulkPurchaseModule (ref), bulkPurchaseRequestedModule (ref), fFlagBulkPurchaseReportCountersModule (ref), reportBulkPurchaseRequestCountersModule (ref), bulkPurchaseCountersEnumModule (ref), fFlagBulkPurchaseRemoveStartedActionModule (ref), getAccountModule (ref), promiseModule (ref), bulkPurchaseStartedModule (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	return function(p9)
		-- upvalues: fFlagAXAddOffersToBulkPurchaseModule (copy), bulkPurchaseRequestedModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), p8 (ref), fFlagBulkPurchaseReportCountersModule (copy), reportBulkPurchaseRequestCountersModule (copy), bulkPurchaseCountersEnumModule (copy), fFlagBulkPurchaseRemoveStartedActionModule (copy), getAccountModule (copy), p1 (ref), promiseModule (copy), bulkPurchaseStartedModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
		if fFlagAXAddOffersToBulkPurchaseModule then
			p9:dispatch(bulkPurchaseRequestedModule(p2, p3, p4, p5, p6, p7, p8))
		else
			p9:dispatch(bulkPurchaseRequestedModule(p2, p3, p4, p5, p6, p7))
		end
		if fFlagBulkPurchaseReportCountersModule then
			reportBulkPurchaseRequestCountersModule(bulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter)
		end
		if fFlagBulkPurchaseRemoveStartedActionModule then
			return
		end
		local var1, _ = getAccountModule(p1)
		
		return promiseModule.all({ var1 }):andThen(function(_)
			-- upvalues: p9 (ref), bulkPurchaseStartedModule (copy), p4 (copy)
			p9:dispatch(bulkPurchaseStartedModule(p4))
		end):catch(function(_)
			-- upvalues: p9 (ref), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
			p9:dispatch(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
		end)
	end
end