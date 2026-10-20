local PurchaseErrorsModule = require(script.Parent.Enum.PurchaseErrors)

local function _(p1, p2): string
	return tostring(p1) .. "." .. tostring(p2)
end

local config = {
	[tostring(nil) .. "." .. tostring("PriceChangedView")] = PurchaseErrorsModule.UnknownFailure,
	[tostring("Membership Level Too Low") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.UnknownFailure,
	[tostring("Purchases are Currently Disabled") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.PurchaseDisabled,
	[tostring("Item Not For Sale") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.NotForSale,
	[tostring("Age Restricted Item") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.Under13,
	[tostring("Item Owned") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.AlreadyOwn,
	[tostring("Too Many Purchases") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.TooManyPurchases,
	[tostring("Invalid Parameter") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.InvalidRequest,
	[tostring("Unauthorized") .. "." .. tostring("TransactionFailureView")] = PurchaseErrorsModule.Unauthorized
}

local _ = function(p1, p2)
	-- upvalues: config (copy)
	return config[tostring(p1) .. "." .. tostring(p2)]
end

return function(p1)
	-- upvalues: PurchaseErrorsModule (copy), config (copy)
	assert(p1 ~= nil and type(p1) == "table", "err must be a valid table!")
	local Title = p1.title
	local ShowDivId = p1.showDivId
	local ShortfallPrice: number = p1.shortfallPrice
	
	if (ShowDivId == "TransactionFailureView" or ShowDivId == "InsufficientFundsView") and (ShortfallPrice ~= nil and ShortfallPrice > 0) then
		return PurchaseErrorsModule.NotEnoughRobux
	else
		return config[tostring(Title) .. "." .. tostring(ShowDivId)] or PurchaseErrorsModule.UnknownFailure
	end
end