local gifting = script:FindFirstAncestor("Gifting")
local tModule = require(gifting.Parent.t)
local ampRecourseActionModule = require(gifting.Enums.AmpRecourseAction)
local failureReasonModule = require(gifting.Enums.FailureReason)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local _ = require(gifting.Types)

local function formatInvalidItems(p1)
	-- upvalues: tModule (ref), giftModelUtilsModule (ref)
	if not tModule.table(p1) then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		local var1 = if tModule.table(v) then giftModelUtilsModule.formatItem(v.item) else nil
		
		if var1 ~= nil then
			table.insert(t, { item = var1, reason = v.reason })
		end
	end
	return t
end

return {
	format = function(p2, p3, p4)
		-- upvalues: failureReasonModule (ref), ampRecourseActionModule (ref), formatInvalidItems (ref)
		return {
			failureReason = failureReasonModule.fromValue(p2.failureReason),
			ampFeatureCheck = p2.ampFeatureCheck,
			ampRecourseActions = ampRecourseActionModule.fromValues(p2.ampRecourseActions),
			invalidItems = formatInvalidItems(p2.invalidItems),
			purchaseGiftRequest = p2.purchaseGiftRequest,
			acceptGiftRequest = p2.acceptGiftRequest,
			status = p3,
			errorMessage = p4
		}
	end,
	invalidRequest = function(p2)
		-- upvalues: failureReasonModule (ref)
		return {
			failureReason = failureReasonModule.InvalidInput,
			errorMessage = p2
		}
	end
}