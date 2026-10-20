local Gifting = script:FindFirstAncestor("Gifting")
local TModule = require(Gifting.Parent.t)
local AmpRecourseActionModule = require(Gifting.Enums.AmpRecourseAction)
local FailureReasonModule = require(Gifting.Enums.FailureReason)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local _ = require(Gifting.Types)

local function formatInvalidItems(InvalidItems)
	-- upvalues: TModule (copy), GiftModelUtilsModule (copy)
	if not TModule.table(InvalidItems) then
		return nil
	end
	local List = {}
	
	for _, invalidItem in InvalidItems do
		local FormatItemResult = if TModule.table(invalidItem) then GiftModelUtilsModule.formatItem(invalidItem.item) else nil
		
		if FormatItemResult ~= nil then
			table.insert(List, { item = FormatItemResult, reason = invalidItem.reason })
		end
	end
	return List
end

return {
	format = function(p1, Status, ErrorMessage)
		-- upvalues: FailureReasonModule (copy), AmpRecourseActionModule (copy), formatInvalidItems (copy)
		return {
			failureReason = FailureReasonModule.fromValue(p1.failureReason),
			ampFeatureCheck = p1.ampFeatureCheck,
			ampRecourseActions = AmpRecourseActionModule.fromValues(p1.ampRecourseActions),
			invalidItems = formatInvalidItems(p1.invalidItems),
			purchaseGiftRequest = p1.purchaseGiftRequest,
			acceptGiftRequest = p1.acceptGiftRequest,
			status = Status,
			errorMessage = ErrorMessage
		}
	end,
	invalidRequest = function(ErrorMessage)
		-- upvalues: FailureReasonModule (copy)
		return {
			failureReason = FailureReasonModule.InvalidInput,
			errorMessage = ErrorMessage
		}
	end
}